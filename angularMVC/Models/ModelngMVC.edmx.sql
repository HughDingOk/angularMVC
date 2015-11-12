
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/12/2015 23:00:10
-- Generated from EDMX file: c:\users\ikuki\documents\visual studio 2013\Projects\angularMVC\angularMVC\Models\ModelngMVC.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [angularMVC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSet] DROP CONSTRAINT [FK_CategoryProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_UserOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderSet] DROP CONSTRAINT [FK_UserOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderSet] DROP CONSTRAINT [FK_ProductOrder];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[OrderSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderSet];
GO
IF OBJECT_ID(N'[dbo].[ProductSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [pwd] nvarchar(12)  NOT NULL,
    [email] nvarchar(50)  NOT NULL,
    [Role] smallint  NOT NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [Id] uniqueidentifier  NOT NULL,
    [PlaceTime] datetime  NOT NULL,
    [Paid] bit  NOT NULL,
    [productList] nvarchar(max)  NOT NULL,
    [subTotal] float  NOT NULL,
    [UserID] nvarchar(max)  NOT NULL,
    [ProductID] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- Creating table 'ProductSet'
CREATE TABLE [dbo].[ProductSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(max)  NOT NULL,
    [ImagePath] nvarchar(max)  NOT NULL,
    [Price] float  NOT NULL,
    [Introduction] nvarchar(max)  NOT NULL,
    [CategoryID] nvarchar(max)  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [PK_ProductSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Id] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [FK_CategoryProduct]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct'
CREATE INDEX [IX_FK_CategoryProduct]
ON [dbo].[ProductSet]
    ([Category_Id]);
GO

-- Creating foreign key on [User_Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_UserOrder]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserOrder'
CREATE INDEX [IX_FK_UserOrder]
ON [dbo].[OrderSet]
    ([User_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_ProductOrder]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductOrder'
CREATE INDEX [IX_FK_ProductOrder]
ON [dbo].[OrderSet]
    ([Product_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------