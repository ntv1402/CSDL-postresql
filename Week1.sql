CREATE TABLE regions(
    REGION_ID INT,
    REGION_NAME VARCHAR(25),
    PRIMARY KEY (REGION_ID)
);
CREATE TABLE countries(
    COUNTRY_ID CHAR(2),
    COUNTRY_NAME VARCHAR(25),
    REGION_ID INT,
    FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID),
    PRIMARY KEY (COUNTRY_ID)
);
CREATE TABLE locations(
    LOCATION_ID INT,
    STREET_ADDRRESS VARCHAR(25),
    POSTAL_CODE VARCHAR(25),
    CITY VARCHAR(25),
    STATE_PROVINCE VARCHAR(25),
    COUNTRY_ID CHAR(2),
    CONSTRAINT PK PRIMARY KEY (LOCATION_ID),
    FOREIGN KEY (COUNTRY_ID) REFERENCES countries(COUNTRY_ID)
);
CREATE TABLE departments(
    DEPARTMENT_ID INT,
    DEPARMENT_NAME VARCHAR(30),
    MANAGER_ID INT,
    LOCATION_ID INT,
    PRIMARY KEY (DEPARTMENT_ID),
    FOREIGN KEY (LOCATION_ID) REFERENCES locations(LOCATION_ID)
);
CREATE TABLE jobs(
    JOB_ID VARCHAR(10),
    JOB_TITLE VARCHAR(35),
    MIN_SALARY INT,
    MAX_SALARY INT,
    PRIMARY KEY (JOB_ID)
);
CREATE TABLE job_history(
    EMPLOYEE_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID VARCHAR(10),
    DEPARTMENT_ID INT,
    PRIMARY KEY (EMPLOYEE_ID, START_DATE),
    FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
    UNIQUE (EMPLOYEE_ID)
);
CREATE TABLE employees(
    EMPLOYEE_ID INT,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(25),
    EMAIL VARCHAR(25),
    PHONE_NUMBER VARCHAR(20),
    HIDE_DATE DATE,
    JOB_ID VARCHAR(10),
    SALARY INT,
    COMMISSON_PCT INT,
    MANAGER_ID INT,
    DEPARTMENT_ID INT,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES job_history(EMPLOYEE_ID),
    FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID) 
);
CREATE TABLE jobs_grades(
    GRADE_LEVEL VARCHAR(22),
    LOWEST_SAL INT,
    HIGHEST_SAL INT,
    PRIMARY KEY (GRADE_LEVEL)
);

