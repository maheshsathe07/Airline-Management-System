CREATE DATABASE PROJECT;
USE PROJECT;

CREATE TABLE flight (
    f_code VARCHAR(255) PRIMARY KEY,
    f_name VARCHAR(255),
    src VARCHAR(255),
    dst VARCHAR(255)
);

CREATE TABLE cancellation (
    cancellation_no VARCHAR(255) PRIMARY KEY,
    pnr_no VARCHAR(255),
    cancellation_date DATE,
    f_code VARCHAR(255),
    FOREIGN KEY (f_code) REFERENCES flight(f_code),
    FOREIGN KEY (pnr_no) REFERENCES passenger(pnr_no)
);

CREATE TABLE login (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255)
);

INSERT INTO login VALUES ('admin', '12345');

CREATE TABLE passenger (
    pnr_no VARCHAR(255) PRIMARY KEY,
    address VARCHAR(255),
    nationality VARCHAR(255),
    name VARCHAR(255),
    gender VARCHAR(255),
    ph_no VARCHAR(255),
    passport_no VARCHAR(255),
    fl_code VARCHAR(255),
    FOREIGN KEY (fl_code) REFERENCES flight(f_code)
);

CREATE TABLE payment (
    payment_id VARCHAR(255) PRIMARY KEY,
    pnr_no VARCHAR(255),
    ph_no VARCHAR(255),
    cheque_no VARCHAR(255),
    card_no VARCHAR(255),
    paid_amt DECIMAL(10, 2), -- Assuming the amount is in decimal format
    pay_date DATE,
    FOREIGN KEY (pnr_no) REFERENCES passenger(pnr_no)
);

CREATE TABLE reservation (
    ticket_id VARCHAR(255) PRIMARY KEY,
    pnr_no VARCHAR(255),
    f_code VARCHAR(255),
    jny_date DATE,
    jny_time TIME,
    src VARCHAR(255),
    dst VARCHAR(255),
    FOREIGN KEY (pnr_no) REFERENCES passenger(pnr_no),
    FOREIGN KEY (f_code) REFERENCES flight(f_code)
);

CREATE TABLE sector (
	ID int AUTO_INCREMENT PRIMARY KEY,
    flight_code VARCHAR(255),
    capacity INT, -- Assuming capacity is an integer
    class_code VARCHAR(255),
    class_name VARCHAR(255),
    FOREIGN KEY (flight_code) REFERENCES flight(f_code)
);


INSERT INTO flight (f_code, f_name, src, dst) 
VALUES 
    ('BA 222', 'INDIGO', 'MUMBAI', 'HYDERABAD'),
    ('AB 1987', 'SPECIJET', 'DELHI', 'BENGALORE'),
    ('IN 1201', 'INDIGO', 'MUMBAI', 'DELHI'),
    ('IN 1302', 'INDIGO', 'BENGALORE', 'DELHI');
    
INSERT INTO sector(flight_code, capacity, class_code, class_name)
VALUES
	('BA 222', 40, 'W', 'PREMIUM ECONOMY'),
    ( 'AB 1987', 50, 'B', 'BUSINESS'),
    ('IN 1201', 16, 'F', 'FIRST'),
    ('IN 1302', 250, 'E', 'ECONOMY');
    

INSERT INTO passenger (pnr_no, address, nationality, name, gender, ph_no, passport_no, fl_code)
VALUES 
    ('PNR123456', '123 Main Street, City', 'Indian', 'Mahesh Sathe', 'Male', '1234567890', 'ABC123456', 'BA 222'),
    ('PNR789012', '456 Elm Street, Town', 'American', 'Jane Smith', 'Female', '0987654321', 'DEF789012', 'AB 1987'),
    ('PNR345678', '789 Oak Street, Village', 'Indian', 'Prem Shejole', 'Male', '9876543210', 'GHI345678', 'IN 1201'),
    ('PNR901234', '321 Maple Street, County', 'British', 'Emily Brown', 'Female', '7654321098', 'JKL901234', 'IN 1302'),
    ('PNR567890', '654 Pine Street, State', 'Indian', 'Vinod Panzade', 'Male', '5432109876', 'MNO567890', 'BA 222');


INSERT INTO payment (payment_id, pnr_no, ph_no, cheque_no, card_no, paid_amt, pay_date)
VALUES 
    ('PAY001', 'PNR123456', '1234567890', 'CHQ789', 'CARD123', '5000', '2024-03-29'),
    ('PAY002', 'PNR789012', '0987654321', 'CHQ456', 'CARD456', '7000', '2024-03-30'),
    ('PAY003', 'PNR345678', '9876543210', 'CHQ123', 'CARD789', '3000', '2024-04-01'),
    ('PAY004', 'PNR901234', '7654321098', 'CHQ987', 'CARD987', '6000', '2024-04-02'),
    ('PAY005', 'PNR567890', '5432109876', 'CHQ654', 'CARD321', '8000', '2024-04-03');


INSERT INTO reservation (ticket_id, pnr_no, f_code, jny_date, jny_time, src, dst)
VALUES 
    ('TICKET123456', 'PNR123456', 'BA 222', '2024-04-01', '08:00:00', 'MUMBAI', 'HYDERABAD'),
    ('TICKET789012', 'PNR789012', 'AB 1987', '2024-04-02', '10:00:00', 'DELHI', 'BENGALORE'),
    ('TICKET345678', 'PNR345678', 'IN 1201', '2024-04-03', '12:00:00', 'MUMBAI', 'DELHI'),
    ('TICKET901234', 'PNR901234', 'IN 1302', '2024-04-04', '14:00:00', 'BENGALORE', 'DELHI'),
    ('TICKET567890', 'PNR567890', 'BA 222', '2024-04-05', '16:00:00', 'MUMBAI', 'HYDERABAD');

SELECT f_code, f_name, src, dst
FROM flight
WHERE f_code = 'BA 222';


SELECT flight.f_code, flight.f_name, flight.src, flight.dst, sector.capacity, sector.class_code, sector.class_name 
FROM flight
INNER JOIN sector ON flight.f_code = sector.flight_code
WHERE flight.f_code = "BA 222";

INSERT INTO flight VALUES
('AI101', 'Flight 101', 'Bangalore', 'Mumbai'),
('AI102', 'Flight 102', 'Mumbai', 'Delhi'),
('AI103', 'Flight 103', 'Delhi', 'Hyderabad'),
('AI104', 'Flight 104', 'Hyderabad', 'Patna'),
('AI105', 'Flight 105', 'Patna', 'Chennai');

SET SQL_SAFE_UPDATES = 0;

UPDATE flight
SET src = 'Bengaluru'
WHERE src = 'Bangalore';

SET SQL_SAFE_UPDATES = 1;


INSERT INTO sector(flight_code, capacity, class_code, class_name)
 VALUES ('AI101', 200, 'Economy', 'Economy Class'),
	   ('AI101', 50, 'Business', 'Business Class'),
	   ('AI102', 200, 'Economy', 'Economy Class'),
	   ('AI102', 50, 'Business', 'Business Class'),
	   ('AI103', 200, 'Economy', 'Economy Class'),
	   ('AI103', 50, 'Business', 'Business Class'),
	   ('AI104', 200, 'Economy', 'Economy Class'),
	   ('AI104', 50, 'Business', 'Business Class'),
	   ('AI105', 200, 'Economy', 'Economy Class'),
	   ('AI105', 50, 'Business', 'Business Class');

INSERT INTO passenger 
VALUES ('PNR001', 'Address 1', 'Indian', 'John Doe', 'Male', '1234567890', 'ABCD1234', 'AI101'),
	   ('PNR002', 'Address 2', 'Indian', 'Jane Doe', 'Female', '9876543210', 'WXYZ5678', 'AI102');
       
INSERT INTO flight (f_code, f_name, src, dst)
VALUES 
    ('AI 123', 'Flight AI 123', 'Bangalore', 'Mumbai'),
    ('BA 456', 'Flight BA 456', 'Mumbai', 'Delhi'),
    ('IN 789', 'Flight IN 789', 'Delhi', 'Hyderabad'),
    ('AI 321', 'Flight AI 321', 'Hyderabad', 'Bangalore'),
    ('BA 123', 'Flight BA 123', 'Chennai', 'Mumbai'),
    ('IN 456', 'Flight IN 456', 'Patna', 'Delhi');

       
INSERT INTO passenger (pnr_no, address, nationality, name, gender, ph_no, passport_no, fl_code)
VALUES 
    ('PNR098765', '123 Main Street, Bangalore', 'Indian', 'Rohit Chavan', 'Male', '9876543210', 'ABC123456', 'AI 123'),
    ('PNR345679', '456 Park Avenue, Mumbai', 'Indian', 'Vijay Mathe', 'Female', '8765432109', 'DEF654321', 'BA 456'),
    ('PNR901212', '789 Elm Street, Delhi', 'Indian', 'Kaustubh Daberao', 'Female', '7654321098', 'GHI789012', 'IN 789'),
    ('PNR567880', '321 Oak Street, Hyderabad', 'Indian', 'Nikhil Desai', 'Male', '6543210987', 'JKL234567', 'AI 321'),
    ('PNR234572', '654 Pine Street, Chennai', 'Indian', 'Emily Davis', 'Female', '5432109876', 'MNO345678', 'BA 123'),
    ('PNR789243', '987 Maple Street, Patna', 'Indian', 'David Brown', 'Male', '4321098765', 'PQR456789', 'IN 456');


INSERT INTO payment (payment_id, pnr_no, ph_no, cheque_no, card_no, paid_amt, pay_date)
VALUES 
    ('PAY006', 'PNR098765', '9876543210', 'CHQ987654', 'CARD987654', '5500', '2024-04-04'),
    ('PAY007', 'PNR234572', '1234567890', NULL, 'CARD654321', '6500', '2024-04-05'),
    ('PAY008', 'PNR789243', '8765432109', 'CHQ456789', NULL, '4500', '2024-04-06');

INSERT INTO reservation (ticket_id, pnr_no, f_code, jny_date, jny_time, src, dst)
VALUES 
    ('TICKET987654', 'PNR098765', 'AI 321', '2024-04-06', '08:00:00', 'DELHI', 'PATNA'),
    ('TICKET234567', 'PNR234572', 'BA 123', '2024-04-07', '10:00:00', 'MUMBAI', 'HYDERABAD'),
    ('TICKET789123', 'PNR789243', 'IN 456', '2024-04-08', '12:00:00', 'CHENNAI', 'BENGALORE');


INSERT INTO cancellation VALUES ('CAN001', 'PNR001', '2024-03-29', 'AI101'),
                                   ('CAN002', 'PNR002', '2024-03-29', 'AI102');
