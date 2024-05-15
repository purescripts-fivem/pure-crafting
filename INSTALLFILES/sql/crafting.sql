CREATE TABLE IF NOT EXISTS `crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `rotation` varchar(255) NOT NULL,
  `queue` longtext NOT NULL DEFAULT '[]',
  `finished` longtext NOT NULL DEFAULT '[]',
  `blueprints` longtext NOT NULL DEFAULT '[]',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `crafting_users` (
  `uniqueId` varchar(255) NOT NULL,
  `faves` longtext NOT NULL DEFAULT '{}',
  `amountPlaced` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
