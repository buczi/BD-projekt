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
-----------------------------------------------------------
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