CREATE TABLE COMPANY (
  ID INT NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL,
  VERSION INT NOT NULL DEFAULT 0,
  PRIMARY KEY(ID)
);

CREATE TABLE USERS (
  ID INT NOT NULL AUTO_INCREMENT,
  USER_TYPE VARCHAR(20) NOT NULL,
  NAME VARCHAR(50) NOT NULL,
  SURNAME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(50),
  USERNAME VARCHAR(45) NOT NULL UNIQUE,
  PASSWORD VARCHAR(60) NOT NULL,
  USER_STATUS VARCHAR (20) NOT NULL DEFAULT 'ACTIVE',
  COMPANY INT NOT NULL,
  VERSION INT NOT NULL DEFAULT 0,
  PRIMARY KEY (ID),
  CONSTRAINT FK_USER_COMPANY FOREIGN KEY (COMPANY) REFERENCES COMPANY (ID)
);

CREATE TABLE LICENSES (
  ID INT NOT NULL AUTO_INCREMENT,
  SERIAL_NUMBER VARCHAR(10) NOT NULL,
  OWNER INT NOT NULL,
  USER_COUNT INT NOT NULL,
  LICENSE_STATUS VARCHAR(20) NOT NULL,
  VERSION INT NOT NULL DEFAULT 0,
  PRIMARY KEY (ID),
  CONSTRAINT FK_LICENSE_USER FOREIGN KEY (OWNER) REFERENCES USERS (ID)
);

CREATE TABLE DEVICES (
  ID INT NOT NULL AUTO_INCREMENT,
  UUID VARCHAR(255) NOT NULL,
  LICENSE INT,
  USER INT NOT NULL,
  VERSION INT NOT NULL DEFAULT 0,
  PRIMARY KEY(ID),
  CONSTRAINT FK_DEVICE_LICENSE FOREIGN KEY (LICENSE) REFERENCES LICENSES(ID),
  CONSTRAINT FK_DEVICE_USER FOREIGN KEY (USER) REFERENCES USERS(ID)
);

CREATE TABLE SESSIONS (
  ID INT NOT NULL AUTO_INCREMENT,
  SESSION_ID VARCHAR(32) NOT NULL,
  DEVICE INT NOT NULL,
  SESSION_STATUS VARCHAR(20) NOT NULL,
  VERSION INT NOT NULL DEFAULT 0,
  PRIMARY KEY(ID),
  CONSTRAINT FK_SESSION_DEVICE FOREIGN KEY (DEVICE) REFERENCES DEVICES(ID)
)