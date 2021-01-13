-- Funkcja znajdujaca pietro na ktorym znajduje sie najwieksza ilosc mebli
CREATE OR REPLACE FUNCTION calculete_floor_with_biggest_amount_of_furniture(h_id NUMBER)
RETURN NUMBER
AS
v_floor_id NUMBER;
v_max NUMBER;
v_floor NUMBER;
BEGIN
    SELECT floor_id, eq_amount INTO v_floor_id, v_max FROM (SELECT f.floor_id, SUM(e.amount) AS eq_amount FROM FLOORS F 
    JOIN ROOMS R ON(f.floor_id = r.floor_id) 
    JOIN (SELECT room_id, COUNT(*) AS amount FROM EQUIPMENT GROUP BY room_id) E ON(e.room_id = r.room_id)
    WHERE f.hotel_id = h_id
    GROUP BY f.floor_id)
    WHERE eq_amount = 
    (SELECT MAX(eq_amount) FROM (SELECT f.floor_id, SUM(e.amount) AS eq_amount FROM FLOORS F 
    JOIN ROOMS R ON(f.floor_id = r.floor_id) 
    JOIN (SELECT room_id, COUNT(*) AS amount FROM EQUIPMENT GROUP BY room_id) E ON(e.room_id = r.room_id)
    WHERE f.hotel_id = h_id
    GROUP BY f.floor_id)); 
    
    SELECT floor_number INTO v_floor FROM FLOORS WHERE floor_id = v_floor_id;
    
    dbms_output.put_line('Najwiecej mebli w hotelu o id: '||h_id||' jest na pietrze '||v_floor||' i jest ich '||v_max||'.');
    RETURN v_floor;
END;
/
-- funkcja liczaca ile zaplaci podany pracownik rocznego podatku
CREATE OR REPLACE FUNCTION calculate_yearly_tax(e_id NUMBER)
RETURN NUMBER
AS
v_weekly_hours NUMBER;
v_price_per_hour NUMBER;
v_income NUMBER;
c_treshold CONSTANT NUMBER := 15000;
c_weeks_in_year CONSTANT NUMBER := 52;
c_taxrate CONSTANT NUMBER := 0.15;
c_maxtax CONSTANT NUMBER := 0.25;
BEGIN
    SELECT e.working_time , s.price_per_hour INTO v_weekly_hours, v_price_per_hour FROM EMPLOYEES E JOIN SERVICES S ON(E.SERVICE_ID = S.SERVICE_ID) WHERE e.employee_id = e_id;
    v_income := v_weekly_hours * v_price_per_hour * c_weeks_in_year;
    IF v_income > c_treshold THEN
        RETURN v_income * c_maxtax;
    ELSE
        RETURN v_income * c_taxrate;
    END IF;
END;
/
-- procedura zmieniajaca o zadany procent stawke godzinowa wszystkim pracownikom (uwzglednienie inflacji)
CREATE OR REPLACE PROCEDURE change_hour_rate(rate NUMBER)
AS

BEGIN
    FOR r_service IN (SELECT * FROM SERVICES)
    LOOP
    UPDATE services SET price_per_hour = price_per_hour + price_per_hour * rate WHERE service_id = r_service.service_id;
    END LOOP;
    
END;
/

-- wyzwalacz zabezpieczajacy przed dodaniem pokoju na pietrze gdzie brak na niego miejsca
CREATE OR REPLACE TRIGGER room_tr
BEFORE
INSERT OR UPDATE ON ROOMS
FOR EACH ROW
DECLARE
v_size NUMBER;
v_used_space NUMBER;
BEGIN
    SELECT floor_size INTO v_size FROM FLOORS WHERE floor_id = :new.floor_id;
    SELECT SUM(room_size) INTO v_used_space FROM ROOMS 
    GROUP BY floor_id 
    HAVING floor_id = :new.floor_id;
    IF v_size - v_used_space - :new.room_size <=0 THEN
        dbms_output.put_line('Nie da sie wstaiwc pokoju na to pietro');
        raise_application_error(-20001, 'Przekroczona wielkosc pietra');
    END IF;
END;
/
-- wyzwalacz przy rezerwacji zmieniany jest przychod danego hotelu
CREATE OR REPLACE TRIGGER reservation_tr
AFTER
INSERT ON RESERVATIONS
FOR EACH ROW
DECLARE
v_hotel_id NUMBER;
BEGIN
    SELECT hotel_id INTO v_hotel_id FROM ROOMS R JOIN FLOORS F ON(f.floor_id = r.room_id)
    WHERE r.room_id = :new.room_id;
    UPDATE SALES SET revenue = revenue + :new.price WHERE HOTEL_ID = v_hotel_id;
    dbms_output.put_line('Dodano kwotê wynajmu do obrotu '||:new.price);
END;
/
-- wyliczenie ilosci gosci w hotelu i na podstawie tego dodanie lub odjecie z pensji menadzerowi o ile taki sie znajduje 
CREATE OR REPLACE PROCEDURE calculate_amount_of_guest(h_id NUMBER)
AS
c_min_guest CONSTANT NUMBER := 2;
c_bouns_guest CONSTANT NUMBER := 5;
v_guests NUMBER;
c_bonus_range CONSTANT NUMBER := 0.1;
BEGIN
    SELECT COUNT(*) INTO v_guests FROM FLOORS F JOIN ROOMS R ON(f.floor_id = r.floor_id) JOIN RESERVATIONS V ON (v.room_id = r.room_id) JOIN GUESTS G ON(g.guest_id = v.guest_id)
    GROUP BY f.hotel_id
    HAVING f.hotel_id = h_id;
    IF v_guests < c_min_guest THEN
        UPDATE EMPLOYEES SET working_time = working_time - working_time*c_bonus_range WHERE service_id = 104;
    ELSIF v_guests > c_bouns_guest THEN
        UPDATE EMPLOYEES SET working_time = working_time + working_time*c_bonus_range WHERE service_id = 104;
    ELSE
        dbms_output.put_line('Brak zmian w wynagrodzeniu managera. Gosci w hotelu '||v_guests);
    END IF;   
        dbms_output.put_line('Gosci w hotelu '||v_guests);
END;
/
