USE [master]
GO
/****** Object:  Database [MarCo]    Script Date: 27/11/2023 02:13:44 a. m. ******/
CREATE DATABASE [MarCo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarCo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MarCo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarCo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MarCo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MarCo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarCo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarCo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarCo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarCo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarCo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarCo] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarCo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarCo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarCo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarCo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarCo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarCo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarCo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarCo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarCo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarCo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MarCo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarCo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarCo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarCo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarCo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarCo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarCo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarCo] SET RECOVERY FULL 
GO
ALTER DATABASE [MarCo] SET  MULTI_USER 
GO
ALTER DATABASE [MarCo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarCo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarCo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarCo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarCo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarCo] SET QUERY_STORE = OFF
GO
USE [MarCo]
GO
/****** Object:  User [MarCo]    Script Date: 27/11/2023 02:13:44 a. m. ******/
CREATE USER [MarCo] FOR LOGIN [MarCo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MarCo]
GO
/****** Object:  Table [dbo].[Agendas]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agendas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[ApellidoCliente] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Fecha] [date] NULL,
	[fkUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Apellido] [varchar](150) NOT NULL,
	[Mail] [varchar](150) NOT NULL,
	[fkUsuario] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id] [nvarchar](50) NOT NULL,
	[Cuit] [int] NULL,
	[Nombre] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reuniones]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reuniones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](150) NOT NULL,
	[Formato] [nvarchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Imagen] [varchar](max) NULL,
	[fkUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Reuniones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Nota] [varchar](max) NOT NULL,
	[Estado] [varchar](50) NULL,
	[Fecha] [date] NOT NULL,
	[fkUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Apellido] [varchar](150) NOT NULL,
	[Contraseña] [varchar](150) NOT NULL,
	[Mail] [varchar](150) NOT NULL,
	[fkRol] [int] NOT NULL,
	[fkEmpresa] [nvarchar](50) NOT NULL,
	[Cuit] [int] NULL,
 CONSTRAINT [PK_Dueño] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioXReunion]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXReunion](
	[IdUsuario] [int] NOT NULL,
	[IdReunion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 27/11/2023 02:13:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[fkUsuario] [int] NOT NULL,
	[fkEstado] [int] NOT NULL,
	[fkCliente] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agendas] ON 

INSERT [dbo].[Agendas] ([Id], [NombreCliente], [ApellidoCliente], [Telefono], [Descripcion], [Fecha], [fkUsuario]) VALUES (1, N'alberto', N'cuch', 1122343456, N'rhgrh', CAST(N'2023-12-12' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Agendas] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (1, N'ivoooo', N'singer', N'ari@gmail.com', 1, 1122758572)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (11, N'martin', N'perez', N'arthththi@gmail.com', 1, 1134546678)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (12, N'alejandro', N'rodriguez', N'ale123@gmail.com', 1, 1134213465)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (13, N'alejandro', N'rodriguez', N'ale1234@gmail.com', 9, 1134213465)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (14, N'albert', N'sus', N'alber@gmail.com', 8, 1134546578)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (15, N'alejandro', N'rodriguez', N'ale123467@gmail.com', 1, 1134213465)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (16, N'alvareo', N'efw', N'xususu@gmail.com', 1, 112232234)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (1021, N'rt', N'srt', N'srt@gmail.com', 23, 123345)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (1022, N'sdg', N'sfg', N'sfg@gmail.com', 23, 123234)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (1023, N'sususu', N'sususu', N'dokifn@gmail.com', 23, 122323)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Apellido], [Mail], [fkUsuario], [Telefono]) VALUES (1024, N'rgrg', N'rwg', N'srwg@gmail.com', 33, 121223)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N' L2OmFvq1', 123456, N'adrfsfhg')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N' P9GR3xin', 12334, N'rjgrgji')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'1', 123, N'Microsoft')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'2', 2234, N'SmanWatches')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'3', 1234545, N'steam')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'5VXVpuIZ', 45, N'ghgh')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'aerthg', 6765, N'Nombre')
INSERT [dbo].[Empresa] ([Id], [Cuit], [Nombre]) VALUES (N'PpU29GOI', 123434, N'prueba')
GO
SET IDENTITY_INSERT [dbo].[Reuniones] ON 

INSERT [dbo].[Reuniones] ([Id], [Titulo], [Formato], [Fecha], [Imagen], [fkUsuario]) VALUES (1, N'cfhg', N'Presencial', CAST(N'2023-12-06' AS Date), N'', 23)
INSERT [dbo].[Reuniones] ([Id], [Titulo], [Formato], [Fecha], [Imagen], [fkUsuario]) VALUES (2, N'<dsf', N'Presencial', CAST(N'2023-11-29' AS Date), N'', 31)
INSERT [dbo].[Reuniones] ([Id], [Titulo], [Formato], [Fecha], [Imagen], [fkUsuario]) VALUES (3, N'srgh', N'Llamada', CAST(N'2023-12-07' AS Date), N'', 33)
SET IDENTITY_INSERT [dbo].[Reuniones] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (1, N'Jefe')
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (2, N'Vendedor')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Tareas] ON 

INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1, N'llamar a albertsus', N'hacer un llamado ', N'Urgente', CAST(N'2023-11-12' AS Date), 1)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (2, N'reunion de empresas', N'asistir a la reuion', N'Realizado', CAST(N'2023-12-20' AS Date), 1)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (3, N'atender reclamo ', N'atender el relcamo de la empresa Ombu', N'Urgente', CAST(N'2023-12-15' AS Date), 1)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (6, N'sfdag', N'ardgh', N'Realizado', CAST(N'2023-11-10' AS Date), 18)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (7, N'srgf', N'srg', N'', CAST(N'2023-11-09' AS Date), 1)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (8, N'rg', N'etqg', N'', CAST(N'2023-11-17' AS Date), 1)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1009, N'sdfsd', N'sdsds', N'Realizado', CAST(N'2023-11-30' AS Date), 31)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1010, N'<sdg', N'<sfg', N'Por realizar', CAST(N'2023-11-29' AS Date), 32)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1011, N'papu', N'carlos', N'Realizado', CAST(N'2023-11-30' AS Date), 32)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1012, N'papu', N'sito', N'Por realizar', CAST(N'2023-12-01' AS Date), 23)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1013, N'srg', N'srg', N'Por realizar', CAST(N'2023-11-28' AS Date), 23)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1014, N'ghjgh', N'ghgh', N'Realizado', CAST(N'2023-11-24' AS Date), 23)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Nota], [Estado], [Fecha], [fkUsuario]) VALUES (1015, N'zsdhg', N'dth', N'Por realizar', CAST(N'2023-11-30' AS Date), 33)
SET IDENTITY_INSERT [dbo].[Tareas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (1, N'ari', N'cohen', N'123', N'ari@gmail.com', 2, N'1', 123)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (2, N'martin', N'perez', N'123', N'artgi@gmail.com', 1, N'1', 12345)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (7, N'martinf', N'perezfg', N'123', N'martin202020@gmail.com', 1, N'1', 12345)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (10, N'esteban', N'rodriguez', N'123', N'ari2012@7gmail.com', 1, N'1', 12345)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (11, N'roberto', N'carlos', N'123', N'roberto@gmail.com', 1, N'3', 12345)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (18, N'sus', N'sususu', N'123', N'ola@gmail.com', 2, N'3', 1234565)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (23, N'ghgh', N'arsetg', N'123', N'pipi@mail.com', 1, N'5VXVpuIZ', 45)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (31, N'papa', N'quemada', N'123', N'dujgbn@gmail.com', 2, N'5VXVpuIZ', NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (32, N'ari', N'sus', N'123', N'sususu@gmail.com', 2, N'5VXVpuIZ', NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Contraseña], [Mail], [fkRol], [fkEmpresa], [Cuit]) VALUES (33, N'prueba', N'prueba', N'123', N'prueba@gmail.com', 1, N'PpU29GOI', 123434)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Agendas]  WITH CHECK ADD  CONSTRAINT [FK_Agenda_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Agendas] CHECK CONSTRAINT [FK_Agenda_Usuarios]
GO
ALTER TABLE [dbo].[Reuniones]  WITH CHECK ADD  CONSTRAINT [FK_Reuniones_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Reuniones] CHECK CONSTRAINT [FK_Reuniones_Usuarios]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empresa] FOREIGN KEY([fkEmpresa])
REFERENCES [dbo].[Empresa] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empresa]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([fkRol])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
ALTER TABLE [dbo].[UsuarioXReunion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXReunion_Reuniones] FOREIGN KEY([IdReunion])
REFERENCES [dbo].[Reuniones] ([Id])
GO
ALTER TABLE [dbo].[UsuarioXReunion] CHECK CONSTRAINT [FK_UsuarioXReunion_Reuniones]
GO
ALTER TABLE [dbo].[UsuarioXReunion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXReunion_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[UsuarioXReunion] CHECK CONSTRAINT [FK_UsuarioXReunion_Usuarios]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Estado] FOREIGN KEY([fkEstado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Estado]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [MarCo] SET  READ_WRITE 
GO
