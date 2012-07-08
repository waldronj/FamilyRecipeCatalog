
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/01/2012 14:20:49
-- Generated from EDMX file: c:\users\beast\documents\visual studio 11\Projects\IngredientCatalog\IngredientCatalog\RecipeCatalog.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RecipeCatalog];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Recipes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recipes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Recipes'
CREATE TABLE [dbo].[Recipes] (
    [RecipeId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Ingredients] nvarchar(max)  NOT NULL,
    [Instructions] nvarchar(max)  NOT NULL,
    [PictureURL] nvarchar(max)  NULL,
    [Contributer] nvarchar(50)  NULL,
    [Category] nvarchar(100)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RecipeId] in table 'Recipes'
ALTER TABLE [dbo].[Recipes]
ADD CONSTRAINT [PK_Recipes]
    PRIMARY KEY CLUSTERED ([RecipeId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------