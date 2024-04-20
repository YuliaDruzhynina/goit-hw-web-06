drop table if exists students;
CREATE TABLE students (
  id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(30),
  email VARCHAR(30)
);


drop table if exists groups;
CREATE TABLE groups (
  id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
  group_name VARCHAR(50) NOT NULL,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES students(id)
  	ON UPDATE CASCADE
  	ON DELETE CASCADE
);

drop table if exists teachers;
CREATE TABLE teachers (
  id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
  teacher_name VARCHAR(50),
  teacher_email VARCHAR(50),
  teacher_phone VARCHAR(50)
);

drop table if exists subjects;
CREATE TABLE subjects (
  id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
  subject_name VARCHAR(150) NOT NULL,
  teacher_id INTEGER,
  FOREIGN KEY (teacher_id) REFERENCES teachers (id)
  	ON UPDATE CASCADE
  	ON DELETE CASCADE
);
  
  drop table if exists grades;
  CREATE TABLE grades (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  student_id INTEGER,
  teacher_id INTEGER,
  subject_id INTEGER,
  grade INTEGER,
  grade_date DATE,
  FOREIGN KEY (student_id) REFERENCES students(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (subject_id) REFERENCES subjects(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON UPDATE CASCADE ON DELETE CASCADE
);
