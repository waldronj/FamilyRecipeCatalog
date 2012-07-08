
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/30/2012 11:50:22
-- Generated from EDMX file: c:\users\beast\documents\visual studio 11\Projects\IngredientCatalog\IngredientCatalog\Recipe.edmx
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


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Recipes'
CREATE TABLE [dbo].[Recipes] (
    [RecipeId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Ingredients] nvarchar(max)  NOT NULL,
    [Instructions] nvarchar(max)  NOT NULL,
    [PictureURL] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Notes'
CREATE TABLE [dbo].[Notes] (
    [NoteId] int IDENTITY(1,1) NOT NULL,
    [Note] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RecipeNotes'
CREATE TABLE [dbo].[RecipeNotes] (
    [Recipes_RecipeId] int  NOT NULL,
    [Notes_NoteId] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Recipes_RecipeId], [Notes_NoteId] in table 'RecipeNotes'
ALTER TABLE [dbo].[RecipeNotes]
ADD CONSTRAINT [PK_RecipeNotes]
    PRIMARY KEY NONCLUSTERED ([Recipes_RecipeId], [Notes_NoteId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Notes'
ALTER TABLE [dbo].[Notes]
ADD CONSTRAINT [FK_UserNotes]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserNotes'
CREATE INDEX [IX_FK_UserNotes]
ON [dbo].[Notes]
    ([UserId]);
GO

-- Creating foreign key on [Recipes_RecipeId] in table 'RecipeNotes'
ALTER TABLE [dbo].[RecipeNotes]
ADD CONSTRAINT [FK_RecipeNotes_Recipe]
    FOREIGN KEY ([Recipes_RecipeId])
    REFERENCES [dbo].[Recipes]
        ([RecipeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Notes_NoteId] in table 'RecipeNotes'
ALTER TABLE [dbo].[RecipeNotes]
ADD CONSTRAINT [FK_RecipeNotes_Notes]
    FOREIGN KEY ([Notes_NoteId])
    REFERENCES [dbo].[Notes]
        ([NoteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeNotes_Notes'
CREATE INDEX [IX_FK_RecipeNotes_Notes]
ON [dbo].[RecipeNotes]
    ([Notes_NoteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------