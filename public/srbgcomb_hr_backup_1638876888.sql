SET foreign_key_checks = 0;

CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_company_id_foreign` (`company_id`),
  KEY `announcements_department_id_foreign` (`department_id`),
  KEY `announcements_added_by_foreign` (`added_by`),
  CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO announcements VALUES('2','New Announcement','2021-03-30','2021-04-01','New announcement of happiness','\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"','1','','ash','1','2021-03-29 22:00:13','2021-03-29 22:00:13');
INSERT INTO announcements VALUES('5','Hello','2020-10-13','2021-03-30','2021-03-30','dasda','1','','ash','1','2021-03-29 22:00:13','2021-03-29 22:00:13');



CREATE TABLE `appraisals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO appraisals VALUES('1','1','9','1','2','Beginner','Beginner','Intermidiate','Advanced','None','None','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','01/17/2021','2021-01-16 22:36:09','2021-01-16 22:43:12');
INSERT INTO appraisals VALUES('2','1','10','2','3','Advanced','Beginner','Advanced','Intermidiate','Expert/Leader','Beginner','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','01/18/2021','2021-01-16 22:36:58','2021-01-16 22:42:56');
INSERT INTO appraisals VALUES('4','1','12','3','5','Beginner','None','None','Intermidiate','None','None','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','01/19/2021','2021-01-16 22:37:53','2021-01-16 22:37:53');
INSERT INTO appraisals VALUES('5','2','14','4','6','Intermidiate','None','None','Intermidiate','None','None','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','01/20/2021','2021-01-16 22:38:20','2021-01-16 22:38:20');



CREATE TABLE `asset_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO asset_categories VALUES('1','','laptop','2020-07-28 23:15:07','2020-07-28 23:15:07');



CREATE TABLE `assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `asset_code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets_category_id` bigint(20) unsigned NOT NULL,
  `Asset_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_company_id_foreign` (`company_id`),
  KEY `assets_employee_id_foreign` (`employee_id`),
  KEY `assets_assets_category_id_foreign` (`assets_category_id`),
  CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assets VALUES('1','Laptop','1','','lap-01','1','','Asus','637256','Inv-090','','2020-10-25','2021-05-30','yes','2020-07-28 23:16:05','2020-07-28 23:16:05');



CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_out` tinyint(4) NOT NULL,
  `time_late` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES('28','49','2021-12-07','11:53','42.0.7.231','','','1','03:53','00:00','00:00','00:00','00:00','present');



CREATE TABLE `award_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `award_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO award_types VALUES('1','Performer Of The Year','2020-07-26 13:19:34','2020-07-26 13:19:34');
INSERT INTO award_types VALUES('2','Best Salesman','2020-07-26 13:19:47','2020-07-26 13:19:47');



CREATE TABLE `awards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `award_information` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `award_date` date NOT NULL,
  `gift` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `award_type_id` bigint(20) unsigned DEFAULT NULL,
  `award_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_company_id_foreign` (`company_id`),
  KEY `awards_department_id_foreign` (`department_id`),
  KEY `awards_employee_id_foreign` (`employee_id`),
  KEY `awards_award_type_id_foreign` (`award_type_id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `c_m_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `home` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO c_m_s VALUES('1','&lt;p&gt;Home Page, You can add your page design here&amp;nbsp;&lt;/p&gt;','&lt;p&gt;About Page, You can add your page design here&lt;/p&gt;','&lt;p&gt;Hello world&lt;/p&gt;','2020-07-27 02:19:39','2021-07-23 16:01:38');



CREATE TABLE `calendarables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `candidate_interview` (
  `interview_id` bigint(20) unsigned NOT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`candidate_id`),
  KEY `candidate_interview_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trading_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_location_id_foreign` (`location_id`),
  CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO companies VALUES('1','HR1','corporation','omega','5654335','54324','omega@gmail.com','hr1.com','675436','1','2019008832_1595789616.png','','2020-07-26 11:53:37','2020-07-26 11:53:37');
INSERT INTO companies VALUES('3','Sichuan Road Bridge Group','partnership','','','01631608763','emamhsajeeb@gmail.com','srbg.pro','158785156','3','629606125_1638853411.jpg','','2021-12-07 11:03:31','2021-12-07 13:12:56');



CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `complaint_from` bigint(20) unsigned NOT NULL,
  `complaint_against` bigint(20) unsigned NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_company_id_foreign` (`company_id`),
  KEY `complaints_complaint_from_foreign` (`complaint_from`),
  KEY `complaints_complaint_against_foreign` (`complaint_against`),
  CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO countries VALUES('1','US','United States');
INSERT INTO countries VALUES('2','CA','Canada');
INSERT INTO countries VALUES('3','AF','Afghanistan');
INSERT INTO countries VALUES('4','AL','Albania');
INSERT INTO countries VALUES('5','DZ','Algeria');
INSERT INTO countries VALUES('6','DS','American Samoa');
INSERT INTO countries VALUES('7','AD','Andorra');
INSERT INTO countries VALUES('8','AO','Angola');
INSERT INTO countries VALUES('9','AI','Anguilla');
INSERT INTO countries VALUES('10','AQ','Antarctica');
INSERT INTO countries VALUES('11','AG','Antigua and/or Barbuda');
INSERT INTO countries VALUES('12','AR','Argentina');
INSERT INTO countries VALUES('13','AM','Armenia');
INSERT INTO countries VALUES('14','AW','Aruba');
INSERT INTO countries VALUES('15','AU','Australia');
INSERT INTO countries VALUES('16','AT','Austria');
INSERT INTO countries VALUES('17','AZ','Azerbaijan');
INSERT INTO countries VALUES('18','BS','Bahamas');
INSERT INTO countries VALUES('19','BH','Bahrain');
INSERT INTO countries VALUES('20','BD','Bangladesh');
INSERT INTO countries VALUES('21','BB','Barbados');
INSERT INTO countries VALUES('22','BY','Belarus');
INSERT INTO countries VALUES('23','BE','Belgium');
INSERT INTO countries VALUES('24','BZ','Belize');
INSERT INTO countries VALUES('25','BJ','Benin');
INSERT INTO countries VALUES('26','BM','Bermuda');
INSERT INTO countries VALUES('27','BT','Bhutan');
INSERT INTO countries VALUES('28','BO','Bolivia');
INSERT INTO countries VALUES('29','BA','Bosnia and Herzegovina');
INSERT INTO countries VALUES('30','BW','Botswana');
INSERT INTO countries VALUES('31','BV','Bouvet Island');
INSERT INTO countries VALUES('32','BR','Brazil');
INSERT INTO countries VALUES('33','IO','British lndian Ocean Territory');
INSERT INTO countries VALUES('34','BN','Brunei Darussalam');
INSERT INTO countries VALUES('35','BG','Bulgaria');
INSERT INTO countries VALUES('36','BF','Burkina Faso');
INSERT INTO countries VALUES('37','BI','Burundi');
INSERT INTO countries VALUES('38','KH','Cambodia');
INSERT INTO countries VALUES('39','CM','Cameroon');
INSERT INTO countries VALUES('40','CV','Cape Verde');
INSERT INTO countries VALUES('41','KY','Cayman Islands');
INSERT INTO countries VALUES('42','CF','Central African Republic');
INSERT INTO countries VALUES('43','TD','Chad');
INSERT INTO countries VALUES('44','CL','Chile');
INSERT INTO countries VALUES('45','CN','China');
INSERT INTO countries VALUES('46','CX','Christmas Island');
INSERT INTO countries VALUES('47','CC','Cocos (Keeling) Islands');
INSERT INTO countries VALUES('48','CO','Colombia');
INSERT INTO countries VALUES('49','KM','Comoros');
INSERT INTO countries VALUES('50','CG','Congo');
INSERT INTO countries VALUES('51','CK','Cook Islands');
INSERT INTO countries VALUES('52','CR','Costa Rica');
INSERT INTO countries VALUES('53','HR','Croatia (Hrvatska)');
INSERT INTO countries VALUES('54','CU','Cuba');
INSERT INTO countries VALUES('55','CY','Cyprus');
INSERT INTO countries VALUES('56','CZ','Czech Republic');
INSERT INTO countries VALUES('57','DK','Denmark');
INSERT INTO countries VALUES('58','DJ','Djibouti');
INSERT INTO countries VALUES('59','DM','Dominica');
INSERT INTO countries VALUES('60','DO','Dominican Republic');
INSERT INTO countries VALUES('61','TP','East Timor');
INSERT INTO countries VALUES('62','EC','Ecudaor');
INSERT INTO countries VALUES('63','EG','Egypt');
INSERT INTO countries VALUES('64','SV','El Salvador');
INSERT INTO countries VALUES('65','GQ','Equatorial Guinea');
INSERT INTO countries VALUES('66','ER','Eritrea');
INSERT INTO countries VALUES('67','EE','Estonia');
INSERT INTO countries VALUES('68','ET','Ethiopia');
INSERT INTO countries VALUES('69','FK','Falkland Islands (Malvinas)');
INSERT INTO countries VALUES('70','FO','Faroe Islands');
INSERT INTO countries VALUES('71','FJ','Fiji');
INSERT INTO countries VALUES('72','FI','Finland');
INSERT INTO countries VALUES('73','FR','France');
INSERT INTO countries VALUES('74','FX','France, Metropolitan');
INSERT INTO countries VALUES('75','GF','French Guiana');
INSERT INTO countries VALUES('76','PF','French Polynesia');
INSERT INTO countries VALUES('77','TF','French Southern Territories');
INSERT INTO countries VALUES('78','GA','Gabon');
INSERT INTO countries VALUES('79','GM','Gambia');
INSERT INTO countries VALUES('80','GE','Georgia');
INSERT INTO countries VALUES('81','DE','Germany');
INSERT INTO countries VALUES('82','GH','Ghana');
INSERT INTO countries VALUES('83','GI','Gibraltar');
INSERT INTO countries VALUES('84','GR','Greece');
INSERT INTO countries VALUES('85','GL','Greenland');
INSERT INTO countries VALUES('86','GD','Grenada');
INSERT INTO countries VALUES('87','GP','Guadeloupe');
INSERT INTO countries VALUES('88','GU','Guam');
INSERT INTO countries VALUES('89','GT','Guatemala');
INSERT INTO countries VALUES('90','GN','Guinea');
INSERT INTO countries VALUES('91','GW','Guinea-Bissau');
INSERT INTO countries VALUES('92','GY','Guyana');
INSERT INTO countries VALUES('93','HT','Haiti');
INSERT INTO countries VALUES('94','HM','Heard and Mc Donald Islands');
INSERT INTO countries VALUES('95','HN','Honduras');
INSERT INTO countries VALUES('96','HK','Hong Kong');
INSERT INTO countries VALUES('97','HU','Hungary');
INSERT INTO countries VALUES('98','IS','Iceland');
INSERT INTO countries VALUES('99','IN','India');
INSERT INTO countries VALUES('100','ID','Indonesia');
INSERT INTO countries VALUES('101','IR','Iran (Islamic Republic of)');
INSERT INTO countries VALUES('102','IQ','Iraq');
INSERT INTO countries VALUES('103','IE','Ireland');
INSERT INTO countries VALUES('104','IL','Israel');
INSERT INTO countries VALUES('105','IT','Italy');
INSERT INTO countries VALUES('106','CI','Ivory Coast');
INSERT INTO countries VALUES('107','JM','Jamaica');
INSERT INTO countries VALUES('108','JP','Japan');
INSERT INTO countries VALUES('109','JO','Jordan');
INSERT INTO countries VALUES('110','KZ','Kazakhstan');
INSERT INTO countries VALUES('111','KE','Kenya');
INSERT INTO countries VALUES('112','KI','Kiribati');
INSERT INTO countries VALUES('113','KP','Korea, Democratic People\'s Republic of');
INSERT INTO countries VALUES('114','KR','Korea, Republic of');
INSERT INTO countries VALUES('115','KW','Kuwait');
INSERT INTO countries VALUES('116','KG','Kyrgyzstan');
INSERT INTO countries VALUES('117','LA','Lao People\'s Democratic Republic');
INSERT INTO countries VALUES('118','LV','Latvia');
INSERT INTO countries VALUES('119','LB','Lebanon');
INSERT INTO countries VALUES('120','LS','Lesotho');
INSERT INTO countries VALUES('121','LR','Liberia');
INSERT INTO countries VALUES('122','LY','Libyan Arab Jamahiriya');
INSERT INTO countries VALUES('123','LI','Liechtenstein');
INSERT INTO countries VALUES('124','LT','Lithuania');
INSERT INTO countries VALUES('125','LU','Luxembourg');
INSERT INTO countries VALUES('126','MO','Macau');
INSERT INTO countries VALUES('127','MK','Macedonia');
INSERT INTO countries VALUES('128','MG','Madagascar');
INSERT INTO countries VALUES('129','MW','Malawi');
INSERT INTO countries VALUES('130','MY','Malaysia');
INSERT INTO countries VALUES('131','MV','Maldives');
INSERT INTO countries VALUES('132','ML','Mali');
INSERT INTO countries VALUES('133','MT','Malta');
INSERT INTO countries VALUES('134','MH','Marshall Islands');
INSERT INTO countries VALUES('135','MQ','Martinique');
INSERT INTO countries VALUES('136','MR','Mauritania');
INSERT INTO countries VALUES('137','MU','Mauritius');
INSERT INTO countries VALUES('138','TY','Mayotte');
INSERT INTO countries VALUES('139','MX','Mexico');
INSERT INTO countries VALUES('140','FM','Micronesia, Federated States of');
INSERT INTO countries VALUES('141','MD','Moldova, Republic of');
INSERT INTO countries VALUES('142','MC','Monaco');
INSERT INTO countries VALUES('143','MN','Mongolia');
INSERT INTO countries VALUES('144','MS','Montserrat');
INSERT INTO countries VALUES('145','MA','Morocco');
INSERT INTO countries VALUES('146','MZ','Mozambique');
INSERT INTO countries VALUES('147','MM','Myanmar');
INSERT INTO countries VALUES('148','NA','Namibia');
INSERT INTO countries VALUES('149','NR','Nauru');
INSERT INTO countries VALUES('150','NP','Nepal');
INSERT INTO countries VALUES('151','NL','Netherlands');
INSERT INTO countries VALUES('152','AN','Netherlands Antilles');
INSERT INTO countries VALUES('153','NC','New Caledonia');
INSERT INTO countries VALUES('154','NZ','New Zealand');
INSERT INTO countries VALUES('155','NI','Nicaragua');
INSERT INTO countries VALUES('156','NE','Niger');
INSERT INTO countries VALUES('157','NG','Nigeria');
INSERT INTO countries VALUES('158','NU','Niue');
INSERT INTO countries VALUES('159','NF','Norfork Island');
INSERT INTO countries VALUES('160','MP','Northern Mariana Islands');
INSERT INTO countries VALUES('161','NO','Norway');
INSERT INTO countries VALUES('162','OM','Oman');
INSERT INTO countries VALUES('163','PK','Pakistan');
INSERT INTO countries VALUES('164','PW','Palau');
INSERT INTO countries VALUES('165','PA','Panama');
INSERT INTO countries VALUES('166','PG','Papua New Guinea');
INSERT INTO countries VALUES('167','PY','Paraguay');
INSERT INTO countries VALUES('168','PE','Peru');
INSERT INTO countries VALUES('169','PH','Philippines');
INSERT INTO countries VALUES('170','PN','Pitcairn');
INSERT INTO countries VALUES('171','PL','Poland');
INSERT INTO countries VALUES('172','PT','Portugal');
INSERT INTO countries VALUES('173','PR','Puerto Rico');
INSERT INTO countries VALUES('174','QA','Qatar');
INSERT INTO countries VALUES('175','RE','Reunion');
INSERT INTO countries VALUES('176','RO','Romania');
INSERT INTO countries VALUES('177','RU','Russian Federation');
INSERT INTO countries VALUES('178','RW','Rwanda');
INSERT INTO countries VALUES('179','KN','Saint Kitts and Nevis');
INSERT INTO countries VALUES('180','LC','Saint Lucia');
INSERT INTO countries VALUES('181','VC','Saint Vincent and the Grenadines');
INSERT INTO countries VALUES('182','WS','Samoa');
INSERT INTO countries VALUES('183','SM','San Marino');
INSERT INTO countries VALUES('184','ST','Sao Tome and Principe');
INSERT INTO countries VALUES('185','SA','Saudi Arabia');
INSERT INTO countries VALUES('186','SN','Senegal');
INSERT INTO countries VALUES('187','SC','Seychelles');
INSERT INTO countries VALUES('188','SL','Sierra Leone');
INSERT INTO countries VALUES('189','SG','Singapore');
INSERT INTO countries VALUES('190','SK','Slovakia');
INSERT INTO countries VALUES('191','SI','Slovenia');
INSERT INTO countries VALUES('192','SB','Solomon Islands');
INSERT INTO countries VALUES('193','SO','Somalia');
INSERT INTO countries VALUES('194','ZA','South Africa');
INSERT INTO countries VALUES('195','GS','South Georgia South Sandwich Islands');
INSERT INTO countries VALUES('196','ES','Spain');
INSERT INTO countries VALUES('197','LK','Sri Lanka');
INSERT INTO countries VALUES('198','SH','St. Helena');
INSERT INTO countries VALUES('199','PM','St. Pierre and Miquelon');
INSERT INTO countries VALUES('200','SD','Sudan');
INSERT INTO countries VALUES('201','SR','Suriname');
INSERT INTO countries VALUES('202','SJ','Svalbarn and Jan Mayen Islands');
INSERT INTO countries VALUES('203','SZ','Swaziland');
INSERT INTO countries VALUES('204','SE','Sweden');
INSERT INTO countries VALUES('205','CH','Switzerland');
INSERT INTO countries VALUES('206','SY','Syrian Arab Republic');
INSERT INTO countries VALUES('207','TW','Taiwan');
INSERT INTO countries VALUES('208','TJ','Tajikistan');
INSERT INTO countries VALUES('209','TZ','Tanzania, United Republic of');
INSERT INTO countries VALUES('210','TH','Thailand');
INSERT INTO countries VALUES('211','TG','Togo');
INSERT INTO countries VALUES('212','TK','Tokelau');
INSERT INTO countries VALUES('213','TO','Tonga');
INSERT INTO countries VALUES('214','TT','Trinidad and Tobago');
INSERT INTO countries VALUES('215','TN','Tunisia');
INSERT INTO countries VALUES('216','TR','Turkey');
INSERT INTO countries VALUES('217','TM','Turkmenistan');
INSERT INTO countries VALUES('218','TC','Turks and Caicos Islands');
INSERT INTO countries VALUES('219','TV','Tuvalu');
INSERT INTO countries VALUES('220','UG','Uganda');
INSERT INTO countries VALUES('221','UA','Ukraine');
INSERT INTO countries VALUES('222','AE','United Arab Emirates');
INSERT INTO countries VALUES('223','GB','United Kingdom');
INSERT INTO countries VALUES('224','UM','United States minor outlying islands');
INSERT INTO countries VALUES('225','UY','Uruguay');
INSERT INTO countries VALUES('226','UZ','Uzbekistan');
INSERT INTO countries VALUES('227','VU','Vanuatu');
INSERT INTO countries VALUES('228','VA','Vatican City State');
INSERT INTO countries VALUES('229','VE','Venezuela');
INSERT INTO countries VALUES('230','VN','Vietnam');
INSERT INTO countries VALUES('231','VG','Virigan Islands (British)');
INSERT INTO countries VALUES('232','VI','Virgin Islands (U.S.)');
INSERT INTO countries VALUES('233','WF','Wallis and Futuna Islands');
INSERT INTO countries VALUES('234','EH','Western Sahara');
INSERT INTO countries VALUES('235','YE','Yemen');
INSERT INTO countries VALUES('236','YU','Yugoslavia');
INSERT INTO countries VALUES('237','ZR','Zaire');
INSERT INTO countries VALUES('238','ZM','Zambia');
INSERT INTO countries VALUES('239','ZW','Zimbabwe');



CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_head` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_foreign` (`company_id`),
  KEY `departments_department_head_foreign` (`department_head`),
  CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES('5','HR','3','','','2020-07-27 02:19:39','2021-12-07 11:20:35');
INSERT INTO departments VALUES('6','Engineering','3','','','2021-12-07 11:20:01','2021-12-07 11:22:22');



CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_company_id_foreign` (`company_id`),
  KEY `designations_department_id_foreign` (`department_id`),
  CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO designations VALUES('7','HR manager','3','5','','2020-07-27 02:31:05','2021-12-07 12:50:05');
INSERT INTO designations VALUES('8','QC Database Engineer','3','6','','2021-12-07 11:22:50','2021-12-07 11:22:50');



CREATE TABLE `document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_types_company_id_foreign` (`company_id`),
  CONSTRAINT `document_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO document_types VALUES('1','','Driving Licesnse','2020-07-26 13:27:04','2020-07-26 13:27:04');
INSERT INTO document_types VALUES('2','','Passport','2020-07-26 13:27:16','2020-07-26 13:27:16');
INSERT INTO document_types VALUES('3','','National Id','2020-07-26 13:27:40','2020-07-26 13:27:40');
INSERT INTO document_types VALUES('4','','Resume','2021-12-07 13:22:42','2021-12-07 13:22:42');



CREATE TABLE `employee_bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `relation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(4) DEFAULT 0,
  `is_dependent` tinyint(4) DEFAULT 0,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone_ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_contacts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employee_documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employee_documents VALUES('5','49','3','NID','','NID.1638860124.jpg','2023-12-31','','2021-12-07 12:55:24','2021-12-07 12:55:24');



CREATE TABLE `employee_immigrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_interview` (
  `interview_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`employee_id`),
  KEY `employee_interview_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_meeting` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `meeting_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`meeting_id`),
  KEY `employee_meeting_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_project` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `employee_project_project_id_foreign` (`project_id`),
  CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_qualificaitons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `education_level_id` bigint(20) unsigned DEFAULT NULL,
  `institution_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint(20) unsigned DEFAULT NULL,
  `general_skill_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`),
  CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `support_ticket_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`support_ticket_id`),
  KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`),
  CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_task` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`task_id`),
  KEY `employee_task_task_id_foreign` (`task_id`),
  CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_training_list` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `training_list_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`training_list_id`),
  KEY `employee_training_list_training_list_id_foreign` (`training_list_id`),
  CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_work_experience` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_experience_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_shift_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `role_users_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double NOT NULL DEFAULT 0,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_leave` int(14) DEFAULT 0,
  `remaining_leave` int(14) DEFAULT 0,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  KEY `employees_company_id_foreign` (`company_id`),
  KEY `employees_department_id_foreign` (`department_id`),
  KEY `employees_designation_id_foreign` (`designation_id`),
  KEY `employees_location_id_foreign` (`location_id`),
  KEY `employees_role_users_id_foreign` (`role_users_id`),
  KEY `employees_status_id_foreign` (`status_id`),
  CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES('49','Emam','Hosen','emamhsajeeb@gmail.com','+8801610285004','1999-09-22','Male','3','3','6','8','','2','1','2021-11-17','','single','','','','20','','','','','','','','30000','Monthly','general','24','24','','0.00','1','2021-12-07 11:35:47','2021-12-07 13:10:28');



CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `event_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_company_id_foreign` (`company_id`),
  KEY `events_department_id_foreign` (`department_id`),
  CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expense_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_types_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `file_manager_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `allowed_extensions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_file_size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO file_manager_settings VALUES('1','jpg,png,doc,docx,pdf,csv,xls,jpeg','20','2020-07-28 22:59:20','2020-07-28 22:59:20');



CREATE TABLE `file_managers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_managers_department_id_foreign` (`department_id`),
  KEY `file_managers_added_by_foreign` (`added_by`),
  CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO file_managers VALUES('1','','1','New','185.04 KB','pdf','','2020-07-28 23:01:33','2020-07-28 23:01:33');



CREATE TABLE `finance_bank_cashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_bank_cashes VALUES('1','Central Bank','64000','100000','5635636','676','Ethopia','2020-07-28 10:17:21','2021-12-07 13:15:21');
INSERT INTO finance_bank_cashes VALUES('2','New Horizon','144500','35000','5534677','453','Orchestra','2020-07-28 10:18:15','2020-07-28 22:36:41');



CREATE TABLE `finance_deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payer_id` bigint(20) unsigned DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_deposits_company_id_foreign` (`company_id`),
  KEY `finance_deposits_account_id_foreign` (`account_id`),
  KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_deposits_payer_id_foreign` (`payer_id`),
  CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_deposits VALUES('1','','1','110500','interest income','gfddds','3','1','564534','','2021-03-28','2020-07-28 10:24:20','2020-07-28 10:26:37');
INSERT INTO finance_deposits VALUES('5','','2','110500','interest income','','1','2','37763','','2021-03-27','2020-07-28 11:12:31','2020-07-28 22:28:25');



CREATE TABLE `finance_expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payee_id` bigint(20) unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_expenses_company_id_foreign` (`company_id`),
  KEY `finance_expenses_account_id_foreign` (`account_id`),
  KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  KEY `finance_expenses_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_expenses VALUES('3','','2','3000','','','2','1','455343','','2021-03-29','2020-07-28 10:45:41','2020-07-28 10:45:41');
INSERT INTO finance_expenses VALUES('9','','1','20000','','','','','Payroll','','2021-03-26','2020-07-29 00:20:58','2020-07-29 00:20:58');
INSERT INTO finance_expenses VALUES('10','','1','1000','','','','','Payroll','','2021-03-26','2020-07-29 00:38:34','2020-07-29 00:38:34');
INSERT INTO finance_expenses VALUES('11','','1','1500','','','','','Payroll','','2021-03-26','2020-07-29 02:11:51','2020-07-29 02:11:51');
INSERT INTO finance_expenses VALUES('12','','1','1500','','','','','Payroll','','2021-03-26','2020-07-29 02:33:49','2020-07-29 02:33:49');
INSERT INTO finance_expenses VALUES('13','','1','2190','','','','','Payroll','','2021-03-26','2020-07-29 11:25:19','2020-07-29 11:25:19');
INSERT INTO finance_expenses VALUES('14','','1','1500','','','','','Payroll','','2021-03-26','2020-07-29 12:08:48','2020-07-29 12:08:48');
INSERT INTO finance_expenses VALUES('16','','1','310','','','','','Payroll','','2021-03-26','2020-07-29 13:32:34','2020-07-29 13:32:34');
INSERT INTO finance_expenses VALUES('19','','1','965','','','','','Payroll','','2021-02-28','2020-10-14 23:27:00','2020-10-14 23:27:00');
INSERT INTO finance_expenses VALUES('20','','1','310','','','','','Payroll','','2021-02-28','2020-10-19 04:54:47','2020-10-19 04:54:47');
INSERT INTO finance_expenses VALUES('21','','1','3690','','','','','Payroll','','2021-01-24','2020-10-19 04:57:30','2020-10-19 04:57:30');
INSERT INTO finance_expenses VALUES('22','','1','310','','','','','Payroll','','2021-03-05','2021-03-05 04:49:44','2021-03-05 04:49:44');
INSERT INTO finance_expenses VALUES('23','','1','49800','','','','','Payroll','','2021-03-12','2021-03-11 22:18:02','2021-03-11 22:18:02');
INSERT INTO finance_expenses VALUES('24','','1','110','','','','','Payroll','','2021-03-12','2021-03-11 22:40:21','2021-03-11 22:40:21');
INSERT INTO finance_expenses VALUES('25','','1','1705','','','','','Payroll','','2021-03-12','2021-03-11 22:52:46','2021-03-11 22:52:46');
INSERT INTO finance_expenses VALUES('26','','1','3880','','','','','Payroll','','2021-03-12','2021-03-11 23:20:57','2021-03-11 23:20:57');
INSERT INTO finance_expenses VALUES('27','','1','3880','','','','','Payroll','','2021-03-12','2021-03-11 23:27:15','2021-03-11 23:27:15');
INSERT INTO finance_expenses VALUES('28','','1','1110','','','','','Payroll','','2021-03-12','2021-03-11 23:31:31','2021-03-11 23:31:31');
INSERT INTO finance_expenses VALUES('29','','1','2590','','','','','Payroll','','2021-03-12','2021-03-12 02:24:41','2021-03-12 02:24:41');
INSERT INTO finance_expenses VALUES('30','','1','175','','','','','Payroll','','2021-03-12','2021-03-12 02:26:26','2021-03-12 02:26:26');
INSERT INTO finance_expenses VALUES('31','','1','110','','','','','Payroll','','2021-03-12','2021-03-12 02:34:06','2021-03-12 02:34:06');
INSERT INTO finance_expenses VALUES('32','','1','310','','','','','Payroll','','2021-03-12','2021-03-12 03:03:09','2021-03-12 03:03:09');
INSERT INTO finance_expenses VALUES('33','','1','2590','','','','','Payroll','','2021-03-12','2021-03-12 03:27:41','2021-03-12 03:27:41');
INSERT INTO finance_expenses VALUES('34','','1','0','','','','','Payroll','','2021-03-12','2021-03-12 03:40:29','2021-03-12 03:40:29');
INSERT INTO finance_expenses VALUES('35','','1','2305','','','','','Payroll','','2021-03-12','2021-03-12 03:46:25','2021-03-12 03:46:25');
INSERT INTO finance_expenses VALUES('36','','1','110','','','','','Payroll','','2021-03-12','2021-03-12 05:03:55','2021-03-12 05:03:55');
INSERT INTO finance_expenses VALUES('37','','1','660','','','','','Payroll','','2021-03-12','2021-03-12 05:07:59','2021-03-12 05:07:59');
INSERT INTO finance_expenses VALUES('38','','1','660','','','','','Payroll','','2021-03-12','2021-03-12 05:08:48','2021-03-12 05:08:48');
INSERT INTO finance_expenses VALUES('39','','1','420','','','','','Payroll','','2021-03-12','2021-03-12 05:12:40','2021-03-12 05:12:40');
INSERT INTO finance_expenses VALUES('40','','1','650','','','','','Payroll','','2021-03-12','2021-03-12 05:16:06','2021-03-12 05:16:06');
INSERT INTO finance_expenses VALUES('41','','1','310','','','','','Payroll','','2021-03-12','2021-03-12 05:17:02','2021-03-12 05:17:02');
INSERT INTO finance_expenses VALUES('42','','1','660','','','','','Payroll','','2021-03-13','2021-03-13 02:07:03','2021-03-13 02:07:03');
INSERT INTO finance_expenses VALUES('43','','1','0','','','','','Payroll','','2021-03-13','2021-03-13 02:07:25','2021-03-13 02:07:25');
INSERT INTO finance_expenses VALUES('44','','1','1490','','','','','Payroll','','2021-03-20','2021-03-20 07:25:41','2021-03-20 07:25:41');
INSERT INTO finance_expenses VALUES('45','','1','2090','','','','','Payroll','','2021-03-20','2021-03-20 07:37:54','2021-03-20 07:37:54');
INSERT INTO finance_expenses VALUES('46','','1','2090','','','','','Payroll','','2021-03-22','2021-03-22 06:44:20','2021-03-22 06:44:20');
INSERT INTO finance_expenses VALUES('47','','1','340','','','','','Payroll','','2021-03-22','2021-03-22 07:30:06','2021-03-22 07:30:06');
INSERT INTO finance_expenses VALUES('48','','1','175','','','','','Payroll','','2021-03-22','2021-03-22 07:36:02','2021-03-22 07:36:02');
INSERT INTO finance_expenses VALUES('49','','1','375','','','','','Payroll','','2021-04-06','2021-04-05 20:31:41','2021-04-05 20:31:41');
INSERT INTO finance_expenses VALUES('50','','1','110','','','','','Payroll','','2021-04-06','2021-04-05 20:36:28','2021-04-05 20:36:28');
INSERT INTO finance_expenses VALUES('51','','1','200','','','','','Payroll','','2021-04-06','2021-04-05 22:07:42','2021-04-05 22:07:42');
INSERT INTO finance_expenses VALUES('52','','1','775','','','','','Payroll','','2021-04-08','2021-04-08 10:35:48','2021-04-08 10:35:48');
INSERT INTO finance_expenses VALUES('53','','1','675','','','','','Payroll','','2021-04-08','2021-04-08 10:36:12','2021-04-08 10:36:12');
INSERT INTO finance_expenses VALUES('54','','1','675','','','','','Payroll','','2021-04-09','2021-04-09 00:27:31','2021-04-09 00:27:31');
INSERT INTO finance_expenses VALUES('55','','1','800','','','','','Payroll','','2021-04-09','2021-04-09 00:29:25','2021-04-09 00:29:25');
INSERT INTO finance_expenses VALUES('56','','1','1050','','','','','Payroll','','2021-04-09','2021-04-09 09:48:46','2021-04-09 09:48:46');
INSERT INTO finance_expenses VALUES('57','','1','950','','','','','Payroll','','2021-04-10','2021-04-10 06:45:13','2021-04-10 06:45:13');
INSERT INTO finance_expenses VALUES('58','','1','1050','','','','','Payroll','','2021-04-10','2021-04-10 09:01:21','2021-04-10 09:01:21');
INSERT INTO finance_expenses VALUES('59','','1','905','','','','','Payroll','','2021-04-10','2021-04-10 10:06:06','2021-04-10 10:06:06');
INSERT INTO finance_expenses VALUES('60','','1','1090','','','','','Payroll','','2021-04-10','2021-04-10 10:07:24','2021-04-10 10:07:24');
INSERT INTO finance_expenses VALUES('61','','1','990','','','','','Payroll','','2021-04-11','2021-04-10 19:29:36','2021-04-10 19:29:36');
INSERT INTO finance_expenses VALUES('62','','1','950','','','','','Payroll','','2021-04-11','2021-04-10 19:49:48','2021-04-10 19:49:48');
INSERT INTO finance_expenses VALUES('63','','1','83.333','','','','','Payroll','','2021-04-11','2021-04-10 21:01:42','2021-04-10 21:01:42');
INSERT INTO finance_expenses VALUES('64','','1','83.333','','','','','Payroll','','2021-04-11','2021-04-10 21:03:00','2021-04-10 21:03:00');
INSERT INTO finance_expenses VALUES('65','','1','83.333','','','','','Payroll','','2021-04-11','2021-04-10 21:03:57','2021-04-10 21:03:57');
INSERT INTO finance_expenses VALUES('66','','1','83.333','','','','','Payroll','','2021-04-11','2021-04-10 21:11:40','2021-04-10 21:11:40');
INSERT INTO finance_expenses VALUES('67','','1','715','','','','','Payroll','','2021-04-11','2021-04-11 10:40:48','2021-04-11 10:40:48');
INSERT INTO finance_expenses VALUES('68','','1','715','','','','','Payroll','','2021-04-11','2021-04-11 10:52:03','2021-04-11 10:52:03');
INSERT INTO finance_expenses VALUES('69','','1','605','','','','','Payroll','','2021-04-12','2021-04-11 18:16:42','2021-04-11 18:16:42');
INSERT INTO finance_expenses VALUES('70','','1','605','','','','','Payroll','','2021-04-12','2021-04-11 18:19:09','2021-04-11 18:19:09');
INSERT INTO finance_expenses VALUES('71','','1','1615','','','','','Payroll','','2021-04-12','2021-04-12 10:33:37','2021-04-12 10:33:37');
INSERT INTO finance_expenses VALUES('72','','1','215','','','','','Payroll','','2021-04-12','2021-04-12 10:34:45','2021-04-12 10:34:45');
INSERT INTO finance_expenses VALUES('73','','1','215','','','','','Payroll','','2021-04-12','2021-04-12 10:35:23','2021-04-12 10:35:23');
INSERT INTO finance_expenses VALUES('74','','1','215','','','','','Payroll','','2021-04-12','2021-04-12 10:36:32','2021-04-12 10:36:32');
INSERT INTO finance_expenses VALUES('75','','1','215','','','','','Payroll','','2021-04-12','2021-04-12 10:36:32','2021-04-12 10:36:32');
INSERT INTO finance_expenses VALUES('76','','1','85','','','','','Payroll','','2021-04-13','2021-04-12 22:06:17','2021-04-12 22:06:17');
INSERT INTO finance_expenses VALUES('77','','1','4055','','','','','Payroll','','2021-04-13','2021-04-13 08:28:42','2021-04-13 08:28:42');
INSERT INTO finance_expenses VALUES('78','','1','165','','','','','Payroll','','2021-04-13','2021-04-13 08:36:59','2021-04-13 08:36:59');
INSERT INTO finance_expenses VALUES('79','','1','410','','','','','Payroll','','2021-04-14','2021-04-13 14:41:16','2021-04-13 14:41:16');
INSERT INTO finance_expenses VALUES('82','','1','165','','','','','Payroll','','2021-04-14','2021-04-14 09:15:33','2021-04-14 09:15:33');
INSERT INTO finance_expenses VALUES('83','','1','75','','','','','Payroll','','2021-04-14','2021-04-14 09:17:30','2021-04-14 09:17:30');
INSERT INTO finance_expenses VALUES('84','','1','200','','','','','Payroll','','2021-04-14','2021-04-14 09:37:09','2021-04-14 09:37:09');
INSERT INTO finance_expenses VALUES('85','','1','275','','','','','Payroll','','2021-04-15','2021-04-14 13:39:45','2021-04-14 13:39:45');
INSERT INTO finance_expenses VALUES('86','','1','139','','','','','Payroll','','2021-04-15','2021-04-14 14:07:53','2021-04-14 14:07:53');
INSERT INTO finance_expenses VALUES('87','','1','740','','','','','Payroll','','2021-07-03','2021-07-03 06:48:19','2021-07-03 06:48:19');
INSERT INTO finance_expenses VALUES('88','','1','36000','','','','','Payroll','','2021-12-07','2021-12-07 13:15:21','2021-12-07 13:15:21');



CREATE TABLE `finance_payees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_payees VALUES('1','Mr. A','563345','2020-07-28 10:22:13','2020-07-28 10:22:13');
INSERT INTO finance_payees VALUES('2','Mr. B','5656353','2020-07-28 10:22:31','2020-07-28 10:22:31');



CREATE TABLE `finance_payers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_payers VALUES('1','Mr. X','34242','2020-07-28 10:23:01','2020-07-28 10:23:01');
INSERT INTO finance_payers VALUES('2','Mr. Z','54563','2020-07-28 10:23:19','2020-07-28 10:23:19');



CREATE TABLE `finance_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payee_id` bigint(20) unsigned DEFAULT NULL,
  `payer_id` bigint(20) unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transactions_company_id_foreign` (`company_id`),
  KEY `finance_transactions_account_id_foreign` (`account_id`),
  KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  KEY `finance_transactions_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_transactions VALUES('1','','1','110500','interest income','','gfddds','3','','1','','','','564534','','2021-03-28','2020-07-28 10:24:20','2020-07-28 10:26:37');
INSERT INTO finance_transactions VALUES('3','','2','3000','','','','2','1','','455343','','2021-03-29','','','','2020-07-28 10:45:41','2020-07-28 10:45:41');
INSERT INTO finance_transactions VALUES('5','','2','110500','interest income','','','1','','2','','','','37763','','2021-03-27','2020-07-28 11:12:31','2020-07-28 22:28:25');
INSERT INTO finance_transactions VALUES('6','','2','2000','transfer','','','1','','','','','','6736','','2021-03-30','2020-07-28 22:36:41','2020-07-28 22:36:41');
INSERT INTO finance_transactions VALUES('7','','1','2000','transfer','','','1','','','6736','','2021-03-30','','','','2020-07-28 22:36:41','2020-07-28 22:36:41');
INSERT INTO finance_transactions VALUES('9','','1','20000','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 00:20:58','2020-07-29 00:20:58');
INSERT INTO finance_transactions VALUES('10','','1','1000','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 00:38:34','2020-07-29 00:38:34');
INSERT INTO finance_transactions VALUES('11','','1','1500','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 02:11:51','2020-07-29 02:11:51');
INSERT INTO finance_transactions VALUES('12','','1','1500','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 02:33:49','2020-07-29 02:33:49');
INSERT INTO finance_transactions VALUES('13','','1','2190','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 11:25:19','2020-07-29 11:25:19');
INSERT INTO finance_transactions VALUES('14','','1','1500','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 12:08:47','2020-07-29 12:08:47');
INSERT INTO finance_transactions VALUES('16','','1','310','','','','','','','Payroll','','2021-03-26','','','','2020-07-29 13:32:34','2020-07-29 13:32:34');
INSERT INTO finance_transactions VALUES('19','','1','965','','','','','','','Payroll','','2021-02-28','','','','2020-10-14 23:27:00','2020-10-14 23:27:00');
INSERT INTO finance_transactions VALUES('20','','1','310','','','','','','','Payroll','','2021-02-28','','','','2020-10-19 04:54:47','2020-10-19 04:54:47');
INSERT INTO finance_transactions VALUES('21','','1','3690','','','','','','','Payroll','','2021-01-24','','','','2020-10-19 04:57:30','2020-10-19 04:57:30');
INSERT INTO finance_transactions VALUES('22','','1','310','','','','','','','Payroll','','2021-03-05','','','','2021-03-05 04:49:44','2021-03-05 04:49:44');
INSERT INTO finance_transactions VALUES('23','','1','49800','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 22:18:02','2021-03-11 22:18:02');
INSERT INTO finance_transactions VALUES('24','','1','110','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 22:40:21','2021-03-11 22:40:21');
INSERT INTO finance_transactions VALUES('25','','1','1705','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 22:52:46','2021-03-11 22:52:46');
INSERT INTO finance_transactions VALUES('26','','1','3880','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 23:20:57','2021-03-11 23:20:57');
INSERT INTO finance_transactions VALUES('27','','1','3880','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 23:27:15','2021-03-11 23:27:15');
INSERT INTO finance_transactions VALUES('28','','1','1110','','','','','','','Payroll','','2021-03-12','','','','2021-03-11 23:31:31','2021-03-11 23:31:31');
INSERT INTO finance_transactions VALUES('29','','1','2590','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 02:24:41','2021-03-12 02:24:41');
INSERT INTO finance_transactions VALUES('30','','1','175','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 02:26:26','2021-03-12 02:26:26');
INSERT INTO finance_transactions VALUES('31','','1','110','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 02:34:06','2021-03-12 02:34:06');
INSERT INTO finance_transactions VALUES('32','','1','310','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 03:03:09','2021-03-12 03:03:09');
INSERT INTO finance_transactions VALUES('33','','1','2590','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 03:27:41','2021-03-12 03:27:41');
INSERT INTO finance_transactions VALUES('34','','1','0','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 03:40:29','2021-03-12 03:40:29');
INSERT INTO finance_transactions VALUES('35','','1','2305','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 03:46:24','2021-03-12 03:46:24');
INSERT INTO finance_transactions VALUES('36','','1','110','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:03:55','2021-03-12 05:03:55');
INSERT INTO finance_transactions VALUES('37','','1','660','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:07:59','2021-03-12 05:07:59');
INSERT INTO finance_transactions VALUES('38','','1','660','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:08:48','2021-03-12 05:08:48');
INSERT INTO finance_transactions VALUES('39','','1','420','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:12:40','2021-03-12 05:12:40');
INSERT INTO finance_transactions VALUES('40','','1','650','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:16:06','2021-03-12 05:16:06');
INSERT INTO finance_transactions VALUES('41','','1','310','','','','','','','Payroll','','2021-03-12','','','','2021-03-12 05:17:02','2021-03-12 05:17:02');
INSERT INTO finance_transactions VALUES('42','','1','660','','','','','','','Payroll','','2021-03-13','','','','2021-03-13 02:07:03','2021-03-13 02:07:03');
INSERT INTO finance_transactions VALUES('43','','1','0','','','','','','','Payroll','','2021-03-13','','','','2021-03-13 02:07:25','2021-03-13 02:07:25');
INSERT INTO finance_transactions VALUES('44','','1','1490','','','','','','','Payroll','','2021-03-20','','','','2021-03-20 07:25:41','2021-03-20 07:25:41');
INSERT INTO finance_transactions VALUES('45','','1','2090','','','','','','','Payroll','','2021-03-20','','','','2021-03-20 07:37:54','2021-03-20 07:37:54');
INSERT INTO finance_transactions VALUES('46','','1','2090','','','','','','','Payroll','','2021-03-22','','','','2021-03-22 06:44:20','2021-03-22 06:44:20');
INSERT INTO finance_transactions VALUES('47','','1','340','','','','','','','Payroll','','2021-03-22','','','','2021-03-22 07:30:06','2021-03-22 07:30:06');
INSERT INTO finance_transactions VALUES('48','','1','175','','','','','','','Payroll','','2021-03-22','','','','2021-03-22 07:36:02','2021-03-22 07:36:02');
INSERT INTO finance_transactions VALUES('49','','1','375','','','','','','','Payroll','','2021-04-06','','','','2021-04-05 20:31:41','2021-04-05 20:31:41');
INSERT INTO finance_transactions VALUES('50','','1','110','','','','','','','Payroll','','2021-04-06','','','','2021-04-05 20:36:28','2021-04-05 20:36:28');
INSERT INTO finance_transactions VALUES('51','','1','200','','','','','','','Payroll','','2021-04-06','','','','2021-04-05 22:07:42','2021-04-05 22:07:42');
INSERT INTO finance_transactions VALUES('52','','1','775','','','','','','','Payroll','','2021-04-08','','','','2021-04-08 10:35:47','2021-04-08 10:35:47');
INSERT INTO finance_transactions VALUES('53','','1','675','','','','','','','Payroll','','2021-04-08','','','','2021-04-08 10:36:12','2021-04-08 10:36:12');
INSERT INTO finance_transactions VALUES('54','','1','675','','','','','','','Payroll','','2021-04-09','','','','2021-04-09 00:27:31','2021-04-09 00:27:31');
INSERT INTO finance_transactions VALUES('55','','1','800','','','','','','','Payroll','','2021-04-09','','','','2021-04-09 00:29:25','2021-04-09 00:29:25');
INSERT INTO finance_transactions VALUES('56','','1','1050','','','','','','','Payroll','','2021-04-09','','','','2021-04-09 09:48:46','2021-04-09 09:48:46');
INSERT INTO finance_transactions VALUES('57','','1','950','','','','','','','Payroll','','2021-04-10','','','','2021-04-10 06:45:13','2021-04-10 06:45:13');
INSERT INTO finance_transactions VALUES('58','','1','1050','','','','','','','Payroll','','2021-04-10','','','','2021-04-10 09:01:21','2021-04-10 09:01:21');
INSERT INTO finance_transactions VALUES('59','','1','905','','','','','','','Payroll','','2021-04-10','','','','2021-04-10 10:06:06','2021-04-10 10:06:06');
INSERT INTO finance_transactions VALUES('60','','1','1090','','','','','','','Payroll','','2021-04-10','','','','2021-04-10 10:07:24','2021-04-10 10:07:24');
INSERT INTO finance_transactions VALUES('61','','1','990','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 19:29:36','2021-04-10 19:29:36');
INSERT INTO finance_transactions VALUES('62','','1','950','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 19:49:48','2021-04-10 19:49:48');
INSERT INTO finance_transactions VALUES('63','','1','83.333','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 21:01:42','2021-04-10 21:01:42');
INSERT INTO finance_transactions VALUES('64','','1','83.333','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 21:03:00','2021-04-10 21:03:00');
INSERT INTO finance_transactions VALUES('65','','1','83.333','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 21:03:57','2021-04-10 21:03:57');
INSERT INTO finance_transactions VALUES('66','','1','83.333','','','','','','','Payroll','','2021-04-11','','','','2021-04-10 21:11:40','2021-04-10 21:11:40');
INSERT INTO finance_transactions VALUES('67','','1','715','','','','','','','Payroll','','2021-04-11','','','','2021-04-11 10:40:47','2021-04-11 10:40:47');
INSERT INTO finance_transactions VALUES('68','','1','715','','','','','','','Payroll','','2021-04-11','','','','2021-04-11 10:52:03','2021-04-11 10:52:03');
INSERT INTO finance_transactions VALUES('69','','1','605','','','','','','','Payroll','','2021-04-12','','','','2021-04-11 18:16:41','2021-04-11 18:16:41');
INSERT INTO finance_transactions VALUES('70','','1','605','','','','','','','Payroll','','2021-04-12','','','','2021-04-11 18:19:09','2021-04-11 18:19:09');
INSERT INTO finance_transactions VALUES('71','','1','1615','','','','','','','Payroll','','2021-04-12','','','','2021-04-12 10:33:37','2021-04-12 10:33:37');
INSERT INTO finance_transactions VALUES('72','','1','215','','','','','','','Payroll','','2021-04-12','','','','2021-04-12 10:34:45','2021-04-12 10:34:45');
INSERT INTO finance_transactions VALUES('73','','1','215','','','','','','','Payroll','','2021-04-12','','','','2021-04-12 10:35:23','2021-04-12 10:35:23');
INSERT INTO finance_transactions VALUES('74','','1','215','','','','','','','Payroll','','2021-04-12','','','','2021-04-12 10:36:32','2021-04-12 10:36:32');
INSERT INTO finance_transactions VALUES('75','','1','215','','','','','','','Payroll','','2021-04-12','','','','2021-04-12 10:36:32','2021-04-12 10:36:32');
INSERT INTO finance_transactions VALUES('76','','1','85','','','','','','','Payroll','','2021-04-13','','','','2021-04-12 22:06:17','2021-04-12 22:06:17');
INSERT INTO finance_transactions VALUES('77','','1','4055','','','','','','','Payroll','','2021-04-13','','','','2021-04-13 08:28:42','2021-04-13 08:28:42');
INSERT INTO finance_transactions VALUES('78','','1','165','','','','','','','Payroll','','2021-04-13','','','','2021-04-13 08:36:59','2021-04-13 08:36:59');
INSERT INTO finance_transactions VALUES('79','','1','410','','','','','','','Payroll','','2021-04-14','','','','2021-04-13 14:41:16','2021-04-13 14:41:16');
INSERT INTO finance_transactions VALUES('82','','1','165','','','','','','','Payroll','','2021-04-14','','','','2021-04-14 09:15:33','2021-04-14 09:15:33');
INSERT INTO finance_transactions VALUES('83','','1','75','','','','','','','Payroll','','2021-04-14','','','','2021-04-14 09:17:30','2021-04-14 09:17:30');
INSERT INTO finance_transactions VALUES('84','','1','200','','','','','','','Payroll','','2021-04-14','','','','2021-04-14 09:37:09','2021-04-14 09:37:09');
INSERT INTO finance_transactions VALUES('85','','1','275','','','','','','','Payroll','','2021-04-15','','','','2021-04-14 13:39:45','2021-04-14 13:39:45');
INSERT INTO finance_transactions VALUES('86','','1','139','','','','','','','Payroll','','2021-04-15','','','','2021-04-14 14:07:53','2021-04-14 14:07:53');
INSERT INTO finance_transactions VALUES('87','','1','740','','','','','','','Payroll','','2021-07-03','','','','2021-07-03 06:48:19','2021-07-03 06:48:19');
INSERT INTO finance_transactions VALUES('88','','1','36000','','','','','','','Payroll','','2021-12-07','','','','2021-12-07 13:15:21','2021-12-07 13:15:21');



CREATE TABLE `finance_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `from_account_id` bigint(20) unsigned DEFAULT NULL,
  `to_account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transfers_company_id_foreign` (`company_id`),
  KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO finance_transfers VALUES('1','','1','2','2000','6736','','1','2021-03-30','2020-07-28 22:36:41','2020-07-28 22:36:41');



CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payment_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES('1','SRBG','logo.png','Asia/Dhaka','BDT','prefix','1','Y/m/d','default.css','Emam H. Sajeeb','https://www.facebook.com/emamhsajeeb','2020-07-25 12:00:00','2021-12-07 13:48:55');



CREATE TABLE `goal_trackings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `goal_type_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_achievement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO goal_trackings VALUES('1','1','1','Testing-1 Subject','Testing-1 Achievement','Testing-1 Description','01/17/2021','01/18/2021','38','In Progress','2021-01-16 21:14:15','2021-01-16 21:14:39');
INSERT INTO goal_trackings VALUES('2','2','2','Testing-2 Subject','Testing-2 Achievement','Testing-2 Description','01/19/2021','01/20/2021','52','In Progress','2021-01-16 21:15:33','2021-01-16 21:18:11');
INSERT INTO goal_trackings VALUES('4','1','3','Testing-3 Subject','Testing-3 Achievement','Testing 3 Description','01/21/2021','01/22/2021','90','Completed','2021-01-16 21:16:28','2021-01-16 21:18:21');



CREATE TABLE `goal_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO goal_types VALUES('1','Event Goal','2021-01-16 20:14:44','2021-01-16 20:14:44');
INSERT INTO goal_types VALUES('2','Success Goal','2021-01-16 20:14:58','2021-01-16 20:14:58');
INSERT INTO goal_types VALUES('3','Complete','2021-01-16 20:40:18','2021-01-16 20:40:18');



CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_company_id_foreign` (`company_id`),
  KEY `holidays_department_id_foreign` (`department_id`),
  CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO holidays VALUES('1','Eid Ul Adha','ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum q','1','','2021-03-30','2021-04-01','1','2020-07-27 11:07:35','2020-07-27 11:07:35');



CREATE TABLE `indicators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO indicators VALUES('1','1','2','1','None','Beginner','Intermidiate','Expert/Leader','Advanced','Advanced','admin','2021-01-16 22:16:32','2021-01-16 22:16:32');
INSERT INTO indicators VALUES('2','1','3','2','None','Beginner','Intermidiate','Advanced','Advanced','Expert/Leader','admin','2021-01-16 22:17:10','2021-01-16 22:17:10');
INSERT INTO indicators VALUES('3','2','7','5','Advanced','Advanced','Beginner','Beginner','Intermidiate','Advanced','admin','2021-01-16 22:17:54','2021-01-16 22:17:54');



CREATE TABLE `invoice_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_qty` bigint(20) NOT NULL DEFAULT 0,
  `item_unit_price` bigint(20) NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_project_id_foreign` (`project_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_items VALUES('1','1','1','a','$0','0','4','30','120','225','0','10','5','10','215','','2020-07-28 09:43:24');
INSERT INTO invoice_items VALUES('2','1','1','b','5','5','2','50','105','225','0','10','5','10','215','2020-07-28 09:43:24','2020-07-28 09:43:24');
INSERT INTO invoice_items VALUES('3','2','2','z','$0','0','1','10','10','10','0','0','0','0','10','','2020-07-28 09:52:54');
INSERT INTO invoice_items VALUES('7','5','3','aa','$0','0','12','20','240','240','1','20','0','48','192','','2021-06-16 21:35:42');
INSERT INTO invoice_items VALUES('8','6','2','item1','$0','0','1','10','10','10','0','0','0','0','10','','2021-06-16 21:33:45');
INSERT INTO invoice_items VALUES('9','6','2','item2','$0','0','1','0','0','10','0','0','0','0','10','','2021-06-16 21:33:45');
INSERT INTO invoice_items VALUES('10','7','2','amarnam','$0','0','1','0','0','0','0','0','0','0','0','','');
INSERT INTO invoice_items VALUES('11','6','2','item3','$0','0','1','0','0','10','0','0','0','0','10','2021-06-16 21:34:12','2021-06-16 21:34:12');



CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_client_id_foreign` (`client_id`),
  KEY `invoices_project_id_foreign` (`project_id`),
  CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoices VALUES('1','INV-xnL5K2','','1','2021-03-29','2021-04-09','225','0','10','5','10','215','Thanks','1','2020-07-28 09:37:47','2021-06-16 21:22:01');
INSERT INTO invoices VALUES('2','INV-NleUqw','','2','2021-03-26','2021-04-05','10','0','0','0','0','10','Thanks','2','2020-07-28 09:48:59','2020-10-17 20:32:59');
INSERT INTO invoices VALUES('5','INV-IjAIYl','','3','2021-03-29','2021-04-03','240','1','20','0','48','192','','1','2020-10-12 00:49:25','2021-06-16 21:35:42');
INSERT INTO invoices VALUES('6','INV-jbd7aR','','2','2021-06-01','2021-06-30','10','0','0','0','0','10','','0','2021-06-16 20:06:33','2021-06-16 21:33:45');
INSERT INTO invoices VALUES('7','INV-GVnNa4','','2','2021-06-10','2021-06-22','0','0','0','0','0','0','','0','2021-06-16 21:32:20','2021-06-16 21:32:20');



CREATE TABLE `ip_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO ip_settings VALUES('1','FNF','103.120.140.1','2021-03-28 07:34:42','2021-03-28 09:57:27');
INSERT INTO ip_settings VALUES('14','Lion-Coders','127.54.03.1','2021-03-28 09:58:02','2021-03-28 09:58:02');
INSERT INTO ip_settings VALUES('15','Local','127.0.0.2','2021-03-28 10:26:13','2021-03-28 22:39:40');
INSERT INTO ip_settings VALUES('16','XYZ','103.161.152.4','2021-07-04 20:36:35','2021-07-04 20:37:12');



CREATE TABLE `job_candidates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_candidates_job_id_foreign` (`job_id`),
  CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO job_candidates VALUES('1','1','John Stones','john_stones@gmail.com','','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus, quam et ultricies vulputate, mauris arcu viverra ipsum, nec interdum dui ipsum id elit. Vivamus vehicula posuere commodo. Curabitur consectetur lacus nisi. Mauris vitae pulvinar lacus. Vestibulum malesuada felis magna, in convallis tortor lobortis ac.','jonh@fb.com','john_stones','JohnStones_1603445937.pdf','applied','','2020-10-22 23:38:57','2020-10-22 23:38:57');



CREATE TABLE `job_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_category` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO job_categories VALUES('2','PHP','xdBCMHJABdhRlMqXkA0G');
INSERT INTO job_categories VALUES('3','Seo','YoHOIZmN5jdNLG6gMp3x');
INSERT INTO job_categories VALUES('5','Analyst','gDCJcrUn9M7tt5xVK3wh');



CREATE TABLE `job_interviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `interview_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_interviews_job_id_foreign` (`job_id`),
  KEY `job_interviews_added_by_foreign` (`added_by`),
  CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `job_category_id` bigint(20) unsigned NOT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_vacancy` int(11) NOT NULL,
  `job_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_experience` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  KEY `job_posts_company_id_foreign` (`company_id`),
  CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO job_posts VALUES('1','1','2','Laravel Developer','full_time','2','qPnZoMWx83Qb0YnTVl5F','No Preference','2 Years','Lion-Coders is looking for Intermediate level Software Developers (3) for its Laravel based software developments. The primary role of these developers will be to develop/debug new desktop/xamarin/web applications for its overseas clients.','&lt;p&gt;&amp;bull; Should have experience in working on framework such as Laravel,&lt;br /&gt;Symphony etc&lt;br /&gt;&amp;bull; Excellent working knowledge of Web application development&lt;br /&gt;&amp;bull; Advance coding Skills in PHP, HTML, CSS, JavaScript, and scripting&lt;br /&gt;languages desirable&lt;br /&gt;&amp;bull; Excellent working knowledge of MySQL database&lt;br /&gt;&amp;bull; Good understanding of database performance tuning and sql queries&lt;br /&gt;&amp;bull; Experience working with a PHP framework such as CodeIgniter/Laravel&lt;br /&gt;&amp;bull; Experience in both Front End / Back End Developer.&lt;br /&gt;&amp;bull; Good Knowledge and understanding of CRM, CMS, SHOPPING-CART,&lt;br /&gt;PAYMENT GATEWAY &amp;amp; other API INTEGRATION&lt;/p&gt;','2021-03-06','1','1','2021-02-21 16:00:00','2021-03-23 18:46:04');
INSERT INTO job_posts VALUES('2','1','5','Business Analyst','part_time','3','OhBIUt70qzUGfzfWifEI','Male','5 Years','Business analysts work with organizations to help them improve their processes and systems. They conduct research and analysis in order to come up with solutions to business problems and help to introduce these systems to businesses and their clients.','&lt;p&gt;Important skills needed :&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Oral and written communication skills&lt;/li&gt;
&lt;li&gt;nterpersonal and consultative skills&lt;/li&gt;
&lt;li&gt;Facilitation skills&lt;/li&gt;
&lt;li&gt;Analytical thinking and problem solving&lt;/li&gt;
&lt;li&gt;Being detail-oriented and capable of delivering a high level of accuracy&lt;/li&gt;
&lt;li&gt;Organizational skills&lt;/li&gt;
&lt;/ul&gt;','2021-03-03','1','1','2021-02-22 16:00:00','2021-03-23 18:46:46');



CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allocated_day` int(11) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_company_id_foreign` (`company_id`),
  CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO leave_types VALUES('1','Medical','5','','2020-07-26 13:18:04','2020-07-26 13:18:04');
INSERT INTO leave_types VALUES('2','Casual','3','','2020-07-26 13:18:39','2020-07-26 13:18:39');
INSERT INTO leave_types VALUES('3','Manual','','','2020-07-26 13:18:48','2020-07-26 13:18:48');



CREATE TABLE `leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `leave_reason` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_half` tinyint(4) DEFAULT 0,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_company_id_foreign` (`company_id`),
  KEY `leaves_employee_id_foreign` (`employee_id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  KEY `leaves_department_id_foreign` (`department_id`),
  CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_head` bigint(20) unsigned DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(10) unsigned DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_location_head_foreign` (`location_head`),
  KEY `locations_country_foreign` (`country`),
  CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO locations VALUES('1','Boston','','22,westwood','','Boston','New Boston','2','7678','2020-07-26 11:12:19','2020-07-26 11:12:19');
INSERT INTO locations VALUES('2','sydney ranger','','Waca,22 bekar street','','sydney','West Australia','15','9890','2020-07-26 11:21:12','2020-07-27 02:14:58');
INSERT INTO locations VALUES('3','Rathura','','Rathura','Kaliganj','Gazipur','Dhaka','20','1721','2021-12-07 12:51:29','2021-12-07 12:51:29');



CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `meeting_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_company_id_foreign` (`company_id`),
  CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO meetings VALUES('1','1','Project Vision','m et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod','2021-04-01','03:20PM','pending','1','2020-07-28 07:31:11','2020-07-28 07:31:11');



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('2','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('3','2020_02_09_103616_create_role_users_table','1');
INSERT INTO migrations VALUES('4','2020_02_10_00000_create_users_table','1');
INSERT INTO migrations VALUES('5','2020_02_12_091317_create_locations_table','1');
INSERT INTO migrations VALUES('6','2020_02_12_091344_create_companies_table','1');
INSERT INTO migrations VALUES('7','2020_02_12_091353_create_departments_table','1');
INSERT INTO migrations VALUES('8','2020_02_12_091742_create_statuses_table','1');
INSERT INTO migrations VALUES('9','2020_02_12_091824_create_office_shifts_table','1');
INSERT INTO migrations VALUES('10','2020_02_12_091936_create_designations_table','1');
INSERT INTO migrations VALUES('11','2020_02_12_092121_create_leave_types_table','1');
INSERT INTO migrations VALUES('12','2020_02_13_100750_create_employees_table','1');
INSERT INTO migrations VALUES('13','2020_02_14_092309_create_leaves_table','1');
INSERT INTO migrations VALUES('14','2020_02_20_115449_create_general_settings_table','1');
INSERT INTO migrations VALUES('15','2020_02_23_054028_create_permission_tables','1');
INSERT INTO migrations VALUES('16','2020_02_23_184712_add_columns_to_permission_table','1');
INSERT INTO migrations VALUES('17','2020_03_19_132718_add_employee_id_on_locations_table','2');
INSERT INTO migrations VALUES('18','2020_03_20_162201_create_announcements_table','2');
INSERT INTO migrations VALUES('19','2020_03_20_201357_create_policies_table','2');
INSERT INTO migrations VALUES('20','2020_03_22_113701_create_holidays_table','2');
INSERT INTO migrations VALUES('21','2020_03_23_100213_create_award_types_table','3');
INSERT INTO migrations VALUES('22','2020_03_23_100248_create_awards_table','3');
INSERT INTO migrations VALUES('23','2020_03_23_123604_create_transfers_table','3');
INSERT INTO migrations VALUES('24','2020_03_23_144135_create_resignations_table','3');
INSERT INTO migrations VALUES('25','2020_03_23_150510_create_travel_types_table','3');
INSERT INTO migrations VALUES('26','2020_03_23_152610_create_travels_table','3');
INSERT INTO migrations VALUES('27','2020_03_23_154228_create_promotions_table','3');
INSERT INTO migrations VALUES('28','2020_03_23_194844_create_complaints_table','3');
INSERT INTO migrations VALUES('29','2020_03_24_134301_create_warnings_type_table','3');
INSERT INTO migrations VALUES('30','2020_03_24_134304_create_warnings_table','3');
INSERT INTO migrations VALUES('31','2020_03_24_143012_create_termination_types_table','3');
INSERT INTO migrations VALUES('32','2020_03_24_143038_create_terminations_table','3');
INSERT INTO migrations VALUES('33','2020_04_06_185530_create_training_types_table','3');
INSERT INTO migrations VALUES('34','2020_04_06_190352_create_trainers_table','3');
INSERT INTO migrations VALUES('35','2020_04_07_083717_create_training_lists_table','3');
INSERT INTO migrations VALUES('36','2020_04_07_103503_create_employee_training_list_table','3');
INSERT INTO migrations VALUES('37','2020_04_08_095050_create_events_table','3');
INSERT INTO migrations VALUES('38','2020_04_08_163144_create_meetings_table','3');
INSERT INTO migrations VALUES('39','2020_04_08_163906_create_employee_meeting_table','3');
INSERT INTO migrations VALUES('40','2020_05_05_212429_create_document_types_table','3');
INSERT INTO migrations VALUES('41','2020_04_09_063646_create_finance_bank_cashes_table','4');
INSERT INTO migrations VALUES('42','2020_04_09_154642_create_finance_payees_table','4');
INSERT INTO migrations VALUES('43','2020_04_09_201357_create_finance_payers_table','4');
INSERT INTO migrations VALUES('44','2020_04_10_064405_create_payment_methods_table','4');
INSERT INTO migrations VALUES('45','2020_04_10_094429_create_expense_types_table','4');
INSERT INTO migrations VALUES('46','2020_04_10_121829_create_finance_deposits_table','4');
INSERT INTO migrations VALUES('47','2020_04_11_084040_create_finance_expenses_table','4');
INSERT INTO migrations VALUES('48','2020_04_11_164442_create_finance_transactions_table','4');
INSERT INTO migrations VALUES('49','2020_04_13_071336_create_finance_transfers_table','4');
INSERT INTO migrations VALUES('50','2020_04_13_135659_create_asset_categories_table','5');
INSERT INTO migrations VALUES('51','2020_04_13_160310_create_assets_table','5');
INSERT INTO migrations VALUES('52','2020_04_15_103730_create_file_manager_settings_table','5');
INSERT INTO migrations VALUES('53','2020_04_15_193003_create_file_managers_table','5');
INSERT INTO migrations VALUES('54','2020_04_18_094856_create_support_tickets_table','5');
INSERT INTO migrations VALUES('55','2020_04_21_052227_create_ticket_comments_table','5');
INSERT INTO migrations VALUES('56','2020_04_21_172758_create_employee_support_ticket_table','5');
INSERT INTO migrations VALUES('57','2020_04_24_070148_create_countries_table','5');
INSERT INTO migrations VALUES('58','2020_04_24_071350_create_clients_table','5');
INSERT INTO migrations VALUES('59','2020_04_25_083125_create_projects_table','5');
INSERT INTO migrations VALUES('60','2020_04_25_092544_create_employee_project_table','5');
INSERT INTO migrations VALUES('61','2020_04_27_132031_create_project_discussions_table','5');
INSERT INTO migrations VALUES('62','2020_04_27_202219_create_project_bugs_table','5');
INSERT INTO migrations VALUES('63','2020_04_28_095459_create_project_files_table','5');
INSERT INTO migrations VALUES('64','2020_04_28_172850_create_tasks_table','5');
INSERT INTO migrations VALUES('65','2020_04_28_183034_create_employee_task_table','5');
INSERT INTO migrations VALUES('66','2020_04_29_164820_create_task_discussions_table','5');
INSERT INTO migrations VALUES('67','2020_04_29_185015_create_task_files_table','5');
INSERT INTO migrations VALUES('68','2020_05_01_093124_create_tax_types_table','5');
INSERT INTO migrations VALUES('69','2020_05_02_100902_create_invoices_table','5');
INSERT INTO migrations VALUES('70','2020_05_02_110310_create_invoice_items_table','5');
INSERT INTO migrations VALUES('71','2020_05_06_085438_create_employee_immigrations_table','6');
INSERT INTO migrations VALUES('72','2020_05_07_191655_create_employee_contacts_table','6');
INSERT INTO migrations VALUES('73','2020_05_08_181821_create_employee_documents_table','6');
INSERT INTO migrations VALUES('74','2020_05_12_200437_create_qualification_education_levels_table','6');
INSERT INTO migrations VALUES('75','2020_05_16_204859_create_qualification_languages_table','6');
INSERT INTO migrations VALUES('76','2020_05_17_181817_create_qualification_skills_table','6');
INSERT INTO migrations VALUES('77','2020_05_17_191414_create_employee_qualificaitons_table','6');
INSERT INTO migrations VALUES('78','2020_05_18_191844_create_employee_work_experience_table','6');
INSERT INTO migrations VALUES('79','2020_05_19_170527_create_employee_bank_accounts_table','6');
INSERT INTO migrations VALUES('80','2020_05_22_201218_create_salary_allowances_table','6');
INSERT INTO migrations VALUES('81','2020_05_23_184036_create_salary_commissions_table','6');
INSERT INTO migrations VALUES('82','2020_05_24_085740_create_salary_deductions_table','6');
INSERT INTO migrations VALUES('83','2020_05_24_103950_create_salary_other_payments_table','6');
INSERT INTO migrations VALUES('84','2020_05_24_163618_create_salary_overtimes_table','6');
INSERT INTO migrations VALUES('85','2020_05_26_134431_create_salary_loans_table','6');
INSERT INTO migrations VALUES('86','2020_06_11_104501_create_payslips_table','7');
INSERT INTO migrations VALUES('87','2020_06_17_055449_create_calendarables_table','7');
INSERT INTO migrations VALUES('88','2020_06_19_083329_create_job_categories_table','7');
INSERT INTO migrations VALUES('89','2020_06_19_152528_create_job_employers_table','7');
INSERT INTO migrations VALUES('90','2020_06_22_052056_create_attendances_table','7');
INSERT INTO migrations VALUES('91','2020_07_05_010713_create_job_posts_table','7');
INSERT INTO migrations VALUES('92','2020_07_06_162706_create_job_candidates_table','7');
INSERT INTO migrations VALUES('93','2020_07_07_144320_create_job_interviews_table','7');
INSERT INTO migrations VALUES('94','2020_07_07_160007_create_candidate_interview_table','7');
INSERT INTO migrations VALUES('95','2020_07_07_160428_create_employee_interview_table','7');
INSERT INTO migrations VALUES('96','2020_07_25_003500_create_official_documents_table','7');
INSERT INTO migrations VALUES('97','2020_04_18_203257_create_notifications_table','8');
INSERT INTO migrations VALUES('98','2020_10_16_202848_create_c_m_s_table','9');
INSERT INTO migrations VALUES('99','2018_08_29_200844_create_languages_table','10');
INSERT INTO migrations VALUES('100','2018_08_29_205156_create_translations_table','10');
INSERT INTO migrations VALUES('101','2021_01_08_072901_create_goal_types_table','10');
INSERT INTO migrations VALUES('102','2021_01_08_165133_create_indicators_table','10');
INSERT INTO migrations VALUES('103','2021_01_09_081319_create_appraisals_table','10');
INSERT INTO migrations VALUES('104','2021_01_10_080158_create_goal_trackings_table','10');
INSERT INTO migrations VALUES('105','2021_03_28_184255_create_ip_settings_table','11');
INSERT INTO migrations VALUES('106','2021_04_05_103029_create_salary_basics_table','12');



CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO model_has_roles VALUES('1','App\\User','1');
INSERT INTO model_has_roles VALUES('1','App\\User','8');
INSERT INTO model_has_roles VALUES('1','App\\User','28');
INSERT INTO model_has_roles VALUES('1','App\\User','29');
INSERT INTO model_has_roles VALUES('1','App\\User','30');
INSERT INTO model_has_roles VALUES('1','App\\User','31');
INSERT INTO model_has_roles VALUES('1','App\\User','36');
INSERT INTO model_has_roles VALUES('1','App\\User','40');
INSERT INTO model_has_roles VALUES('1','App\\User','44');
INSERT INTO model_has_roles VALUES('1','App\\User','46');
INSERT INTO model_has_roles VALUES('1','App\\User','47');
INSERT INTO model_has_roles VALUES('2','App\\User','10');
INSERT INTO model_has_roles VALUES('2','App\\User','12');
INSERT INTO model_has_roles VALUES('2','App\\User','13');
INSERT INTO model_has_roles VALUES('2','App\\User','14');
INSERT INTO model_has_roles VALUES('2','App\\User','15');
INSERT INTO model_has_roles VALUES('2','App\\User','24');
INSERT INTO model_has_roles VALUES('2','App\\User','25');
INSERT INTO model_has_roles VALUES('2','App\\User','27');
INSERT INTO model_has_roles VALUES('2','App\\User','32');
INSERT INTO model_has_roles VALUES('2','App\\User','33');
INSERT INTO model_has_roles VALUES('2','App\\User','34');
INSERT INTO model_has_roles VALUES('2','App\\User','37');
INSERT INTO model_has_roles VALUES('2','App\\User','38');
INSERT INTO model_has_roles VALUES('2','App\\User','41');
INSERT INTO model_has_roles VALUES('2','App\\User','42');
INSERT INTO model_has_roles VALUES('2','App\\User','43');
INSERT INTO model_has_roles VALUES('2','App\\User','48');
INSERT INTO model_has_roles VALUES('2','App\\User','49');
INSERT INTO model_has_roles VALUES('3','App\\User','39');
INSERT INTO model_has_roles VALUES('4','App\\User','11');
INSERT INTO model_has_roles VALUES('4','App\\User','23');
INSERT INTO model_has_roles VALUES('4','App\\User','26');
INSERT INTO model_has_roles VALUES('4','App\\User','45');
INSERT INTO model_has_roles VALUES('5','App\\User','9');
INSERT INTO model_has_roles VALUES('5','App\\User','21');
INSERT INTO model_has_roles VALUES('5','App\\User','22');



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES('0ac4b300-c8ef-4fd5-9f38-a0eb71e05d6f','App\\Notifications\\ProjectUpdatedNotification','App\\User','8','{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','','2020-10-18 04:21:13','2020-10-18 04:21:13');
INSERT INTO notifications VALUES('0c7b565d-2342-4937-8628-1db54d9a0642','App\\Notifications\\ProjectUpdatedNotification','App\\User','15','{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}','','2020-10-25 10:12:46','2020-10-25 10:12:46');
INSERT INTO notifications VALUES('1140572c-13d0-456b-b58e-01df812d21b6','App\\Notifications\\InvoicePaidNotification','App\\User','16','{\"data\":\"Payment of Project : Test2 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}','','2020-10-17 20:13:41','2020-10-17 20:13:41');
INSERT INTO notifications VALUES('144c0b47-e39d-4bb2-9742-0a1519d2a8b5','App\\Notifications\\InvoicePaidNotification','App\\User','16','{\"data\":\"Payment of Project : test3 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-IjAIYl\"}','','2020-10-12 00:50:56','2020-10-12 00:50:56');
INSERT INTO notifications VALUES('232dbdbd-f4fc-4c6f-93ba-58d5f854e6b2','App\\Notifications\\TicketAssignedNotification','App\\User','12','{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 10:05:30','2020-07-28 10:05:30');
INSERT INTO notifications VALUES('26fd9a32-861a-414f-bed9-656b04743199','App\\Notifications\\EmployeeTravelStatus','App\\User','9','{\"data\":\"Your travel request status is --- approved\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_travel\"}','2021-07-05 08:53:34','2020-08-18 00:13:03','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('2d9f84f7-b18c-4d81-87e3-40ba55ed3ee1','App\\Notifications\\InvoiceReceivedNotification','App\\User','16','{\"data\":\"Invoice of Project : test3 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-IjAIYl\"}','','2020-10-12 00:50:00','2020-10-12 00:50:00');
INSERT INTO notifications VALUES('4c9b05be-02ef-45eb-b8a6-d6cb4e1ac890','App\\Notifications\\ProjectUpdatedNotification','App\\User','9','{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','2021-07-05 08:53:34','2020-10-18 04:21:13','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('5bcad5db-10b0-4864-93b3-239c540a0238','App\\Notifications\\ProjectUpdatedNotification','App\\User','12','{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','','2020-10-18 04:21:13','2020-10-18 04:21:13');
INSERT INTO notifications VALUES('641c1c91-d33c-451b-836f-c421e15912f7','App\\Notifications\\ClientTaskCreated','App\\User','8','{\"data\":\"A task has been created of Test2 by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}','','2020-10-11 18:53:23','2020-10-11 18:53:23');
INSERT INTO notifications VALUES('69319850-8ca7-4734-8cd6-871d976077f1','App\\Notifications\\ProjectUpdatedNotification','App\\User','8','{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}','','2020-10-25 10:12:46','2020-10-25 10:12:46');
INSERT INTO notifications VALUES('75865d0f-944d-43e2-aa43-ab1ad12a6e92','App\\Notifications\\TicketCreatedNotification','App\\User','12','{\"data\":\"A ticket has been issued for Bob Hobart\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 09:59:09','2020-07-28 09:59:09');
INSERT INTO notifications VALUES('8e9054a1-fe5d-4a8b-8b33-40655f1306bf','App\\Notifications\\EmployeeAwardNotify','App\\User','9','{\"data\":\"Congratulation! An Award has been given to you\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_Core_hr\"}','2021-07-05 08:53:34','2020-08-17 23:55:40','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('9a2c3218-774f-4990-b41b-f5ba0d5dad5a','App\\Notifications\\TicketUpdatedNotification','App\\User','8','{\"data\":\"Issued ticket for Bob Hobart has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 10:06:02','2020-07-28 10:06:02');
INSERT INTO notifications VALUES('9b2fa86f-db94-4694-84be-2c033bbb450d','App\\Notifications\\TicketAssignedNotification','App\\User','8','{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 10:05:30','2020-07-28 10:05:30');
INSERT INTO notifications VALUES('9e5de11c-c9fd-4b3d-acd5-dc2208b46682','App\\Notifications\\EmployeeTravelStatus','App\\User','9','{\"data\":\"Your travel request status is --- first level approval\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_travel\"}','2021-07-05 08:53:34','2020-08-18 00:11:23','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('9fe492ca-7b37-4419-935d-31cd42d3af77','App\\Notifications\\ClientTaskCreated','App\\User','8','{\"data\":\"new2222 has been updated by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}','','2020-10-11 19:00:20','2020-10-11 19:00:20');
INSERT INTO notifications VALUES('a92e54de-6aa5-4f9e-84ff-db58c857ce6e','App\\Notifications\\ProjectUpdatedNotification','App\\User','11','{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','','2020-10-18 04:21:13','2020-10-18 04:21:13');
INSERT INTO notifications VALUES('b0e5a738-ff48-4c14-a02a-2ad571ce0fa6','App\\Notifications\\InvoiceReceivedNotification','App\\User','16','{\"data\":\"Invoice of Project : Test2 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}','','2020-10-17 20:18:53','2020-10-17 20:18:53');
INSERT INTO notifications VALUES('b8f87453-1177-4edf-8fc4-4969e2a8d122','App\\Notifications\\ProjectUpdatedNotification','App\\User','14','{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}','','2020-10-25 10:12:46','2020-10-25 10:12:46');
INSERT INTO notifications VALUES('baed268a-08f6-4c19-a19a-2e3805ca16d6','App\\Notifications\\InvoiceReceivedNotification','App\\User','16','{\"data\":\"Invoice of Project : Test2 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}','','2020-10-17 20:33:04','2020-10-17 20:33:04');
INSERT INTO notifications VALUES('c14d50a8-90b3-42fc-ace1-41c73b16489c','App\\Notifications\\TicketAssignedNotification','App\\User','10','{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 10:05:30','2020-07-28 10:05:30');
INSERT INTO notifications VALUES('cf7d4b40-9d91-4431-a780-0abe6abd13ae','App\\Notifications\\InvoicePaidNotification','App\\User','16','{\"data\":\"Test1 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/1\"}','2020-10-11 22:08:12','2020-10-11 22:05:30','2020-10-11 22:08:12');
INSERT INTO notifications VALUES('d0b5259d-71ec-4937-8e6d-50d217491718','App\\Notifications\\TicketAssignedNotification','App\\User','9','{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','2021-07-05 08:53:34','2020-07-28 10:05:30','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('d45ac590-d192-442b-afa3-66117f4bb2ec','App\\Notifications\\InvoiceReceivedNotification','App\\User','16','{\"data\":\"Invoice of Project : test3 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/4\"}','','2020-10-12 00:28:36','2020-10-12 00:28:36');
INSERT INTO notifications VALUES('e3b8524c-573e-4b8e-9465-7789189c5224','App\\Notifications\\EmployeePromotion','App\\User','9','{\"data\":\" Congratulation!You have been promoted to  Senior Executive 1\",\"link\":\"\"}','2021-07-05 08:53:34','2020-08-17 23:45:52','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('e7faff2c-21f2-49a4-917a-b7c4f0c41b85','App\\Notifications\\EmployeeTransferNotify','App\\User','9','{\"data\":\"You have been transferred To\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_transfer\"}','2021-07-05 08:53:34','2020-08-18 00:44:56','2021-07-05 08:53:34');
INSERT INTO notifications VALUES('e82fc7b5-2ab7-4799-af55-204684deb53f','App\\Notifications\\ProjectUpdatedNotification','App\\User','8','{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}','','2020-10-25 10:16:16','2020-10-25 10:16:16');
INSERT INTO notifications VALUES('ec32bc86-7300-4509-b28a-1b91e2e99711','App\\Notifications\\ProjectUpdatedNotification','App\\User','8','{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}','','2020-10-25 10:14:23','2020-10-25 10:14:23');
INSERT INTO notifications VALUES('fa1c5825-43e9-4ee9-a48d-792f43b0d79d','App\\Notifications\\TicketUpdatedNotification','App\\User','12','{\"data\":\"Issued ticket for Bob Hobart has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 10:06:02','2020-07-28 10:06:02');
INSERT INTO notifications VALUES('fea68d3b-bf7b-452f-b3de-d41d30a787ec','App\\Notifications\\TicketCreatedNotification','App\\User','8','{\"data\":\"A ticket has been issued for Bob Hobart\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','','2020-07-28 09:59:09','2020-07-28 09:59:09');



CREATE TABLE `office_shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_shift` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `sunday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_shifts_company_id_foreign` (`company_id`),
  CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO office_shifts VALUES('1','Morning Shift','','1','','','','','','','10:00AM','02:00PM','10:00AM','05:00PM','10:00AM','05:00PM','10:00AM','05:00PM','2020-07-26 21:06:46','2020-07-26 21:06:46');
INSERT INTO office_shifts VALUES('2','MidDay','','1','','','04:00PM','09:00PM','12:00PM','09:00PM','12:00PM','09:00PM','','','12:00PM','09:00PM','12:00PM','09:00PM','2020-07-26 21:22:37','2021-06-29 17:20:24');
INSERT INTO office_shifts VALUES('3','Day Shift','','3','08:00AM','06:00PM','08:00AM','06:00PM','08:00AM','06:00PM','08:00AM','06:00PM','08:00AM','06:00PM','08:00AM','06:00PM','08:00AM','06:00PM','2021-12-07 11:27:28','2021-12-07 11:27:28');



CREATE TABLE `official_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `official_documents_company_id_foreign` (`company_id`),
  KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  KEY `official_documents_added_by_foreign` (`added_by`),
  CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO official_documents VALUES('1','1','3','1','Bay Project Info','8739320','','Bay Project Info.1603366355.pdf','2021-05-30','7','2020-10-22 01:32:35','2020-10-22 01:32:35');



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES('new@gmail.com','$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy','2020-10-05 21:22:35');



CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `method_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_percentage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_methods VALUES('1','','Paypal','10%','123','2020-07-26 20:52:20','2020-07-26 20:53:03');
INSERT INTO payment_methods VALUES('2','','Bank','5%','786','2020-07-26 20:53:17','2020-07-26 20:53:17');
INSERT INTO payment_methods VALUES('3','','Cash','%','999','2020-07-26 20:53:29','2020-07-26 20:53:29');



CREATE TABLE `payslips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payslip_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payslip_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deductions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtimes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `month_year` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payslips_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payslips VALUES('169','71A9EyOi2YpgYo55pcze','-784028324','49','3','Monthly','30000','36000','[{\"id\":18,\"employee_id\":\"49\",\"month_year\":\"December-2021\",\"first_date\":\"2021-12-01\",\"allowance_title\":\"Accommodation\",\"allowance_amount\":\"6000\",\"is_taxable\":\"0\",\"created_at\":\"2021-12-07 13:11:04\",\"updated_at\":\"2021-12-07 13:11:04\"}]','[]','[]','[]','[]','[]','','0','0','1','December-2021','2021-12-07 13:15:21','2021-12-07 13:15:21');



CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('1','user','web','','');
INSERT INTO permissions VALUES('2','view-user','web','','');
INSERT INTO permissions VALUES('3','edit-user','web','','');
INSERT INTO permissions VALUES('4','delete-user','web','','');
INSERT INTO permissions VALUES('5','last-login-user','web','','');
INSERT INTO permissions VALUES('6','role-access-user','web','','');
INSERT INTO permissions VALUES('7','details-employee','web','','');
INSERT INTO permissions VALUES('8','view-details-employee','web','','');
INSERT INTO permissions VALUES('9','store-details-employee','web','','');
INSERT INTO permissions VALUES('10','modify-details-employee','web','','');
INSERT INTO permissions VALUES('11','customize-setting','web','','');
INSERT INTO permissions VALUES('12','role-access','web','','');
INSERT INTO permissions VALUES('13','general-setting','web','','');
INSERT INTO permissions VALUES('14','view-general-setting','web','','');
INSERT INTO permissions VALUES('15','store-general-setting','web','','');
INSERT INTO permissions VALUES('16','mail-setting','web','','');
INSERT INTO permissions VALUES('17','view-mail-setting','web','','');
INSERT INTO permissions VALUES('18','store-mail-setting','web','','');
INSERT INTO permissions VALUES('19','language-setting','web','','');
INSERT INTO permissions VALUES('20','core_hr','web','','');
INSERT INTO permissions VALUES('21','view-calendar','web','','');
INSERT INTO permissions VALUES('22','promotion','web','','');
INSERT INTO permissions VALUES('23','view-promotion','web','','');
INSERT INTO permissions VALUES('24','store-promotion','web','','');
INSERT INTO permissions VALUES('25','edit-promotion','web','','');
INSERT INTO permissions VALUES('26','delete-promotion','web','','');
INSERT INTO permissions VALUES('27','award','web','','');
INSERT INTO permissions VALUES('28','view-award','web','','');
INSERT INTO permissions VALUES('29','store-award','web','','');
INSERT INTO permissions VALUES('30','edit-award','web','','');
INSERT INTO permissions VALUES('31','delete-award','web','','');
INSERT INTO permissions VALUES('32','transfer','web','','');
INSERT INTO permissions VALUES('33','view-transfer','web','','');
INSERT INTO permissions VALUES('34','store-transfer','web','','');
INSERT INTO permissions VALUES('35','edit-transfer','web','','');
INSERT INTO permissions VALUES('36','delete-transfer','web','','');
INSERT INTO permissions VALUES('37','travel','web','','');
INSERT INTO permissions VALUES('38','view-travel','web','','');
INSERT INTO permissions VALUES('39','store-travel','web','','');
INSERT INTO permissions VALUES('40','edit-travel','web','','');
INSERT INTO permissions VALUES('41','delete-travel','web','','');
INSERT INTO permissions VALUES('42','resignation','web','','');
INSERT INTO permissions VALUES('43','view-resignation','web','','');
INSERT INTO permissions VALUES('44','store-resignation','web','','');
INSERT INTO permissions VALUES('45','edit-resignation','web','','');
INSERT INTO permissions VALUES('46','delete-resignation','web','','');
INSERT INTO permissions VALUES('47','complaint','web','','');
INSERT INTO permissions VALUES('48','view-complaint','web','','');
INSERT INTO permissions VALUES('49','store-complaint','web','','');
INSERT INTO permissions VALUES('50','edit-complaint','web','','');
INSERT INTO permissions VALUES('51','delete-complaint','web','','');
INSERT INTO permissions VALUES('52','warning','web','','');
INSERT INTO permissions VALUES('53','view-warning','web','','');
INSERT INTO permissions VALUES('54','store-warning','web','','');
INSERT INTO permissions VALUES('55','edit-warning','web','','');
INSERT INTO permissions VALUES('56','delete-warning','web','','');
INSERT INTO permissions VALUES('57','termination','web','','');
INSERT INTO permissions VALUES('58','view-termination','web','','');
INSERT INTO permissions VALUES('59','store-termination','web','','');
INSERT INTO permissions VALUES('60','edit-termination','web','','');
INSERT INTO permissions VALUES('61','delete-termination','web','','');
INSERT INTO permissions VALUES('62','timesheet','web','','');
INSERT INTO permissions VALUES('63','attendance','web','','');
INSERT INTO permissions VALUES('64','view-attendance','web','','');
INSERT INTO permissions VALUES('65','edit-attendance','web','','');
INSERT INTO permissions VALUES('66','office_shift','web','','');
INSERT INTO permissions VALUES('67','view-office_shift','web','','');
INSERT INTO permissions VALUES('68','store-office_shift','web','','');
INSERT INTO permissions VALUES('69','edit-office_shift','web','','');
INSERT INTO permissions VALUES('70','delete-office_shift','web','','');
INSERT INTO permissions VALUES('71','holiday','web','','');
INSERT INTO permissions VALUES('72','view-holiday','web','','');
INSERT INTO permissions VALUES('73','store-holiday','web','','');
INSERT INTO permissions VALUES('74','edit-holiday','web','','');
INSERT INTO permissions VALUES('75','delete-holiday','web','','');
INSERT INTO permissions VALUES('76','leave','web','','');
INSERT INTO permissions VALUES('77','view-holiday','web','','');
INSERT INTO permissions VALUES('78','store-holiday','web','','');
INSERT INTO permissions VALUES('79','edit-holiday','web','','');
INSERT INTO permissions VALUES('80','delete-holiday','web','','');
INSERT INTO permissions VALUES('81','payment-module','web','','');
INSERT INTO permissions VALUES('82','view-payslip','web','','');
INSERT INTO permissions VALUES('83','make-payment','web','','');
INSERT INTO permissions VALUES('84','make-bulk_payment','web','','');
INSERT INTO permissions VALUES('85','view-paylist','web','','');
INSERT INTO permissions VALUES('86','set-salary','web','','');
INSERT INTO permissions VALUES('87','hr_report','web','','');
INSERT INTO permissions VALUES('88','report-payslip','web','','');
INSERT INTO permissions VALUES('89','report-attendance','web','','');
INSERT INTO permissions VALUES('90','report-training','web','','');
INSERT INTO permissions VALUES('91','report-project','web','','');
INSERT INTO permissions VALUES('92','report-task','web','','');
INSERT INTO permissions VALUES('93','report-employee','web','','');
INSERT INTO permissions VALUES('94','report-account','web','','');
INSERT INTO permissions VALUES('95','report-deposit','web','','');
INSERT INTO permissions VALUES('96','report-expense','web','','');
INSERT INTO permissions VALUES('97','report-transaction','web','','');
INSERT INTO permissions VALUES('98','recruitment','web','','');
INSERT INTO permissions VALUES('99','job_employer','web','','');
INSERT INTO permissions VALUES('100','view-job_employer','web','','');
INSERT INTO permissions VALUES('101','store-job_employer','web','','');
INSERT INTO permissions VALUES('102','edit-job_employer','web','','');
INSERT INTO permissions VALUES('103','delete-job_employer','web','','');
INSERT INTO permissions VALUES('104','job_post','web','','');
INSERT INTO permissions VALUES('105','view-job_post','web','','');
INSERT INTO permissions VALUES('106','store-job_post','web','','');
INSERT INTO permissions VALUES('107','edit-job_post','web','','');
INSERT INTO permissions VALUES('108','delete-job_post','web','','');
INSERT INTO permissions VALUES('109','job_candidate','web','','');
INSERT INTO permissions VALUES('110','view-job_candidate','web','','');
INSERT INTO permissions VALUES('111','store-job_candidate','web','','');
INSERT INTO permissions VALUES('112','delete-job_candidate','web','','');
INSERT INTO permissions VALUES('113','job_interview','web','','');
INSERT INTO permissions VALUES('114','view-job_interview','web','','');
INSERT INTO permissions VALUES('115','store-job_interview','web','','');
INSERT INTO permissions VALUES('116','delete-job_interview','web','','');
INSERT INTO permissions VALUES('117','project-management','web','','');
INSERT INTO permissions VALUES('118','project','web','','');
INSERT INTO permissions VALUES('119','view-project','web','','');
INSERT INTO permissions VALUES('120','store-project','web','','');
INSERT INTO permissions VALUES('121','edit-project','web','','');
INSERT INTO permissions VALUES('122','delete-project','web','','');
INSERT INTO permissions VALUES('123','task','web','','');
INSERT INTO permissions VALUES('124','view-task','web','','');
INSERT INTO permissions VALUES('125','store-task','web','','');
INSERT INTO permissions VALUES('126','edit-task','web','','');
INSERT INTO permissions VALUES('127','delete-task','web','','');
INSERT INTO permissions VALUES('128','client','web','','');
INSERT INTO permissions VALUES('129','view-client','web','','');
INSERT INTO permissions VALUES('130','store-client','web','','');
INSERT INTO permissions VALUES('131','edit-client','web','','');
INSERT INTO permissions VALUES('132','delete-client','web','','');
INSERT INTO permissions VALUES('133','invoice','web','','');
INSERT INTO permissions VALUES('134','view-invoice','web','','');
INSERT INTO permissions VALUES('135','store-invoice','web','','');
INSERT INTO permissions VALUES('136','edit-invoice','web','','');
INSERT INTO permissions VALUES('137','delete-invoice','web','','');
INSERT INTO permissions VALUES('138','ticket','web','','');
INSERT INTO permissions VALUES('139','view-ticket','web','','');
INSERT INTO permissions VALUES('140','store-ticket','web','','');
INSERT INTO permissions VALUES('141','edit-ticket','web','','');
INSERT INTO permissions VALUES('142','delete-ticket','web','','');
INSERT INTO permissions VALUES('143','import-module','web','','');
INSERT INTO permissions VALUES('144','import-attendance','web','','');
INSERT INTO permissions VALUES('145','import-employee','web','','');
INSERT INTO permissions VALUES('146','file_module','web','','');
INSERT INTO permissions VALUES('147','file_manager','web','','');
INSERT INTO permissions VALUES('148','view-file_manager','web','','');
INSERT INTO permissions VALUES('149','store-file_manager','web','','');
INSERT INTO permissions VALUES('150','edit-file_manager','web','','');
INSERT INTO permissions VALUES('151','delete-file_manager','web','','');
INSERT INTO permissions VALUES('152','view-file_config','web','','');
INSERT INTO permissions VALUES('153','official_document','web','','');
INSERT INTO permissions VALUES('154','view-official_document','web','','');
INSERT INTO permissions VALUES('155','store-official_document','web','','');
INSERT INTO permissions VALUES('156','edit-official_document','web','','');
INSERT INTO permissions VALUES('157','delete-official_document','web','','');
INSERT INTO permissions VALUES('158','event-meeting','web','','');
INSERT INTO permissions VALUES('159','meeting','web','','');
INSERT INTO permissions VALUES('160','view-meeting','web','','');
INSERT INTO permissions VALUES('161','store-meeting','web','','');
INSERT INTO permissions VALUES('162','edit-meeting','web','','');
INSERT INTO permissions VALUES('163','delete-meeting','web','','');
INSERT INTO permissions VALUES('164','event','web','','');
INSERT INTO permissions VALUES('165','view-event','web','','');
INSERT INTO permissions VALUES('166','store-event','web','','');
INSERT INTO permissions VALUES('167','edit-event','web','','');
INSERT INTO permissions VALUES('168','delete-event','web','','');
INSERT INTO permissions VALUES('169','role','web','','');
INSERT INTO permissions VALUES('170','view-role','web','','');
INSERT INTO permissions VALUES('171','store-role','web','','');
INSERT INTO permissions VALUES('172','edit-role','web','','');
INSERT INTO permissions VALUES('173','delete-role','web','','');
INSERT INTO permissions VALUES('174','assign-module','web','','');
INSERT INTO permissions VALUES('175','assign-role','web','','');
INSERT INTO permissions VALUES('176','assign-ticket','web','','');
INSERT INTO permissions VALUES('177','assign-project','web','','');
INSERT INTO permissions VALUES('178','assign-task','web','','');
INSERT INTO permissions VALUES('179','finance','web','','');
INSERT INTO permissions VALUES('180','account','web','','');
INSERT INTO permissions VALUES('181','view-account','web','','');
INSERT INTO permissions VALUES('182','store-account','web','','');
INSERT INTO permissions VALUES('183','edit-account','web','','');
INSERT INTO permissions VALUES('184','delete-account','web','','');
INSERT INTO permissions VALUES('185','view-transaction','web','','');
INSERT INTO permissions VALUES('186','view-balance_transfer','web','','');
INSERT INTO permissions VALUES('187','store-balance_transfer','web','','');
INSERT INTO permissions VALUES('188','expense','web','','');
INSERT INTO permissions VALUES('189','view-expense','web','','');
INSERT INTO permissions VALUES('190','store-expense','web','','');
INSERT INTO permissions VALUES('191','edit-expense','web','','');
INSERT INTO permissions VALUES('192','delete-expense','web','','');
INSERT INTO permissions VALUES('193','deposit','web','','');
INSERT INTO permissions VALUES('194','view-deposit','web','','');
INSERT INTO permissions VALUES('195','store-deposit','web','','');
INSERT INTO permissions VALUES('196','edit-deposit','web','','');
INSERT INTO permissions VALUES('197','delete-deposit','web','','');
INSERT INTO permissions VALUES('198','payer','web','','');
INSERT INTO permissions VALUES('199','view-payer','web','','');
INSERT INTO permissions VALUES('200','store-payer','web','','');
INSERT INTO permissions VALUES('201','edit-payer','web','','');
INSERT INTO permissions VALUES('202','delete-payer','web','','');
INSERT INTO permissions VALUES('203','payee','web','','');
INSERT INTO permissions VALUES('204','view-payee','web','','');
INSERT INTO permissions VALUES('205','store-payee','web','','');
INSERT INTO permissions VALUES('206','edit-payee','web','','');
INSERT INTO permissions VALUES('207','delete-payee','web','','');
INSERT INTO permissions VALUES('208','training_module','web','','');
INSERT INTO permissions VALUES('209','trainer','web','','');
INSERT INTO permissions VALUES('210','view-trainer','web','','');
INSERT INTO permissions VALUES('211','store-trainer','web','','');
INSERT INTO permissions VALUES('212','edit-trainer','web','','');
INSERT INTO permissions VALUES('213','delete-trainer','web','','');
INSERT INTO permissions VALUES('214','training','web','','');
INSERT INTO permissions VALUES('215','view-training','web','','');
INSERT INTO permissions VALUES('216','store-training','web','','');
INSERT INTO permissions VALUES('217','edit-training','web','','');
INSERT INTO permissions VALUES('218','delete-training','web','','');
INSERT INTO permissions VALUES('219','access-module','web','','');
INSERT INTO permissions VALUES('220','access-variable_type','web','','');
INSERT INTO permissions VALUES('221','access-variable_method','web','','');
INSERT INTO permissions VALUES('222','access-language','web','','');
INSERT INTO permissions VALUES('223','announcement','web','','');
INSERT INTO permissions VALUES('224','store-announcement','web','','');
INSERT INTO permissions VALUES('225','edit-announcement','web','','');
INSERT INTO permissions VALUES('226','delete-announcement','web','','');
INSERT INTO permissions VALUES('227','company','web','','');
INSERT INTO permissions VALUES('228','view-company','web','','');
INSERT INTO permissions VALUES('229','store-company','web','','');
INSERT INTO permissions VALUES('230','edit-company','web','','');
INSERT INTO permissions VALUES('231','delete-company','web','','');
INSERT INTO permissions VALUES('232','department','web','','');
INSERT INTO permissions VALUES('233','view-department','web','','');
INSERT INTO permissions VALUES('234','store-department','web','','');
INSERT INTO permissions VALUES('235','edit-department','web','','');
INSERT INTO permissions VALUES('236','delete-department','web','','');
INSERT INTO permissions VALUES('237','designation','web','','');
INSERT INTO permissions VALUES('238','view-designation','web','','');
INSERT INTO permissions VALUES('239','store-designation','web','','');
INSERT INTO permissions VALUES('240','edit-designation','web','','');
INSERT INTO permissions VALUES('241','delete-designation','web','','');
INSERT INTO permissions VALUES('242','location','web','','');
INSERT INTO permissions VALUES('243','view-location','web','','');
INSERT INTO permissions VALUES('244','store-location','web','','');
INSERT INTO permissions VALUES('245','edit-location','web','','');
INSERT INTO permissions VALUES('246','delete-location','web','','');
INSERT INTO permissions VALUES('247','policy','web','','');
INSERT INTO permissions VALUES('248','store-policy','web','','');
INSERT INTO permissions VALUES('249','edit-policy','web','','');
INSERT INTO permissions VALUES('250','delete-policy','web','','');
INSERT INTO permissions VALUES('251','view-cms','web','','');
INSERT INTO permissions VALUES('252','store-cms','web','','');
INSERT INTO permissions VALUES('253','store-user','web','','');
INSERT INTO permissions VALUES('254','delete-attendance','web','','');
INSERT INTO permissions VALUES('255','view-leave','web','','');
INSERT INTO permissions VALUES('256','store-leave','web','','');
INSERT INTO permissions VALUES('257','edit-leave','web','','');
INSERT INTO permissions VALUES('258','delete-leave','web','','');
INSERT INTO permissions VALUES('259','cms','web','','');
INSERT INTO permissions VALUES('260','performance','web','','');
INSERT INTO permissions VALUES('261','goal-type','web','','');
INSERT INTO permissions VALUES('262','view-goal-type','web','','');
INSERT INTO permissions VALUES('263','store-goal-type','web','','');
INSERT INTO permissions VALUES('264','edit-goal-type','web','','');
INSERT INTO permissions VALUES('265','delete-goal-type','web','','');
INSERT INTO permissions VALUES('266','goal-tracking','web','','');
INSERT INTO permissions VALUES('267','view-goal-tracking','web','','');
INSERT INTO permissions VALUES('268','store-goal-tracking','web','','');
INSERT INTO permissions VALUES('269','edit-goal-tracking','web','','');
INSERT INTO permissions VALUES('270','delete-goal-tracking','web','','');
INSERT INTO permissions VALUES('271','indicator','web','','');
INSERT INTO permissions VALUES('272','view-indicator','web','','');
INSERT INTO permissions VALUES('273','store-indicator','web','','');
INSERT INTO permissions VALUES('274','edit-indicator','web','','');
INSERT INTO permissions VALUES('275','delete-indicator','web','','');
INSERT INTO permissions VALUES('276','appraisal','web','','');
INSERT INTO permissions VALUES('277','view-appraisal','web','','');
INSERT INTO permissions VALUES('278','store-appraisal','web','','');
INSERT INTO permissions VALUES('279','edit-appraisal','web','','');
INSERT INTO permissions VALUES('280','delete-appraisal','web','','');
INSERT INTO permissions VALUES('281','assets-and-category','web','','');
INSERT INTO permissions VALUES('282','category','web','','');
INSERT INTO permissions VALUES('283','view-assets-category','web','','');
INSERT INTO permissions VALUES('284','store-assets-category','web','','');
INSERT INTO permissions VALUES('285','edit-assets-category','web','','');
INSERT INTO permissions VALUES('286','delete-assets-category','web','','');
INSERT INTO permissions VALUES('287','assets','web','','');
INSERT INTO permissions VALUES('288','view-assets','web','','');
INSERT INTO permissions VALUES('289','store-assets','web','','');
INSERT INTO permissions VALUES('290','edit-assets','web','','');
INSERT INTO permissions VALUES('291','delete-assets','web','','');
INSERT INTO permissions VALUES('292','set-permission','web','','');



CREATE TABLE `policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policies_company_id_foreign` (`company_id`),
  KEY `policies_added_by_foreign` (`added_by`),
  CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO policies VALUES('2','No smoking','No smoking during the office hours.Smoke in the smoking zone if you really have to','1','ash','2020-07-27 02:56:24','2020-07-27 02:56:24');



CREATE TABLE `project_bugs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_bugs_user_id_foreign` (`user_id`),
  KEY `project_bugs_project_id_foreign` (`project_id`),
  CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `project_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_discussions_user_id_foreign` (`user_id`),
  KEY `project_discussions_project_id_foreign` (`project_id`),
  CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO project_discussions VALUES('1','1','1','Hola','','2020-07-28 08:12:38','2020-07-28 08:12:38');



CREATE TABLE `project_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_project_id_foreign` (`project_id`),
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `project_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_added_by_foreign` (`added_by`),
  CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO projects VALUES('1','Test1','','1','2021-03-29','2021-04-02','medium','&lt;ul&gt;
&lt;li&gt;Section 2: Functional Objectives&lt;br /&gt;Each objective gives a desired behavior for the system, a business justification, and a measure to determine if the final system has successfully met the objective. These objectives are organized by priority. In order for the new system to be considered successful, all high priority objectives must be met.&lt;/li&gt;
&lt;li&gt;Section 3: Non-Functional Objectives&lt;br /&gt;This section is organized by category. Each objective specifies a technical requirement or constraint on the overall characteristics of the system. Each objective is measurable.&lt;/li&gt;
&lt;li&gt;Section 4: Context Model&lt;br /&gt;This section gives a text description of the goal of the system, and a pictorial description of the scope of the system in a context diagram. Those entities outside the system that interact with the system are described.&lt;/li&gt;
&lt;/ul&gt;','tinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will','in_progress','Note','36','','','2020-07-28 07:58:29','2020-11-01 18:47:03');
INSERT INTO projects VALUES('2','Test2','','','2021-03-30','2021-03-31','highest','&lt;ul style=&quot;list-style-type: square;&quot;&gt;
&lt;li&gt;The system shall allow for on-line product ordering by either the customer or the sales agent. For customers, this will eliminate the current delay between their decision to buy and the placement of the order. This will reduce the time a sales agent spends on an order by x%. The cost to process an order will be reduced to $y.&lt;/li&gt;
&lt;li&gt;The system shall reflect a new and changed product description within x minutes of the database being updated by the product owner. This will reduce the number of incidents of incorrectly displayed information by x%. This eliminates the current redundant update of information, saving $y dollars annually.&lt;/li&gt;
&lt;/ul&gt;','in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis','not_started','','83','','','2020-07-28 08:36:47','2020-11-01 18:47:59');
INSERT INTO projects VALUES('3','test3','','1','2021-03-31','2021-04-04','high','&lt;p&gt;&amp;nbsp;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;strong&gt;A sales agent should be able to use the system in his job after x days of training.&lt;/strong&gt;&lt;/li&gt;
&lt;li&gt;&lt;strong&gt;A user who already knows what product he is interested in should be able to locate and view that page in x seconds.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&amp;nbsp;&lt;/p&gt;','','not_started','','55','','','2020-08-03 02:26:42','2020-11-01 18:51:05');



CREATE TABLE `promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_company_id_foreign` (`company_id`),
  KEY `promotions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_education_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_education_levels_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO qualification_education_levels VALUES('1','','BSC','2020-07-26 20:54:02','2020-07-26 20:54:02');
INSERT INTO qualification_education_levels VALUES('2','','Diploma','2020-07-26 20:54:06','2020-07-26 20:54:06');
INSERT INTO qualification_education_levels VALUES('3','','BBA','2020-07-26 20:54:14','2020-07-26 20:54:14');



CREATE TABLE `qualification_languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_languages_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO qualification_languages VALUES('1','','English','2020-10-19 20:32:36','2020-10-19 20:32:36');
INSERT INTO qualification_languages VALUES('2','','Arabic','2020-10-19 20:32:44','2020-10-19 20:32:44');



CREATE TABLE `qualification_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_skills_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO qualification_skills VALUES('1','','MS Word','2020-10-19 20:32:54','2020-10-19 20:32:54');
INSERT INTO qualification_skills VALUES('2','','Photoshop','2020-10-19 20:33:02','2020-10-19 20:33:02');



CREATE TABLE `resignations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resignations_company_id_foreign` (`company_id`),
  KEY `resignations_department_id_foreign` (`department_id`),
  KEY `resignations_employee_id_foreign` (`employee_id`),
  CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES('11','4');
INSERT INTO role_has_permissions VALUES('21','2');
INSERT INTO role_has_permissions VALUES('22','2');
INSERT INTO role_has_permissions VALUES('23','2');
INSERT INTO role_has_permissions VALUES('24','2');
INSERT INTO role_has_permissions VALUES('25','2');
INSERT INTO role_has_permissions VALUES('26','2');
INSERT INTO role_has_permissions VALUES('27','2');
INSERT INTO role_has_permissions VALUES('28','2');
INSERT INTO role_has_permissions VALUES('29','2');
INSERT INTO role_has_permissions VALUES('30','2');
INSERT INTO role_has_permissions VALUES('31','2');
INSERT INTO role_has_permissions VALUES('32','2');
INSERT INTO role_has_permissions VALUES('33','2');
INSERT INTO role_has_permissions VALUES('34','2');
INSERT INTO role_has_permissions VALUES('35','2');
INSERT INTO role_has_permissions VALUES('36','2');
INSERT INTO role_has_permissions VALUES('38','2');
INSERT INTO role_has_permissions VALUES('39','2');
INSERT INTO role_has_permissions VALUES('41','2');
INSERT INTO role_has_permissions VALUES('42','2');
INSERT INTO role_has_permissions VALUES('43','2');
INSERT INTO role_has_permissions VALUES('44','2');
INSERT INTO role_has_permissions VALUES('46','2');
INSERT INTO role_has_permissions VALUES('47','2');
INSERT INTO role_has_permissions VALUES('48','2');
INSERT INTO role_has_permissions VALUES('49','2');
INSERT INTO role_has_permissions VALUES('50','2');
INSERT INTO role_has_permissions VALUES('51','2');
INSERT INTO role_has_permissions VALUES('52','2');
INSERT INTO role_has_permissions VALUES('53','2');
INSERT INTO role_has_permissions VALUES('54','2');
INSERT INTO role_has_permissions VALUES('55','2');
INSERT INTO role_has_permissions VALUES('56','2');
INSERT INTO role_has_permissions VALUES('57','2');
INSERT INTO role_has_permissions VALUES('58','2');
INSERT INTO role_has_permissions VALUES('59','2');
INSERT INTO role_has_permissions VALUES('60','2');
INSERT INTO role_has_permissions VALUES('61','2');
INSERT INTO role_has_permissions VALUES('169','4');
INSERT INTO role_has_permissions VALUES('170','4');



CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES('1','admin','web','Can access and change everything','1','','');
INSERT INTO roles VALUES('2','employee','web','Default access','1','2020-07-26 06:50:45','2020-07-26 06:50:45');
INSERT INTO roles VALUES('3','client','web','When you create a client, this role and associated.','1','2020-10-07 20:10:23','2020-10-07 20:10:23');
INSERT INTO roles VALUES('4','Manager','web','Can Manage','1','2021-02-24 02:24:58','2021-02-24 02:24:58');
INSERT INTO roles VALUES('5','Editor','web','Custom access','1','2021-02-24 02:24:58','2021-02-24 02:24:58');



CREATE TABLE `salary_allowances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowance_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_taxable` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_allowances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO salary_allowances VALUES('17','49','November-2021','2021-11-01','Accommodation','6000','0','2021-12-07 11:42:33','2021-12-07 11:42:33');
INSERT INTO salary_allowances VALUES('18','49','December-2021','2021-12-01','Accommodation','6000','0','2021-12-07 13:11:04','2021-12-07 13:11:04');



CREATE TABLE `salary_basics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_basics_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO salary_basics VALUES('24','49','November-2021','2021-11-01','Monthly','25000','2021-12-07 11:41:54','2021-12-07 11:41:54');
INSERT INTO salary_basics VALUES('25','49','December-2021','2021-12-01','Monthly','30000','2021-12-07 13:10:28','2021-12-07 13:10:28');



CREATE TABLE `salary_commissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_commissions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_deductions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_deductions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_payable` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_loans_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_other_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_other_payments_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_overtimes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_overtimes_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO statuses VALUES('1','full-time','2020-07-26 13:24:16','2020-07-26 13:24:16');
INSERT INTO statuses VALUES('2','part-time','2020-07-26 13:24:26','2020-07-26 13:24:26');
INSERT INTO statuses VALUES('3','internship','2020-07-26 13:24:42','2020-07-26 13:24:42');
INSERT INTO statuses VALUES('4','terminated','2020-07-26 13:24:49','2020-07-26 13:24:49');



CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `ticket_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_remarks` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `ticket_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  KEY `support_tickets_company_id_foreign` (`company_id`),
  KEY `support_tickets_department_id_foreign` (`department_id`),
  KEY `support_tickets_employee_id_foreign` (`employee_id`),
  CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO support_tickets VALUES('1','1','','','Kkqx8gSB','Broadcast Issue','medium','','ASAP','open','Fix Asap','','ticket_Kkqx8gSB.png','2020-07-28 09:59:08','2020-07-28 10:06:02');
INSERT INTO support_tickets VALUES('2','1','','','BYrKY0X8','Screen Issue','medium','&lt;p&gt;lorem ipsum&lt;strong&gt; lorem&lt;/strong&gt;&lt;/p&gt;','','pending','fix this issue ASAP','','ticket_BYrKY0X8.pdf','2020-08-02 23:17:26','2020-08-02 23:17:26');



CREATE TABLE `task_discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `task_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `task_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `task_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_company_id_foreign` (`company_id`),
  KEY `tasks_added_by_foreign` (`added_by`),
  CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tasks VALUES('1','Test1 Task','1','1','2021-03-29','2021-04-01','20','&lt;table style=&quot;border-collapse: collapse; width: 100%; height: 45px;&quot; border=&quot;1&quot;&gt;
&lt;tbody&gt;
&lt;tr style=&quot;height: 15px;&quot;&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;gsba&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;svnba&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style=&quot;height: 15px;&quot;&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;dfsd&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;dfsf&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style=&quot;height: 15px;&quot;&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;','','','9','','1','2020-07-28 08:14:01','2020-11-01 17:42:14');
INSERT INTO tasks VALUES('2','Task222','2','','2021-03-30','2021-03-30','12','&lt;p&gt;fdsafa gs&lt;/p&gt;','not started','','','','1','2020-07-28 09:26:49','2020-11-01 17:47:42');
INSERT INTO tasks VALUES('3','aa','1','1','2021-03-31','2021-04-02','16','&lt;p&gt;new&lt;/p&gt;','not started','','','','','2020-10-11 10:12:09','2020-11-01 17:49:48');
INSERT INTO tasks VALUES('6','new2222','2','1','2021-03-30','2021-03-31','20','&lt;p style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;fv fsdf&lt;/strong&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;dfds&lt;/strong&gt;&lt;/li&gt;
&lt;li style=&quot;text-align: center;&quot;&gt;zczcz&lt;/li&gt;
&lt;/ul&gt;','','','','','','2020-10-11 18:53:22','2020-11-01 16:44:07');



CREATE TABLE `tax_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tax_types VALUES('1','No tax','0','fixed','zero tax','2020-07-28 09:31:42','2020-07-28 09:31:42');
INSERT INTO tax_types VALUES('2','Vat','5','percentage','5% vat for all item','2020-07-28 09:32:12','2020-07-28 09:32:12');



CREATE TABLE `termination_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `termination_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO termination_types VALUES('1','voluntery termination','2020-07-26 13:22:03','2020-07-26 13:22:03');
INSERT INTO termination_types VALUES('2','Performance Termination','2020-07-26 13:22:27','2020-07-26 13:22:27');



CREATE TABLE `terminations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `terminated_employee` bigint(20) unsigned NOT NULL,
  `termination_type` bigint(20) unsigned DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminations_company_id_foreign` (`company_id`),
  KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  KEY `terminations_termination_type_foreign` (`termination_type`),
  CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ticket_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ticket_comments` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `trainers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expertise` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainers_company_id_foreign` (`company_id`),
  CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO trainers VALUES('1','Pink','Floyd','floyd@pink.com','76352839','1','Backstreet 22,Austria','Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est','','2020-07-27 12:14:54','2020-07-27 12:14:54');



CREATE TABLE `training_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `trainer_id` bigint(20) unsigned DEFAULT NULL,
  `training_type_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_lists_company_id_foreign` (`company_id`),
  KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  KEY `training_lists_training_type_id_foreign` (`training_type_id`),
  CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO training_lists VALUES('1','Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est','2021-04-01','2021-04-02','200','','','1','1','1','2020-07-27 12:17:38','2020-07-27 12:17:38');



CREATE TABLE `training_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO training_types VALUES('1','0','Job Training','','2020-07-27 12:10:52','2020-07-27 12:10:52');
INSERT INTO training_types VALUES('2','0','Workshop','','2020-07-27 12:10:59','2020-07-27 12:10:59');
INSERT INTO training_types VALUES('3','0','Mind Training','','2020-07-27 12:11:07','2020-07-27 12:11:07');



CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `from_department_id` bigint(20) unsigned DEFAULT NULL,
  `to_department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_foreign` (`company_id`),
  KEY `transfers_from_department_id_foreign` (`from_department_id`),
  KEY `transfers_to_department_id_foreign` (`to_department_id`),
  KEY `transfers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `travel_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `arrangement_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_types_company_id_foreign` (`company_id`),
  CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO travel_types VALUES('1','Corporation','','2020-07-26 20:51:23','2020-07-26 20:51:23');
INSERT INTO travel_types VALUES('2','Guest House','','2020-07-26 20:51:34','2020-07-26 20:51:34');
INSERT INTO travel_types VALUES('3','Hotel','','2020-07-26 20:51:39','2020-07-26 20:51:39');



CREATE TABLE `travels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `travel_type` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_company_id_foreign` (`company_id`),
  KEY `travels_employee_id_foreign` (`employee_id`),
  KEY `travels_travel_type_foreign` (`travel_type`),
  CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_bg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_users_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_users_id_foreign` (`role_users_id`),
  CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Nayon','Chandro','nayon.hr','admin@srbg.com','','$2y$10$lOzg9YlHVKf9wFfnyi.DDe9hhU.t3KiqejPP1rv5WyJN7pe.XmA5G','nayon.hr_1638853575.jpg','','1','1','1234','43.250.81.164','2021-12-07 14:52:39.00','YfQqfRNcw79qSgHXYcDKaINDzE2kmPam5SrjPi4yb9R7exsgY68dIQlPylCe','','2021-12-07 13:17:46','');
INSERT INTO users VALUES('49','Emam','Hosen','emamhsajeeb','emamhsajeeb@gmail.com','','$2y$10$/3Ak3OjL75A0TNM3cE2thujjJj3ONNPm4xn9yXF/GAme9CaDTGE4e','emamhsajeeb_1638855347.jpg','','2','1','+8801610285004','43.250.81.164','2021-12-07 16:33:35.00','7t31jWYfp5QET5oSdaqePNEbs5Rr5XsDUX5isIIuiSk7KBxN9s6pAkSeTbF0','2021-12-07 11:35:47','2021-12-07 11:40:48','');



CREATE TABLE `warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `warning_to` bigint(20) unsigned NOT NULL,
  `warning_type` bigint(20) unsigned DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warnings_company_id_foreign` (`company_id`),
  KEY `warnings_warning_to_foreign` (`warning_to`),
  KEY `warnings_warning_type_foreign` (`warning_type`),
  CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warnings_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warning_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warnings_type VALUES('1','First written warning','2020-07-26 13:20:57','2020-07-26 13:20:57');
INSERT INTO warnings_type VALUES('2','Verbal Warning','2020-07-26 13:21:17','2020-07-26 13:21:17');

SET foreign_key_checks = 1;