USE [master]
GO
/****** Object:  Database [MundoDisneyBD]    Script Date: 2/6/2023 09:57:35 ******/
CREATE DATABASE [MundoDisneyBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MundoDisneyBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MundoDisneyBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MundoDisneyBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MundoDisneyBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MundoDisneyBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MundoDisneyBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MundoDisneyBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MundoDisneyBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MundoDisneyBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MundoDisneyBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MundoDisneyBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET RECOVERY FULL 
GO
ALTER DATABASE [MundoDisneyBD] SET  MULTI_USER 
GO
ALTER DATABASE [MundoDisneyBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MundoDisneyBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MundoDisneyBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MundoDisneyBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MundoDisneyBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MundoDisneyBD', N'ON'
GO
ALTER DATABASE [MundoDisneyBD] SET QUERY_STORE = OFF
GO
USE [MundoDisneyBD]
GO
/****** Object:  User [Disney]    Script Date: 2/6/2023 09:57:36 ******/
CREATE USER [Disney] FOR LOGIN [Disney] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 2/6/2023 09:57:36 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Disney]
GO
/****** Object:  Table [dbo].[PeliSerie]    Script Date: 2/6/2023 09:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliSerie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](8000) NULL,
	[Titulo] [varchar](50) NULL,
	[FechaCreacion] [date] NULL,
	[Calificacion] [float] NULL,
 CONSTRAINT [PK_PeliSerie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 2/6/2023 09:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](4000) NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Peso] [float] NULL,
	[Historia] [varchar](4000) NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonajeXPeliSerie]    Script Date: 2/6/2023 09:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonajeXPeliSerie](
	[IdPersonaje] [int] NULL,
	[IdPeliSerie] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeliSerie] ON 

INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (1, N'https://static.wikia.nocookie.net/doblaje/images/d/d9/ElHombreAra%C3%B1a.jpg/revision/latest?cb=20110116183239&path-prefix=es', N'Spider-Man', CAST(N'2002-04-29' AS Date), 3.7)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (2, N'https://play-lh.googleusercontent.com/vmwvke9JmwNsEKiMk1gV6cmcHQbyxajCSnLi8HTI6ZON_mS-I8CW4mt5qciVuFYVioUs', N'Pinocchio', CAST(N'1940-02-23' AS Date), 3.8)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (3, N'https://es.web.img3.acsta.net/medias/nmedia/18/73/54/02/20415767.jpg', N'Aldin', CAST(N'1992-10-25' AS Date), 4)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (4, N'https://es.web.img3.acsta.net/c_310_420/pictures/14/03/18/10/23/226614.jpg', N'Dinosaurios', CAST(N'2000-05-19' AS Date), 3.2)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (5, N'https://pics.filmaffinity.com/Robin_Hood-416040707-large.jpg', N'Robin Hood', CAST(N'1973-10-08' AS Date), 3.8)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (6, N'https://es.web.img3.acsta.net/medias/nmedia/18/80/54/24/19548867.jpg', N'Peter Pan', CAST(N'1953-07-07' AS Date), 3.3)
INSERT [dbo].[PeliSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (7, N'https://www.ecartelera.com/carteles/15800/15882/005_m.jpg', N'Spiderman: No Way Home', CAST(N'2021-12-13' AS Date), 4.1)
SET IDENTITY_INSERT [dbo].[PeliSerie] OFF
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'https://hollywoodlife.com/wp-content/uploads/2021/12/pinocchio-live-action-everett-collection-embed.jpg', N'Pinocchio', 75, 4, N'
Pinocchio cuenta la historia de una marioneta tallada por un viejo carpintero llamado Geppetto, que cobra vida gracias a la intervención de un hada. El objetivo de Pinocchio es convertirse en un niño real, pero se enfrenta a numerosas pruebas y tentaciones en su camino, como la mentira y la desobediencia. A través de sus aventuras, aprende valiosas lecciones sobre la honestidad, la responsabilidad y el amor filial, hasta que finalmente, después de superar obstáculos y sacrificios, se transforma en un niño de verdad.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (3, N'https://cdn.shopify.com/s/files/1/1395/2179/files/pantalon_aladino_large.png?v=1560455095', N'Aladin', 18, 60, N'Aladino narra la historia de un joven callejero que encuentra una lámpara mágica que contiene un genio poderoso. Aladino utiliza los deseos concedidos por el genio para mejorar su vida y conquistar el corazón de la princesa Jasmine. Sin embargo, un malvado hechicero intenta robar la lámpara para sus propios propósitos maliciosos. Con astucia y valentía, Aladino lucha contra el villano y utiliza su último deseo para liberar al genio, demostrando que el amor y la amistad son más valiosos que cualquier deseo material. Al final, Aladino y Jasmine encuentran la felicidad y el amor verdadero.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (4, N'https://pbs.twimg.com/profile_images/494661379526111232/4BhsivNF_400x400.jpeg', N'Aladar', 50, 5000, N'Aladar es la historia de un dinosaurio iguanodonte que es adoptado por una familia de dinosaurios lemures después de que su huevo se separa de su manada durante la extinción de los dinosaurios. Al crecer, Aladar se convierte en un líder y guía a su nueva familia y a otros dinosaurios en un peligroso viaje en busca de un lugar seguro. A través de desafíos y sacrificios, Aladar demuestra el poder del trabajo en equipo y la compasión, mientras lucha por sobrevivir en un mundo cambiante y hostil.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (8, N'https://hips.hearstapps.com/digitalspyuk.cdnds.net/16/02/1452771009-movies-robin-hood-disney.jpg?resize=480:*', N'Robin Hood', 20, 75, N'
Robin Hood es la legendaria historia de un hábil arquero y proscrito que roba a los ricos para darle a los pobres en el bosque de Sherwood. Liderando a un grupo de forajidos, desafía al corrupto Príncipe Juan y su cruel sirviente, el Sheriff de Nottingham. Robin Hood se convierte en un símbolo de la justicia y la resistencia contra la opresión, defendiendo a los desfavorecidos y luchando por un mundo más equitativo en la Inglaterra medieval.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (9, N'https://static.wikia.nocookie.net/disney/images/8/82/PeterPan.png/revision/latest?cb=20121006101543&path-prefix=es', N'Peter Pan', 12, 30, N'Peter Pan es la historia de un niño que se niega a crecer y vive en el País de Nunca Jamás. Junto a su hada compañera, Campanita, lleva a los niños perdidos en aventuras mágicas. Allí, se enfrenta al malvado Capitán Garfio y su tripulación pirata. Peter Pan muestra a los niños que la imaginación y la libertad son esenciales, pero también revela la nostalgia y los desafíos de nunca crecer.')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
INSERT [dbo].[PersonajeXPeliSerie] ([IdPersonaje], [IdPeliSerie]) VALUES (2, 2)
INSERT [dbo].[PersonajeXPeliSerie] ([IdPersonaje], [IdPeliSerie]) VALUES (3, 3)
INSERT [dbo].[PersonajeXPeliSerie] ([IdPersonaje], [IdPeliSerie]) VALUES (4, 4)
INSERT [dbo].[PersonajeXPeliSerie] ([IdPersonaje], [IdPeliSerie]) VALUES (8, 5)
INSERT [dbo].[PersonajeXPeliSerie] ([IdPersonaje], [IdPeliSerie]) VALUES (9, 6)
GO
ALTER TABLE [dbo].[PersonajeXPeliSerie]  WITH CHECK ADD  CONSTRAINT [FK_PersonajeXPeliSerie_PeliSerie] FOREIGN KEY([IdPeliSerie])
REFERENCES [dbo].[PeliSerie] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonajeXPeliSerie] CHECK CONSTRAINT [FK_PersonajeXPeliSerie_PeliSerie]
GO
ALTER TABLE [dbo].[PersonajeXPeliSerie]  WITH CHECK ADD  CONSTRAINT [FK_PersonajeXPeliSerie_Personaje] FOREIGN KEY([IdPersonaje])
REFERENCES [dbo].[Personaje] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonajeXPeliSerie] CHECK CONSTRAINT [FK_PersonajeXPeliSerie_Personaje]
GO
USE [master]
GO
ALTER DATABASE [MundoDisneyBD] SET  READ_WRITE 
GO
