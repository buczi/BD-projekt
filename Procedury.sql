CREATE OR REPLACE PROCEDURE change_hour_rate(rate NUMBER)
AS

BEGIN
    FOR r_service IN (SELECT * FROM SERVICES)
    LOOP
    UPDATE services SET price_per_hour = price_per_hour + price_per_hour * rate WHERE service_id = r_service.service_id;
    END LOOP;
    
END;
/
--------------------------------------------------
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