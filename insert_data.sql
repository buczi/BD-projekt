INSERT INTO services VALUES ( 101 , 'Sprzatanie' , 30);
INSERT INTO services VALUES ( 102 , 'Recepcjonista' , 25);
INSERT INTO services VALUES ( 103 , 'Starszy Recepcjonista' , 40);
INSERT INTO services VALUES ( 104 , 'Menadzer' , 100);
INSERT INTO services VALUES ( 105 , 'Ochroniarz' , 20);
INSERT INTO services VALUES ( 106 , 'Serwisant' , 40);
commit;
------------------------------------------------
INSERT INTO roomtype VALUES ( 101 , 'Jednoosobowy' , 2, null);
INSERT INTO roomtype VALUES ( 102 , 'Dwuosobowy' , 2, null);
INSERT INTO roomtype VALUES ( 103 , 'Dwuosobowy VIP' , 3, 10);
INSERT INTO roomtype VALUES ( 104 , 'Czteroosobowy' , 3, null);
INSERT INTO roomtype VALUES ( 105 , 'Czteroosobowy VIP' , 5, 20);
INSERT INTO roomtype VALUES ( 106 , 'Willa' , 8, 50);
commit;
------------------------------------------------

ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO futniture VALUES ( 101 , 'Kanapa' , '01/02/2004');
INSERT INTO futniture VALUES ( 102 , 'Stolik' , '01/02/2006');
INSERT INTO futniture VALUES ( 112 , 'Telewizor' , '01/02/2008');
INSERT INTO futniture VALUES ( 103 , 'Lozko Jednoosobowe' , '01/02/2007');
INSERT INTO futniture VALUES ( 104 , 'Telewizor Plazmowy' , '01/01/2009');
INSERT INTO futniture VALUES ( 105 , 'Lozko Dwuosobowe' , '20/11/2011');
INSERT INTO futniture VALUES ( 106 , 'Lozko King Size' , '01/02/2006');
INSERT INTO futniture VALUES ( 107 , 'Dywan' , '01/02/2008');
INSERT INTO futniture VALUES ( 108 , 'Przysznic' , '01/02/2007');
INSERT INTO futniture VALUES ( 109 , 'Wanna' , '01/02/2006');
INSERT INTO futniture VALUES ( 110 , 'Pralka' , '01/02/2008');
INSERT INTO futniture VALUES ( 111 , 'Wentylator' , '01/02/2007');
commit;
-------------------------------------------------
INSERT INTO guests VALUES ( 101 , 'Ignacy', 'Wakon' , 920129 );
INSERT INTO guests VALUES ( 102 , 'Jerzy' , 'Bialowierzy', 607123 );
INSERT INTO guests VALUES ( 106 , 'Miloslaw' , 'Starynkiewicz', 2012934 );
INSERT INTO guests VALUES ( 103 , 'Agata' , 'Salata' , 9618523 );
INSERT INTO guests VALUES ( 104 , 'Janina' , 'Slonina', 86710327 );
INSERT INTO guests VALUES ( 105 , 'Hubert' , 'Gniot', 12947108 );
commit;
------------------------------------------------
INSERT INTO sales VALUES ( 101 , 200000, 1800000, 500000, null );
INSERT INTO sales VALUES ( 102 , 67500, 80000, 100000, null );
INSERT INTO sales VALUES ( 103, 75000000, 73000200, 100500, null );
commit;

------------------------------------------------
INSERT INTO address VALUES ( 101 , 'WARSZAWA' , 'Jerozolimskie' , 25 , null );
INSERT INTO address VALUES ( 102 , 'WARSZAWA' , 'Pulawska' , 515 , null );
INSERT INTO address VALUES ( 103 , 'KRAKOW' , 'Wawelska' , 69 , null );
commit;


------------------------------------------------
INSERT INTO employees VALUES ( 101 , 40 , 'Hermenegilda' , ' Hartz' , 101 , null );
INSERT INTO employees VALUES ( 102 , 80 , 'Waldemar' , ' Kiepski' , 105 , null );
INSERT INTO employees VALUES ( 103 , 20 , 'Janusz' , ' Pons' , 102 , null );
INSERT INTO employees VALUES ( 104 , 45 , 'Ksawery' , ' Brok' , 103 , null );
INSERT INTO employees VALUES ( 105 , 40 , 'Anna' , ' Walnowska' , 102 , null );
INSERT INTO employees VALUES ( 106 , 15 , 'Krystian' , ' Mon' , 106 , null );
INSERT INTO employees VALUES ( 107 , 30 , 'Henryk' , ' Walezy' , 104 , null );
INSERT INTO employees VALUES ( 108 , 60 , 'Brajan' , ' Mocny' , 101 , null );
INSERT INTO employees VALUES ( 109 , 40 , 'Joanna' , ' Krais' , 105 , null );
commit;



------------------------------------------------
INSERT INTO floors VALUES ( 101 , 0 , 100 , null);
INSERT INTO floors VALUES ( 102 , 1 , 95 , null);
INSERT INTO floors VALUES ( 103 , 2 , 110 , null);
INSERT INTO floors VALUES ( 104 , 3 , 100 , null);
INSERT INTO floors VALUES ( 105 , 0 , 80 , null);
INSERT INTO floors VALUES ( 106 , 1 , 50 , null);
INSERT INTO floors VALUES ( 107 , 2 , 50 , null);
INSERT INTO floors VALUES ( 108 , 3 , 40 , null);
INSERT INTO floors VALUES ( 109 , 4 , 45 , null);
INSERT INTO floors VALUES ( 110 , 0 , 350 , null);
INSERT INTO floors VALUES ( 111 , 1 , 300 , null);
commit;


------------------------------------------------
INSERT INTO hotel VALUES ( 101 , 'MARIOT' ,  103 , 102);
INSERT INTO hotel VALUES ( 102 , 'SUPERSTAR' ,  102 , 101);
INSERT INTO hotel VALUES ( 103 , 'MAGENDA' ,  101 , 103);
commit;
------------------------------------------------
INSERT INTO rooms VALUES ( 101 , 100 , 50 , 400 , 1, 101, 102);
INSERT INTO rooms VALUES ( 102 , 101 , 30 , 200 , 0, 101, 102);
INSERT INTO rooms VALUES ( 103 , 200 , 50 , 400 , 0, 102, 103);
INSERT INTO rooms VALUES ( 104 , 330 , 50 , 400 , 0, 104, 104);
INSERT INTO rooms VALUES ( 105 , 115 , 100 , 800 , 2 , 105, 106);
INSERT INTO rooms VALUES ( 106 , 107 , 35 , 100 , 0 , 105, 111);
commit;

UPDATE floors SET hotel_id = 101 WHERE floor_id = 101;
UPDATE floors SET hotel_id = 101 WHERE floor_id = 102;
UPDATE floors SET hotel_id = 101 WHERE floor_id = 103;
UPDATE floors SET hotel_id = 101 WHERE floor_id = 104;
UPDATE floors SET hotel_id = 102 WHERE floor_id = 105;
UPDATE floors SET hotel_id = 102 WHERE floor_id = 106;
UPDATE floors SET hotel_id = 102 WHERE floor_id = 107;
UPDATE floors SET hotel_id = 102 WHERE floor_id = 108;
UPDATE floors SET hotel_id = 102 WHERE floor_id = 109;
UPDATE floors SET hotel_id = 103 WHERE floor_id = 110;
UPDATE floors SET hotel_id = 103 WHERE floor_id = 111;

UPDATE address SET hotel_id = 101 WHERE address_id = 103;
UPDATE address SET hotel_id = 102 WHERE address_id = 102;
UPDATE address SET hotel_id = 103 WHERE address_id = 101;

UPDATE employees SET hotel_id = 103 WHERE employee_id = 101;
UPDATE employees SET hotel_id = 101 WHERE employee_id = 102;
UPDATE employees SET hotel_id = 101 WHERE employee_id = 103;
UPDATE employees SET hotel_id = 101 WHERE employee_id = 104;
UPDATE employees SET hotel_id = 102 WHERE employee_id = 105;
UPDATE employees SET hotel_id = 102 WHERE employee_id = 106;
UPDATE employees SET hotel_id = 103 WHERE employee_id = 107;
UPDATE employees SET hotel_id = 101 WHERE employee_id = 108;
UPDATE employees SET hotel_id = 101 WHERE employee_id = 109;

UPDATE sales SET hotel_id = 101 WHERE sales_id = 102;
UPDATE sales SET hotel_id = 102 WHERE sales_id = 101;
UPDATE sales SET hotel_id = 103 WHERE sales_id = 103;

commit;
------------------------------------------------
INSERT INTO equipment VALUES ( 101, 102 );
INSERT INTO equipment VALUES ( 101, 104 );
INSERT INTO equipment VALUES ( 101, 107 );
INSERT INTO equipment VALUES ( 101, 111 );
INSERT INTO equipment VALUES ( 102, 103 );
INSERT INTO equipment VALUES ( 102, 101 );
INSERT INTO equipment VALUES ( 102, 107 );
INSERT INTO equipment VALUES ( 102, 111 );
INSERT INTO equipment VALUES ( 102, 102 );
INSERT INTO equipment VALUES ( 102, 110 );
INSERT INTO equipment VALUES ( 103, 101 );
INSERT INTO equipment VALUES ( 103, 104 );
INSERT INTO equipment VALUES ( 104, 111 );
INSERT INTO equipment VALUES ( 104, 103 );
INSERT INTO equipment VALUES ( 104, 101 );
INSERT INTO equipment VALUES ( 104, 107 );
INSERT INTO equipment VALUES ( 105, 111 );
INSERT INTO equipment VALUES ( 106, 102 );
INSERT INTO equipment VALUES ( 106, 110 );
INSERT INTO equipment VALUES ( 106, 101 );
INSERT INTO equipment VALUES ( 101, 104 );
commit;
------------------------------------------------



INSERT INTO reservations VALUES ( 101, '01/01/2008', '01/12/2008' , 12000 , 105 , 103 );
INSERT INTO reservations VALUES ( 102, '03/03/2005', '04/04/2005' , 7000 , 103 , 104);
INSERT INTO reservations VALUES ( 103, '12/12/2005', '12/12/2006' , 1500 , 106 , 103);
INSERT INTO reservations VALUES ( 104, '01/05/2000', '31/12/2010' , 600 , 102 , 101);
INSERT INTO reservations VALUES (105, '01/01/2005', '03/03/2005' , 1200 , 105 , 105);
INSERT INTO reservations VALUES (106,  '03/03/2005', '01/11/2005' , 4780 , 105 , 103);
INSERT INTO reservations VALUES (107,  '01/11/2005', '01/12/2005' , 600 , 102 , 105);
INSERT INTO reservations VALUES (108,  '01/01/2004', '11/10/2003' , 20000 , 104 , 102 );
INSERT INTO reservations VALUES (109, '15/10/2004', '01/01/2005' , 8905 , 101 , 103);
INSERT INTO reservations VALUES (110, '20/11/2005', '01/12/2006' , 4750 , 105 , 101 );
commit;
------------------------------------------------
