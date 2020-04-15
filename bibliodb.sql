USE [BiblioDBV2]
GO
/****** Object:  Table [dbo].[Livres]    Script Date: 4/15/2020 4:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titre] [nvarchar](max) NULL,
	[Prix] [int] NOT NULL,
	[Taille] [int] NOT NULL,
 CONSTRAINT [PK_Livres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visiteurs]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visiteurs](
	[Id] [int] NOT NULL,
	[Nom] [nvarchar](max) NULL,
	[Palmares] [nvarchar](max) NULL,
	[Rang] [int] NULL,
	[Profil] [nvarchar](max) NULL,
	[SessionsParJour] [int] NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Visiteurs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LivreDetailView]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[LivreDetailView]
AS
   SELECT        dbo.Livres.Id as LivreId, 
                 dbo.Visiteurs.Id AS VisiteurId, 
				 dbo.Visiteurs.Nom AS [Nom auteur], 
				 dbo.Visiteurs.Palmares, 
				 dbo.Visiteurs.Rang, 
				 dbo.Livres.Titre AS [Titre livre], 
				 dbo.Livres.Prix, dbo.Livres.Taille
   FROM          dbo.Livres INNER JOIN
                 dbo.Visiteurs ON dbo.Livres.Id = dbo.Visiteurs.Id
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelationLivreVisiteurs]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationLivreVisiteurs](
	[LivreId] [int] NOT NULL,
	[VisiteurId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Trace] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RelationLivreVisiteurs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200319183809_FirstMigration', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200321195022_InitialMigration', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200322073540_SecondMigration', N'3.1.2')
SET IDENTITY_INSERT [dbo].[Livres] ON 

INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1, N'Thief Of Dread', 154, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (2, N'Warrior Of Despair', 163, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (3, N'Aliens Of The Eclipse', 239, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (4, N'Gods Of My Imagination', 214, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (5, N'Criminals And Strangers', 99, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (6, N'Armies And Enemies', 195, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (7, N'Honor Of The Stars', 189, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (8, N'Crossbow Of History', 273, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (9, N'Hiding The Titans', 241, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (10, N'Faith Of A Storm', 305, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (11, N'Guardian Of The Great', 324, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (12, N'Butcher With Wings', 197, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (13, N'Witches Of Silver', 158, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (14, N'Lords Of Fire', 244, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (15, N'Enemies And Children', 295, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (16, N'Agents And Criminals', 58, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (17, N'Sword Of The Night', 169, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (18, N'Argument Of Sorrow', 295, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (19, N'Shelter At The Leaders', 91, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (20, N'Question The Emperor', 191, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (21, N'Army Of Heaven', 76, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (22, N'Duke Of Perfection', 323, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (23, N'Invaders Of The Banished', 197, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (24, N'Dogs Of The Eternal', 175, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (25, N'Snakes And Cats', 242, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (26, N'Butchers And Pirates', 52, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (27, N'Unity Of The Great', 202, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (28, N'Creation Of The Forsaken', 79, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (29, N'Forsaking Dreams', 195, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (30, N'Changing The Nation', 269, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (31, N'Thief ', 96, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (32, N'Warrior ', 163, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (33, N'Aliens Of Despair', 316, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (34, N'Gods And Strangers', 202, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (35, N'Criminals Of My Imagination', 74, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (36, N'Armies Of The Stars', 177, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (37, N'Honor And Enemies', 107, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (38, N'Crossbow Of A Storm', 232, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (39, N'Hiding Of History', 267, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (40, N'Faith The Titans', 56, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (41, N'Guardian With Wings', 147, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (42, N'Butcher Of The Great', 174, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (43, N'Witches Of Fire ', 111, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (44, N'Lords Of Silver ', 287, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (45, N'Enemies And Criminals', 319, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (46, N'Agents And Children', 211, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (47, N'Sword Of Sorrow', 111, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (48, N'Argument Of The Night', 177, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (49, N'Shelter The Emperor', 151, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (50, N'Question At The Leaders', 197, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (51, N'Army Of Perfection', 267, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (52, N'Duke Of Heaven', 122, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (53, N'Invaders Of The Eternal', 312, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (54, N'Dogs Of The Banished', 149, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (55, N'Snakes And Pirates', 177, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (56, N'Butchers And Cats', 80, 1)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (57, N'Unity Of The Forsaken', 51, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (58, N'Creation Of The Great', 243, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (59, N'Forsaking Dreams', 96, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (60, N'Changing The Nation', 297, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (61, N'Thief Of Dread', 74, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (62, N'Warrior Of Despair', 175, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (63, N'Aliens Of The Eclipse', 77, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (64, N'Gods Of My Imagination', 185, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (65, N'Criminals And Strangers', 306, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (66, N'Armies And Enemies', 99, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (67, N'Honor Of The Stars', 193, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (68, N'Crossbow Of History', 271, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (69, N'Hiding The Titans', 111, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (70, N'Faith Of A Storm', 196, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (71, N'Guardian Of The Great', 67, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (72, N'Butcher With Wings', 274, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (73, N'Witches Of Silver', 137, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (74, N'Lords Of Fire', 91, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (75, N'Enemies And Children', 282, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (76, N'Agents And Criminals', 167, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (77, N'Sword Of The Night', 112, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (78, N'Argument Of Sorrow', 114, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (79, N'Shelter At The Leaders', 172, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (80, N'Question The Emperor', 239, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (81, N'Army Of Heaven', 265, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (82, N'Duke Of Perfection', 265, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (83, N'Invaders Of The Banished', 257, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (84, N'Dogs Of The Eternal', 259, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (85, N'Snakes And Cats', 253, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (86, N'Butchers And Pirates', 91, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (87, N'Unity Of The Great', 159, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (88, N'Creation Of The Forsaken', 257, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (89, N'Forsaking Dreams', 166, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (90, N'Changing The Nation', 135, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (91, N'Thief ', 306, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (92, N'Warrior ', 248, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (93, N'Aliens Of Despair', 127, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (94, N'Gods And Strangers', 288, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (95, N'Criminals Of My Imagination', 119, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (96, N'Armies Of The Stars', 210, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (97, N'Honor And Enemies', 299, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (98, N'Crossbow Of A Storm', 283, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (99, N'Hiding Of History', 175, 2)
GO
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (100, N'Faith The Titans', 92, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (101, N'Guardian With Wings', 200, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (102, N'Butcher Of The Great', 279, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (103, N'Witches Of Fire ', 223, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (104, N'Lords Of Silver ', 301, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (105, N'Enemies And Criminals', 323, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (106, N'Agents And Children', 109, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (107, N'Sword Of Sorrow', 152, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (108, N'Argument Of The Night', 231, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (109, N'Shelter The Emperor', 139, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (110, N'Question At The Leaders', 200, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (111, N'Army Of Perfection', 55, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (112, N'Duke Of Heaven', 248, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (113, N'Invaders Of The Eternal', 180, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (114, N'Dogs Of The Banished', 66, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (115, N'Snakes And Pirates', 230, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (116, N'Butchers And Cats', 262, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (117, N'Unity Of The Forsaken', 208, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (118, N'Creation Of The Great', 166, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (119, N'Forsaking Dreams', 122, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (120, N'Changing The Nation', 242, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (121, NULL, 0, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1121, NULL, 0, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1122, NULL, 0, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1123, NULL, 0, 3)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1124, N'Game Of Throne', 0, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1125, NULL, 0, 0)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1126, NULL, 0, 0)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1127, N'Game Of Throne 2', 0, 2)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1128, NULL, 0, 0)
INSERT [dbo].[Livres] ([Id], [Titre], [Prix], [Taille]) VALUES (1129, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Livres] OFF
SET IDENTITY_INSERT [dbo].[RelationLivreVisiteurs] ON 

INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (1, 16870654, 3, CAST(N'2020-03-22T18:53:17.6726809' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (2, 46419782, 4, CAST(N'2020-03-22T18:53:20.1889410' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (3, 1228290, 5, CAST(N'2020-03-22T18:53:20.2008090' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (4, 63609545, 6, CAST(N'2020-03-22T18:53:20.2048362' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (5, 1228290, 7, CAST(N'2020-03-22T18:53:20.2069663' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (6, 1228290, 8, CAST(N'2020-03-22T18:53:20.2090845' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (7, 8603325, 9, CAST(N'2020-03-22T18:53:20.2112423' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (8, 47356388, 10, CAST(N'2020-03-22T18:53:20.2131966' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (9, 63609545, 11, CAST(N'2020-03-22T18:53:20.2154279' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (10, 66009902, 12, CAST(N'2020-03-22T18:53:20.2185269' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (11, 66009902, 13, CAST(N'2020-03-22T18:53:20.2215335' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (12, 16870654, 14, CAST(N'2020-03-22T18:53:20.2241843' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (13, 66009902, 15, CAST(N'2020-03-22T18:53:20.2263509' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (14, 63609545, 16, CAST(N'2020-03-22T18:53:20.2289149' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (15, 3165221, 17, CAST(N'2020-03-22T18:53:20.2313121' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (16, 66009902, 18, CAST(N'2020-03-22T18:53:20.2346016' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (17, 63609545, 19, CAST(N'2020-03-22T18:53:20.2377586' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (18, 1228290, 20, CAST(N'2020-03-22T18:53:20.2411069' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (19, 16870654, 21, CAST(N'2020-03-22T18:53:20.2443472' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (20, 8603325, 22, CAST(N'2020-03-22T18:53:20.2476688' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (21, 359513, 23, CAST(N'2020-03-22T18:53:20.2502000' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (22, 29513691, 24, CAST(N'2020-03-22T18:53:20.2526597' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (23, 46419782, 25, CAST(N'2020-03-22T18:53:20.2555928' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (24, 1228290, 26, CAST(N'2020-03-22T18:53:20.2579877' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (25, 8603325, 27, CAST(N'2020-03-22T18:53:20.2608010' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (26, 8603325, 28, CAST(N'2020-03-22T18:53:20.2633841' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (27, 3165221, 29, CAST(N'2020-03-22T18:53:20.2668081' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (28, 8603325, 30, CAST(N'2020-03-22T18:53:20.2694127' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (29, 63609545, 31, CAST(N'2020-03-22T18:53:20.2726658' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (30, 8603325, 32, CAST(N'2020-03-22T18:53:20.2753024' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (31, 46419782, 33, CAST(N'2020-03-22T18:53:20.2794753' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (32, 3165221, 34, CAST(N'2020-03-22T18:53:20.2830749' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (33, 46419782, 35, CAST(N'2020-03-22T18:53:20.2859008' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (34, 66009902, 36, CAST(N'2020-03-22T18:53:20.2886810' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (35, 29513691, 37, CAST(N'2020-03-22T18:53:20.2914286' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (36, 66009902, 38, CAST(N'2020-03-22T18:53:20.2942008' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (37, 66009902, 39, CAST(N'2020-03-22T18:53:20.2984908' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (38, 66009902, 40, CAST(N'2020-03-22T18:53:20.3482148' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (39, 8603325, 41, CAST(N'2020-03-22T18:53:20.3514291' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (40, 29513691, 42, CAST(N'2020-03-22T18:53:20.3617703' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (41, 63609545, 43, CAST(N'2020-03-22T18:53:20.4214635' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (42, 8603325, 44, CAST(N'2020-03-22T18:53:20.4529695' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (43, 47356388, 45, CAST(N'2020-03-22T18:53:20.4575593' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (44, 3165221, 46, CAST(N'2020-03-22T18:53:20.4620835' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (45, 29513691, 47, CAST(N'2020-03-22T18:53:20.4691223' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (46, 29513691, 48, CAST(N'2020-03-22T18:53:20.4738858' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (47, 46419782, 49, CAST(N'2020-03-22T18:53:20.4775955' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (48, 63609545, 50, CAST(N'2020-03-22T18:53:20.4804522' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (49, 16870654, 51, CAST(N'2020-03-22T18:53:20.4846315' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (50, 16870654, 52, CAST(N'2020-03-22T18:53:20.4882620' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (51, 359513, 53, CAST(N'2020-03-22T18:53:20.4915296' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (52, 47356388, 54, CAST(N'2020-03-22T18:53:20.4950339' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (53, 3165221, 55, CAST(N'2020-03-22T18:53:20.4985665' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (54, 46419782, 56, CAST(N'2020-03-22T18:53:20.5023030' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (55, 1228290, 57, CAST(N'2020-03-22T18:53:20.5060116' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (56, 1228290, 58, CAST(N'2020-03-22T18:53:20.5094595' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (57, 1228290, 59, CAST(N'2020-03-22T18:53:20.5164962' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (58, 1228290, 60, CAST(N'2020-03-22T18:53:20.5218098' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (59, 29513691, 61, CAST(N'2020-03-22T18:53:20.5293971' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (60, 359513, 62, CAST(N'2020-03-22T18:53:20.5353570' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (61, 16870654, 63, CAST(N'2020-03-22T18:53:20.5398795' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (62, 1228290, 64, CAST(N'2020-03-22T18:53:20.5458946' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (63, 8603325, 65, CAST(N'2020-03-22T18:53:20.5509768' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (64, 3165221, 66, CAST(N'2020-03-22T18:53:20.5561600' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (65, 46419782, 67, CAST(N'2020-03-22T18:53:20.5620813' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (66, 359513, 68, CAST(N'2020-03-22T18:53:20.5679522' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (67, 66009902, 69, CAST(N'2020-03-22T18:53:20.5731264' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (68, 1228290, 70, CAST(N'2020-03-22T18:53:20.5811121' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (69, 66009902, 71, CAST(N'2020-03-22T18:53:20.5844411' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (70, 8603325, 72, CAST(N'2020-03-22T18:53:20.5876497' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (71, 47356388, 73, CAST(N'2020-03-22T18:53:20.5910224' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (72, 46419782, 74, CAST(N'2020-03-22T18:53:20.5952520' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (73, 16870654, 75, CAST(N'2020-03-22T18:53:20.5985318' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (74, 8603325, 76, CAST(N'2020-03-22T18:53:20.6018319' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (75, 46419782, 77, CAST(N'2020-03-22T18:53:20.6051087' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (76, 46419782, 78, CAST(N'2020-03-22T18:53:20.6087622' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (77, 29513691, 79, CAST(N'2020-03-22T18:53:20.6131197' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (78, 66009902, 80, CAST(N'2020-03-22T18:53:20.6165678' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (79, 46419782, 81, CAST(N'2020-03-22T18:53:20.6198350' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (80, 47356388, 82, CAST(N'2020-03-22T18:53:20.6235033' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (81, 16870654, 83, CAST(N'2020-03-22T18:53:20.6279463' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (82, 16870654, 84, CAST(N'2020-03-22T18:53:20.6314811' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (83, 46419782, 85, CAST(N'2020-03-22T18:53:20.6355313' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (84, 47356388, 86, CAST(N'2020-03-22T18:53:20.6390833' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (85, 29513691, 87, CAST(N'2020-03-22T18:53:20.6429255' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (86, 16870654, 88, CAST(N'2020-03-22T18:53:20.6465264' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (87, 1228290, 89, CAST(N'2020-03-22T18:53:20.6501621' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (88, 1228290, 90, CAST(N'2020-03-22T18:53:20.6564843' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (89, 66009902, 91, CAST(N'2020-03-22T18:53:20.6608003' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (90, 29513691, 92, CAST(N'2020-03-22T18:53:20.6654198' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (91, 66009902, 93, CAST(N'2020-03-22T18:53:20.6799989' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (92, 66009902, 94, CAST(N'2020-03-22T18:53:20.6926514' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (93, 16870654, 95, CAST(N'2020-03-22T18:53:20.6969547' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (94, 29513691, 96, CAST(N'2020-03-22T18:53:20.7006586' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (95, 16870654, 97, CAST(N'2020-03-22T18:53:20.7072838' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (96, 63609545, 98, CAST(N'2020-03-22T18:53:20.7117197' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (97, 1228290, 99, CAST(N'2020-03-22T18:53:20.7155783' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (98, 63609545, 100, CAST(N'2020-03-22T18:53:20.7205191' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (99, 359513, 101, CAST(N'2020-03-22T18:53:20.7240158' AS DateTime2))
GO
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (100, 63609545, 102, CAST(N'2020-03-22T18:53:20.7280500' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (101, 8603325, 103, CAST(N'2020-03-22T18:53:20.7314607' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (102, 29513691, 104, CAST(N'2020-03-22T18:53:20.7351057' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (103, 46419782, 105, CAST(N'2020-03-22T18:53:20.7383410' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (104, 46419782, 106, CAST(N'2020-03-22T18:53:20.7416793' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (105, 359513, 107, CAST(N'2020-03-22T18:53:20.7452871' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (106, 8603325, 108, CAST(N'2020-03-22T18:53:20.7494420' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (107, 66009902, 109, CAST(N'2020-03-22T18:53:20.7529779' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (108, 1228290, 110, CAST(N'2020-03-22T18:53:20.7562263' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (109, 1228290, 111, CAST(N'2020-03-22T18:53:20.7602151' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (110, 29513691, 112, CAST(N'2020-03-22T18:53:20.7638330' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (111, 63609545, 113, CAST(N'2020-03-22T18:53:20.7679434' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (112, 359513, 114, CAST(N'2020-03-22T18:53:20.7713415' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (113, 46419782, 115, CAST(N'2020-03-22T18:53:20.7751220' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (114, 46419782, 116, CAST(N'2020-03-22T18:53:20.7794691' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (115, 8603325, 117, CAST(N'2020-03-22T18:53:20.7832306' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (116, 1228290, 118, CAST(N'2020-03-22T18:53:20.7868147' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (117, 46419782, 119, CAST(N'2020-03-22T18:53:20.7904648' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (118, 3165221, 120, CAST(N'2020-03-22T18:53:20.7957483' AS DateTime2))
INSERT [dbo].[RelationLivreVisiteurs] ([LivreId], [VisiteurId], [Id], [Trace]) VALUES (119, 47356388, 121, CAST(N'2020-03-22T18:53:20.7995656' AS DateTime2))
SET IDENTITY_INSERT [dbo].[RelationLivreVisiteurs] OFF
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (41061, N'Frederic Kearney', NULL, NULL, N'Novice', 5, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (359513, N'Taran Greig', N'1 oscars', 2, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (1228290, N'Minahil Callahan', N'2 oscars', 6, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (2399524, N'Hugh Roth', NULL, NULL, N'experienced', 10, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (3165221, N'Talha Vinson', N'1 oscars', 4, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (4322080, N'Wil Bond', NULL, NULL, N'experienced', 3, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (5009246, N'Delores Oneil', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (8541776, N'Elliot Le', NULL, NULL, N'experienced', 11, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (8603325, N'Aayan Baxter', N'4 oscars', 2, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (12185796, N'Gaia Baxter', NULL, NULL, N'experienced', 5, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (13063473, N'Austen Long', NULL, NULL, N'Novice', 4, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (16001149, N'Eleasha Crouch', NULL, NULL, N'experienced', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (16321512, N'Elleanor Pollard', NULL, NULL, N'Novice', 7, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (16870654, N'Amir Felix', N'4 oscars', 8, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (17713017, N'Hamaad Dolan', NULL, NULL, N'Novice', 0, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (20341925, N'Tomi Hamer', NULL, NULL, N'Novice', 7, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (22597652, N'Juno Hackett', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (24428686, N'Pola Sinclair', NULL, NULL, N'experienced', 11, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (29513691, N'Daniella Gilbert', N'3 oscars', 5, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (29979226, N'Aubree Bradshaw', NULL, NULL, N'experienced', 5, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (30474330, N'Annaliese Huerta', NULL, NULL, N'Novice', 11, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (31209679, N'Aeryn O Neill', NULL, NULL, N'experienced', 8, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (31981697, N'Lynn Harrell', NULL, NULL, N'experienced', 8, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (34106743, N'Nadir Carr', NULL, NULL, NULL, NULL, N'Moderateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (34799956, N'Tania Aguilar', NULL, NULL, N'experienced', 3, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (35243222, N'Isha Driscoll', NULL, NULL, NULL, NULL, N'Moderateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (35319771, N'Terrell Watt', NULL, NULL, NULL, NULL, N'Moderateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (36528427, N'Tashan Benson', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (40807399, N'Lia Davies', NULL, NULL, N'experienced', 8, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (40953208, N'Chaya Vu', NULL, NULL, N'experienced', 3, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (41065483, N'Shola Cantrell', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (41629729, N'Fahim Morrison', NULL, NULL, N'Novice', 5, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (42614420, N'Rhiannon Fox', NULL, NULL, N'experienced', 11, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (44018709, N'Diego Corrigan', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (44597241, N'Aminah Sanderson', NULL, NULL, N'Novice', 3, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (45598209, N'Lacey-Mae Mackie', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (46369596, N'Nojus Richmond', NULL, NULL, N'experienced', 7, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (46419782, N'Rowena Lynch', N'1 oscars', 3, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (47129288, N'Alina Houston', NULL, NULL, NULL, NULL, N'Moderateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (47356388, N'Alessandro Bradley', N'1 oscars', 3, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (47403907, N'Ariyan Rahman', NULL, NULL, N'Novice', 10, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (48780169, N'Ed Povey', NULL, NULL, N'experienced', 0, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (50697561, N'Ruqayyah Patterson', NULL, NULL, N'experienced', 9, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (50848483, N'Makenzie Wagstaff', NULL, NULL, N'Novice', 0, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (51791499, N'Sanjay Cote', NULL, NULL, N'Novice', 4, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (53324351, N'Raife Alcock', NULL, NULL, N'Novice', 9, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (54116930, N'Ikrah Massey', NULL, NULL, N'Novice', 6, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (54814357, N'Kaleem Kaiser', NULL, NULL, N'Novice', 1, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (56456672, N'Ebony Andersen', NULL, NULL, N'experienced', 9, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (60223214, N'Arianne Horne', NULL, NULL, N'experienced', 11, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (62632450, N'Raheem Bennett', NULL, NULL, N'Novice', 6, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (63037041, N'Clarence Madden', NULL, NULL, N'experienced', 7, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (63464403, N'Allison Norton', NULL, NULL, N'experienced', 4, N'Utilisateur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (63609545, N'Jaxon Edge', N'1 oscars', 3, NULL, NULL, N'Auteur')
INSERT [dbo].[Visiteurs] ([Id], [Nom], [Palmares], [Rang], [Profil], [SessionsParJour], [Discriminator]) VALUES (66009902, N'Kris Salinas', N'1 oscars', 6, NULL, NULL, N'Auteur')
ALTER TABLE [dbo].[Visiteurs] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[RelationLivreVisiteurs]  WITH CHECK ADD  CONSTRAINT [FK_RelationLivreVisiteurs_Livres] FOREIGN KEY([LivreId])
REFERENCES [dbo].[Livres] ([Id])
GO
ALTER TABLE [dbo].[RelationLivreVisiteurs] CHECK CONSTRAINT [FK_RelationLivreVisiteurs_Livres]
GO
ALTER TABLE [dbo].[RelationLivreVisiteurs]  WITH CHECK ADD  CONSTRAINT [FK_RelationLivreVisiteurs_Visiteurs] FOREIGN KEY([VisiteurId])
REFERENCES [dbo].[Visiteurs] ([Id])
GO
ALTER TABLE [dbo].[RelationLivreVisiteurs] CHECK CONSTRAINT [FK_RelationLivreVisiteurs_Visiteurs]
GO
/****** Object:  StoredProcedure [dbo].[sp_AvgPrix]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AvgPrix]
AS
    BEGIN	
		SELECT AVG([Prix]) FROM 
		[dbo].[Livres]
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_AvgSessionParJour]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AvgSessionParJour]
AS
    BEGIN	
		SELECT AVG([SessionsParJour]) FROM 
		[dbo].[Visiteurs]
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_CountSessionParJour]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CountSessionParJour]
AS
    BEGIN	
		SELECT COUNT([SessionsParJour]) FROM 
		[dbo].[Visiteurs]
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_MaxPrix]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MaxPrix]
AS
    BEGIN	
		SELECT MAX([Prix]) FROM 
		[dbo].[Livres]
	END

	
GO
/****** Object:  StoredProcedure [dbo].[sp_MaxSessionParJour]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MaxSessionParJour]
AS
    BEGIN	
		SELECT MAX([SessionsParJour]) FROM 
		[dbo].[Visiteurs]
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_MinPrix]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MinPrix]
AS
    BEGIN	
		SELECT MIN([Prix]) FROM 
		[dbo].[Livres]
	END

	
GO
/****** Object:  StoredProcedure [dbo].[sp_MinSessionParJour]    Script Date: 4/15/2020 4:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MinSessionParJour]
AS
    BEGIN	
		SELECT MIN([SessionsParJour]) FROM 
		[dbo].[Visiteurs]
	END
GO
