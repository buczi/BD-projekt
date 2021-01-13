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
------------------------------------------------
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
