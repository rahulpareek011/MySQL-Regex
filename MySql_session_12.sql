use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);

select * from students;
select * from enrollments;
-- Inner Join- Students who enrolled in courses
select std.student_id, std.student_name, enr.student_id,enr.course_name from students as std
join enrollments as enr where std.student_id = enr.student_id;

-- Left Join- want all students enrolled and not enrolled both
-- now even data present in left table(student) will come in enrollment table as null
select std.student_id, std.student_name, enr.student_id,enr.course_name from students as std
left join enrollments as enr on std.student_id = enr.student_id;

-- Right Join- want all enrollement even if student is missing
-- now even data present in right table(enrollemennt) will come in student table as null
select * from enrollments;
select std.student_id, std.student_name, enr.student_id, enr.course_name from students as std
right join enrollments as enr on std.student_id = enr.student_id;

-- only student name who doesn't enrolled?
select std.student_id, std.student_name, enr.enrollment_id, enr.student_id,enr.course_name 
from students as std left join enrollments as enr 
on std.student_id=enr.student_id where enrollment_id is NULL;

-- Inner JOIN Ques?
-- write a query to list all students and the courses they are enrolled in
-- only include student those are enrolled in atleast one course.

-- JOIN + aggregate/group by question
-- write a SQL query to find the total number of courses each student is enrolled in.
-- Display student_name and course_count.
select std.student_name, count(enr.enrollment_id) 
from students as std inner join enrollments as enr 
on std.student_id=enr.student_id group by student_name;

-- calculate the total credits earned by each student, including students who 
-- have not enrolled in any course.
select s.student_id, s.student_name, sum(e.credits) from students as s
left join enrollments as e on s.student_id=e.student_id group by student_id;

-- write a sql query for student have enrolled in mroe than two courses
select s.student_id, s.student_name, count(enrollment_id) from students as s
left join enrollments as e on s.student_id=e.student_id
group by student_id having count(enrollment_id)>2;

-- in one major how many student there

-- total credits per major
select s.major, sum(e.credits) from students as s
left join enrollments as e on s.student_id=e.student_id group by major;

-- top 3 student name which enrolled in total course in descending order
select s.student_id, s.student_name, count(enrollment_id) from students as s
left join enrollments as e on s.student_id=e.student_id
group by student_id order by count(enrollment_id) desc limit 3;

-- take 3 student name which enrolled in total course in descending order except top 1
-- limit: how much rows you want
-- offset: skip the top rows
select s.student_id, s.student_name, count(enrollment_id) from students as s
left join enrollments as e on s.student_id=e.student_id
group by student_id order by count(enrollment_id) desc limit 3 offset 1;

-- join+groupby+string function questions?
-- display the first 3 characters of each course
-- name and the total number of enrollments for those courses
select substring(e.course_name,1,3), count(*) from enrollments as e
group by e.course_name;

-- group students by the length of their names and show the count of students
-- in each group.
select char_length(s.student_name), count(e.enrollment_id)
from students as s join enrollments as e on s.student_id = e.student_id
group by char_length(s.student_name);

-- now solving leet code question
-- solved -> 175, 181
-- To be done -> 183, 184, 197, 511, 180.