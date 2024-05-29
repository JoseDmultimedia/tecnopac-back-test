
CREATE TABLE `Rol` (
  `idRol` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nameRol` VARCHAR(255) NOT NULL,
  `descriptionRol` VARCHAR(255)
);

CREATE TABLE `Status` (
  `idStatus` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nameStatus` VARCHAR(255) NOT NULL
);

CREATE TABLE `User` (
  `idUser` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `idRol` INT NOT NULL,
  `idStatus` INT NOT NULL,
  `promoted` BOOLEAN NOT NULL DEFAULT FALSE,
  `projectsQuantity` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`idRol`) REFERENCES `Rol` (`idRol`),
  FOREIGN KEY (`idStatus`) REFERENCES `Status` (`idStatus`)
);

CREATE TABLE `Logs` (
  `idLogs` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `logTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `SocialNetType` (
  `idSocialNetType` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `typeNet` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL
);

CREATE TABLE `SocialNet` (
  `idSocialNet` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idSocialNetType` INT NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`idSocialNetType`) REFERENCES `SocialNetType` (`idSocialNetType`)
);

CREATE TABLE `UsersInSocialNet` (
  `idUsersInSocialNet` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `idSocialNet` INT NOT NULL,
  FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`),
  FOREIGN KEY (`idSocialNet`) REFERENCES `SocialNet` (`idSocialNet`)
);

CREATE TABLE `UsersInLogs` (
  `idUsersInLogs` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `idLogs` INT NOT NULL,
  FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`),
  FOREIGN KEY (`idLogs`) REFERENCES `Logs` (`idLogs`)
);


