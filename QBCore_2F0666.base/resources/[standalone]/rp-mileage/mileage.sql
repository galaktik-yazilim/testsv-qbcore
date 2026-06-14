-- Mil değerlerini ondalıklı saklamak için (mevcut kurulumlarda güvenli)
ALTER TABLE `player_vehicles`
    MODIFY COLUMN `drivingdistance` FLOAT NULL DEFAULT 0;

UPDATE `player_vehicles` SET `drivingdistance` = 0 WHERE `drivingdistance` IS NULL;
