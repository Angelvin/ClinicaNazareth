USE master
IF EXISTS(select * from sys.databases where name='clinica')
DROP DATABASE clinica

CREATE DATABASE clinica
GO
ALTER DATABASE [clinica] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clinica] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clinica] SET  MULTI_USER 
GO
ALTER DATABASE [clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinica] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'clinica', N'ON'
GO
USE [clinica]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 23/05/2014 11:51:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo](
	[idCargo] [int] IDENTITY(1,1) NOT NULL,
	[nombreCargo] [varchar](50) NULL,
	[descripcionCargo] [varchar](50) NULL,
 CONSTRAINT [PK_cargo] PRIMARY KEY CLUSTERED 
(
	[idCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cita]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cita](
	[idCita] [int] IDENTITY(1,1) NOT NULL,
	[fechaCita] [datetime] NOT NULL,
	[horaCita] [time](7) NOT NULL,
	[correoCita] [nchar](35) NOT NULL,
	[estadoCita] [nchar](10) NOT NULL,
	[fkPaciente] [int] NOT NULL,
	[fkEmpleado] [int] NOT NULL,
	[motivo] [varchar](90) NULL,
 CONSTRAINT [PK_cita] PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[consulta]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[consulta](
	[idConsulta] [int] NOT NULL,
	[fechaConsulta] [datetime] NOT NULL,
	[horaConsulta] [time](7) NOT NULL,
	[peso] [varchar](50) NULL,
	[temperatura] [varchar](50) NOT NULL,
	[altura] [varchar](50) NOT NULL,
	[tipoConsulta] [char](2) NOT NULL,
	[sintomasConsulta] [varchar](50) NOT NULL,
	[fkTratamiento] [int] NOT NULL,
	[fkExpediente] [int] NOT NULL,
 CONSTRAINT [PK_consulta] PRIMARY KEY CLUSTERED 
(
	[idConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[correo]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[correo](
	[idCorreo] [int] NOT NULL,
	[Correo] [varchar](50) NULL,
	[fkPersona] [int] NOT NULL,
 CONSTRAINT [PK_correo] PRIMARY KEY CLUSTERED 
(
	[idCorreo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamento](
	[idDep] [int] IDENTITY(1,1) NOT NULL,
	[nombreDepa] [varchar](50) NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_medicina]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_medicina](
	[idDetMedTrata] [int] IDENTITY(1,1) NOT NULL,
	[fkTratamiento] [int] NULL,
	[fkProducto] [int] NULL,
 CONSTRAINT [PK_detalle_medicina] PRIMARY KEY CLUSTERED 
(
	[idDetMedTrata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalleET]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleET](
	[idDetTrataExa] [int] NOT NULL,
	[fkTratamiento] [int] NULL,
	[fkExamen] [int] NULL,
 CONSTRAINT [PK_detalleET] PRIMARY KEY CLUSTERED 
(
	[idDetTrataExa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dieta]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dieta](
	[idDieta] [int] IDENTITY(1,1) NOT NULL,
	[fechaInic] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[contenidoDieta] [varchar](150) NULL,
	[descripcionDieta] [varchar](150) NULL,
	[fkExpediente] [int] NOT NULL,
 CONSTRAINT [PK_dieta] PRIMARY KEY CLUSTERED 
(
	[idDieta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[calleDireccion] [varchar](50) NULL,
	[casaDireccion] [varchar](50) NULL,
	[fkMunicipio] [int] NOT NULL,
	[fkpersona] [int] NOT NULL,
 CONSTRAINT [PK_Dirreccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[documento]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[documento](
	[idDocu] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
	[fkpersona] [int] NULL,
 CONSTRAINT [PK_documento] PRIMARY KEY CLUSTERED 
(
	[idDocu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[fkTipoemple] [int] NOT NULL,
	[fkCargo] [int] NOT NULL,
	[fkpersona] [int] NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__empleado__52AEF05D2EA1F731] UNIQUE NONCLUSTERED 
(
	[fkpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entrada]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entrada](
	[idEntr] [int] IDENTITY(1,1) NOT NULL,
	[cantidadEntrada] [int] NOT NULL,
	[presentacionEntrada] [varchar](50) NULL,
	[precioEntrada] [decimal](18, 0) NULL,
	[fkProducto] [int] NOT NULL,
 CONSTRAINT [PK_entrada] PRIMARY KEY CLUSTERED 
(
	[idEntr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[examen]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[examen](
	[idExamen] [int] IDENTITY(1,1) NOT NULL,
	[fechasoliExamen] [datetime] NULL,
	[fechaaplicacionExamen] [datetime] NULL,
	[observExamen] [varchar](50) NULL,
	[fkTipoexamen] [int] NOT NULL,
	[fkResultado] [int] NOT NULL,
	[fkExpediente] [int] NOT NULL,
 CONSTRAINT [PK_examen] PRIMARY KEY CLUSTERED 
(
	[idExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[expediente]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expediente](
	[idExpedi] [int] IDENTITY(1,1) NOT NULL,
	[fkDetalleET] [int] NULL,
	[fkDetMedTrata] [int] NULL,
	[fkEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_historial] PRIMARY KEY CLUSTERED 
(
	[idExpedi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[factura]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
	[fechacreacionFactu] [datetime] NULL,
	[fkPaciente] [int] NOT NULL,
	[fkEmpleado] [int] NULL,
	[fkPago] [int] NULL,
	[fkProducto] [int] NOT NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[idLogin] [int] IDENTITY(1,1) NOT NULL,
	[usuLogin] [varchar](50) NOT NULL,
	[passLogin] [varchar](50) NOT NULL,
	[fkRol] [int] NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[idLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[municipio](
	[idMuni] [int] IDENTITY(1,1) NOT NULL,
	[nombreMuni] [varchar](50) NULL,
	[fkDepa] [int] NOT NULL,
 CONSTRAINT [PK_municipio] PRIMARY KEY CLUSTERED 
(
	[idMuni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[fkExpedi] [int] NULL,
	[fkpersona] [int] NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fkExpedi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fkExpedi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fkpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pago]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[valorPago] [numeric](18, 0) NULL,
	[fkTipopago] [int] NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[persona]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[pnombrePer] [varchar](30) NOT NULL,
	[snombrePer] [varchar](30) NULL,
	[pApellPer] [varchar](30) NOT NULL,
	[sApellPer] [varchar](50) NULL,
	[fechaNacPer] [datetime] NOT NULL,
	[fkLogin] [int] NULL,
	[fkresponsable] [int] NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProdu] [varchar](50) NOT NULL,
	[fecha] [date] NULL,
	[Estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resultado]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resultado](
	[idResultado] [int] IDENTITY(1,1) NOT NULL,
	[descripcionResul] [varchar](100) NULL,
 CONSTRAINT [PK_resultado] PRIMARY KEY CLUSTERED 
(
	[idResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](50) NULL,
	[descripcionRol] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[salida]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida](
	[idsalida] [int] IDENTITY(1,1) NOT NULL,
	[cantidadSalida] [int] NOT NULL,
	[fechaSalida] [date] NULL,
	[fkProducto] [int] NOT NULL,
 CONSTRAINT [PK_salida] PRIMARY KEY CLUSTERED 
(
	[idsalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[telefono]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[telefono](
	[idtelefono] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](50) NOT NULL,
	[tipo] [nchar](10) NULL,
	[idPerson] [int] NOT NULL,
 CONSTRAINT [PK_telefono] PRIMARY KEY CLUSTERED 
(
	[idtelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_empleado]    Script Date: 23/05/2014 11:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_empleado](
	[idTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoEmp] [varchar](50) NULL,
	[descripcionTipoEmp] [varchar](80) NULL,
 CONSTRAINT [PK_tipo_empleado] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_examen]    Script Date: 23/05/2014 11:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_examen](
	[idTipoExamen] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoExa] [varchar](50) NULL,
	[descripcionTipoExa] [varchar](90) NULL,
 CONSTRAINT [PK_tipo_examen] PRIMARY KEY CLUSTERED 
(
	[idTipoExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 23/05/2014 11:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[idTipopago] [int] IDENTITY(1,1) NOT NULL,
	[descripcionTipoPago] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[idTipopago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descripcionTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_tratamiento]    Script Date: 23/05/2014 11:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_tratamiento](
	[idTipoTratamient] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoTrata] [varchar](50) NULL,
	[descripcionTipoTrata] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_tratamiento] PRIMARY KEY CLUSTERED 
(
	[idTipoTratamient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tratamiento]    Script Date: 23/05/2014 11:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tratamiento](
	[idTratamiento] [int] IDENTITY(1,1) NOT NULL,
	[fechainiTrata] [datetime] NOT NULL,
	[fechasoliTrata] [datetime] NULL,
	[observaTrata] [varchar](150) NOT NULL,
	[fechafinalTrata] [datetime] NULL,
	[fkTipoTrata] [int] NOT NULL,
 CONSTRAINT [PK_tratamiento] PRIMARY KEY CLUSTERED 
(
	[idTratamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_empleado] FOREIGN KEY([fkEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_empleado]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_paciente] FOREIGN KEY([fkPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_paciente]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_expediente] FOREIGN KEY([fkExpediente])
REFERENCES [dbo].[expediente] ([idExpedi])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_expediente]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_tratamiento] FOREIGN KEY([fkTratamiento])
REFERENCES [dbo].[tratamiento] ([idTratamiento])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_tratamiento]
GO
ALTER TABLE [dbo].[correo]  WITH CHECK ADD  CONSTRAINT [FK_correo_persona] FOREIGN KEY([fkPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[correo] CHECK CONSTRAINT [FK_correo_persona]
GO
ALTER TABLE [dbo].[detalle_medicina]  WITH CHECK ADD  CONSTRAINT [fkDetalleProducto] FOREIGN KEY([fkProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalle_medicina] CHECK CONSTRAINT [fkDetalleProducto]
GO
ALTER TABLE [dbo].[detalle_medicina]  WITH CHECK ADD  CONSTRAINT [fkDetalleTratamiento] FOREIGN KEY([fkTratamiento])
REFERENCES [dbo].[tratamiento] ([idTratamiento])
GO
ALTER TABLE [dbo].[detalle_medicina] CHECK CONSTRAINT [fkDetalleTratamiento]
GO
ALTER TABLE [dbo].[detalleET]  WITH CHECK ADD  CONSTRAINT [FK_detalleET_tratamiento] FOREIGN KEY([fkTratamiento])
REFERENCES [dbo].[tratamiento] ([idTratamiento])
GO
ALTER TABLE [dbo].[detalleET] CHECK CONSTRAINT [FK_detalleET_tratamiento]
GO
ALTER TABLE [dbo].[detalleET]  WITH CHECK ADD  CONSTRAINT [fkDetalleExamen] FOREIGN KEY([fkExamen])
REFERENCES [dbo].[examen] ([idExamen])
GO
ALTER TABLE [dbo].[detalleET] CHECK CONSTRAINT [fkDetalleExamen]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_municipio] FOREIGN KEY([fkMunicipio])
REFERENCES [dbo].[municipio] ([idMuni])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_municipio]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_persona] FOREIGN KEY([fkpersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_persona]
GO
ALTER TABLE [dbo].[documento]  WITH CHECK ADD  CONSTRAINT [FK_documento_persona] FOREIGN KEY([fkpersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[documento] CHECK CONSTRAINT [FK_documento_persona]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_cargo1] FOREIGN KEY([fkCargo])
REFERENCES [dbo].[cargo] ([idCargo])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_cargo1]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_persona] FOREIGN KEY([fkpersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_persona]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_tipo_empleado1] FOREIGN KEY([fkTipoemple])
REFERENCES [dbo].[tipo_empleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_tipo_empleado1]
GO
ALTER TABLE [dbo].[entrada]  WITH CHECK ADD  CONSTRAINT [FK_entrada_producto] FOREIGN KEY([fkProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[entrada] CHECK CONSTRAINT [FK_entrada_producto]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [FK_examen_resultado] FOREIGN KEY([fkResultado])
REFERENCES [dbo].[resultado] ([idResultado])
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [FK_examen_resultado]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [FK_examen_tipo_examen1] FOREIGN KEY([fkTipoexamen])
REFERENCES [dbo].[tipo_examen] ([idTipoExamen])
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [FK_examen_tipo_examen1]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [FK_expediente_expediente] FOREIGN KEY([idExpedi])
REFERENCES [dbo].[expediente] ([idExpedi])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [FK_expediente_expediente]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [fkExpedienteDetaET] FOREIGN KEY([fkDetalleET])
REFERENCES [dbo].[detalleET] ([idDetTrataExa])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [fkExpedienteDetaET]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [fkExpedienteDetaMed] FOREIGN KEY([fkDetMedTrata])
REFERENCES [dbo].[detalle_medicina] ([idDetMedTrata])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [fkExpedienteDetaMed]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [fkExpedienteEmpleado] FOREIGN KEY([fkEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [fkExpedienteEmpleado]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_paciente] FOREIGN KEY([fkPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_paciente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_pago] FOREIGN KEY([fkPago])
REFERENCES [dbo].[pago] ([idPago])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_pago]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_producto] FOREIGN KEY([fkProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_producto]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_rol] FOREIGN KEY([fkRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_rol]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [FK_municipio_Departamento] FOREIGN KEY([fkDepa])
REFERENCES [dbo].[Departamento] ([idDep])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [FK_municipio_Departamento]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [FK_paciente_expediente] FOREIGN KEY([fkExpedi])
REFERENCES [dbo].[expediente] ([idExpedi])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_expediente]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [FK_paciente_paciente] FOREIGN KEY([fkpersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_paciente]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_tipo_pago] FOREIGN KEY([fkTipopago])
REFERENCES [dbo].[tipo_pago] ([idTipopago])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_tipo_pago]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [FK_persona_persona] FOREIGN KEY([fkresponsable])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [FK_persona_persona]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [FKpersonaLogin] FOREIGN KEY([fkLogin])
REFERENCES [dbo].[login] ([idLogin])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [FKpersonaLogin]
GO
ALTER TABLE [dbo].[salida]  WITH CHECK ADD  CONSTRAINT [FK_salida_producto] FOREIGN KEY([fkProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[salida] CHECK CONSTRAINT [FK_salida_producto]
GO
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD  CONSTRAINT [FK_telefono_telefono] FOREIGN KEY([idPerson])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [FK_telefono_telefono]
GO
ALTER TABLE [dbo].[tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_tratamiento_tipo_tratamiento] FOREIGN KEY([fkTipoTrata])
REFERENCES [dbo].[tipo_tratamiento] ([idTipoTratamient])
GO
ALTER TABLE [dbo].[tratamiento] CHECK CONSTRAINT [FK_tratamiento_tipo_tratamiento]
GO
ALTER TABLE [dbo].[cargo]  WITH CHECK ADD  CONSTRAINT [CK_cargo_soloLetras] CHECK  ((NOT [nombreCargo] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[cargo] CHECK CONSTRAINT [CK_cargo_soloLetras]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [CK_cita] CHECK  (([fechaCita]>=getdate()))
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [CK_cita]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [CK_consulta] CHECK  (([fechaconsulta]<getdate()))
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [CK_consulta]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [CK_consulta_1] CHECK  ((NOT [sintomasConsulta] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [CK_consulta_1]
GO
ALTER TABLE [dbo].[dieta]  WITH CHECK ADD  CONSTRAINT [CK_dieta_contenido_soloLetras] CHECK  ((NOT [contenidoDieta] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[dieta] CHECK CONSTRAINT [CK_dieta_contenido_soloLetras]
GO
ALTER TABLE [dbo].[dieta]  WITH CHECK ADD  CONSTRAINT [CK_dieta_fechafin] CHECK  (([fechaFinal]>=getdate()))
GO
ALTER TABLE [dbo].[dieta] CHECK CONSTRAINT [CK_dieta_fechafin]
GO
ALTER TABLE [dbo].[dieta]  WITH CHECK ADD  CONSTRAINT [CK_dieta_fechaini] CHECK  (([fechaInic]>=getdate()))
GO
ALTER TABLE [dbo].[dieta] CHECK CONSTRAINT [CK_dieta_fechaini]
GO
ALTER TABLE [dbo].[dieta]  WITH CHECK ADD  CONSTRAINT [CK_dieta_fechascoherentes] CHECK  (([fechaFinal]>[fechaInic]))
GO
ALTER TABLE [dbo].[dieta] CHECK CONSTRAINT [CK_dieta_fechascoherentes]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [CK_examen] CHECK  (([fechaaplicacionExamen]>getdate()))
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [CK_examen]
GO
ALTER TABLE [dbo].[examen]  WITH CHECK ADD  CONSTRAINT [CK_examen_fechaSol] CHECK  (([fechasoliExamen]>=getdate()))
GO
ALTER TABLE [dbo].[examen] CHECK CONSTRAINT [CK_examen_fechaSol]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [CK_factura_fechacre] CHECK  (([fechacreacionFactu]=getdate()))
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [CK_factura_fechacre]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [ckpassLogin] CHECK  ((ltrim(rtrim([passLogin]))<>''))
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [ckpassLogin]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [ckusuLogin] CHECK  ((ltrim(rtrim([usuLogin]))<>''))
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [ckusuLogin]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [CK_persona] CHECK  ((NOT [pnombrePer] like '%[0-9]%'))
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [CK_persona]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [CK_persona_1] CHECK  ((NOT [snombrePer] like '%[0-9]%'))
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [CK_persona_1]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [CK_persona_2] CHECK  ((NOT [snombrePer] like '%[0-9]%'))
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [CK_persona_2]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [CK_persona_3] CHECK  ((NOT [snombrePer] like '%[0-9]%'))
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [CK_persona_3]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [CK_persona_4] CHECK  (([fechaNacPer]<getdate()))
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [CK_persona_4]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [ckproducto] CHECK  ((NOT [nombreProdu] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [ckproducto]
GO
ALTER TABLE [dbo].[rol]  WITH CHECK ADD  CONSTRAINT [ckNombreRol] CHECK  ((NOT [nombreRol] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[rol] CHECK CONSTRAINT [ckNombreRol]
GO
ALTER TABLE [dbo].[tipo_empleado]  WITH CHECK ADD  CONSTRAINT [ckNombreTipoempleado] CHECK  ((NOT [nombreTipoEmp] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[tipo_empleado] CHECK CONSTRAINT [ckNombreTipoempleado]
GO
ALTER TABLE [dbo].[tipo_examen]  WITH CHECK ADD  CONSTRAINT [CK_tipo_examen_nombre] CHECK  ((NOT [nombreTipoExa] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[tipo_examen] CHECK CONSTRAINT [CK_tipo_examen_nombre]
GO
ALTER TABLE [dbo].[tratamiento]  WITH CHECK ADD  CONSTRAINT [CK_tratamiento] CHECK  (([fechafinalTrata]>[fechainiTrata]))
GO
ALTER TABLE [dbo].[tratamiento] CHECK CONSTRAINT [CK_tratamiento]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Evalua que solo esten escritas letras' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dieta', @level2type=N'CONSTRAINT',@level2name=N'CK_dieta_contenido_soloLetras'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que la fecha ingresada sea de fechas posteriores al dia actual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dieta', @level2type=N'CONSTRAINT',@level2name=N'CK_dieta_fechafin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que la fecha sea posterior a fecha actual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dieta', @level2type=N'CONSTRAINT',@level2name=N'CK_dieta_fechaini'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que las fecha final sea posterior a la inicial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dieta', @level2type=N'CONSTRAINT',@level2name=N'CK_dieta_fechascoherentes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua la fecha sea posterior al dia actual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'examen', @level2type=N'CONSTRAINT',@level2name=N'CK_examen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Evalua que la fecha de solicitud sea posterior o igual al dia actual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'examen', @level2type=N'CONSTRAINT',@level2name=N'CK_examen_fechaSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que la fecha posterior sea igual al dia actual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'factura', @level2type=N'CONSTRAINT',@level2name=N'CK_factura_fechacre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que solo se escriban letras en nombre de examen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipo_examen', @level2type=N'CONSTRAINT',@level2name=N'CK_tipo_examen_nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'evalua que la fecha final sea posterior a la inicial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tratamiento', @level2type=N'CONSTRAINT',@level2name=N'CK_tratamiento'
GO
USE [master]
GO
ALTER DATABASE [clinica] SET  READ_WRITE 
GO
