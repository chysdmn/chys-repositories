-- Active: 1718785320318@@localhost@3306@sqlsql
CREATE TABLE Users (
    User_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 用户ID，主键
    Email VARCHAR(255) UNIQUE NOT NULL, -- 用户邮箱，唯一且不能为空
    Password VARCHAR(255) NOT NULL, -- 用户密码，不能为空
    User_name VARCHAR(100) NOT NULL, -- 用户名，不能为空
    RegistrationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 注册时间，默认为当前时间戳，注意这里没有分号
);