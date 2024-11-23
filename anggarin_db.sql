-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2024 at 03:23 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anggarin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `budget_tools`
--

CREATE TABLE `budget_tools` (
  `Budget_ID` char(36) NOT NULL,
  `User_ID` char(36) NOT NULL,
  `Budget_Name` varchar(100) NOT NULL,
  `total_amount` decimal(20,3) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` char(36) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `Expense_ID` char(36) NOT NULL,
  `User_ID` char(36) NOT NULL,
  `Category_ID` char(36) NOT NULL,
  `Expense_amount` decimal(15,2) NOT NULL,
  `Expense_date` date NOT NULL,
  `Description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_analysis`
--

CREATE TABLE `financial_analysis` (
  `report_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `report_date` timestamp NOT NULL,
  `Total_Income` decimal(15,2) NOT NULL,
  `Total_Expense` decimal(15,2) NOT NULL,
  `Net_Savings` decimal(15,2) NOT NULL,
  `Analysis_Sum` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `income_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `income_amount` decimal(15,2) NOT NULL,
  `income_date` date NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_tracking`
--

CREATE TABLE `income_tracking` (
  `income_Tracking_ID` char(36) NOT NULL,
  `User_ID` char(36) NOT NULL,
  `Income_ID` char(36) NOT NULL,
  `Source_income_name` varchar(256) NOT NULL,
  `Income_date` date NOT NULL,
  `Income_amount` decimal(15,2) NOT NULL,
  `Notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_recommendation`
--

CREATE TABLE `investment_recommendation` (
  `Recomd_ID` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `investment_type` varchar(100) NOT NULL,
  `risk_level` enum('Low','Medium','High') NOT NULL,
  `Target_Return` decimal(5,2) NOT NULL,
  `Recommendation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_input`
--

CREATE TABLE `receipt_input` (
  `receipt_id` char(36) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `extracted_text` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saving_financial_goals`
--

CREATE TABLE `saving_financial_goals` (
  `goal_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `goal_name` varchar(100) NOT NULL,
  `target_amount` decimal(15,2) NOT NULL,
  `current_amount` decimal(15,2) NOT NULL,
  `goal_deadline` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `amount` int NOT NULL,
  `date` date NOT NULL,
  `description` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` char(36) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profile_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_input`
--

CREATE TABLE `voice_input` (
  `voice_id` char(36) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `transcription` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budget_tools`
--
ALTER TABLE `budget_tools`
  ADD PRIMARY KEY (`Budget_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`Expense_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Indexes for table `financial_analysis`
--
ALTER TABLE `financial_analysis`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `income_tracking`
--
ALTER TABLE `income_tracking`
  ADD PRIMARY KEY (`income_Tracking_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Income_ID` (`Income_ID`);

--
-- Indexes for table `investment_recommendation`
--
ALTER TABLE `investment_recommendation`
  ADD PRIMARY KEY (`Recomd_ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `receipt_input`
--
ALTER TABLE `receipt_input`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `saving_financial_goals`
--
ALTER TABLE `saving_financial_goals`
  ADD PRIMARY KEY (`goal_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `voice_input`
--
ALTER TABLE `voice_input`
  ADD PRIMARY KEY (`voice_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budget_tools`
--
ALTER TABLE `budget_tools`
  ADD CONSTRAINT `budget_tools_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`user_ID`),
  ADD CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `financial_analysis`
--
ALTER TABLE `financial_analysis`
  ADD CONSTRAINT `financial_analysis_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `income_tracking`
--
ALTER TABLE `income_tracking`
  ADD CONSTRAINT `income_tracking_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`user_ID`),
  ADD CONSTRAINT `income_tracking_ibfk_2` FOREIGN KEY (`Income_ID`) REFERENCES `income` (`income_id`);

--
-- Constraints for table `investment_recommendation`
--
ALTER TABLE `investment_recommendation`
  ADD CONSTRAINT `investment_recommendation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `receipt_input`
--
ALTER TABLE `receipt_input`
  ADD CONSTRAINT `receipt_input_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  ADD CONSTRAINT `receipt_input_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `saving_financial_goals`
--
ALTER TABLE `saving_financial_goals`
  ADD CONSTRAINT `saving_financial_goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `voice_input`
--
ALTER TABLE `voice_input`
  ADD CONSTRAINT `voice_input_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  ADD CONSTRAINT `voice_input_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
