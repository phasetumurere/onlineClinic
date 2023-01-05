-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.26-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table clinic_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `loginid` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `dob` text NOT NULL,
  `mobileno` text NOT NULL,
  `addr` varchar(500) NOT NULL,
  `notes` varchar(200) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_login` date NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`id`, `username`, `loginid`, `password`, `fname`, `lname`, `gender`, `dob`, `mobileno`, `addr`, `notes`, `image`, `created_on`, `updated_on`, `role_id`, `last_login`, `delete_status`) VALUES
	(1, 'admin', 'ndbhalerao91@gmail.com', 'aa7f019c326413d5b8bcad4314228bcd33ef557f5d81c7cc977f7728156f4357', 'teddypots', 'admin', 'Male', '2018-11-26', '9423979339', '<p>Maharashtra, India</p>\r\n', '<p>admin panel</p>\r\n', 'profile.jpg', '2018-04-30', '2019-10-15', 1, '0000-00-00', 0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table clinic_db.appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentid` int(10) NOT NULL AUTO_INCREMENT,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`appointmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.appointment: ~4 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
REPLACE INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`, `delete_status`) VALUES
	(1, '', 1, 0, 1, '2020-05-25', '12:00:00', 1, 'Approved', 'Reason of appointment', 0),
	(2, '', 1, 0, 2, '2020-05-27', '10:00:00', 1, 'Active', 'reason of appointment', 1),
	(3, '', 1, 0, 1, '2020-05-26', '11:11:00', 1, 'Inactive', 'reason', 0),
	(4, '', 1, 0, 2, '2020-05-29', '15:00:00', 1, 'Active', 'reason of appointment', 0);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

-- Dumping structure for table clinic_db.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `billingid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL,
  `discount` float(10,2) NOT NULL,
  `taxamount` float(10,2) NOT NULL,
  `discountreason` text NOT NULL,
  `discharge_time` time NOT NULL,
  `discharge_date` date NOT NULL,
  PRIMARY KEY (`billingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table clinic_db.billing_records
CREATE TABLE IF NOT EXISTS `billing_records` (
  `billingservice_id` int(10) NOT NULL,
  `billingid` int(10) NOT NULL,
  `bill_type_id` int(10) NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`billingservice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.billing_records: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_records` ENABLE KEYS */;

-- Dumping structure for table clinic_db.department
CREATE TABLE IF NOT EXISTS `department` (
  `departmentid` int(10) NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.department: ~2 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
REPLACE INTO `department` (`departmentid`, `departmentname`, `description`, `status`, `delete_status`) VALUES
	(1, 'ICU department', 'ICU department for people with serious illness', 'Active', 0),
	(2, 'Neurology department', 'neurology department for treating diseases of nervous system', 'Active', 0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table clinic_db.doctor
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctorid` int(10) NOT NULL AUTO_INCREMENT,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.doctor: ~0 rows (approximately)
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
REPLACE INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`, `delete_status`) VALUES
	(1, 'Dr. Akash Ahire', '9423979339', 1, 'akash@gmail.com', 'bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358', 'Active', 'MD', 3.0, 200.00, 0);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;

-- Dumping structure for table clinic_db.doctor_timings
CREATE TABLE IF NOT EXISTS `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`doctor_timings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.doctor_timings: ~0 rows (approximately)
/*!40000 ALTER TABLE `doctor_timings` DISABLE KEYS */;
REPLACE INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`, `delete_status`) VALUES
	(1, 1, '09:00:00', '12:00:00', '', 'Active', 0);
/*!40000 ALTER TABLE `doctor_timings` ENABLE KEYS */;

-- Dumping structure for table clinic_db.manage_website
CREATE TABLE IF NOT EXISTS `manage_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(600) NOT NULL,
  `business_email` varchar(600) NOT NULL,
  `business_web` varchar(500) NOT NULL,
  `portal_addr` varchar(500) NOT NULL,
  `addr` varchar(600) NOT NULL,
  `curr_sym` varchar(600) NOT NULL,
  `curr_position` varchar(500) NOT NULL,
  `front_end_en` varchar(500) NOT NULL,
  `date_format` date NOT NULL,
  `def_tax` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.manage_website: ~0 rows (approximately)
/*!40000 ALTER TABLE `manage_website` DISABLE KEYS */;
REPLACE INTO `manage_website` (`id`, `business_name`, `business_email`, `business_web`, `portal_addr`, `addr`, `curr_sym`, `curr_position`, `front_end_en`, `date_format`, `def_tax`, `logo`) VALUES
	(1, 'Mayuri K', 'mayuri.infospace@gmail.com', '#', '#', '<p>Maharashtra, India</p>\r\n', '$', 'right', '0', '0000-00-00', '0.20', 'logo for hospital system.jpg');
/*!40000 ALTER TABLE `manage_website` ENABLE KEYS */;

-- Dumping structure for table clinic_db.medicine
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicineid` int(10) NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.medicine: ~0 rows (approximately)
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
REPLACE INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`, `delete_status`) VALUES
	(1, 'Paracetamol', 10.00, 'Medicine description here', 'Active', 0);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;

-- Dumping structure for table clinic_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `prescriptionid` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table clinic_db.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `patientid` int(10) NOT NULL AUTO_INCREMENT,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`patientid`),
  KEY `loginid` (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.patient: ~0 rows (approximately)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
REPLACE INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`, `delete_status`) VALUES
	(1, 'Atul Petkar', '2020-05-25', '11:00:00', 'nashik, maharashtra', '9423979339', 'nashik', '1234', 'atul@gmail.com', 'bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358', 'B+', 'Male', '1995-07-25', 'Active', 0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

-- Dumping structure for table clinic_db.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `cardnumber` int(25) NOT NULL,
  `cvvno` int(5) NOT NULL,
  `expdate` date NOT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Dumping structure for table clinic_db.prescription
CREATE TABLE IF NOT EXISTS `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `delivery_type` varchar(10) NOT NULL COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10) NOT NULL COMMENT 'appointmentid or orderid',
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.prescription: ~0 rows (approximately)
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;

-- Dumping structure for table clinic_db.prescription_records
CREATE TABLE IF NOT EXISTS `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.prescription_records: ~0 rows (approximately)
/*!40000 ALTER TABLE `prescription_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_records` ENABLE KEYS */;

-- Dumping structure for table clinic_db.room
CREATE TABLE IF NOT EXISTS `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.room: ~5 rows (approximately)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
REPLACE INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
	(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
	(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
	(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
	(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
	(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumping structure for table clinic_db.service_type
CREATE TABLE IF NOT EXISTS `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.service_type: ~5 rows (approximately)
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
REPLACE INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
	(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
	(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
	(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
	(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
	(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;

-- Dumping structure for table clinic_db.tbl_email_config
CREATE TABLE IF NOT EXISTS `tbl_email_config` (
  `e_id` int(21) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `mail_driver_host` varchar(5000) NOT NULL,
  `mail_port` int(50) NOT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(30) NOT NULL,
  `mail_encrypt` varchar(300) NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.tbl_email_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_email_config` DISABLE KEYS */;
REPLACE INTO `tbl_email_config` (`e_id`, `name`, `mail_driver_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encrypt`) VALUES
	(1, 'Upturn India Technologies', 'mail.upturnit.com', 587, 'contact.info@upturnit.com', 'x(ilz?cWumI2', 'sdsad');
/*!40000 ALTER TABLE `tbl_email_config` ENABLE KEYS */;

-- Dumping structure for table clinic_db.tbl_permission
CREATE TABLE IF NOT EXISTS `tbl_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `operation` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table clinic_db.tbl_permission: ~44 rows (approximately)
/*!40000 ALTER TABLE `tbl_permission` DISABLE KEYS */;
REPLACE INTO `tbl_permission` (`id`, `name`, `display_name`, `operation`) VALUES
	(1, 'repairs', 'Repairs', 'repairs'),
	(2, 'create_repair', 'Create Repair	', 'create_repair	'),
	(3, 'edit_repair', 'Edit Repair', 'edit_repair'),
	(4, 'delete_repair', 'Delete Repair', 'delete_repair'),
	(5, 'manage_category', 'Manage Category', 'manage_category'),
	(6, 'sales', 'Sales', 'sales'),
	(7, 'invoices', 'Invoices', 'invoices'),
	(8, 'edit_invoice', 'Edit Invoice', 'edit_invoice'),
	(9, 'add_payment', 'Add Payment', 'add_payment'),
	(10, 'custom_reports', 'Custom Reports', 'custom_reports'),
	(11, 'financial_overview', 'Financial Overview', 'financial_overview'),
	(12, 'manage_expense', 'Manage Expense', 'manage_expense'),
	(13, 'create_expense', 'Create Expense', 'create_expense'),
	(14, 'edit_expense', 'Edit Expense', 'edit_expense'),
	(15, 'delete_expense', 'Delete Expense', 'delete_expense'),
	(16, 'generate_invoice', 'Generate Invoice', 'generate_invoice'),
	(17, 'products', 'Products', 'products'),
	(18, 'create_product', 'Create Product', 'create_product'),
	(19, 'edit_product', 'Edit Product', 'edit_product'),
	(20, 'delete_product', 'Delete Product', 'delete_product'),
	(21, 'users', 'Users', 'users'),
	(22, 'create_user', 'Create User', 'create_user'),
	(23, 'edit_user', 'Edit User', 'edit_user'),
	(24, 'delete_user', 'Delete User', 'delete_user'),
	(25, 'manage_roles', 'Manage Roles', 'manage_roles'),
	(26, 'settings', 'Settings', 'settings'),
	(27, 'communication', 'Communication', 'communication'),
	(28, 'create_communication', 'Create Communication', 'create_communication'),
	(29, 'delete_communication', 'Delete Communication', 'delete_communication'),
	(30, 'payroll', 'Payroll', 'payroll'),
	(31, 'create_payroll', 'Create Payroll', 'create_payroll'),
	(32, 'edit_payroll', 'Edit Payroll', 'edit_payroll'),
	(33, 'delete_payroll', 'Delete Payroll', 'delete_payroll'),
	(34, 'departments', 'Departments', 'departments'),
	(35, 'saved_items', 'Saved Item', 'saved_items'),
	(36, 'create_saved_item', 'Create Saved Item', 'create_saved_item'),
	(37, 'edit_saved_item', 'Edit Saved Item', 'edit_saved_item'),
	(38, 'delete_saved_item', 'Delete Saved Item', 'delete_saved_item'),
	(39, 'dashboard', 'Dashboard', 'dashboard'),
	(40, 'clients_statistics', 'Clients Statistics', 'clients_statistics'),
	(41, 'invoices_statistics', 'Invoices Statistics', 'invoices_statistics'),
	(42, 'repairs_statistics', 'Repairs Statistics', 'repairs_statistics'),
	(43, 'financial_overview_graph', 'Financial Overview Graph', 'financial_overview_graph'),
	(44, 'calendar', 'Calendar', 'calendar');
/*!40000 ALTER TABLE `tbl_permission` ENABLE KEYS */;

-- Dumping structure for table clinic_db.tbl_permission_role
CREATE TABLE IF NOT EXISTS `tbl_permission_role` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `permission_id` int(30) NOT NULL,
  `role_id` int(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.tbl_permission_role: ~87 rows (approximately)
/*!40000 ALTER TABLE `tbl_permission_role` DISABLE KEYS */;
REPLACE INTO `tbl_permission_role` (`id`, `permission_id`, `role_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 1),
	(7, 7, 1),
	(8, 8, 1),
	(9, 9, 1),
	(10, 10, 1),
	(11, 11, 1),
	(12, 12, 1),
	(13, 13, 1),
	(14, 14, 1),
	(15, 15, 1),
	(16, 16, 1),
	(17, 17, 1),
	(18, 18, 1),
	(19, 19, 1),
	(20, 20, 1),
	(21, 21, 1),
	(22, 22, 1),
	(23, 23, 1),
	(24, 24, 1),
	(25, 25, 1),
	(26, 26, 1),
	(27, 27, 1),
	(28, 28, 1),
	(29, 29, 1),
	(30, 30, 1),
	(31, 31, 1),
	(32, 32, 1),
	(33, 33, 1),
	(34, 34, 1),
	(35, 35, 1),
	(36, 36, 1),
	(37, 37, 1),
	(38, 38, 1),
	(39, 39, 1),
	(40, 40, 1),
	(41, 41, 1),
	(42, 42, 1),
	(43, 43, 1),
	(44, 44, 1),
	(45, 1, 2),
	(46, 2, 2),
	(47, 6, 2),
	(48, 9, 2),
	(49, 12, 2),
	(50, 17, 2),
	(51, 35, 2),
	(52, 39, 2),
	(53, 40, 2),
	(54, 41, 2),
	(55, 42, 2),
	(56, 43, 2),
	(57, 44, 2),
	(236, 34, 4),
	(237, 1, 3),
	(238, 2, 3),
	(239, 3, 3),
	(240, 4, 3),
	(241, 5, 3),
	(242, 6, 3),
	(243, 7, 3),
	(244, 8, 3),
	(245, 9, 3),
	(246, 10, 3),
	(247, 13, 3),
	(248, 14, 3),
	(249, 17, 3),
	(250, 18, 3),
	(251, 26, 3),
	(252, 27, 3),
	(253, 28, 3),
	(254, 29, 3),
	(255, 34, 3),
	(256, 35, 3),
	(257, 36, 3),
	(258, 37, 3),
	(259, 38, 3),
	(260, 39, 3),
	(261, 40, 3),
	(262, 41, 3),
	(263, 42, 3),
	(264, 43, 3),
	(265, 44, 3);
/*!40000 ALTER TABLE `tbl_permission_role` ENABLE KEYS */;

-- Dumping structure for table clinic_db.tbl_role
CREATE TABLE IF NOT EXISTS `tbl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(200) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.tbl_role: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
REPLACE INTO `tbl_role` (`id`, `role_name`, `slug`, `delete_status`) VALUES
	(1, 'Admin', 'admin', 0),
	(2, 'client', 'client', 0),
	(3, 'Technicians', 'technicians', 0);
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;

-- Dumping structure for table clinic_db.tbl_sms_config
CREATE TABLE IF NOT EXISTS `tbl_sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_username` varchar(200) NOT NULL,
  `sms_password` varchar(200) NOT NULL,
  `sms_senderid` varchar(200) NOT NULL,
  `created_at` date NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.tbl_sms_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_sms_config` DISABLE KEYS */;
REPLACE INTO `tbl_sms_config` (`id`, `sms_username`, `sms_password`, `sms_senderid`, `created_at`, `delete_status`) VALUES
	(1, 'nikhilbhalerao007', '123456789', 'UPTURN', '2019-10-10', 0);
/*!40000 ALTER TABLE `tbl_sms_config` ENABLE KEYS */;

-- Dumping structure for table clinic_db.treatment
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatmentid` int(11) NOT NULL AUTO_INCREMENT,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`treatmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.treatment: ~0 rows (approximately)
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
REPLACE INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`, `delete_status`) VALUES
	(1, 'Blood Test', 200.00, 'Treatment note here', 'Active', 0);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;

-- Dumping structure for table clinic_db.treatment_records
CREATE TABLE IF NOT EXISTS `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.treatment_records: ~0 rows (approximately)
/*!40000 ALTER TABLE `treatment_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_records` ENABLE KEYS */;

-- Dumping structure for table clinic_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table clinic_db.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
