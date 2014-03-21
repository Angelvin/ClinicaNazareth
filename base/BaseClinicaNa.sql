USE [master]
GO
/****** Object:  Database [respaldo ]    Script Date: 06/03/2014 19:07:55 ******/
CREATE DATABASE [respaldo ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'respaldo', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANGEL\MSSQL\DATA\respaldo .mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'respaldo _log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANGEL\MSSQL\DATA\respaldo _log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [respaldo ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [respaldo ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [respaldo ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [respaldo ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [respaldo ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [respaldo ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [respaldo ] SET ARITHABORT OFF 
GO
ALTER DATABASE [respaldo ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [respaldo ] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [respaldo ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [respaldo ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [respaldo ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [respaldo ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [respaldo ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [respaldo ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [respaldo ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [respaldo ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [respaldo ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [respaldo ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [respaldo ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [respaldo ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [respaldo ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [respaldo ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [respaldo ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [respaldo ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [respaldo ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [respaldo ] SET  MULTI_USER 
GO
ALTER DATABASE [respaldo ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [respaldo ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [respaldo ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [respaldo ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [respaldo ]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo](
	[id_car] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descrpcion] [varchar](90) NULL,
 CONSTRAINT [PK_cargo] PRIMARY KEY CLUSTERED 
(
	[id_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dieta]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dieta](
	[id_die] [int] IDENTITY(1,1) NOT NULL,
	[fecha_ini] [datetime] NULL,
	[fecha_final] [varchar](50) NULL,
	[contenido] [varchar](150) NULL,
	[descripcion] [varchar](150) NULL,
	[id_hist] [int] NULL,
 CONSTRAINT [PK_dieta] PRIMARY KEY CLUSTERED 
(
	[id_die] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[id_emp] [int] IDENTITY(1,1) NOT NULL,
	[primer_nom] [varchar](50) NULL,
	[segundo_nom] [varchar](50) NOT NULL,
	[primer_ape] [varchar](50) NULL,
	[segundo_ape] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NULL,
	[fecha_nac] [datetime] NULL,
	[id_temp] [int] NULL,
	[id_cargo] [int] NULL,
	[id_login] [int] NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[id_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[examen]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[examen](
	[id_exa] [int] IDENTITY(1,1) NOT NULL,
	[fecha_sol] [datetime] NULL,
	[fecha_apli] [datetime] NULL,
	[observaciones] [varchar](50) NULL,
	[id_tex] [int] NULL,
	[id_resul] [int] NULL,
	[id_hist] [int] NULL,
 CONSTRAINT [PK_examen] PRIMARY KEY CLUSTERED 
(
	[id_exa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[factura]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_fac] [int] IDENTITY(1,1) NOT NULL,
	[fecha_cre] [datetime] NULL,
	[id_pac] [int] NULL,
	[id_emp] [int] NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[id_fac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historial]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historial](
	[id_his] [int] IDENTITY(1,1) NOT NULL,
	[fecha_ini] [datetime] NULL,
	[horario] [varchar](50) NULL,
	[contenido] [varchar](150) NULL,
	[descripcion] [varchar](150) NULL,
	[fecha_fin] [datetime] NULL,
	[id_tra] [int] NULL,
 CONSTRAINT [PK_historial] PRIMARY KEY CLUSTERED 
(
	[id_his] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
	[id_rol] [int] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paciente](
	[id_pac] [int] IDENTITY(1,1) NOT NULL,
	[primer_nom] [varchar](50) NULL,
	[segundo_nom] [varchar](50) NOT NULL,
	[primer_ape] [varchar](50) NULL,
	[segundo_ape] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NULL,
	[fecha_nac] [datetime] NULL,
	[id_hist] [int] NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[id_pac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pago]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pago](
	[id_pag] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[mont] [numeric](18, 0) NULL,
	[id_fac] [int] NULL,
	[id_tipopago] [int] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[id_pag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resultado]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resultado](
	[id_res] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_resultado] PRIMARY KEY CLUSTERED 
(
	[id_res] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](50) NULL,
	[descripcion_rol] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_empleado]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_empleado](
	[id_temp] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](80) NULL,
 CONSTRAINT [PK_tipo_empleado] PRIMARY KEY CLUSTERED 
(
	[id_temp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_examen]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_examen](
	[id_tex] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](90) NULL,
 CONSTRAINT [PK_tipo_examen] PRIMARY KEY CLUSTERED 
(
	[id_tex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[id_tpago] [int] IDENTITY(1,1) NOT NULL,
	[descrpcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[id_tpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_tratamiento]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_tratamiento](
	[id_ttra] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_tratamiento] PRIMARY KEY CLUSTERED 
(
	[id_ttra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tratamiento]    Script Date: 06/03/2014 19:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tratamiento](
	[id_trat] [int] IDENTITY(1,1) NOT NULL,
	[fecha_ini] [datetime] NULL,
	[fecha_sol] [datetime] NULL,
	[observaciones] [varchar](150) NULL,
	[fecha_fin] [datetime] NULL,
	[id_ttra] [int] NULL,
 CONSTRAINT [PK_tratamiento] PRIMARY KEY CLUSTERED 
(
	[id_trat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[dieta]  WITH CHECK ADD  CONSTRAINT [FK_dieta_historial] FOREIGN KEY([id_hist])
REFERENCES [dbo].[historial] ([id_his])
GO
ALTER TABLE [dbo].[dieta] CHECK CONSTRAINT [FK_dieta_historial]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_cargo1] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[cargo] ([id_car])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_cargo1]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_login1] FOREIGN KEY([id_login])
REFERENCES [dbo].[login] ([id_login])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_login1]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_tipo_empleado1] FOREIGN KEY([id_temp])
REFERENCES [dbo].[tipo_empleado] ([id_temp])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_tipo_empleado1]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [FK_examen_historial1] FOREIGN KEY([id_hist])
REFERENCES [dbo].[historial] ([id_his])
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [FK_examen_historial1]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [FK_examen_resultado] FOREIGN KEY([id_resul])
REFERENCES [dbo].[resultado] ([id_res])
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [FK_examen_resultado]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [FK_examen_tipo_examen1] FOREIGN KEY([id_tex])
REFERENCES [dbo].[tipo_examen] ([id_tex])
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [FK_examen_tipo_examen1]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_empleado] FOREIGN KEY([id_emp])
REFERENCES [dbo].[empleado] ([id_emp])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_empleado]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_paciente] FOREIGN KEY([id_pac])
REFERENCES [dbo].[paciente] ([id_pac])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_paciente]
GO
ALTER TABLE [dbo].[historial]  WITH CHECK ADD  CONSTRAINT [FK_historial_tratamiento] FOREIGN KEY([id_tra])
REFERENCES [dbo].[tratamiento] ([id_trat])
GO
ALTER TABLE [dbo].[historial] CHECK CONSTRAINT [FK_historial_tratamiento]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_rol]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [FK_paciente_historial1] FOREIGN KEY([id_hist])
REFERENCES [dbo].[historial] ([id_his])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_historial1]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_factura] FOREIGN KEY([id_fac])
REFERENCES [dbo].[factura] ([id_fac])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_factura]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_tipo_pago] FOREIGN KEY([id_tipopago])
REFERENCES [dbo].[tipo_pago] ([id_tpago])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_tipo_pago]
GO
ALTER TABLE [dbo].[tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_tratamiento_tipo_tratamiento] FOREIGN KEY([id_ttra])
REFERENCES [dbo].[tipo_tratamiento] ([id_ttra])
GO
ALTER TABLE [dbo].[tratamiento] CHECK CONSTRAINT [FK_tratamiento_tipo_tratamiento]
GO
USE [master]
GO
ALTER DATABASE [respaldo ] SET  READ_WRITE 
GO
