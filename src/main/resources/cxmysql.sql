/* ---------------------------------------------------- */
/*  Created On : 03-Dec-2017 11:38:12 AM                */
/*  DBMS       : MySql                                  */
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `provider` CASCADE
;

DROP TABLE IF EXISTS `subscriber` CASCADE
;

DROP TABLE IF EXISTS `subscription` CASCADE
;

/* Create Tables */

CREATE TABLE `provider`
(
  `provider_guid` VARCHAR(22) NOT NULL,
  `provider_name` VARCHAR(30) NULL,
  `username` VARCHAR(30) NOT NULL,
  `apikey` VARCHAR(36) NOT NULL,
  `pubisher_token` VARCHAR(100) NOT NULL,
  CONSTRAINT `pk_provider` PRIMARY KEY (`provider_guid` ASC)
)

;

CREATE TABLE `subscriber`
(
  `identity_guid` VARCHAR(22) NOT NULL,
  `uid` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `account_state` VARCHAR(10) NOT NULL,
  `affiliace_code` VARCHAR(20) NOT NULL,
  `entitlement` VARCHAR(50) NOT NULL,
  `saved_datetime` DATETIME NULL,
  `active_subscription_guid` VARCHAR(22) NULL,
  `provider_guid` VARCHAR(36) NOT NULL,
  CONSTRAINT `pk_subscriber` PRIMARY KEY (`identity_guid` ASC)
)

;

CREATE TABLE `subscription`
(
  `subscription_guid` VARCHAR(22) NOT NULL,
  `affiliace_code` VARCHAR(20) NOT NULL,
  `product_id` VARCHAR(50) NOT NULL,
  `store_receipt` BLOB NULL,
  `transaction_id` VARCHAR(50) NULL,
  `state` VARCHAR(20) NOT NULL,
  `identity_guid` VARCHAR(22) NOT NULL,
  CONSTRAINT `pk_subscription` PRIMARY KEY (`subscription_guid` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `subscriber` 
 ADD INDEX `ixfk_subscriber_provider` (`provider_guid` ASC)
;

ALTER TABLE `subscription` 
 ADD INDEX `ixfk_subscription_subscriber` (`identity_guid` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `subscription` 
 ADD CONSTRAINT `fk_subscription_subscriber`
  FOREIGN KEY (`identity_guid`) REFERENCES `subscriber` (`identity_guid`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
