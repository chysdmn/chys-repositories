

-- 创建用户表
CREATE TABLE Users (
    User_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 用户ID，主键
    Email VARCHAR(255) UNIQUE NOT NULL, -- 用户邮箱，唯一且不能为空
    Password VARCHAR(255) NOT NULL, -- 用户密码，不能为空
    User_name VARCHAR(100) NOT NULL, -- 用户名，不能为空
    
    RegistrationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 注册时间，默认为当前时间戳，注意这里没有分号
    Users_Properties ENUM('admin', 'regular') DEFAULT 'regular' NOT NULL;--用户属性，选择管理或者普通用户，默认普通用户
);



-- 创建数据集表
CREATE TABLE Datasets (
    Dataset_ID INT PRIMARY KEY, -- 数据集ID，主键
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 上传时间，默认为当前时间戳
    FilePath VARCHAR(255) UNIQUE NOT NULL, -- 文件路径，唯一且不能为空
    Dataset_Name VARCHAR(100), -- 数据集名称，
    DataType ENUM('csv', 'json', 'txt') NOT NULL, -- 数据类型，只能是csv、json、txt其中之一，不能为空
    Dataset_Properties  VARCHAR(20) NOT NULL CHECK (Properties IN ('train', 'test')), -- 数据集属性信息，可选(训练集或测试集)
    UserID INT, -- 关联的用户ID
    ModelID INT, -- 关联的模型ID
    FOREIGN KEY (UserID) REFERENCES Users(User_ID), -- 外键，关联到Users表的ID列
    FOREIGN KEY (ModelID) REFERENCES Models(Model_ID) -- 外键，关联到Models表的ID列
);

-- 创建实验表
CREATE TABLE Experiments (
    Experiment_ID INT PRIMARY KEY, -- 实验ID，主键
    SampleFilePath VARCHAR(255), -- 样本文件路径，可选
    Experiment_Name VARCHAR(100) NOT NULL, -- 实验名称，不能为空
    Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 实验日期，默认为当前时间戳
    PredictionResult VARCHAR(50), -- 预测结果
    UserID INT, -- 关联的用户ID
    ModelID INT, -- 关联的模型ID
    FOREIGN KEY (UserID) REFERENCES Users(User_ID), -- 外键，关联到Users表的ID列
    FOREIGN KEY (ModelID) REFERENCES Models(Model_ID) -- 外键，关联到Models表的ID列
);

-- 创建训练任务表
CREATE TABLE TrainingTasks (
    TrainingTask_ID INT PRIMARY KEY, -- 训练任务ID，主键
    TrainingTask_Name VARCHAR(100) UNIQUE NOT NULL, -- 训练任务名称，唯一且不能为空
    Result VARCHAR(50), -- 训练结果，文本格式存储
    UserID INT, -- 关联的用户ID
    ModelID INT, -- 关联的模型ID
    FOREIGN KEY (UserID) REFERENCES Users(User_ID), -- 外键，关联到Users表的ID列
    FOREIGN KEY (ModelID) REFERENCES Models(Model_ID) -- 外键，关联到Models表的ID列
);

-- 创建模型表
CREATE TABLE Models (
    Model_ID INT PRIMARY KEY, -- 模型ID，主键
    Model_Name VARCHAR(100) UNIQUE NOT NULL, -- 模型名称，唯一且不能为空
    Parameters VARCHAR(50) -- 模型参数信息
);
