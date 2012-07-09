
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/08/2012 22:25:08
-- Generated from EDMX file: E:\Programming\GitHub\FamilyRecipeCatalog\IngredientCatalog\RecipeCatalog.edmx
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

IF OBJECT_ID(N'[dbo].[FK_RecipeNote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [FK_RecipeNote];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Notes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notes];
GO
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
    [Category] nvarchar(100)  NULL,
    [ServingSize] nchar(40)  NULL,
    [RecipeOrigin] nchar(40)  NULL
);
GO

-- Creating table 'Notes'
CREATE TABLE [dbo].[Notes] (
    [NoteId] int IDENTITY(1,1) NOT NULL,
    [NoteWriter] nvarchar(max)  NOT NULL,
    [NoteValue] nvarchar(max)  NOT NULL,
    [RecipeRecipeId] int  NOT NULL
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

-- Creating primary key on [NoteId] in table 'Notes'
ALTER TABLE [dbo].[Notes]
ADD CONSTRAINT [PK_Notes]
    PRIMARY KEY CLUSTERED ([NoteId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RecipeRecipeId] in table 'Notes'
ALTER TABLE [dbo].[Notes]
ADD CONSTRAINT [FK_RecipeNote]
    FOREIGN KEY ([RecipeRecipeId])
    REFERENCES [dbo].[Recipes]
        ([RecipeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeNote'
CREATE INDEX [IX_FK_RecipeNote]
ON [dbo].[Notes]
    ([RecipeRecipeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------