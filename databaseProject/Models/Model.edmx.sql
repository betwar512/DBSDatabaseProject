
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/03/2015 22:41:01
-- Generated from EDMX file: C:\Users\Betwar-mac\Source\Repos\DBSDatabaseProject\databaseProject\Models\Model.edmx
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Branch_To_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Branch] DROP CONSTRAINT [FK_Branch_To_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_Contract_task_ToContract]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contract_task] DROP CONSTRAINT [FK_Contract_task_ToContract];
GO
IF OBJECT_ID(N'[dbo].[FK_Contract_To_Project]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contract] DROP CONSTRAINT [FK_Contract_To_Project];
GO
IF OBJECT_ID(N'[dbo].[FK_Contract_worker_ToTable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contract_worker] DROP CONSTRAINT [FK_Contract_worker_ToTable];
GO
IF OBJECT_ID(N'[dbo].[FK_Office_worker_ToDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Office_worker] DROP CONSTRAINT [FK_Office_worker_ToDepartment];
GO
IF OBJECT_ID(N'[dbo].[FK_Office_worker_ToEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Office_worker] DROP CONSTRAINT [FK_Office_worker_ToEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Project_status_report_ToProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project_status_report] DROP CONSTRAINT [FK_Project_status_report_ToProject];
GO
IF OBJECT_ID(N'[dbo].[FK_Project_ToCompany]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK_Project_ToCompany];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Branch]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Branch];
GO
IF OBJECT_ID(N'[dbo].[Company]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company];
GO
IF OBJECT_ID(N'[dbo].[Contract]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contract];
GO
IF OBJECT_ID(N'[dbo].[Contract_task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contract_task];
GO
IF OBJECT_ID(N'[dbo].[Contract_worker]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contract_worker];
GO
IF OBJECT_ID(N'[dbo].[Department]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Department];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Office_worker]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Office_worker];
GO
IF OBJECT_ID(N'[dbo].[Project]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Project];
GO
IF OBJECT_ID(N'[dbo].[Project_status_report]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Project_status_report];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[Contract_worker_Info]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[Contract_worker_Info];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[ContractWorkerView]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[ContractWorkerView];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[Department_Info]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[Department_Info];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[Office_worker_info]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[Office_worker_info];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[OfficeWorkerView]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[OfficeWorkerView];
GO
IF OBJECT_ID(N'[M2DbModelStoreContainer].[Reports]', 'U') IS NOT NULL
    DROP TABLE [M2DbModelStoreContainer].[Reports];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Branches'
CREATE TABLE [dbo].[Branches] (
    [Company_id] int  NOT NULL,
    [Name] nchar(10)  NOT NULL,
    [Phone] nchar(10)  NOT NULL,
    [Address] nvarchar(50)  NOT NULL,
    [Email] nchar(10)  NOT NULL
);
GO

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [Company_id] int  NOT NULL,
    [Company_name] nchar(10)  NULL,
    [Bussines_type] nchar(10)  NULL
);
GO

-- Creating table 'Contracts'
CREATE TABLE [dbo].[Contracts] (
    [Contract_id] int  NOT NULL,
    [Employee_id] int  NOT NULL,
    [Project_id] int  NOT NULL,
    [Start_date] datetime  NULL,
    [End_date] datetime  NULL
);
GO

-- Creating table 'Contract_task'
CREATE TABLE [dbo].[Contract_task] (
    [Contract_id] int  NOT NULL,
    [Task_name] nchar(10)  NOT NULL,
    [Task_description] nvarchar(50)  NULL
);
GO

-- Creating table 'Contract_worker'
CREATE TABLE [dbo].[Contract_worker] (
    [Employee_id] int  NOT NULL,
    [Specialization] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [Department_id] int  NOT NULL,
    [Department_name] nchar(10)  NOT NULL,
    [Phone] nchar(10)  NULL,
    [Manager] int  NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Employee_Id] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Salary] decimal(18,0)  NULL,
    [Birthday] datetime  NULL,
    [Address] nvarchar(50)  NULL,
    [Phone] nchar(10)  NULL,
    [Email] nvarchar(50)  NULL,
    [Sex] nchar(10)  NULL
);
GO

-- Creating table 'Office_worker'
CREATE TABLE [dbo].[Office_worker] (
    [Employee_Id] int  NOT NULL,
    [Department_Id] int  NULL,
    [Super_Id] nchar(10)  NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Project_id] int  NOT NULL,
    [Company_id] int  NULL,
    [Project_name] nchar(10)  NULL
);
GO

-- Creating table 'Project_status_report'
CREATE TABLE [dbo].[Project_status_report] (
    [Project_id] int  NOT NULL,
    [Registration] nchar(10)  NOT NULL,
    [Employee_id] int  NULL,
    [Work_hours] nchar(10)  NULL,
    [Description] nvarchar(50)  NULL,
    [Role] nchar(10)  NULL,
    [Project_status] nchar(10)  NULL
);
GO

-- Creating table 'Contract_worker_Info'
CREATE TABLE [dbo].[Contract_worker_Info] (
    [Employee_Id] int  NOT NULL,
    [name] nvarchar(50)  NULL,
    [Specialization] nvarchar(50)  NOT NULL,
    [Contract_id] int  NOT NULL,
    [Project_id] int  NOT NULL
);
GO

-- Creating table 'ContractWorkerViews'
CREATE TABLE [dbo].[ContractWorkerViews] (
    [Id] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Phone] nchar(10)  NULL,
    [Email] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL,
    [Salary] decimal(18,0)  NULL,
    [Sex] nchar(10)  NULL,
    [Specialization] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'OfficeWorkerViews'
CREATE TABLE [dbo].[OfficeWorkerViews] (
    [Id] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Phone] nchar(10)  NULL,
    [Email] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL,
    [Salary] decimal(18,0)  NULL,
    [Sex] nchar(10)  NULL,
    [Department_Id] int  NULL
);
GO

-- Creating table 'Department_Info'
CREATE TABLE [dbo].[Department_Info] (
    [Department_id] int  NOT NULL,
    [Department_name] nchar(10)  NOT NULL,
    [Phone] nchar(10)  NULL,
    [Manager] int  NULL
);
GO

-- Creating table 'Office_worker_info'
CREATE TABLE [dbo].[Office_worker_info] (
    [Employee_Id] int  NOT NULL,
    [name] nvarchar(50)  NULL,
    [Super_Id] nchar(10)  NULL
);
GO

-- Creating table 'Reports'
CREATE TABLE [dbo].[Reports] (
    [Employee_Id] int  NOT NULL,
    [Project_id] int  NOT NULL,
    [name] nvarchar(50)  NULL,
    [Work_Hours] nchar(10)  NULL,
    [Role] nchar(10)  NULL,
    [Description] nvarchar(50)  NULL,
    [Project_status] nchar(10)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Company_id], [Name] in table 'Branches'
ALTER TABLE [dbo].[Branches]
ADD CONSTRAINT [PK_Branches]
    PRIMARY KEY CLUSTERED ([Company_id], [Name] ASC);
GO

-- Creating primary key on [Company_id] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([Company_id] ASC);
GO

-- Creating primary key on [Contract_id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [PK_Contracts]
    PRIMARY KEY CLUSTERED ([Contract_id] ASC);
GO

-- Creating primary key on [Contract_id], [Task_name] in table 'Contract_task'
ALTER TABLE [dbo].[Contract_task]
ADD CONSTRAINT [PK_Contract_task]
    PRIMARY KEY CLUSTERED ([Contract_id], [Task_name] ASC);
GO

-- Creating primary key on [Employee_id] in table 'Contract_worker'
ALTER TABLE [dbo].[Contract_worker]
ADD CONSTRAINT [PK_Contract_worker]
    PRIMARY KEY CLUSTERED ([Employee_id] ASC);
GO

-- Creating primary key on [Department_id] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([Department_id] ASC);
GO

-- Creating primary key on [Employee_Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Employee_Id] ASC);
GO

-- Creating primary key on [Employee_Id] in table 'Office_worker'
ALTER TABLE [dbo].[Office_worker]
ADD CONSTRAINT [PK_Office_worker]
    PRIMARY KEY CLUSTERED ([Employee_Id] ASC);
GO

-- Creating primary key on [Project_id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Project_id] ASC);
GO

-- Creating primary key on [Project_id], [Registration] in table 'Project_status_report'
ALTER TABLE [dbo].[Project_status_report]
ADD CONSTRAINT [PK_Project_status_report]
    PRIMARY KEY CLUSTERED ([Project_id], [Registration] ASC);
GO

-- Creating primary key on [Employee_Id], [Specialization], [Contract_id], [Project_id] in table 'Contract_worker_Info'
ALTER TABLE [dbo].[Contract_worker_Info]
ADD CONSTRAINT [PK_Contract_worker_Info]
    PRIMARY KEY CLUSTERED ([Employee_Id], [Specialization], [Contract_id], [Project_id] ASC);
GO

-- Creating primary key on [Id], [Specialization] in table 'ContractWorkerViews'
ALTER TABLE [dbo].[ContractWorkerViews]
ADD CONSTRAINT [PK_ContractWorkerViews]
    PRIMARY KEY CLUSTERED ([Id], [Specialization] ASC);
GO

-- Creating primary key on [Id] in table 'OfficeWorkerViews'
ALTER TABLE [dbo].[OfficeWorkerViews]
ADD CONSTRAINT [PK_OfficeWorkerViews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Department_id], [Department_name] in table 'Department_Info'
ALTER TABLE [dbo].[Department_Info]
ADD CONSTRAINT [PK_Department_Info]
    PRIMARY KEY CLUSTERED ([Department_id], [Department_name] ASC);
GO

-- Creating primary key on [Employee_Id] in table 'Office_worker_info'
ALTER TABLE [dbo].[Office_worker_info]
ADD CONSTRAINT [PK_Office_worker_info]
    PRIMARY KEY CLUSTERED ([Employee_Id] ASC);
GO

-- Creating primary key on [Employee_Id], [Project_id] in table 'Reports'
ALTER TABLE [dbo].[Reports]
ADD CONSTRAINT [PK_Reports]
    PRIMARY KEY CLUSTERED ([Employee_Id], [Project_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Company_id] in table 'Branches'
ALTER TABLE [dbo].[Branches]
ADD CONSTRAINT [FK_Branch_To_Company]
    FOREIGN KEY ([Company_id])
    REFERENCES [dbo].[Companies]
        ([Company_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Company_id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_Project_ToCompany]
    FOREIGN KEY ([Company_id])
    REFERENCES [dbo].[Companies]
        ([Company_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Project_ToCompany'
CREATE INDEX [IX_FK_Project_ToCompany]
ON [dbo].[Projects]
    ([Company_id]);
GO

-- Creating foreign key on [Contract_id] in table 'Contract_task'
ALTER TABLE [dbo].[Contract_task]
ADD CONSTRAINT [FK_Contract_task_ToContract]
    FOREIGN KEY ([Contract_id])
    REFERENCES [dbo].[Contracts]
        ([Contract_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Project_id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [FK_Contract_To_Project]
    FOREIGN KEY ([Project_id])
    REFERENCES [dbo].[Projects]
        ([Project_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Contract_To_Project'
CREATE INDEX [IX_FK_Contract_To_Project]
ON [dbo].[Contracts]
    ([Project_id]);
GO

-- Creating foreign key on [Employee_id] in table 'Contract_worker'
ALTER TABLE [dbo].[Contract_worker]
ADD CONSTRAINT [FK_Contract_worker_ToTable]
    FOREIGN KEY ([Employee_id])
    REFERENCES [dbo].[Employees]
        ([Employee_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Department_Id] in table 'Office_worker'
ALTER TABLE [dbo].[Office_worker]
ADD CONSTRAINT [FK_Office_worker_ToDepartment]
    FOREIGN KEY ([Department_Id])
    REFERENCES [dbo].[Departments]
        ([Department_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Office_worker_ToDepartment'
CREATE INDEX [IX_FK_Office_worker_ToDepartment]
ON [dbo].[Office_worker]
    ([Department_Id]);
GO

-- Creating foreign key on [Employee_Id] in table 'Office_worker'
ALTER TABLE [dbo].[Office_worker]
ADD CONSTRAINT [FK_Office_worker_ToEmployee]
    FOREIGN KEY ([Employee_Id])
    REFERENCES [dbo].[Employees]
        ([Employee_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Project_id] in table 'Project_status_report'
ALTER TABLE [dbo].[Project_status_report]
ADD CONSTRAINT [FK_Project_status_report_ToProject]
    FOREIGN KEY ([Project_id])
    REFERENCES [dbo].[Projects]
        ([Project_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------