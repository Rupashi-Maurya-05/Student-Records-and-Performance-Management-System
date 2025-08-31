create database student_management;
use student_management;
CREATE TABLE Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50),
    section VARCHAR(5)
);
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contact VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    max_marks INT NOT NULL
);
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(50),
    exam_date DATE
);
CREATE TABLE Marks (
    marks_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    exam_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES Exams(exam_id) ON DELETE CASCADE
);
desc marks;
desc classes;
desc students;
desc subjects;
desc teachers;
desc exams;

insert into classes values(301,"10","A");
insert into classes values(302,"10","B");

insert into Students values(1,"Ana",'2004-03-24','Female',
'9911111111','ana@gmail.com','house no. 2, sun colony, delhi',301);
insert into Students values(2,"Amit",'2004-06-04','Male',
'9911111112','amit@gmail.com','house no. 13, star colony, delhi',301);

insert into subjects values(501,"DBMS",100);
insert into subjects values(502,"OS",100);
insert into subjects values(503,"PP",100);
insert into subjects values(504,"DFS",100);

insert into teachers values(10,"Dr. Vaani",501);
insert into teachers values(11,"Dr. Swati",502);
insert into teachers values(12,"Dr. Neetu",503);
insert into teachers values(13,"Dr. Pankaj",504);

insert into exams values(1001,"Midterm",'2025-07-12');
insert into exams values(1002,"Final",'2025-09-30');

insert into marks values(001,1,501,1001,87);
insert into marks values(002,1,502,1001,83);
insert into marks values(003,1,503,1001,90);
insert into marks values(004,1,504,1001,89);

insert into marks values(005,2,501,1001,75);
insert into marks values(006,2,502,1001,80);
insert into marks values(007,2,503,1001,85);
insert into marks values(008,2,504,1001,78);

insert into marks values(009,1,501,1002,95);
insert into marks values(010,1,502,1002,90);
insert into marks values(011,1,503,1002,89);
insert into marks values(012,1,504,1002,94);

insert into marks values(013,2,501,1002,87);
insert into marks values(014,2,502,1002,93);
insert into marks values(015,2,503,1002,81);
insert into marks values(016,2,504,1002,93);