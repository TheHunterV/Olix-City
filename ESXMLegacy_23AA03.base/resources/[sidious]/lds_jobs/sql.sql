CREATE TABLE IF NOT EXISTS `lds_jobs` (
    `name` VARCHAR(64) NOT NULL COLLATE 'utf8mb4_bin',
	`accounts` LONGTEXT NULL COLLATE 'utf8mb4_bin',
    `inventory` LONGTEXT NULL COLLATE 'utf8mb4_bin',
    `garage` LONGTEXT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`name`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `saveclothes` (
    `identifier` VARCHAR(64) NOT NULL COLLATE 'utf8mb4_bin',
	`wardrobe` LONGTEXT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `users` ADD COLUMN `name` VARCHAR(32) NULL;
