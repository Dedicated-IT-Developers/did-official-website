-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2025 at 08:54 AM
-- Server version: 8.2.0
-- PHP Version: 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `did`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts_contact`
--

DROP TABLE IF EXISTS `abouts_contact`;
CREATE TABLE IF NOT EXISTS `abouts_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `number` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `website` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_contact`
--

INSERT INTO `abouts_contact` (`id`, `email`, `number`, `address`, `website`) VALUES
(1, 'dedicateditdevelopers@gmail.com', 'na', 'Calapan City, Oriental Mindoro, Philippines', 'http://did.confired.com');

-- --------------------------------------------------------

--
-- Table structure for table `abouts_education`
--

DROP TABLE IF EXISTS `abouts_education`;
CREATE TABLE IF NOT EXISTS `abouts_education` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `degree` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `field_of_study` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_year` int NOT NULL,
  `end_year` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_education_team_id_583b2b6f_fk_abouts_team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_education`
--

INSERT INTO `abouts_education` (`id`, `school`, `degree`, `field_of_study`, `start_year`, `end_year`, `description`, `created`, `updated`, `team_id`) VALUES
(1, 'Mindoro State University', 'Bachelor of Science in Information Technology', NULL, 2014, 2018, '', '2025-03-28 08:25:35.357000', '2025-03-28 08:26:00.504000', 2),
(2, 'Batangas State University - The National Engineering University', 'Master of Science in Information Technology', 'Machine Learning', 2019, 2023, '', '2025-03-28 08:26:48.552000', '2025-03-28 08:26:48.552000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `abouts_experience`
--

DROP TABLE IF EXISTS `abouts_experience`;
CREATE TABLE IF NOT EXISTS `abouts_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_experience_team_id_58d51593_fk_abouts_team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_experience`
--

INSERT INTO `abouts_experience` (`id`, `company`, `position`, `start_date`, `end_date`, `description`, `created`, `updated`, `team_id`) VALUES
(1, 'Dedicated IT Developers (DiD)', 'Founder, IT Expert, Project Manager, Full-Stack Developer', '2024-03-04', NULL, 'Dedicated IT Developers (DiD) is a dynamic community of IT students driven by innovation, collaboration, and excellence. Guided by our esteemed IT faculty mentors, we strive to bridge the gap between academic learning and real-world application.', '2025-03-28 08:16:24.816000', '2025-03-28 08:16:24.816000', 2),
(2, 'Mindoro State University Management Information System (MIS) Office', 'IT Staff', '2018-06-05', '2020-02-28', 'Responsible for performing IT operations such as Network Configurations, Computer Troubleshooting, System Planning, Development, and Maintenance. Lead Programmer/Developer of the First Web-based Enrollment System (Version 1) of the University.', '2025-03-30 05:48:26.074000', '2025-03-30 05:48:26.074000', 2),
(3, 'Mindoro State University', 'IT Instructor', '2020-03-02', NULL, 'Responsible for developing instructional materials and teaching IT courses that equip students with industry-relevant skills for their future careers. Guided, facilitated, and supervised student activities, projects, research, and extension initiatives within the IT Department. Designed and implemented application/systems for the department while also developing solutions, conducting research, and leading extension projects that benefit both the university and the broader community.', '2025-03-30 05:52:58.306000', '2025-03-30 05:52:58.306000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `abouts_personalproject`
--

DROP TABLE IF EXISTS `abouts_personalproject`;
CREATE TABLE IF NOT EXISTS `abouts_personalproject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `tech_stack` json NOT NULL,
  `features` json NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `team_id` bigint NOT NULL,
  `project_link` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_personalproject_team_id_bbd79438_fk_abouts_team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_personalproject`
--

INSERT INTO `abouts_personalproject` (`id`, `project_name`, `description`, `tech_stack`, `features`, `created`, `updated`, `team_id`, `project_link`) VALUES
(1, 'ConfiRed Framework', 'A light and basic PHP MVC Framework. It was created to examine the structure of an MVC Framework and how it works. It uses static methods to implement Libraries or Helpers better, clear, and easy management. In some PHP versions, a static method is slower than non-static methods. You can also use object-oriented approach.', '[\"PHP\"]', '[\"OOP\", \"MVC\"]', '2025-03-28 08:21:36.893000', '2025-03-28 08:21:36.893000', 2, 'https://github.com/wilfredpine/confired');

-- --------------------------------------------------------

--
-- Table structure for table `abouts_project`
--

DROP TABLE IF EXISTS `abouts_project`;
CREATE TABLE IF NOT EXISTS `abouts_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `tech_stack` json NOT NULL,
  `features` json NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `link` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_project`
--

INSERT INTO `abouts_project` (`id`, `project_name`, `project_type`, `description`, `tech_stack`, `features`, `created`, `updated`, `link`) VALUES
(1, 'DiD Official Website', 'Web Application', 'DiD Official Website is a web application developed by DiD Members using Python. The website is designed using html and tailwind css.', '[\"django\", \"tailwind\"]', '[\"Home\", \"Page\", \"Projects\", \"Teams\", \"Portfolio\", \"About\", \"Contacts\"]', '2025-02-10 13:33:22.514000', '2025-03-28 07:45:57.643000', 'https://did.confired.com/'),
(2, 'Event Attendance Monitoring System', 'Web Application', 'The Event Attendance Monitoring System is a web-based application designed to streamline attendance tracking for events, conferences, and gatherings. Utilizing RFID, the system enables real-time check-ins, automated validation, and secure data storage. Features include live attendance monitoring, reporting, analytics, and integration, ensuring accurate and efficient attendance management. Ideal for organizations, schools, and businesses, this system enhances event security, reduces manual errors, and provides insightful attendance data.', '[\"ExpressJS\", \"PosgreSql\", \"HTML -Bootstrap\"]', '[\"RFID Scanner\", \"Student Registration\", \"Attendance Tracking\", \"Reports\", \"Others\"]', '2025-02-11 01:19:50.894000', '2025-02-11 01:19:50.894000', NULL),
(3, 'TeachTrack', 'Web Application', 'TeachTrack is an RFID-based monitoring system that tracks faculty members\' presence inside the faculty office. By tapping their RFID cards, the system updates their status as \"Inside\" or \"Outside\" in real-time, providing a quick and efficient way to monitor faculty availability.', '[\"Django\", \"Tailwind\"]', '[\"RFID\", \"Kiosk\", \"Admin\"]', '2025-03-27 13:21:35.477000', '2025-03-28 07:45:21.279000', NULL),
(4, 'RoVote: Student Organization Voting System', 'Web Application', 'Web-based Voting system for student organization of Mindoro State University Calapan City Campus', '[\"PHP\", \"MySQL\", \"LavaLust-MVC-Framework\", \"HTML-Bootstrap\"]', '[\"Student-Registration\", \"Realtime-Display-Results\", \"Voting-Panel(Kiosk)\", \"Report-Generation\", \"Validation&Security\", \"More\"]', '2025-03-30 06:09:20.898000', '2025-03-30 06:09:20.898000', NULL),
(5, 'Student Kiosk - Student Information Tracker System for Faculty', 'Web Application', 'MINSU-Student-Kiosk is a faculty-accessible system designed to quickly search, retrieve, and manage student information. The system will be deployed as both a kiosk for searching and a secured admin panel for full management.', '[\"Laravel-11\", \"TailwindCSS\", \"Blade\", \"MySQL\", \"Laravel-Breeze\"]', '[\"Kiosk\", \"Admin-Dashboard\", \"More\"]', '2025-03-30 07:07:12.956000', '2025-03-30 07:07:12.956000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `abouts_projectdeveloper`
--

DROP TABLE IF EXISTS `abouts_projectdeveloper`;
CREATE TABLE IF NOT EXISTS `abouts_projectdeveloper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_projectdeveloper_project_id_e62d6256_fk_abouts_project_id` (`project_id`),
  KEY `abouts_projectdeveloper_team_id_aab9646a_fk_abouts_team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_projectdeveloper`
--

INSERT INTO `abouts_projectdeveloper` (`id`, `role`, `project_id`, `team_id`) VALUES
(4, 'Project Manager, Lead Programmer & Fullstack Developer', 2, 2),
(6, 'Project Manager, Lead Programmer & Back-end Developer', 3, 2),
(7, 'Project Manager, Lead Programmer, & Full-stack Developer', 1, 2),
(8, 'Project Manager & Fullstack Developer', 4, 2),
(9, 'Full-stack Developer', 4, 13),
(10, 'Full-stack Developer', 1, 14),
(11, 'Full-stack Developer', 3, 14),
(12, 'Programmer & QA Tester', 4, 15),
(13, 'Full-stack Developer', 3, 16),
(14, 'Front-end Developer', 1, 16),
(15, 'Front-end Developer', 1, 17),
(16, 'Full-stack Developer', 2, 18),
(17, 'Full-stack Developer', 2, 3),
(18, 'Lead Programmer & Full-stack Developer', 5, 19),
(19, 'Project Manager & QA', 5, 2),
(20, 'Front-end Developer/Graphic Designer', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `abouts_projectimage`
--

DROP TABLE IF EXISTS `abouts_projectimage`;
CREATE TABLE IF NOT EXISTS `abouts_projectimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_projectimage_project_id_64657b96_fk_abouts_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_projectimage`
--

INSERT INTO `abouts_projectimage` (`id`, `image`, `uploaded_at`, `project_id`) VALUES
(1, 'project_images/did.PNG', '2025-02-10 13:34:54.716000', 1),
(6, 'project_images/kiosk.PNG', '2025-03-28 07:52:26.943000', 2),
(7, 'project_images/login.PNG', '2025-03-28 07:52:33.303000', 2),
(8, 'project_images/staff.PNG', '2025-03-28 07:52:41.007000', 2),
(9, 'project_images/admin.PNG', '2025-03-28 07:52:47.685000', 2),
(10, 'project_images/scan.PNG', '2025-03-28 07:52:54.127000', 2),
(11, 'project_images/DiD_Logo.png', '2025-03-28 07:59:12.514000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `abouts_sliderposter`
--

DROP TABLE IF EXISTS `abouts_sliderposter`;
CREATE TABLE IF NOT EXISTS `abouts_sliderposter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slider_image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_sliderposter`
--

INSERT INTO `abouts_sliderposter` (`id`, `slider_image`, `status`, `created`, `updated`) VALUES
(3, 'slider_images/vaGlzhdl.jpg', 'active', '2025-02-10 12:50:47.981000', '2025-02-12 04:50:55.325000'),
(4, 'slider_images/uKRgnASI.jpg', 'active', '2025-02-10 12:50:55.473000', '2025-02-12 04:51:02.926000'),
(5, 'slider_images/iChFfAhg.jpg', 'active', '2025-02-10 12:51:00.376000', '2025-02-12 04:51:10.007000'),
(6, 'slider_images/6ZZAoijn.jpg', 'active', '2025-02-12 04:51:17.233000', '2025-02-12 04:51:17.233000'),
(7, 'slider_images/_z-m1N2n.jpg', 'active', '2025-02-12 04:51:23.900000', '2025-02-12 04:51:23.900000');

-- --------------------------------------------------------

--
-- Table structure for table `abouts_team`
--

DROP TABLE IF EXISTS `abouts_team`;
CREATE TABLE IF NOT EXISTS `abouts_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `objectives` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `skills` json NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_general_ci,
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `github` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts_team`
--

INSERT INTO `abouts_team` (`id`, `name`, `position`, `objectives`, `skills`, `photo`, `created`, `updated`, `user_id`, `website`, `role`, `address`, `email`, `facebook`, `github`, `instagram`, `linkedin`, `phone`, `twitter`, `youtube`) VALUES
(2, 'Wilfred V. Pine, MSIT', 'DiD Founder, IT Expert, Project Manager, Full-Stack Developer', 'Highly motivated and skilled web developer with expertise in front-end and back-end technologies, dedicated to delivering innovative, user-centric solutions. Proficient in leadership, project management, and mentorship, with a strong passion for integrating cutting-edge technologies, including machine learning, to drive efficiency, scalability, and intelligent automation in modern digital solutions.', '[\"Python\", \"PHP\", \"C#\", \"NodeJS\", \"Java\", \"IoT\", \"Machine-Learning\", \"Adobe\"]', 'team_photos/DSC_8968_yzmCouA.JPG', '2025-03-28 07:39:02.032000', '2025-03-29 13:52:43.751000', 2, 'https://confired.com', 'founder', 'Calapan City, Oriental Mindoro, Philippines', 'wilfredpine9@gmail.com', 'https://www.facebook.com/confiredtechnology', 'https://github.com/wilfredpine', 'https://www.instagram.com/wilfredpine/', 'https://www.linkedin.com/in/wilfredpine/', NULL, 'https://twitter.com/wilfredpine9', 'https://www.youtube.com/@confired-official/'),
(3, 'Ariston A. Magboo Jr.', 'Full-stack Developer', 'To earn new knowledge by solving real world problems, enhance my skills in different situations.', '[\"Python\", \"PHP\", \"NodeJS\", \"C#\", \"Java\", \"IoT\", \"Lavalust\", \"Vue\", \"Code\", \"Igniter\", \"Django\", \"ExpressJS\", \"HTML\", \"Bootstrap\", \"Tailwind\", \"CSS\", \"Adobe\", \"Photoshop\", \"Machine-Learning\"]', 'team_photos/ID_PIC_-_Magboo_Jr._Ariston_A..jpg', '2025-03-29 23:10:21.464000', '2025-03-29 23:58:20.401000', 3, NULL, 'member', '', NULL, NULL, 'https://github.com/Inton0417', NULL, NULL, NULL, NULL, NULL),
(6, 'Fidel C. Romasanta, MIT', 'DiD Founder, IT Expert, Project Manager, Programmer', 'Develop a roadmap for long-term sustainability, ensuring continuous growth, adaptation, and positive impact in the tech community. Instill a culture of teamwork, leadership, and knowledge-sharing to empower members to become industry leaders.', '[\"Programming\", \"Internet-of-Things\", \"Leadership\", \"Project-Management\", \"Mentoring\"]', 'team_photos/5R3_FO7RLpr.jpg', '2025-03-29 23:59:58.473000', '2025-03-30 03:30:19.668000', 4, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Ronald M. Marasigan, MSIT', 'DiD Founder, IT Expert, Project Manager, Full-Stack Developer', 'Provide mentorship, training, and hands-on projects to help members enhance their technical skills, preparing them for real-world challenges. Ensure sustainable solutions by focusing on scalable, well-documented, and continuously improving systems for long-term effectiveness.', '[\"PHP\", \"C#\", \"Java\", \"JS\", \"Laravel\", \"CodeIgniter\", \"LavaLust\"]', 'team_photos/5R8.jpg', '2025-03-30 00:40:45.538000', '2025-03-30 00:40:45.538000', 5, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Elmer H. Festijo, MSIT', 'DiD Founder, IT Expert, Project Manager, Programmer', 'Provide mentorship, training, and hands-on projects to help members enhance their technical skills, preparing them for real-world challenges.', '[\"Network-Administration\", \"Virtualization\", \"Cyber-Security\", \"Internet-of-Things\", \"Project-Management\", \"Programming\"]', 'team_photos/5R5.jpg', '2025-03-30 02:29:49.720000', '2025-03-30 02:29:49.720000', 7, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Engr. Jesus M. Bautista, MSIT', 'DiD Founder, IT Expert, Network/System Administrator', 'Ensure sustainable solutions by focusing on scalable, well-documented, and continuously improving systems for long-term effectiveness.', '[\"Network-Administration\", \"System-Administration\", \"Virtualization\", \"Cyber-Security\", \"Project-Management\"]', 'team_photos/5R4.jpg', '2025-03-30 02:40:21.645000', '2025-03-30 02:40:21.645000', 8, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Kristianne Aleza Marie L. Javier, MSIT', 'DiD Founder, IT Expert, Project Manager', 'Develop a roadmap for long-term sustainability, ensuring continuous growth, adaptation, and positive impact in the tech community.', '[\"Programming\", \"Network\", \"CMS\", \"ERP\", \"Project-Management\"]', 'team_photos/5R6.jpg', '2025-03-30 02:59:39.401000', '2025-03-30 02:59:39.401000', 6, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Malou B. Aday', 'DiD Founder, IT Expert, Project Manager, Programmer', 'Guide members in creating strong professional portfolios, resumes, and LinkedIn profiles to improve their job opportunities after graduation.', '[\"Programming\", \"Docker\", \"Project-Management\"]', '', '2025-03-30 03:26:22.805000', '2025-03-30 03:26:22.805000', 9, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Dezza Marie M. Magsino, MSIT', 'DiD Founder, IT Expert, Project Manager, Programmer', 'Provide mentorship, training, and hands-on projects to help members enhance their technical skills, preparing them for real-world challenges.', '[\"Programming\", \"Project-Management\", \"Mentoring\"]', 'team_photos/5R7.jpg', '2025-03-30 03:29:48.489000', '2025-03-30 03:29:48.489000', 10, NULL, 'founder', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Noel Dimailig', 'IT Expert, Full-stack Developer', '--', '[\"PHP\", \"Python\", \"MVC\", \"Django\", \"C#\", \"JS\"]', '', '2025-03-30 06:15:21.968000', '2025-03-30 06:15:21.968000', 11, NULL, 'alumni', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Sonny Sarcia', 'Full-stack Developer', 'Participate in research and development initiatives to advance technology.', '[\"Python\", \"PHP\", \"C#\", \"Java\", \"NodeJS\", \"Machine-Learning\"]', '', '2025-03-30 06:27:55.201000', '2025-03-30 06:27:55.201000', 12, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Lileth V. Pine', 'Full-stack Developer, Quality Assurance Analyst', 'Collaborate on innovative solutions to address community challenges.', '[\"PHP\", \"MySQL\", \"HTML-Bootstrap\", \"MVC\", \"Agile\"]', '', '2025-03-30 06:39:04.789000', '2025-03-30 06:39:04.789000', 13, NULL, 'alumni', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Edward Gatbonton', 'Full-stack Developer', '--', '[\"PHP\", \"MVC\", \"C#\", \"Python\", \"Tailwind\"]', '', '2025-03-30 06:48:21.185000', '2025-03-30 06:48:21.185000', 14, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Cy Kean Angel Dave R. Perjes', 'Full-stack Developer', 'To enhance my skills and learn new programming languages and frameworks and to be familiarize to the environment of team project and too experience real-world project and to collaborate with other members of the organization.', '[\"PHP\", \"HTML\", \"CSS\", \"Tailwind\", \"Laravel\", \"Python\", \"NodeJS\", \"Bootstrap\", \"Firebase\", \"SQL\", \"Django\"]', 'team_photos/Untitled_design_-_Cy_Kean_Perjes.png', '2025-03-30 06:53:28.344000', '2025-03-30 06:53:28.344000', 15, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Ian Sandoval', 'Full-stack Developer', '--', '[\"PHP\", \"C#\", \"Python\", \"MVC\"]', '', '2025-03-30 06:57:32.080000', '2025-03-30 06:57:32.080000', 16, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Mark Lua', 'Full-stack Developer', '--', '[\"PHP\", \"Python\", \"Laravel\", \"Django\", \"NodeJS\"]', '', '2025-03-30 07:03:41.818000', '2025-03-30 07:03:41.818000', 17, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Loraine B. Alagasi', 'Front-end Developer, Graphic Designer, Programmer, QA Tester', 'To apply my skills in web development and UI design in real-world projects, continuously learn new technologies, and contribute to innovative solutions.', '[\"HTML\", \"Bootstrap\", \"Tailwind\", \"CSS\", \"Node.js\", \"and\", \"Vue.js\"]', 'team_photos/loraine_alagasi_-_Alagasi_Loraine_B..png', '2025-03-30 07:13:20.489000', '2025-03-30 07:13:20.489000', 18, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Lance Kianne E. Brito', 'Programmer', 'To become a skilled IT student', '[\"C\", \"C#\", \"Java\", \"SQL\"]', 'team_photos/IMG_20240816_024955_114920_-_LANCE_KIANNE_BRITO.jpg', '2025-03-31 08:53:33.998435', '2025-03-31 08:53:33.998481', 19, NULL, 'member', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'members');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 32),
(2, 1, 38),
(3, 1, 49),
(4, 1, 50),
(5, 1, 51),
(6, 1, 52),
(7, 1, 53),
(8, 1, 54),
(9, 1, 55),
(10, 1, 56),
(11, 1, 57),
(12, 1, 58),
(13, 1, 59),
(14, 1, 60);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add contact', 7, 'add_contact'),
(26, 'Can change contact', 7, 'change_contact'),
(27, 'Can delete contact', 7, 'delete_contact'),
(28, 'Can view contact', 7, 'view_contact'),
(29, 'Can add project', 8, 'add_project'),
(30, 'Can change project', 8, 'change_project'),
(31, 'Can delete project', 8, 'delete_project'),
(32, 'Can view project', 8, 'view_project'),
(33, 'Can add slider poster', 9, 'add_sliderposter'),
(34, 'Can change slider poster', 9, 'change_sliderposter'),
(35, 'Can delete slider poster', 9, 'delete_sliderposter'),
(36, 'Can view slider poster', 9, 'view_sliderposter'),
(37, 'Can add team', 10, 'add_team'),
(38, 'Can change team', 10, 'change_team'),
(39, 'Can delete team', 10, 'delete_team'),
(40, 'Can view team', 10, 'view_team'),
(41, 'Can add project developer', 11, 'add_projectdeveloper'),
(42, 'Can change project developer', 11, 'change_projectdeveloper'),
(43, 'Can delete project developer', 11, 'delete_projectdeveloper'),
(44, 'Can view project developer', 11, 'view_projectdeveloper'),
(45, 'Can add project image', 12, 'add_projectimage'),
(46, 'Can change project image', 12, 'change_projectimage'),
(47, 'Can delete project image', 12, 'delete_projectimage'),
(48, 'Can view project image', 12, 'view_projectimage'),
(49, 'Can add personal project', 13, 'add_personalproject'),
(50, 'Can change personal project', 13, 'change_personalproject'),
(51, 'Can delete personal project', 13, 'delete_personalproject'),
(52, 'Can view personal project', 13, 'view_personalproject'),
(53, 'Can add education', 14, 'add_education'),
(54, 'Can change education', 14, 'change_education'),
(55, 'Can delete education', 14, 'delete_education'),
(56, 'Can view education', 14, 'view_education'),
(57, 'Can add experience', 15, 'add_experience'),
(58, 'Can change experience', 15, 'change_experience'),
(59, 'Can delete experience', 15, 'delete_experience'),
(60, 'Can view experience', 15, 'view_experience');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-09 15:19:44.251000', '2', 'wilfredpine9', 1, '[{\"added\": {}}]', 6, 1),
(2, '2025-02-09 15:20:57.309000', '2', 'wilfredpine9', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 6, 1),
(3, '2025-02-10 06:29:03.213000', '1', 'Slider 1 - active', 1, '[{\"added\": {}}]', 9, 1),
(4, '2025-02-10 06:32:16.146000', '2', 'Slider 2 - active', 1, '[{\"added\": {}}]', 9, 1),
(5, '2025-02-10 06:46:52.214000', '2', 'Slider 2 - active', 3, '', 9, 1),
(6, '2025-02-10 12:50:26.774000', '1', 'Slider 1 - active', 3, '', 9, 1),
(7, '2025-02-10 12:50:47.983000', '3', 'Slider 3 - active', 1, '[{\"added\": {}}]', 9, 1),
(8, '2025-02-10 12:50:55.475000', '4', 'Slider 4 - active', 1, '[{\"added\": {}}]', 9, 1),
(9, '2025-02-10 12:51:00.378000', '5', 'Slider 5 - active', 1, '[{\"added\": {}}]', 9, 1),
(10, '2025-02-10 13:33:22.517000', '1', 'DiD Official Website', 1, '[{\"added\": {}}]', 8, 1),
(11, '2025-02-10 13:34:54.717000', '1', 'Image for DiD Official Website', 1, '[{\"added\": {}}]', 12, 1),
(12, '2025-02-10 14:24:51.006000', '1', 'DiD Official Website', 2, '[{\"changed\": {\"fields\": [\"Features\"]}}]', 8, 1),
(13, '2025-02-10 15:01:55.361000', '1', 'Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(14, '2025-02-10 15:05:51.146000', '1', 'Image for DiD Official Website', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 1),
(15, '2025-02-10 15:06:06.417000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 10, 1),
(16, '2025-02-10 15:07:32.823000', '1', 'Image for DiD Official Website', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 1),
(17, '2025-02-10 15:31:27.194000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 10, 1),
(18, '2025-02-10 15:54:05.815000', '1', 'Wilfred V. Pine, MSIT - Project Manager, Back-end Developer', 1, '[{\"added\": {}}]', 11, 1),
(19, '2025-02-10 15:55:01.743000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Projects\"]}}]', 10, 1),
(20, '2025-02-10 16:03:39.808000', '1', 'dedicateditdevelopers@gmail.com', 1, '[{\"added\": {}}]', 7, 1),
(21, '2025-02-10 16:14:48.201000', '1', 'ConfiRed (Personal) - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 13, 1),
(22, '2025-02-10 17:30:29.018000', '3', 'sonny', 1, '[{\"added\": {}}]', 6, 1),
(23, '2025-02-10 17:31:30.920000', '2', 'Sonny Sarcia', 1, '[{\"added\": {}}]', 10, 1),
(24, '2025-02-10 17:32:09.798000', '2', 'Sonny Sarcia - Fullstack Developer', 1, '[{\"added\": {}}]', 11, 1),
(25, '2025-02-11 01:02:44.275000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Position\", \"Objectives\", \"Skills\"]}}]', 10, 1),
(26, '2025-02-11 01:13:25.734000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(27, '2025-02-11 01:19:50.910000', '2', 'Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 8, 1),
(28, '2025-02-11 01:20:34.441000', '3', 'Wilfred V. Pine, MSIT - Fullstack Developer, Project Manager', 1, '[{\"added\": {}}]', 11, 1),
(29, '2025-02-11 01:30:43.308000', '2', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(30, '2025-02-11 01:30:54.057000', '3', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(31, '2025-02-11 01:31:04.424000', '4', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(32, '2025-02-11 01:31:12.676000', '5', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(33, '2025-02-11 01:56:15.729000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(34, '2025-02-12 04:50:55.326000', '3', 'Slider 3 - active', 2, '[{\"changed\": {\"fields\": [\"Slider image\"]}}]', 9, 1),
(35, '2025-02-12 04:51:02.928000', '4', 'Slider 4 - active', 2, '[{\"changed\": {\"fields\": [\"Slider image\"]}}]', 9, 1),
(36, '2025-02-12 04:51:10.009000', '5', 'Slider 5 - active', 2, '[{\"changed\": {\"fields\": [\"Slider image\"]}}]', 9, 1),
(37, '2025-02-12 04:51:17.235000', '6', 'Slider 6 - active', 1, '[{\"added\": {}}]', 9, 1),
(38, '2025-02-12 04:51:23.901000', '7', 'Slider 7 - active', 1, '[{\"added\": {}}]', 9, 1),
(39, '2025-02-18 06:46:30.640000', '3', 'sonny', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 6, 1),
(40, '2025-02-22 15:16:21.986000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(41, '2025-02-22 15:17:32.827000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(42, '2025-02-22 15:18:41.119000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(43, '2025-02-22 15:23:00.422000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(44, '2025-02-22 15:32:46.059000', '2', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(45, '2025-02-22 15:58:35.119000', '2', 'Sonny Sarcia', 3, '', 10, 1),
(46, '2025-02-22 16:03:13.403000', '4', 'Wilfred V. Pine, MSIT - Fullstack Developer, Project Manager', 1, '[{\"added\": {}}]', 11, 1),
(47, '2025-02-22 16:03:57.503000', '4', 'Wilfred V. Pine, MSIT - Fullstack Developer, Project Manager', 3, '', 11, 1),
(48, '2025-02-22 16:28:51.211000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 10, 1),
(49, '2025-02-22 16:29:14.100000', '1', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 10, 1),
(50, '2025-02-22 16:46:14.264000', '2', 'Egg (Personal) - Sonny Sarcia', 1, '[{\"added\": {}}]', 13, 1),
(51, '2025-02-22 17:12:10.134000', '2', 'Egg (Personal) - Sonny Sarcia', 3, '', 13, 1),
(52, '2025-02-22 17:12:51.086000', '5', 'Sonny Sarcia - Fullstack Developer', 1, '[{\"added\": {}}]', 11, 1),
(53, '2025-02-22 17:13:14.022000', '3', 'Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Objectives\"]}}]', 10, 1),
(54, '2025-02-23 03:46:18.416000', '3', 'Egg (Personal) - Sonny Sarcia', 3, '', 13, 1),
(55, '2025-02-23 03:46:24.885000', '4', 'asdasd (Personal) - Sonny Sarcia', 3, '', 13, 1),
(56, '2025-02-23 03:59:48.187000', '5', 'Egg (Personal) - Sonny Sarcia', 3, '', 13, 1),
(57, '2025-03-27 08:25:28.709000', '1', 'members', 1, '[{\"added\": {}}]', 3, 1),
(58, '2025-03-27 08:26:37.831000', '3', 'sonny', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 6, 1),
(59, '2025-03-27 08:41:25.923000', '1', 'members', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(63, '2025-03-27 13:21:35.480000', '3', 'TeachTrack', 1, '[{\"added\": {}}]', 8, 1),
(64, '2025-03-27 13:29:23.772000', '3', 'TeachTrack', 2, '[{\"changed\": {\"fields\": [\"Tech stack\", \"Features\"]}}]', 8, 1),
(65, '2025-03-27 13:49:29.859000', '3', 'TeachTrack', 2, '[{\"changed\": {\"fields\": [\"Tech stack\", \"Features\"]}}]', 8, 1),
(66, '2025-03-27 13:53:19.128000', '10', 'dsfngkjhb rjh yt trhtj h th (Personal) - Sonny Sarcia', 2, '[{\"changed\": {\"fields\": [\"Tech stack\", \"Features\"]}}]', 13, 1),
(68, '2025-03-27 15:13:37.021000', '4', 'user', 1, '[{\"added\": {}}]', 6, 1),
(69, '2025-03-27 15:14:21.432000', '4', 'user', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(70, '2025-03-27 15:16:03.540000', '4', 'User', 1, '[{\"added\": {}}]', 10, 1),
(71, '2025-03-28 03:40:52.746000', '11', 'csacsacsac (Personal) - Sonny Sarcia', 3, '', 13, 1),
(72, '2025-03-28 03:40:52.746000', '10', 'dsfngkjhb rjh yt trhtj h th (Personal) - Sonny Sarcia', 3, '', 13, 1),
(73, '2025-03-28 03:40:52.746000', '9', 'zczxcxc (Personal) - Sonny Sarcia', 3, '', 13, 1),
(74, '2025-03-28 03:40:52.746000', '1', 'ConfiRed (Personal) - Wilfred V. Pine, MSIT', 3, '', 13, 1),
(75, '2025-03-28 03:41:38.791000', '4', 'User', 3, '', 10, 1),
(76, '2025-03-28 03:41:52.684000', '3', 'Sonny Sarcia', 3, '', 10, 1),
(77, '2025-03-28 06:47:23.372000', '4', 'user', 3, '', 6, 1),
(78, '2025-03-28 07:09:48.335000', '3', 'Wilfred V. Pine, MSIT - Fullstack Developer, Project Manager', 3, '', 11, 1),
(79, '2025-03-28 07:09:48.335000', '1', 'Wilfred V. Pine, MSIT - Project Manager, Back-end Developer', 3, '', 11, 1),
(80, '2025-03-28 07:10:08.208000', '1', 'Wilfred V. Pine, MSIT', 3, '', 10, 1),
(81, '2025-03-28 07:10:23.208000', '3', 'sonny', 3, '', 6, 1),
(82, '2025-03-28 07:10:42.017000', '2', 'wilfredpine9', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 6, 1),
(83, '2025-03-28 07:39:02.042000', '2', 'Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(84, '2025-03-28 07:42:09.366000', '2', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 10, 1),
(85, '2025-03-28 07:45:21.281000', '3', 'TeachTrack', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Features\", \"Link\"]}}]', 8, 1),
(86, '2025-03-28 07:45:57.645000', '1', 'DiD Official Website', 2, '[{\"changed\": {\"fields\": [\"Features\", \"Link\"]}}]', 8, 1),
(87, '2025-03-28 07:48:16.947000', '1', 'Image for DiD Official Website', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 1),
(88, '2025-03-28 07:48:27.159000', '5', 'Image for Event Attendance Monitoring System', 3, '', 12, 1),
(89, '2025-03-28 07:48:27.159000', '4', 'Image for Event Attendance Monitoring System', 3, '', 12, 1),
(90, '2025-03-28 07:48:27.159000', '3', 'Image for Event Attendance Monitoring System', 3, '', 12, 1),
(91, '2025-03-28 07:48:27.159000', '2', 'Image for Event Attendance Monitoring System', 3, '', 12, 1),
(92, '2025-03-28 07:52:26.945000', '6', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(93, '2025-03-28 07:52:33.306000', '7', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(94, '2025-03-28 07:52:41.010000', '8', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(95, '2025-03-28 07:52:47.688000', '9', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(96, '2025-03-28 07:52:54.130000', '10', 'Image for Event Attendance Monitoring System', 1, '[{\"added\": {}}]', 12, 1),
(97, '2025-03-28 07:59:12.517000', '11', 'Image for TeachTrack', 1, '[{\"added\": {}}]', 12, 1),
(98, '2025-03-28 08:00:40.102000', '4', 'Wilfred V. Pine, MSIT - Project Manager & Fullstack Developer', 1, '[{\"added\": {}}]', 11, 1),
(99, '2025-03-28 08:02:58.960000', '2', 'wilfredpine9', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(100, '2025-03-28 08:08:54.742000', '1', 'members', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(101, '2025-03-28 08:16:24.822000', '1', 'Founder, IT Expert, Project Manager, Full-Stack Developer at Dedicated IT Developers (DiD) - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 15, 2),
(102, '2025-03-28 08:21:36.899000', '1', 'ConfiRed Framework (Personal) - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 13, 2),
(103, '2025-03-28 08:25:35.362000', '1', 'Bachelor of Science in Information Technology at Mindoro State University - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 14, 2),
(104, '2025-03-28 08:26:00.506000', '1', 'Bachelor of Science in Information Technology at Mindoro State University - Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Field of study\", \"Start year\", \"End year\"]}}]', 14, 2),
(105, '2025-03-28 08:26:48.554000', '2', 'Master of Science in Information Technology at Batangas State University - The National Engineering University - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 14, 2),
(106, '2025-03-28 08:34:53.512000', '5', 'moderator', 1, '[{\"added\": {}}]', 6, 1),
(107, '2025-03-28 08:37:16.861000', '5', 'moderator', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"User permissions\"]}}]', 6, 1),
(108, '2025-03-28 08:38:50.837000', '5', 'moderator', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 6, 1),
(109, '2025-03-28 08:41:46.189000', '5', 'moderator', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 6, 1),
(110, '2025-03-28 08:42:35.022000', '5', 'moderator', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 6, 1),
(111, '2025-03-28 08:44:25.111000', '5', 'moderator', 3, '', 6, 1),
(112, '2025-03-29 13:52:43.759000', '2', 'Wilfred V. Pine, MSIT', 2, '[{\"changed\": {\"fields\": [\"Linkedin\", \"Twitter\", \"Facebook\", \"Instagram\", \"Youtube\", \"Email\", \"Address\"]}}]', 10, 1),
(113, '2025-03-29 23:01:35.681000', '6', 'aristonmagboo17', 1, '[{\"added\": {}}]', 6, 1),
(114, '2025-03-29 23:02:38.896000', '6', 'aristonmagboo17', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(115, '2025-03-29 23:10:21.479000', '3', 'Ariston A. Magboo Jr.', 1, '[{\"added\": {}}]', 10, 1),
(116, '2025-03-29 23:13:20.307000', '7', 'delfirom', 1, '[{\"added\": {}}]', 6, 1),
(117, '2025-03-29 23:14:32.917000', '7', 'delfirome', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(118, '2025-03-29 23:58:20.408000', '3', 'Ariston A. Magboo Jr.', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 10, 1),
(119, '2025-03-29 23:59:58.477000', '6', 'Fidel C. Romasanta, MIT', 1, '[{\"added\": {}}]', 10, 1),
(120, '2025-03-30 00:29:19.330000', '6', 'Fidel C. Romasanta, MIT', 2, '[]', 10, 4),
(121, '2025-03-30 00:33:54.518000', '6', 'Fidel C. Romasanta, MIT', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 10, 1),
(122, '2025-03-30 00:37:11.267000', '8', 'ronmarasigan', 1, '[{\"added\": {}}]', 6, 1),
(123, '2025-03-30 00:37:27.592000', '8', 'ronmarasigan', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(124, '2025-03-30 00:40:45.546000', '7', 'Ronald M. Marasigan, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(125, '2025-03-30 00:44:09.884000', '6', 'Fidel C. Romasanta, MIT', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 10, 1),
(126, '2025-03-30 02:22:17.161000', '9', 'kamj', 1, '[{\"added\": {}}]', 6, 1),
(127, '2025-03-30 02:23:08.600000', '9', 'kamj', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(128, '2025-03-30 02:24:55.418000', '10', 'ehf', 1, '[{\"added\": {}}]', 6, 1),
(129, '2025-03-30 02:25:44.919000', '10', 'elmerfestijo', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(130, '2025-03-30 02:29:49.725000', '8', 'Elmer H. Festijo, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(131, '2025-03-30 02:32:39.646000', '11', 'jesusbautista', 1, '[{\"added\": {}}]', 6, 1),
(132, '2025-03-30 02:32:57.226000', '11', 'jesusbautista', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(133, '2025-03-30 02:40:21.648000', '9', 'Engr. Jesus M. Bautista, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(134, '2025-03-30 02:42:12.458000', '12', 'adaymalou30', 1, '[{\"added\": {}}]', 6, 1),
(135, '2025-03-30 02:42:36.602000', '12', 'adaymalou30', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(136, '2025-03-30 02:53:45.029000', '13', 'dhesmarie', 1, '[{\"added\": {}}]', 6, 1),
(137, '2025-03-30 02:54:58.060000', '13', 'dhesmarie', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(138, '2025-03-30 02:59:39.412000', '10', 'Kristianne Aleza Marie L. Javier, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(139, '2025-03-30 03:26:22.817000', '11', 'Malou B. Aday', 1, '[{\"added\": {}}]', 10, 1),
(140, '2025-03-30 03:29:48.491000', '12', 'Dezza Marie M. Magsino, MSIT', 1, '[{\"added\": {}}]', 10, 1),
(141, '2025-03-30 03:30:19.673000', '6', 'Fidel C. Romasanta, MIT', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 10, 1),
(142, '2025-03-30 05:20:34.003000', '5', 'Ariston A. Magboo Jr. - Fullstack Developer', 1, '[{\"added\": {}}]', 11, 1),
(143, '2025-03-30 05:22:16.735000', '4', 'Wilfred V. Pine, MSIT - Project Manager, Lead Programmer & Fullstack Developer', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 11, 1),
(144, '2025-03-30 05:48:26.088000', '2', 'IT Staff at Mindoro State University Management Information System (MIS) Office - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 15, 2),
(145, '2025-03-30 05:52:58.311000', '3', 'IT Instructor at Mindoro State University - Wilfred V. Pine, MSIT', 1, '[{\"added\": {}}]', 15, 2),
(146, '2025-03-30 06:00:39.733000', '6', 'Wilfred V. Pine, MSIT - Project Manager, Lead Programmer & Back-end Developer', 1, '[{\"added\": {}}]', 11, 1),
(147, '2025-03-30 06:01:26.197000', '7', 'Wilfred V. Pine, MSIT - Project Manager, Lead Programmer, & Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(148, '2025-03-30 06:09:20.917000', '4', 'RoVote: Student Organization Voting System', 1, '[{\"added\": {}}]', 8, 1),
(149, '2025-03-30 06:12:37.603000', '14', 'noeldimailig', 1, '[{\"added\": {}}]', 6, 1),
(150, '2025-03-30 06:13:04.623000', '14', 'noeldimailig', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(151, '2025-03-30 06:15:21.973000', '13', 'Noel Dimailig', 1, '[{\"added\": {}}]', 10, 1),
(152, '2025-03-30 06:16:59.290000', '8', 'Wilfred V. Pine, MSIT - Project Manager & Fullstack Developer', 1, '[{\"added\": {}}]', 11, 1),
(153, '2025-03-30 06:17:22.438000', '9', 'Noel Dimailig - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(154, '2025-03-30 06:25:02.695000', '15', 'SonyCookies', 1, '[{\"added\": {}}]', 6, 1),
(155, '2025-03-30 06:25:28.386000', '15', 'SonyCookies', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(156, '2025-03-30 06:27:55.221000', '14', 'Sonny Sarcia', 1, '[{\"added\": {}}]', 10, 1),
(157, '2025-03-30 06:29:10.926000', '10', 'Sonny Sarcia - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(158, '2025-03-30 06:29:26.398000', '11', 'Sonny Sarcia - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(159, '2025-03-30 06:35:24.191000', '16', 'lilethpine', 1, '[{\"added\": {}}]', 6, 1),
(160, '2025-03-30 06:35:39.869000', '16', 'lilethpine', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(161, '2025-03-30 06:39:04.812000', '15', 'Lileth V. Pine', 1, '[{\"added\": {}}]', 10, 1),
(162, '2025-03-30 06:40:16.822000', '12', 'Lileth V. Pine - Programmer & QA Tester', 1, '[{\"added\": {}}]', 11, 1),
(163, '2025-03-30 06:46:46.893000', '17', 'ejayayayyy', 1, '[{\"added\": {}}]', 6, 1),
(164, '2025-03-30 06:47:12.430000', '17', 'ejayayayyy', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(165, '2025-03-30 06:48:21.189000', '16', 'Edward Gatbonton', 1, '[{\"added\": {}}]', 10, 1),
(166, '2025-03-30 06:48:52.439000', '13', 'Edward Gatbonton - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(167, '2025-03-30 06:49:20.512000', '14', 'Edward Gatbonton - Front-end Developer', 1, '[{\"added\": {}}]', 11, 1),
(168, '2025-03-30 06:50:55.580000', '18', 'CyKean', 1, '[{\"added\": {}}]', 6, 1),
(169, '2025-03-30 06:51:09.164000', '18', 'CyKean', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(170, '2025-03-30 06:53:28.349000', '17', 'Cy Kean Angel Dave R. Perjes', 1, '[{\"added\": {}}]', 10, 1),
(171, '2025-03-30 06:54:45.731000', '15', 'Cy Kean Angel Dave R. Perjes - Front-end Developer', 1, '[{\"added\": {}}]', 11, 1),
(172, '2025-03-30 06:56:33.300000', '19', 'i4nizer', 1, '[{\"added\": {}}]', 6, 1),
(173, '2025-03-30 06:56:52.441000', '19', 'i4nizer', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(174, '2025-03-30 06:57:32.083000', '18', 'Ian Sandoval', 1, '[{\"added\": {}}]', 10, 1),
(175, '2025-03-30 06:57:51.621000', '16', 'Ian Sandoval - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(176, '2025-03-30 07:00:50.953000', '5', 'Ariston A. Magboo Jr. - Fullstack Developer', 3, '', 11, 1),
(177, '2025-03-30 07:01:02.795000', '17', 'Ariston A. Magboo Jr. - Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(178, '2025-03-30 07:02:21.287000', '20', 'Mr-LuaM', 1, '[{\"added\": {}}]', 6, 1),
(179, '2025-03-30 07:02:47.696000', '20', 'Mr-LuaM', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(180, '2025-03-30 07:03:41.840000', '19', 'Mark Lua', 1, '[{\"added\": {}}]', 10, 1),
(181, '2025-03-30 07:07:12.963000', '5', 'Student Kiosk - Student Information Tracker System for Faculty', 1, '[{\"added\": {}}]', 8, 1),
(182, '2025-03-30 07:08:11.942000', '18', 'Mark Lua - Lead Programmer & Full-stack Developer', 1, '[{\"added\": {}}]', 11, 1),
(183, '2025-03-30 07:09:02.904000', '19', 'Wilfred V. Pine, MSIT - Project Manager & QA', 1, '[{\"added\": {}}]', 11, 1),
(184, '2025-03-30 07:10:29.160000', '21', 'alagasiloraine', 1, '[{\"added\": {}}]', 6, 1),
(185, '2025-03-30 07:10:46.179000', '21', 'alagasiloraine', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(186, '2025-03-30 07:13:20.492000', '20', 'Loraine B. Alagasi', 1, '[{\"added\": {}}]', 10, 1),
(187, '2025-03-30 07:14:02.345000', '20', 'Loraine B. Alagasi - Front-end Developer/Graphic Designer', 1, '[{\"added\": {}}]', 11, 1),
(188, '2025-03-31 08:51:29.490805', '19', 'britolancekianne', 1, '[{\"added\": {}}]', 6, 1),
(189, '2025-03-31 08:51:46.371124', '19', 'britolancekianne', 2, '[{\"changed\": {\"fields\": [\"Email\", \"Staff status\", \"Groups\"]}}]', 6, 1),
(190, '2025-03-31 08:53:33.999921', '21', 'Lance Kianne E. Brito', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'abouts', 'contact'),
(14, 'abouts', 'education'),
(15, 'abouts', 'experience'),
(13, 'abouts', 'personalproject'),
(8, 'abouts', 'project'),
(11, 'abouts', 'projectdeveloper'),
(12, 'abouts', 'projectimage'),
(9, 'abouts', 'sliderposter'),
(10, 'abouts', 'team'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'users', 'customuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-03-31 08:37:47.878976'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-03-31 08:37:47.969328'),
(3, 'auth', '0001_initial', '2025-03-31 08:37:48.466243'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-03-31 08:37:48.550604'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-03-31 08:37:48.557494'),
(6, 'auth', '0004_alter_user_username_opts', '2025-03-31 08:37:48.563950'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-03-31 08:37:48.572510'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-03-31 08:37:48.574874'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-03-31 08:37:48.581576'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-03-31 08:37:48.588985'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-03-31 08:37:48.595720'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-03-31 08:37:48.613915'),
(13, 'auth', '0011_update_proxy_permissions', '2025-03-31 08:37:48.620531'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-03-31 08:37:48.627559'),
(15, 'users', '0001_initial', '2025-03-31 08:37:49.033490'),
(16, 'abouts', '0001_initial', '2025-03-31 08:37:49.311431'),
(17, 'abouts', '0002_initial', '2025-03-31 08:37:49.489252'),
(18, 'abouts', '0003_alter_project_features', '2025-03-31 08:37:49.557550'),
(19, 'abouts', '0004_remove_team_projects_personalproject', '2025-03-31 08:37:49.708141'),
(20, 'abouts', '0005_personalproject_project_link_team_website', '2025-03-31 08:37:49.772970'),
(21, 'abouts', '0006_personalproject_link_project_link_team_role', '2025-03-31 08:37:49.891475'),
(22, 'abouts', '0007_remove_personalproject_link', '2025-03-31 08:37:49.918787'),
(23, 'abouts', '0008_team_address_team_email_team_facebook_team_github_and_more', '2025-03-31 08:37:50.450457'),
(24, 'abouts', '0009_alter_education_options_alter_experience_options_and_more', '2025-03-31 08:37:50.484072'),
(25, 'abouts', '0010_alter_team_options', '2025-03-31 08:37:50.496650'),
(26, 'abouts', '0011_alter_team_role', '2025-03-31 08:37:50.543451'),
(27, 'abouts', '0012_alter_education_degree_and_more', '2025-03-31 08:37:52.328356'),
(28, 'admin', '0001_initial', '2025-03-31 08:37:52.518209'),
(29, 'admin', '0002_logentry_remove_auto_add', '2025-03-31 08:37:52.535349'),
(30, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-31 08:37:52.548815'),
(31, 'sessions', '0001_initial', '2025-03-31 08:37:52.594759');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
CREATE TABLE IF NOT EXISTS `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_customuser`
--

INSERT INTO `users_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `is_email_verified`, `email`) VALUES
(1, 'pbkdf2_sha256$870000$2HftBRyUNFS1nfUBqZAfAs$jhPamweRzoRUBET+6HzqxorWjVvHzr2IWY39bqayLSQ=', '2025-03-29 13:46:15.418000', 1, 'didadmin', '', '', 1, 1, '2025-02-09 15:10:32.442000', 0, 'wilfredpine9@gmail.com'),
(2, 'pbkdf2_sha256$870000$csEcSMf36pRVRg6ZkeOlLP$Uh4Je7LwXrbe0K6k2bNgtBvxDHqRT/7MoV8Hdc+7PJo=', '2025-03-30 05:39:34.198000', 0, 'wilfredpine9', '', '', 1, 1, '2025-02-09 15:19:42.000000', 1, 'only.master.red@gmail.com'),
(3, 'pbkdf2_sha256$870000$Vak160W8UkYqUgsaqpQzR2$0NzFSGIZOb7OV+ZUrApnvyUm5jXf87rlex1ioBm9+NQ=', '2025-03-30 00:30:32.151000', 0, 'aristonmagboo17', '', '', 1, 1, '2025-03-29 23:01:34.000000', 0, 'aristonmagboo17@gmail.com'),
(4, 'pbkdf2_sha256$870000$DVpxbyDKwfJkVShIFCzpOd$QhpyzHsarYnyQvwJcoxxWq87vpDd9QsNNXpdAoJEF8w=', '2025-03-30 00:14:16.139000', 0, 'delfirome', '', '', 1, 1, '2025-03-29 23:13:18.000000', 0, 'delfirome@gmail.com'),
(5, 'pbkdf2_sha256$870000$Zb0u9sAwl3YZ4mnXk8E269$R932RqJ9LRxoVuMmr41Xo4ayypXq8/QKQqgV/62b5x4=', NULL, 0, 'ronmarasigan', '', '', 1, 1, '2025-03-30 00:37:10.000000', 0, 'ronald.marasigan@yahoo.com'),
(6, 'pbkdf2_sha256$870000$h3gQsKQUCcyPcVOX3KmJZy$NbErPn0u3kRbznP1XZ4N+E24BNiYG9HoEWm0i/RJaI8=', NULL, 0, 'kamj', '', '', 1, 1, '2025-03-30 02:22:16.000000', 0, 'kam25javier@gmail.com'),
(7, 'pbkdf2_sha256$870000$ZzElY8kPnxSxIHleP9qXMn$HD5vX0WmeHLwnVu8d1lBfhO9E8Iw4zvlx+IT+SXYb/o=', NULL, 0, 'elmerfestijo', '', '', 1, 1, '2025-03-30 02:24:54.000000', 0, 'elmerfestijo@gmail.com'),
(8, 'pbkdf2_sha256$870000$g8q6PHsHrGUSB0CdIKIyZi$4Zp4Ky4oTRJuxFrdbKc9e+Y4otUz24WfKxFPDukQ808=', NULL, 0, 'jesusbautista', '', '', 1, 1, '2025-03-30 02:32:38.000000', 0, 'bautista_kf@yahoo.com'),
(9, 'pbkdf2_sha256$870000$tYJb8vzDDeuG2sDcRDk9yM$QvhJI0vAj2/Cr685ar1kyvtWCL3Y8QJ41732Jz4l+tQ=', NULL, 0, 'adaymalou30', '', '', 1, 1, '2025-03-30 02:42:11.000000', 0, 'adaymalou30@gmail.com'),
(10, 'pbkdf2_sha256$870000$K6kbMEj2P8yDF1ghVyo17g$V1sx4VP43w0n8qN7aths7gtQi8RiLr4HaHfviBKZi6Y=', NULL, 0, 'dhesmarie', '', '', 1, 1, '2025-03-30 02:53:44.000000', 0, 'dhesmarie@gmail.com'),
(11, 'pbkdf2_sha256$870000$l75b03fKEhVKdVYkwFXm5l$xI577Hskixh/SG7nwkBOn97u8O1OAJ74vo/hFYf16Fc=', NULL, 0, 'noeldimailig', '', '', 1, 1, '2025-03-30 06:12:36.000000', 0, 'noeldimailig@gmail.com'),
(12, 'pbkdf2_sha256$870000$rsN0b66uDyKR24Fcc0hQJF$Ewgc+sqi+skN6D7HZs1Mzjxxxb38o8oQB0keVsSB7lM=', NULL, 0, 'SonyCookies', '', '', 1, 1, '2025-03-30 06:25:01.000000', 0, 'sonycookies@gmail.com'),
(13, 'pbkdf2_sha256$870000$rYNNTiehXm6608TEyUUbF6$bC+RyFt9LcuzykG2yj2qY8hltTrKUKN0hHBEgCpAIOA=', NULL, 0, 'lilethpine', '', '', 1, 1, '2025-03-30 06:35:22.000000', 0, 'lilethpine@gmail.com'),
(14, 'pbkdf2_sha256$870000$cbdUXcVy5JVH9A5IicWxW3$ORmc/e6xWOMhbBTbALmNWGRlkU9bP963NhQlErwiXU4=', NULL, 0, 'ejayayayyy', '', '', 1, 1, '2025-03-30 06:46:45.000000', 0, 'ejayayayyy@gmail.com'),
(15, 'pbkdf2_sha256$870000$XVLRYnvaex13AeFGiZzCwy$kLfABDNZ0+JOL1yE/wKdcPbZrmDw/D4zz1Y7fvKcxx4=', NULL, 0, 'CyKean', '', '', 1, 1, '2025-03-30 06:50:54.000000', 0, 'perjescykean356@gmail.com'),
(16, 'pbkdf2_sha256$870000$xvi8eoVQugKGnwS1VnsSYK$Q4fnJ4/aJsLjCr0AG+NqxRSMzGFbenkv4UHXJPMBVN4=', NULL, 0, 'i4nizer', '', '', 1, 1, '2025-03-30 06:56:31.000000', 0, 'i4nizer@gmail.com'),
(17, 'pbkdf2_sha256$870000$nBgYrBhYvFEPUa9jb4YFSE$agMy4bE0/UfkBkpze/esQxy5lDXeqLOd76WvKTrQVtY=', NULL, 0, 'Mr-LuaM', '', '', 1, 1, '2025-03-30 07:02:19.000000', 0, 'luamark@gmail.com'),
(18, 'pbkdf2_sha256$870000$d9aUKucnWscDV5Iz8sLNTD$IKvSIbHTRTMYUrjCaFjxPBIDT1IefhaLbiFIhUAgPXA=', NULL, 0, 'alagasiloraine', '', '', 1, 1, '2025-03-30 07:10:27.000000', 0, 'alagasiloraine@gmail.com'),
(19, 'pbkdf2_sha256$870000$qWiDaxpJu26AKIvSNRVeRZ$8xlFnDNqoZ8BrAbUTtRuaW5u75OMjeBxt/v2AyZWDac=', NULL, 0, 'britolancekianne', '', '', 1, 1, '2025-03-31 08:51:28.000000', 0, 'britolancekianne@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
CREATE TABLE IF NOT EXISTS `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_customuser_groups`
--

INSERT INTO `users_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 1),
(18, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
CREATE TABLE IF NOT EXISTS `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abouts_education`
--
ALTER TABLE `abouts_education`
  ADD CONSTRAINT `abouts_education_team_id_583b2b6f_fk_abouts_team_id` FOREIGN KEY (`team_id`) REFERENCES `abouts_team` (`id`);

--
-- Constraints for table `abouts_experience`
--
ALTER TABLE `abouts_experience`
  ADD CONSTRAINT `abouts_experience_team_id_58d51593_fk_abouts_team_id` FOREIGN KEY (`team_id`) REFERENCES `abouts_team` (`id`);

--
-- Constraints for table `abouts_personalproject`
--
ALTER TABLE `abouts_personalproject`
  ADD CONSTRAINT `abouts_personalproject_team_id_bbd79438_fk_abouts_team_id` FOREIGN KEY (`team_id`) REFERENCES `abouts_team` (`id`);

--
-- Constraints for table `abouts_projectdeveloper`
--
ALTER TABLE `abouts_projectdeveloper`
  ADD CONSTRAINT `abouts_projectdeveloper_project_id_e62d6256_fk_abouts_project_id` FOREIGN KEY (`project_id`) REFERENCES `abouts_project` (`id`),
  ADD CONSTRAINT `abouts_projectdeveloper_team_id_aab9646a_fk_abouts_team_id` FOREIGN KEY (`team_id`) REFERENCES `abouts_team` (`id`);

--
-- Constraints for table `abouts_projectimage`
--
ALTER TABLE `abouts_projectimage`
  ADD CONSTRAINT `abouts_projectimage_project_id_64657b96_fk_abouts_project_id` FOREIGN KEY (`project_id`) REFERENCES `abouts_project` (`id`);

--
-- Constraints for table `abouts_team`
--
ALTER TABLE `abouts_team`
  ADD CONSTRAINT `abouts_team_user_id_3a55a831_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

--
-- Constraints for table `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
