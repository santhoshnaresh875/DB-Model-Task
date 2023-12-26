CREATE TABLE `Student` (
  `StudentID` Integer PRIMARY KEY,
  `FirstName` Varchar,
  `LastName` Varchar,
  `Email` Varchar,
  `DateOfBirth` Date,
  `EnrollmentDate` Date
);

CREATE TABLE `Instructor` (
  `InstructorID` Integer PRIMARY KEY,
  `FirstName` Varchar,
  `LastName` Varchar,
  `Email` Varchar
);

CREATE TABLE `Course` (
  `CourseID` Integer PRIMARY KEY,
  `CourseName` Varchar,
  `Description` Text,
  `StartDate` Date,
  `EndDate` Date
);

CREATE TABLE `Class` (
  `ClassID` Integer PRIMARY KEY,
  `CourseID` Integer,
  `ClassName` Varchar,
  `Schedule` Varchar,
  `Location` Varchar
);

CREATE TABLE `ClassSession` (
  `SessionID` Integer PRIMARY KEY,
  `CourseID` Integer,
  `SessionDate` Date,
  `StartTime` Time,
  `EndTime` Time,
  `Location` Varchar
);

CREATE TABLE `Enrollment` (
  `EnrollmentID` Integer PRIMARY KEY,
  `StudentID` Integer,
  `CourseID` Integer,
  `EnrollmentDate` Date,
  `Status` Varchar
);

CREATE TABLE `Task` (
  `TaskID` Integer PRIMARY KEY,
  `CourseID` Integer,
  `Title` Varchar,
  `Description` Text,
  `Deadline` Date
);

CREATE TABLE `Submission` (
  `SubmissionID` Integer PRIMARY KEY,
  `TaskID` Integer,
  `StudentID` Integer,
  `SubmissionDate` Date,
  `Content` Text,
  `Status` Varchar
);

CREATE TABLE `FirstMockInterview` (
  `FirstMockID` Integer PRIMARY KEY,
  `StudentID` Integer,
  `Performance` Text,
  `Score` Integer
);

CREATE TABLE `SecondMockInterview` (
  `SecondMockID` Integer PRIMARY KEY,
  `StudentID` Integer,
  `Performance` Text,
  `Score` Integer
);

CREATE TABLE `PlacementPreparation` (
  `PreparationID` Integer PRIMARY KEY,
  `StudentID` Integer,
  `Topic` Varchar,
  `Resources` Text,
  `Status` Varchar
);

CREATE TABLE `Attendance` (
  `AttendanceID` Integer PRIMARY KEY,
  `ClassID` Integer,
  `SessionDate` Date,
  `StudentID` Integer,
  `IsPresent` Boolean
);

CREATE TABLE `LeaveApplication` (
  `LeaveAppID` Integer PRIMARY KEY,
  `StudentID` Integer,
  `SubmissionDate` Date,
  `LeaveStartDate` Date,
  `LeaveEndDate` Date,
  `Reason` Text,
  `Status` Varchar
);

CREATE TABLE `Leaderboard` (
  `LeaderboardID` Integer PRIMARY KEY,
  `CourseID` Integer,
  `StudentID` Integer,
  `Points` Integer
);

CREATE TABLE `Syllabus` (
  `SyllabusID` Integer PRIMARY KEY,
  `CourseID` Integer,
  `Title` Varchar,
  `Description` Text
);

ALTER TABLE `Class` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

ALTER TABLE `ClassSession` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

ALTER TABLE `Enrollment` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `Enrollment` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

ALTER TABLE `Task` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

ALTER TABLE `Submission` ADD FOREIGN KEY (`TaskID`) REFERENCES `Task` (`TaskID`);

ALTER TABLE `Submission` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `FirstMockInterview` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `SecondMockInterview` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `PlacementPreparation` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `Attendance` ADD FOREIGN KEY (`ClassID`) REFERENCES `Class` (`ClassID`);

ALTER TABLE `Attendance` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `LeaveApplication` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `Leaderboard` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

ALTER TABLE `Leaderboard` ADD FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

ALTER TABLE `Syllabus` ADD FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);
