CREATE DATABASE [VETERINARY]

USE [VETERINARY]
GO
/****** Object:  Table [dbo].[Breed]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breed](
	[Breed_ID] [int] IDENTITY(1,1) NOT NULL,
	[Breed_Description] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Breed_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[Pet_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Name] [varchar](100) NOT NULL,
	[Pet_Gender] [varchar](40) NOT NULL,
	[Pet_Age] [int] NOT NULL,
	[Pet_Weight] [varchar](10) NULL,
	[Pet_Vaccines] [bit] NOT NULL,
	[Pet_MicroChip] [bit] NOT NULL,
	[Pet_CodeMicroChip] [varchar](100) NULL,
	[Pet_Observations] [varchar](800) NULL,
	[Pet_RegistrationDate] [datetime] NULL,
	[Breed_Id] [int] NOT NULL,
	[TypePet_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePet]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePet](
	[TypePet_Id] [int] IDENTITY(1,1) NOT NULL,
	[TypePet_Description] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypePet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Breed] ON 

INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (1, N'Akita')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (2, N'Akita americano')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (3, N'Alaskan Husky')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (4, N'Beagle')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (5, N'Boyero de Montaña Bernes')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (6, N'Bull terrier')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (7, N'Bulldog americano')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (8, N'Bulldog inglés')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (9, N'Bulldog francés')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (10, N'Chihuahua')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (11, N'Chow Chow')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (12, N'Cocker Spaniel Inglés')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (13, N'Collie de Pelo Cort')
INSERT [dbo].[Breed] ([Breed_ID], [Breed_Description]) VALUES (14, N'Dobermann')
SET IDENTITY_INSERT [dbo].[Breed] OFF
GO


SET IDENTITY_INSERT [dbo].[TypePet] ON 

INSERT [dbo].[TypePet] ([TypePet_Id], [TypePet_Description]) VALUES (1, N'CAT')
INSERT [dbo].[TypePet] ([TypePet_Id], [TypePet_Description]) VALUES (2, N'DOG')
INSERT [dbo].[TypePet] ([TypePet_Id], [TypePet_Description]) VALUES (3, N'BIRD')
INSERT [dbo].[TypePet] ([TypePet_Id], [TypePet_Description]) VALUES (4, N'RODENTS')
SET IDENTITY_INSERT [dbo].[TypePet] OFF
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Breed_Pets] FOREIGN KEY([Breed_Id])
REFERENCES [dbo].[Breed] ([Breed_ID])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Breed_Pets]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Type_Pets] FOREIGN KEY([TypePet_Id])
REFERENCES [dbo].[TypePet] ([TypePet_Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Type_Pets]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_PETS]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_DELETE_PETS]
	(
		@Pet_Id int
	)
AS

BEGIN
DELETE Pets	 Where Pet_Id = @Pet_Id		 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BREED]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_BREED]
AS
BEGIN
select B.Breed_ID,B.Breed_Description
from Breed B

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PETS]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_PETS]
AS
BEGIN
select P.Pet_Id,P.Pet_Name,P.Pet_Gender,P.Pet_Age,P.Pet_Weight,
	   P.Pet_Vaccines,P.Pet_MicroChip,P.Pet_CodeMicroChip,
	   P.Pet_Observations,P.Pet_RegistrationDate,
	   B.Breed_Description,T.TypePet_Description 
from Pets P
Left Join  Breed B
on P.Breed_ID = B.Breed_ID
left Join TypePet T
on P.TypePet_Id = T.TypePet_Id


END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_TYPEPET]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_TYPEPET]
AS
BEGIN
select T.TypePet_Id,T.TypePet_Description
from TypePet T

END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PETS]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_INSERT_PETS]
	(
		@Pet_Name varchar(100),
		@Pet_Gender varchar(40),
		@Pet_Age int,
		@Pet_Weight varchar(10)= NULL,
		@Pet_Vaccines bit,
		@Pet_MicroChip bit,
		@Pet_CodeMicroChip varchar(100) = NULL,
		@Pet_Observations varchar(800) = NULL,
		@Breed_Id int,
		@TypePet_Id int
	)
AS

BEGIN

INSERT INTO Pets(Pet_Name,Pet_Gender,Pet_Age,Pet_Weight,
				 Pet_Vaccines,Pet_MicroChip,Pet_CodeMicroChip,
				 Pet_Observations,Pet_RegistrationDate,Breed_Id,TypePet_Id)
		VALUES ( @Pet_Name,@Pet_Gender,@Pet_Age,@Pet_Weight,
				 @Pet_Vaccines,@Pet_MicroChip,@Pet_CodeMicroChip,
				 @Pet_Observations,GETDATE(),@Breed_Id,@TypePet_Id)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PETS]    Script Date: 5/08/2022 4:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_UPDATE_PETS]
	(
		@Pet_Id int,
		@Pet_Name varchar(100),
		@Pet_Gender varchar(40),
		@Pet_Age int,
		@Pet_Weight varchar(10)= NULL,
		@Pet_Vaccines bit,
		@Pet_MicroChip bit,
		@Pet_CodeMicroChip varchar(100),
		@Pet_Observations varchar(800) ,
		@Breed_Id int,
		@TypePet_Id int
	)
AS

BEGIN
UPDATE Pets
	SET  Pet_Name = @Pet_Name,
		 Pet_Gender = @Pet_Gender,
		 Pet_Age = @Pet_Age,
		 Pet_Weight = @Pet_Weight,
		 Pet_Vaccines = @Pet_Vaccines,
		 Pet_MicroChip = @Pet_MicroChip,
		 Pet_CodeMicroChip = @Pet_CodeMicroChip,
		 Pet_Observations = @Pet_Observations,
		-- Pet_RegistrationDate = @Pet_RegistrationDate,
		 Breed_Id = @Breed_Id,
		 TypePet_Id = @TypePet_Id
		 Where  Pet_Id = @Pet_Id		 

END
GO
