USE [TCAPPS]
GO
/****** Object:  Table [Lvrp].[Ano]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Ano](
	[id] [int] NOT NULL,
	[ano] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Ano] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[Item]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plenaria_id] [int] NOT NULL,
	[path] [varchar](50) NULL,
	[designacao] [varchar](25) NULL,
	[documento] [varchar](max) NULL,
 CONSTRAINT [PK_TB_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[Localizacao]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Localizacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](50) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
	[tipoLocal_id] [int] NOT NULL,
 CONSTRAINT [PK_Localizacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[Participante]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Participante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[telefone] [varchar](15) NULL,
	[perfil_id] [int] NULL,
	[plenaria_id] [int] NULL,
	[participante_interno] [bit] NOT NULL,
 CONSTRAINT [PK_TB_menbros] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[Perfil]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Perfil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](50) NULL,
 CONSTRAINT [PK_tb_perfis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[Plenario]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[Plenario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[actaNum] [int] NULL,
	[dataPlenario] [datetime] NOT NULL,
	[ordemdeTrabalho] [varchar](250) NOT NULL,
	[conclusao] [varchar](max) NULL,
	[reuniao_id] [int] NULL,
	[localizacao_id] [int] NULL,
	[ano_id] [int] NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_TB_agendamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[TipoLocal]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[TipoLocal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_local] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lvrp].[TipoReuniaoPlenaria]    Script Date: 12-03-2021 15:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lvrp].[TipoReuniaoPlenaria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](50) NULL,
 CONSTRAINT [PK_Reuniao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Lvrp].[Participante] ADD  CONSTRAINT [DF_Participante_participante_interno]  DEFAULT ((1)) FOR [participante_interno]
GO
ALTER TABLE [Lvrp].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Plenario] FOREIGN KEY([plenaria_id])
REFERENCES [Lvrp].[Plenario] ([id])
GO
ALTER TABLE [Lvrp].[Item] CHECK CONSTRAINT [FK_Item_Plenario]
GO
ALTER TABLE [Lvrp].[Localizacao]  WITH CHECK ADD  CONSTRAINT [FK_Localizacao_Tipo_local_id] FOREIGN KEY([tipoLocal_id])
REFERENCES [Lvrp].[TipoLocal] ([id])
GO
ALTER TABLE [Lvrp].[Localizacao] CHECK CONSTRAINT [FK_Localizacao_Tipo_local_id]
GO
ALTER TABLE [Lvrp].[Participante]  WITH CHECK ADD  CONSTRAINT [FK_Participantes_Perfis] FOREIGN KEY([perfil_id])
REFERENCES [Lvrp].[Perfil] ([id])
GO
ALTER TABLE [Lvrp].[Participante] CHECK CONSTRAINT [FK_Participantes_Perfis]
GO
ALTER TABLE [Lvrp].[Participante]  WITH CHECK ADD  CONSTRAINT [FK_Participantes_Plenariaid] FOREIGN KEY([plenaria_id])
REFERENCES [Lvrp].[Plenario] ([id])
GO
ALTER TABLE [Lvrp].[Participante] CHECK CONSTRAINT [FK_Participantes_Plenariaid]
GO
