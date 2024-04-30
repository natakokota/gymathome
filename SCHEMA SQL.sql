DROP TABLE user;
DROP TABLE program_exercise;
DROP TABLE exercises;
DROP TABLE program;

SELECT * FROM USER;
select * from program_exercise;
select * from program;


CREATE TABLE `user` (
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `program` (
  `programID` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(45) COLLATE utf8_unicode_ci DEFAULT NULL,   
  `musclegroup` ENUM('LEGS-GLUTES','ARMS','ABS','BACK') COLLATE utf8_unicode_ci NOT NULL,
  `difficultylevel` enum('Beginner','Intermediate', 'Advanced') COLLATE utf8_unicode_ci NOT NULL,
  `saved` tinyint(4) DEFAULT NULL,
  UNIQUE KEY `programID_UNIQUE` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `exercises` (
  `exercisename` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `musclegroup` enum('LEGS-GLUTES','ARMS','ABS','BACK') COLLATE utf8_unicode_ci NOT NULL,
  `imagepath` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`exercisename`),
  UNIQUE KEY `exercisename_UNIQUE` (`exercisename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `program_exercise` (
  `programID` INT NOT NULL,
  `exercisename` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`programID`,`exercisename`),
  KEY `exercisename` (`exercisename`),
  CONSTRAINT `exercisename` FOREIGN KEY (`exercisename`) REFERENCES `exercises` (`exercisename`),
  CONSTRAINT `programID` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO exercises (exercisename, musclegroup, imagepath)
values ('Squat hold','LEGS-GLUTES', './assets/images/LEGS/squathold.png'),
('Glute bridge alternating leg raises','LEGS-GLUTES', './assets/images/LEGS/glutebridgealternatinglegraises.png'),
('Glute bridge','LEGS-GLUTES', './assets/images/LEGS/glutebridge.png'),
('Frog bridge','LEGS-GLUTES', './assets/images/LEGS/frogbridge.png'),
('Fire hydrants','LEGS-GLUTES', './assets/images/LEGS/firehydrants.png'),
('Donkey kicks','LEGS-GLUTES', './assets/images/LEGS/donkeykicks.png'),
('Back lunges with knee ups','LEGS-GLUTES', './assets/images/LEGS/backlungeswithkneeups.png'),
('Single leg glute bridge','LEGS-GLUTES', './assets/images/LEGS/singlelegglutebridge.png'),

('Arm curls on chair','ARMS', './assets/images/ARMS/armcurlsonchair.png'),
('Renegade row','ARMS', './assets/images/ARMS/renegaderow.png'),
('Chest claps','ARMS', './assets/images/ARMS/chestclaps.png'),
('Forward arm pulses','ARMS', './assets/images/ARMS/forwardarmpulses.png'),
('Overhead press with steps','ARMS', './assets/images/ARMS/overheadpresswithsteps.png'),
('Plank with shoulder taps','ARMS', './assets/images/ARMS/plankwithshouldertaps.png'),
('Up and down arm raises','ARMS', './assets/images/ARMS/upanddownarmraises.png'),

('Butterfly arms','BACK', './assets/images/BACK/butterflyarms.png'),
('Flying superman','BACK', './assets/images/BACK/flyingsuperman.png'),
('Frog push up','BACK', './assets/images/BACK/frogpushup.png'),
('Knee push ups','BACK', './assets/images/BACK/kneepushups.png'),
('Pike push ups','BACK', './assets/images/BACK/pikepushups.png'),
('Plank and pike','BACK', './assets/images/BACK/plankandpike.png'),
('Push ups','BACK', './assets/images/BACK/pushups.png'),
('Wall arm slides','BACK', './assets/images/BACK/wallarmslides.png'),

('Bicycle crunches','ABS', './assets/images/bicyclecrunches.png'),
('Butterfly sit ups','ABS', './assets/images/butterflysitups.png'),
('Angeles lift','ABS', './assets/images/angeleslift.png'),
('Ball roll','ABS', './assets/images/ballroll.png'),
('Boat hold','ABS', './assets/images/boathold.png'),
('Chair sit ups','ABS', './assets/images/chairsitups.png'),
('Jack knives','ABS', './assets/images/jackknives.png'),
('Oblique leg raises','ABS', './assets/images/obliquelegraises.png');

INSERT INTO user (username, password, firstname, lastname, age, sex, email)
values ('marofoudou','123', 'Maro', 'Foudoulaki', 64, 'Female', 'marofoudoulaki@gmail.com'),
('katkol','123', 'Katerina', 'Koletta', 76, 'Male', 'katkoletta@gmail.com'),
('natkokota','123', 'Natalia', 'Kokota', 20, 'Female', 'nataliakokota@gmail.com'),
('gerverikios','123', 'Gerasimos', 'Verikios', 20, 'Male', 'gerasimosverikios@gmail.com');

INSERT INTO program (username, musclegroup, difficultylevel, saved)
values ('aimiktena', 'ABS', 'Beginner', true),
('aimiktena', 'BACK', 'Advanced', true),
('aimiktena', 'ABS', 'Beginner', false);

INSERT INTO program_exercise (programID, exercisename)
values
(1, 'Angeles lift'),
(1, 'Bicycle Crunches'), 
(2, 'Flying superman'), 
(2, 'Plank and pike'), 
(2, 'Frog push up'), 
(3, 'Angeles Lift'),
(3, 'Bicycle Crunches'); 
