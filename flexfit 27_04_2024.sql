-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2024 at 10:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flexfit`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_patient`
--

CREATE TABLE `add_patient` (
  `user_id` varchar(255) NOT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `FMS_Score` varchar(10) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `connection_type` enum('Online','Offline') NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_patient`
--

INSERT INTO `add_patient` (`user_id`, `patient_name`, `dob`, `gender`, `FMS_Score`, `mobile_number`, `connection_type`, `password`, `photo`) VALUES
('2319', 'happy', '2000-11-11', 'male', '100', '902983462', 'Offline', '', 'photos/1713257126_P.HEMAPRAKASH.jpg'),
('321', 'etache', '2003-02-25', 'male', '100', '9636241970', 'Online', '321', 'photos/1712118360_Screenshot 2023-08-26 203127.png'),
('543', 'happy', '2000-11-11', 'male', '100', '902983462', 'Offline', '', 'photos/1712130721_Screenshot (33).png'),
('EL123', 'Elamaran g', '2002-10-11', 'male', '80', '9346364288', 'Online', '123', ''),
('fa124', 'Navin ', '2008-07-04', 'male', '47', '8243468578', 'Offline', '', NULL),
('HP123', 'happy', '2000-11-11', 'male', '100', '902983462', 'Offline', '', NULL),
('HR1114', 'Honey', '2002-11-14', 'Femle', '90', '7283912953', 'Online', '1411', NULL),
('JO123', 'happy', '2000-11-11', 'male', '100', '902983462', 'Online', '9993', NULL),
('P00007', 'sarada', '0000-00-00', 'female ', '70', '9154467911', 'Offline', '', NULL),
('PR123', 'Pranaya', '2003-05-31', 'Female', '100', '9636241970', 'Online', '1335', NULL);

--
-- Triggers `add_patient`
--
DELIMITER $$
CREATE TRIGGER `after_add_patient_insert` AFTER INSERT ON `add_patient` FOR EACH ROW BEGIN
    -- Check if the new patient has an 'Online' connection type
    IF NEW.connection_type = 'Online' THEN
        -- Insert a record into the 'patients' table with the corresponding information
        INSERT INTO `patients` (`user_id`, `patient_name`, `dob`, `gender`, `FMS_Score`, `mobile_number`, `connection_type`, `password`)
        VALUES (NEW.user_id, NEW.patient_name, NEW.dob, NEW.gender, NEW.FMS_Score, NEW.mobile_number, NEW.connection_type, NEW.password);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `username` varchar(100) NOT NULL,
  `doctor_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`username`, `doctor_id`, `password`, `name`, `age`, `gender`) VALUES
('Doctor', '123', '123', 'Elamaran G', '26', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_message`
--

CREATE TABLE `doctor_message` (
  `s_no` int(11) NOT NULL,
  `date_and_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `stored_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_message`
--

INSERT INTO `doctor_message` (`s_no`, `date_and_time`, `user_id`, `stored_text`) VALUES
(13, '2024-04-08 13:49:03', 'fa124', 'you are good '),
(14, '2024-04-08 13:49:21', 'el123', 'you are good ');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_responses`
--

CREATE TABLE `feedback_responses` (
  `Id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `response_id` int(11) NOT NULL,
  `exercise_completion` enum('yes','no') DEFAULT NULL,
  `pain_scale` int(11) DEFAULT NULL,
  `feedback_option` varchar(100) DEFAULT NULL,
  `connection_type` enum('Online','Offline') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_and_time` datetime NOT NULL DEFAULT current_timestamp(),
  `stability` text DEFAULT NULL,
  `mobility` text DEFAULT NULL,
  `Proprioception` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_responses`
--

INSERT INTO `feedback_responses` (`Id`, `user_id`, `response_id`, `exercise_completion`, `pain_scale`, `feedback_option`, `connection_type`, `date_and_time`, `stability`, `mobility`, `Proprioception`, `timestamp`) VALUES
(2, 'JO123', 2, 'yes', 4, 'Poor user experience', 'Online', '2024-02-23 13:10:16', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-23 07:40:16'),
(3, 'JO123', 3, 'no', 3, 'Poor user experience', 'Online', '2024-02-24 13:10:16', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-24 07:40:16'),
(4, 'JO123', 4, 'no', 10, 'Poor user experience', 'Online', '2024-02-26 15:21:39', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-26 09:51:39'),
(124, 'JO123', 1, 'yes', 4, 'Poor user experience', 'Online', '2024-02-19 13:27:56', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-19 07:57:56'),
(125, 'EL123', 1, 'yes', 4, 'Poor user experience', 'Online', '2024-02-25 13:30:59', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-25 08:00:59'),
(126, 'EL123', 2, 'yes', 4, 'Poor user experience', 'Online', '2024-02-26 13:31:58', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-26 08:01:58'),
(127, 'EL123', 3, 'yes', 4, 'Poor user experience', 'Online', '2024-02-27 13:32:50', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-27 08:02:50'),
(128, 'EL123', 4, 'yes', 4, 'Poor user experience', 'Online', '2024-02-28 13:33:59', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-28 08:03:59'),
(129, 'EL123', 5, 'yes', 4, 'Poor user experience', 'Online', '2024-02-29 13:36:49', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-29 08:06:49'),
(130, 'EL123', 6, 'yes', 4, 'Poor user experience', 'Online', '2024-03-01 13:44:30', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-01 08:14:30'),
(142, 'JO123', 5, 'yes', 4, 'Poor user experience', 'Online', '2024-03-02 09:32:30', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-02 04:02:30'),
(143, 'EL123', 7, 'yes', 4, 'Poor user experience', 'Online', '2024-03-02 09:33:20', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-02 04:03:20'),
(151, 'el123', 8, 'no', 7, 'Poor user experience', 'Online', '2024-03-11 15:04:47', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-11 09:34:47'),
(152, 'HP123', 1, 'yes', 10, 'Difficultly in understanding exercises through videos', 'Offline', '2024-03-11 15:15:57', '[\"my video\"]', '[\"maran\"]', '[\"nill\"]', '2024-03-11 09:45:57'),
(153, 'P00007', 1, 'yes', 10, 'Technical issues', 'Offline', '2024-03-11 15:31:30', '[\"Knee Pump Video\",\"my video\"]', '[\"body stretch\"]', '[\"Help full to bonds \"]', '2024-03-11 10:01:30'),
(154, 'fa124', 1, 'yes', 3, 'Time constraints', 'Offline', '2024-03-11 16:17:16', '[\"eye exercises\"]', '[\"masul\"]', '[\"stretches\"]', '2024-03-11 10:47:16'),
(179, 'fa124', 2, 'no', 10, 'Poor user experience', 'Offline', '2024-03-27 11:19:59', '[\"body\",\"eye exercises\"]', '[\"masul\",\"hjagca\"]', '[\"stretches\",\"nill\"]', '2024-03-27 05:49:59'),
(182, 'el123', 9, 'no', 7, 'Poor user experience', 'Online', '2024-03-27 15:19:29', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-27 09:49:29'),
(183, 'El123', 10, 'yes', 3, 'Time constraints', 'Online', '2024-03-30 13:53:35', '[\"eye exercises\"]', '[]', '[]', '2024-03-30 08:23:35'),
(184, 'EL123', 11, 'yes', 6, 'Difficultly in understanding exercises through videos', 'Online', '2024-04-08 11:17:51', '[\"eye exercises\"]', '[\"masul\"]', '[\"null\",\"stretches\",\"backbon\"]', '2024-04-08 05:47:51'),
(185, 'P00007', 2, 'yes', 5, 'Poor user experience', 'Offline', '2024-04-08 11:53:07', '[\"eye exercises\"]', '[\"hjagca\"]', '[\"backbon\"]', '2024-04-08 06:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pat_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `FMS_Score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connection_type` varchar(20) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pat_id`, `user_id`, `password`, `patient_name`, `dob`, `age`, `gender`, `FMS_Score`, `mobile_number`, `connection_type`, `photo`) VALUES
(101, 'EL123', '123', 'Elamaran g', '2002-10-11', '3', 'male', '80', '9346364288', 'Online', ''),
(102, 'JO123', '123', 'happy', '2000-11-11', '', 'male', '100', '902983462', 'Online', ''),
(109, 'PR123', '1335', 'Pranaya', '2003-05-31', '', 'Female', '100', '9636241970', 'Online', ''),
(110, 'HR1114', '1411', 'Honey', '2002-11-14', '', 'Femle', '90', '7283912953', 'Online', ''),
(117, '321', '321', 'etache', '2003-02-25', '', 'male', '100', '9636241970', 'Online', ''),
(118, '321', '321', 'etache', '2003-02-25', '', 'male', '100', '9636241970', 'Online', 'photos/1712118360_Screenshot 2023-08-26 203127.png');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `after_patients_update` AFTER UPDATE ON `patients` FOR EACH ROW BEGIN
    -- Check if the updated patient has an 'Online' connection type
    IF NEW.connection_type = 'Online' THEN
        -- Update the corresponding record in the 'add_patient' table
        UPDATE `add_patient`
        SET
            `patient_name` = NEW.patient_name,
            `dob` = NEW.dob,
            `gender` = NEW.gender,
            `FMS_Score` = NEW.FMS_Score,
            `mobile_number` = NEW.mobile_number,
            `connection_type` = NEW.connection_type,
            `photo` = NEW.photo  -- Update the photo column in add_patient table
        WHERE `user_id` = NEW.user_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_recorded_videos`
--

CREATE TABLE `patient_recorded_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `video_title` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `recorded_video` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_recorded_videos`
--

INSERT INTO `patient_recorded_videos` (`id`, `user_id`, `week`, `video_title`, `date_time`, `recorded_video`) VALUES
(1, 123, 1, 'Exercise Video 1', '2024-02-26 16:17:40', 0x2e2e2e62696e6172792064617461206f662074686520766964656f2e2e2e),
(2, 456, 2, 'Exercise Video 2', '2024-02-26 16:17:40', 0x2e2e2e62696e6172792064617461206f662074686520766964656f2e2e2e);

-- --------------------------------------------------------

--
-- Table structure for table `patient_videos`
--

CREATE TABLE `patient_videos` (
  `s_no` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `week` varchar(50) NOT NULL,
  `video_title` varchar(100) NOT NULL,
  `recorded_patient_video` varchar(255) NOT NULL,
  `date_and_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_videos`
--

INSERT INTO `patient_videos` (`s_no`, `user_id`, `week`, `video_title`, `recorded_patient_video`, `date_and_time`) VALUES
(1, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-02-29 04:41:00'),
(2, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-02-29 04:41:41'),
(3, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-03-05 09:45:43'),
(4, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-03-05 09:49:38'),
(5, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-03-05 09:49:39'),
(6, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-03-05 11:02:14'),
(7, 'EL123', 'week1', 'my video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov', '2024-03-07 07:27:41'),
(8, 'El123', '', 'my video', 'videos/E6E44875-4806-4598-B308-A574AA73F7D1.mov', '2024-03-07 09:26:05'),
(9, 'El123', 'Week2', 'videos/video.mp4', 'videos/B8DD4A0E-6B4D-4B8D-9F82-36D3A19A81EA.mov', '2024-03-07 09:40:47'),
(10, 'El123', 'Week3', 'stretches', 'videos/F329A807-BAC2-47BD-A68C-307E756DB0BD.mov', '2024-03-07 09:44:39'),
(11, 'El123', 'Week1', 'the video', 'videos/4938CBB7-60C8-42D1-8B95-2240EFEFDB52.mov', '2024-03-12 09:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `remainder`
--

CREATE TABLE `remainder` (
  `id` int(11) NOT NULL,
  `reminder_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `remainder`
--

INSERT INTO `remainder` (`id`, `reminder_text`) VALUES
(1, 'You have completed only 1 session of this week, still there are only 3 days left to reach the target. You have to complete 3 sessions.'),
(2, 'You have completed 2 sessions of this week, still there are only 3 days left to reach the target. You have to complete 2 sessions.'),
(3, 'You have completed 2 sessions of this week, still there are only 2 days left to reach the target. You have to complete 2 sessions.'),
(4, 'You have completed 3 sessions of this week, still there are only 3 days left to reach the target. You have to complete 1 session.'),
(5, 'You have completed 3 sessions of this week, still there are only 2 days left to reach the target. You have to complete 1 session.'),
(6, 'You have completed 3 sessions of this week, still there is only 1 day left to reach the target. You have to complete 1 session.');

-- --------------------------------------------------------

--
-- Table structure for table `selected_data`
--

CREATE TABLE `selected_data` (
  `id` int(11) NOT NULL,
  `week` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `selected_titles` text DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `selected_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selected_data`
--

INSERT INTO `selected_data` (`id`, `week`, `category`, `selected_titles`, `user_id`, `selected_path`) VALUES
(169, 'Week1', 'Stability', '[\"my video\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(170, 'Week1', 'Mobility', '[\"maran\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(171, 'Week1', 'Proprioception', '[\"stretches\"]', 'EL123', '[\"videos\\/video.mp4\"]'),
(172, 'Week1', 'stretchers', '[\"the video\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(174, 'Week1', 'WarmUp', '[\"the video\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(175, 'Week1', 'Stability', '[\"my video\"]', 'JO123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(176, 'Week1', 'stretchers', '[\"the video\"]', 'JO123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(177, 'Week1', 'WarmUp', '[\"the video\"]', 'JO123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(203, 'Week2', 'proprioception', '[\"null\"]', 'EL123', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/sample.mp4\",\"videos\\/sample.mp4\",\"videos\\/production_id_4158865 (1080p).mp4\"]'),
(204, 'Week2', 'stability', '[\"Knee Pump Video\"]', 'EL123', '[\"videos\\/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov\"]'),
(205, 'Week2', 'mobility', '[\"masul\"]', 'EL123', '[\"videos\\/video.mp4\"]'),
(206, 'Week3', 'stability', '[\"eye exercises\", \"body\", \"hdc\", \"body stretch\"]', 'EL123', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\"]'),
(207, 'Week3', 'proprioception', '[\"backbon\", \"stretches\"]', 'EL123', '[\"videos\\/video.mp4\",\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(208, 'Week3', 'mobility', '[\"masul\", \"hjagca\", \"body stretch\"]', 'EL123', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\"]'),
(209, 'Week1', 'Stability', '[\"my video\",\"eye exercises\",\"body\",\"hdc\",\"body stretch\"]', 'HR1113', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(210, 'Week1', 'Mobility', '[\"maran\",\"hjagca\",\"masul\"]', 'HR1113', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(211, 'Week1', 'Proprioception', '[\"stretches\",\"backbon\"]', 'HR1113', '[\"videos\\/video.mp4\",\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(212, 'Week1', 'stretchers', '[\"the video\"]', 'HR1113', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(213, 'Week1', 'WarmUp', '[\"the video\",\"welcome\"]', 'HR1113', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\",\"videos\\/18133C53-A269-47CD-AE29-BBE64DA40699.mov\"]'),
(214, 'Week1', 'stretchers', '[\"the video\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(215, 'Week1', 'WarmUp', '[\"the video\",\"welcome\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\",\"videos\\/18133C53-A269-47CD-AE29-BBE64DA40699.mov\"]'),
(216, 'Week1', 'WarmUp', '[\"Trail\"]', 'EL123', '[\"videos\\/pexels_videos_3584 (1080p).mp4\"]'),
(217, 'Week3', 'stability', '[\"Knee Pump Video\"]', 'EL123', '[\"videos\\/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov\"]'),
(218, 'Week3', 'proprioception', '[\"Help full to bonds \"]', 'EL123', '[\"videos\\/60549BAE-9910-4BA7-AB22-5DCF6B022B3D.mov\"]'),
(219, 'Week3', 'mobility', '[\"maran\"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\"]'),
(220, 'Week3', 'mobility', '[\"body stretch\"]', 'EL123', '[\"videos\\/video.mp4\"]'),
(221, 'Week3', 'proprioception', '[\"Help full to bonds \"]', 'EL123', '[\"videos\\/60549BAE-9910-4BA7-AB22-5DCF6B022B3D.mov\"]'),
(222, 'Week3', 'stability', '[\"body\"]', 'EL123', '[\"videos\\/video.mp4\"]'),
(223, 'Week1', 'stability', '[\"eye exercises\", \"body stretch\", \"Knee Pump Video\"]', 'EL123', '[\"videos\\/video.mp4\",\"videos\\/video.mp4\",\"videos\\/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov\"]'),
(224, 'Week1', 'proprioception', '[\"backbon\", \"Help full to bonds \"]', 'EL123', '[\"videos\\/7B778C74-2662-424C-A834-23A1C09865FC.mov\",\"videos\\/60549BAE-9910-4BA7-AB22-5DCF6B022B3D.mov\"]'),
(225, 'Week1', 'mobility', '[\"body stretch\"]', 'EL123', '[\"videos\\/video.mp4\"]');

-- --------------------------------------------------------

--
-- Table structure for table `stored_feedback`
--

CREATE TABLE `stored_feedback` (
  `Id` int(11) NOT NULL,
  `week_number` int(11) NOT NULL,
  `session_number` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `response_id` int(11) NOT NULL,
  `exercise_completion` enum('yes','no') DEFAULT NULL,
  `pain_scale` int(11) DEFAULT NULL,
  `feedback_option` varchar(100) DEFAULT NULL,
  `connection_type` enum('Online','Offline') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_and_time` datetime NOT NULL DEFAULT current_timestamp(),
  `stability` text DEFAULT NULL,
  `mobility` text DEFAULT NULL,
  `proprioception` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stored_feedback`
--

INSERT INTO `stored_feedback` (`Id`, `week_number`, `session_number`, `user_id`, `response_id`, `exercise_completion`, `pain_scale`, `feedback_option`, `connection_type`, `date_and_time`, `stability`, `mobility`, `proprioception`, `timestamp`) VALUES
(2, 1, 1, 'JO123', 1, 'yes', 4, 'Poor user experience', 'Online', '2024-02-19 13:27:56', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-19 07:57:56'),
(3, 1, 1, 'EL123', 1, 'yes', 4, 'Poor user experience', 'Online', '2024-02-25 13:30:59', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-25 08:00:59'),
(4, 1, 2, 'EL123', 2, 'yes', 4, 'Poor user experience', 'Online', '2024-02-26 13:31:58', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-26 08:01:58'),
(5, 1, 3, 'EL123', 3, 'yes', 4, 'Poor user experience', 'Online', '2024-02-27 13:32:51', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-27 08:02:51'),
(6, 1, 4, 'EL123', 4, 'yes', 4, 'Poor user experience', 'Online', '2024-02-28 13:33:59', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-28 08:03:59'),
(7, 1, 5, 'EL123', 5, 'yes', 4, 'Poor user experience', 'Online', '2024-02-29 13:36:49', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-29 08:06:49'),
(8, 1, 6, 'EL123', 6, 'yes', 4, 'Poor user experience', 'Online', '2024-03-01 13:44:30', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-01 08:14:30'),
(9, 1, 2, 'JO123', 2, 'yes', 4, 'Poor user experience', 'Online', '2024-02-23 13:10:52', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-23 07:40:52'),
(10, 1, 3, 'JO123', 3, 'no', 3, 'Poor user experience', 'Online', '2024-02-24 13:10:52', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-24 07:40:52'),
(11, 1, 4, 'JO123', 4, 'no', 10, 'Poor user experience', 'Online', '2024-02-26 15:21:44', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-02-26 09:51:44'),
(19, 2, 1, 'JO123', 5, 'yes', 4, 'Poor user experience', 'Online', '2024-03-02 09:32:31', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-02 04:02:31'),
(20, 1, 7, 'EL123', 7, 'yes', 4, 'Poor user experience', 'Online', '2024-03-02 09:33:20', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-02 04:03:20'),
(21, 2, 1, 'el123', 8, 'no', 7, 'Poor user experience', 'Online', '2024-03-11 15:04:47', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-11 09:34:47'),
(29, 1, 1, 'HP123', 1, 'yes', 10, 'Difficultly in understanding exercises through videos', 'Offline', '2024-03-11 15:15:58', '[\"my video\"]', '[\"maran\"]', '[\"nill\"]', '2024-03-11 09:45:58'),
(30, 1, 1, 'P00007', 1, 'yes', 10, 'Technical issues', 'Offline', '2024-03-11 15:31:31', '[\"Knee Pump Video\",\"my video\"]', '[\"body stretch\"]', '[\"Help full to bonds \"]', '2024-03-11 10:01:31'),
(31, 1, 1, 'fa124', 1, 'yes', 3, 'Time constraints', 'Offline', '2024-03-11 16:17:17', '[\"eye exercises\"]', '[\"masul\"]', '[\"stretches\"]', '2024-03-11 10:47:17'),
(159, 1, 2, 'fa124', 2, 'no', 10, 'Poor user experience', 'Offline', '2024-03-27 11:19:59', '[\"body\",\"eye exercises\"]', '[\"masul\",\"hjagca\"]', '[\"stretches\",\"nill\"]', '2024-03-27 05:49:59'),
(162, 2, 1, 'el123', 9, 'no', 7, 'Poor user experience', 'Online', '2024-03-27 15:19:29', '[\"Knee Pump Video\"]', '[\"hjagca\"]', '[\"stretches\"]', '2024-03-27 09:49:29'),
(163, 3, 1, 'El123', 10, 'yes', 3, 'Time constraints', 'Online', '2024-03-30 13:53:36', '[\"eye exercises\"]', '[]', '[]', '2024-03-30 08:23:36'),
(164, 3, 1, 'EL123', 11, 'yes', 6, 'Difficultly in understanding exercises through videos', 'Online', '2024-04-08 11:17:51', '[\"eye exercises\"]', '[\"masul\"]', '[\"null\",\"stretches\",\"backbon\"]', '2024-04-08 05:47:51'),
(165, 1, 2, 'P00007', 2, 'yes', 5, 'Poor user experience', 'Offline', '2024-04-08 11:53:07', '[\"eye exercises\"]', '[\"hjagca\"]', '[\"backbon\"]', '2024-04-08 06:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `video_data`
--

CREATE TABLE `video_data` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_data`
--

INSERT INTO `video_data` (`id`, `category`, `video_title`, `video_path`) VALUES
(47, 'Proprioception', 'stretches', 'videos/video.mp4'),
(48, 'Stability', 'eye exercises', 'videos/video.mp4'),
(49, 'Mobility', 'masul', 'videos/video.mp4'),
(50, 'Stability', 'body', 'videos/video.mp4'),
(51, 'Stability', 'hdc', 'videos/video.mp4'),
(52, 'mobility', 'hjagca', 'videos/video.mp4'),
(57, 'mobility', 'body stretch', 'videos/video.mp4'),
(58, 'Stability', 'body stretch', 'videos/video.mp4'),
(59, 'Stability', 'Number', 'videos/1405DA8B-F3C3-4FF4-A10A-FA99FC97872E.mov'),
(60, 'Stability', 'Number', 'videos/7ECFBBF5-E035-498F-AD63-994EA17F4283.mov'),
(61, 'Mobility', 'maran', 'videos/7B778C74-2662-424C-A834-23A1C09865FC.mov'),
(62, 'Stability', 'my video', 'videos/7B778C74-2662-424C-A834-23A1C09865FC.mov'),
(63, 'WarmUp', 'the video', 'videos/7B778C74-2662-424C-A834-23A1C09865FC.mov'),
(64, 'Stretchers', 'the video', 'videos/7B778C74-2662-424C-A834-23A1C09865FC.mov'),
(65, 'WarmUp', 'welcome', 'videos/18133C53-A269-47CD-AE29-BBE64DA40699.mov'),
(66, 'Stability', 'Knee Pump Video', 'videos/5B1176DA-FD17-4FFE-9C85-4CA31F8E736A.mov'),
(67, 'Proprioception', 'backbon', 'videos/7B778C74-2662-424C-A834-23A1C09865FC.mov'),
(72, 'Proprioception', 'nill', 'videos/sample.mp4'),
(73, 'Proprioception', 'null', 'videos/production_id_4158865 (1080p).mp4'),
(74, 'Stretchers', 'differs', 'videos/6BB47D44-A637-44DC-AA55-D0BA3B93E022.mov'),
(75, 'WarmUp', 'eghhgh', 'videos/13239966-2321-4758-9BDB-D363B7FF7257.mov'),
(76, 'WarmUp', 'Trail', 'videos/pexels_videos_3584 (1080p).mp4'),
(77, 'Proprioception', 'Help full to bonds ', 'videos/60549BAE-9910-4BA7-AB22-5DCF6B022B3D.mov');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_patient`
--
ALTER TABLE `add_patient`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD UNIQUE KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctor_message`
--
ALTER TABLE `doctor_message`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `patient_recorded_videos`
--
ALTER TABLE `patient_recorded_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_videos`
--
ALTER TABLE `patient_videos`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `remainder`
--
ALTER TABLE `remainder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selected_data`
--
ALTER TABLE `selected_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stored_feedback`
--
ALTER TABLE `stored_feedback`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `video_data`
--
ALTER TABLE `video_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor_message`
--
ALTER TABLE `doctor_message`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `patient_recorded_videos`
--
ALTER TABLE `patient_recorded_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_videos`
--
ALTER TABLE `patient_videos`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `remainder`
--
ALTER TABLE `remainder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `selected_data`
--
ALTER TABLE `selected_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `stored_feedback`
--
ALTER TABLE `stored_feedback`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `video_data`
--
ALTER TABLE `video_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
