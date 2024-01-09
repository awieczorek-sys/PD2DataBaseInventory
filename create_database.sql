--Utworzenie bazy danych

CREATE DATABASE Inventory;
GO

USE Inventory;
GO
-- Utworzenie tabel

-- [dbo].[Product]
CREATE TABLE [dbo].[Product](
	[IdProd] [bigint] IDENTITY(1,1) NOT NULL,
	[ProdName] [varchar](50) NOT NULL,
	[group] [text] NULL,
	[decription] [text] NULL,
	[available] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [available]
GO

-- [dbo].[ProductPrice]

CREATE TABLE [dbo].[ProductPrice](
	[IdProd] [bigint] NOT NULL,
	[Price] [money] NOT NULL,
	[Sell] [binary](1) NOT NULL,
	[DateStart] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductPrice] ADD  DEFAULT ((1)) FOR [Sell]
GO

ALTER TABLE [dbo].[ProductPrice] ADD  DEFAULT ('20000101') FOR [DateStart]
GO

ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Product] FOREIGN KEY([IdProd])
REFERENCES [dbo].[Product] ([IdProd])
GO

-- [dbo].[Delivery]


CREATE TABLE [dbo].[Delivery](
	[IdDeliv] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [text] NULL,
	[DateDeliv] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[IdDeliv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Delivery] ADD  DEFAULT ('20000101') FOR [DateDeliv]
GO

-- [dbo].[DelivProd]

CREATE TABLE [dbo].[DelivProd](
	[IdDeliv] [bigint] NOT NULL,
	[IdProd] [bigint] NOT NULL,
	[Count] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DelivProd]  WITH CHECK ADD  CONSTRAINT [FK_DelivProd_Delivery] FOREIGN KEY([IdDeliv])
REFERENCES [dbo].[Delivery] ([IdDeliv])
GO

ALTER TABLE [dbo].[DelivProd] CHECK CONSTRAINT [FK_DelivProd_Delivery]
GO

ALTER TABLE [dbo].[DelivProd]  WITH CHECK ADD  CONSTRAINT [FK_DelivProd_Product] FOREIGN KEY([IdProd])
REFERENCES [dbo].[Product] ([IdProd])
GO


-- [dbo].[Inv_info]

CREATE TABLE [dbo].[Inv_info](
	[IdInvent] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [text] NULL,
	[ResponsiblePerson] [nchar](10) NULL,
	[DateInv] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Inv_info] PRIMARY KEY CLUSTERED 
(
	[IdInvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Inv_info] ADD  DEFAULT ('20000101') FOR [DateInv]
GO

-- [dbo].[Inventory]

CREATE TABLE [dbo].[Inventory](
	[IdInvent] [bigint] NOT NULL,
	[IdProd] [bigint] NOT NULL,
	[Count] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Inv_info] FOREIGN KEY([IdInvent])
REFERENCES [dbo].[Inv_info] ([IdInvent])
GO

ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Inv_info]
GO

ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Product] FOREIGN KEY([IdProd])
REFERENCES [dbo].[Product] ([IdProd])
GO

ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Product]
GO
