
--user
CREATE TABLE Users (userID integer,
username VARCHAR(20),
pswrd VARCHAR(20),
firstName VARCHAR(20),
lastName VARCHAR(20),
TC VARCHAR(11),
contactNo varchar(11),
DOB VARCHAR(10),
gender varchar(10));

ALTER TABLE Users ADD (
  CONSTRAINT users_pk PRIMARY KEY (userID));

create sequence users_seq start with 1 increment by 1 nomaxvalue;

create trigger users_trigger
before insert on Users
for each row
   begin
     select users_seq.nextval into :new.userID from dual;
   end;




--conductor
CREATE TABLE Conductor (conductorID integer,
                        firstName varchar(20),
                        lastName varchar(20),
                        TC VARCHAR(11),
                        contactNo VARCHAR(11),
                        DOB VARCHAR(15),
                        gender VARCHAR(5));
                       
                        
ALTER TABLE Conductor ADD (CONSTRAINT conductor_pk PRIMARY KEY (conductorID));

create sequence conductor_seq start with 1 increment by 1 nomaxvalue;

create trigger conductor_trigger
before insert on Conductor
for each row
   begin
     select conductor_seq.nextval into :new.conductorID from dual;
   end;
   
   
   
                      
--bus       
CREATE TABLE Bus (busID integer,
                  busLicensePlate varchar(15)
                  details varchar(50));
create sequence bus_seq start with 1 increment by 1 nomaxvalue;
 ALTER TABLE Bus ADD CONSTRAINT busID PRIMARY KEY (busID);


create trigger bus_trigger
before insert on Bus
for each row
   begin
     select bus_seq.nextval into :new.busID from dual;
    end;


  
                 
 --seat                 
 CREATE TABLE Seat (seatNo integer,
                   busID integer,
                   available number(1),
CONSTRAINT seatNo_pk PRIMARY KEY (seatNo),
CONSTRAINT fk_busID FOREIGN KEY (busID) REFERENCES Bus(busID));

create sequence seat_seq start with 1 increment by 1 nomaxvalue;

create trigger seat_trigger
before insert on Seat
for each row
   begin
     select seat_seq.nextval into :new.seatNo from dual;
     end;



CREATE TABLE Admin(username VARCHAR(6),
passwrd VARCHAR(20));
INSERT INTO Admin(username, passwrd) values('admin','admin11');
SELECT * FROM Admin WHERE username='admin' and passwrd='admin11';

--route
CREATE TABLE Route (routeID integer,
                    busID integer,
                    departure varchar(30),
                    arrival varchar(30),
                    routeDate varchar(20),
                    routeTime varchar(20),
                    routeFee integer,
                    CONSTRAINT route_pk PRIMARY KEY (routeID),
                    CONSTRAINT fk_busID1 FOREIGN KEY (busID) REFERENCES Bus(busID)
                    );


create sequence route_seq start with 1 increment by 1 nomaxvalue;

create trigger route_trigger
before insert on Route
for each row
   begin
     select route_seq.nextval into :new.routeID from dual;
   end;

--ticket
CREATE TABLE Ticket (ticketID integer,
                     seatNo integer,
                     routeID integer,
                     busID integer,
                     departure varchar(50),
                     arrival varchar(50),
                     routeDate varchar(20),
                     routeTime varchar(20),
                     routeFee integer,
                     customerName varchar(20),
                     customerSurname varchar(20),
                     customerTC varchar(20)
                     );
                     
create sequence ticket_seq start with 1 increment by 1 nomaxvalue;

create trigger ticket_trigger
before insert on ticket
for each row
   begin
     select ticket_seq.nextval into :new.ticketID from dual;
   end;
   
    ALTER TABLE Ticket ADD CONSTRAINT PK_ticketID PRIMARY KEY (ticketID);
    ALTER TABLE Ticket ADD CONSTRAINT fk_routeID FOREIGN KEY (routeID) REFERENCES Route(routeID);
    DROP TABLE Ticket;

