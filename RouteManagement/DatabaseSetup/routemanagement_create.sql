USE [EdiOrdering]
GO
/****** Object:  Schema [Route]    Script Date: 10/5/2017 8:38:09 AM ******/
CREATE SCHEMA [Route]
GO
/****** Object:  Table [Route].[CustomerSetting]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[CustomerSetting](
	[CustomerSettingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [char](31) NOT NULL,
	[RouteID] [int] NOT NULL,
	[DelayedBillingID] [int] NOT NULL,
	[PetFoodID] [int] NOT NULL,
	[HasShippingCharge] [bit] NOT NULL,
	[PetFoodMoney] [money] NOT NULL,
	[HasFinancialHold] [bit] NOT NULL,
 CONSTRAINT [PK_ClinicSettings] PRIMARY KEY CLUSTERED 
(
	[CustomerSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[CustomerSettingOption]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[CustomerSettingOption](
	[CustomerSettingOptionID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClinicSettingsDelayedBilling] PRIMARY KEY CLUSTERED 
(
	[CustomerSettingOptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[DayOfWeek]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[DayOfWeek](
	[DayOfWeekID] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_DayOfWeek] PRIMARY KEY CLUSTERED 
(
	[DayOfWeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[DeliveryDateDefault]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[DeliveryDateDefault](
	[DeliveryDateDefaultID] [int] IDENTITY(1,1) NOT NULL,
	[HasDelivery] [bit] NOT NULL,
	[IncrementDeliveryByDays] [int] NOT NULL,
	[DeliveryCutOff] [time](7) NULL,
	[SiteOrderTypeID] [int] NOT NULL,
	[DayOfWeekID] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryDateDefault] PRIMARY KEY CLUSTERED 
(
	[DeliveryDateDefaultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[DeliveryDateException]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[DeliveryDateException](
	[DeliveryDateExceptionID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[HasDelivery] [bit] NOT NULL,
	[DeliveryCutOff] [time](7) NULL,
	[IncrementDeliveryByDays] [int] NOT NULL,
	[DeliveryDateDefaultID] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryDateException] PRIMARY KEY CLUSTERED 
(
	[DeliveryDateExceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[MapCoordinates]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[MapCoordinates](
	[MapCoordinatesID] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [nvarchar](50) NOT NULL,
	[Lat] [decimal](18, 5) NOT NULL,
	[Long] [decimal](18, 5) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Error] [nvarchar](max) NULL,
 CONSTRAINT [PK_MapCoordinates] PRIMARY KEY CLUSTERED 
(
	[MapCoordinatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Route].[OrderType]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[OrderType](
	[OrderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[Route]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[Route](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[RouteNumber] [int] NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[RouteSite]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[RouteSite](
	[RouteSiteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
 CONSTRAINT [PK_RouteSite] PRIMARY KEY CLUSTERED 
(
	[RouteSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[Site]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[Site](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Route].[SiteOrderType]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Route].[SiteOrderType](
	[SiteOrderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RouteSiteID] [int] NOT NULL,
	[OrderTypeID] [int] NOT NULL,
 CONSTRAINT [PK_SiteOrderType] PRIMARY KEY CLUSTERED 
(
	[SiteOrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwMemberInformation]    Script Date: 10/5/2017 8:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCustomerInformation]
AS
SELECT        rm.ADRSCODE AS AddressCode, rm.CUSTNMBR AS CustomerId, rm.ADDRESS1, rm.ADDRESS2, rm.ADRSCODE, rm.CITY, rm.CUSTCLAS AS Class, rm.COUNTRY, rm.FAX, rm.INACTIVE, rm.CUSTNAME AS Name, 
                         rm.CNTCPRSN AS ContactPerson, rm.PHONE1, rm.PHONE2, rm.STATE, rm.ZIP, ca.ENTITY_ID, ca.CARRIER_ID, ca.SHIPVIA, ca.ENTITYTYPE, cs.RouteID, csdb.Name AS DelayedBilling, cs.HasShippingCharge, 
                         cs.PetFoodMoney, cspf.Name AS PetFood, CASE WHEN entity_id IS NULL THEN 0 WHEN CustomerSettingID IS NULL THEN 1 ELSE 2 END AS SetupState, r.RouteNumber, r.Description, 
                         cs.CustomerSettingID
FROM            WDDC.dbo.RM00101 AS rm LEFT OUTER JOIN
                         ASCTrac.dbo.CARRIERACCT AS ca ON RTRIM(rm.CUSTNMBR) + '-' + RTRIM(rm.ADRSCODE) = RTRIM(ca.ENTITY_ID) LEFT OUTER JOIN
                         Route.CustomerSetting AS cs ON RTRIM(rm.CUSTNMBR) = RTRIM(cs.CustomerId) LEFT OUTER JOIN
                         Route.CustomerSettingOption AS csdb ON cs.DelayedBillingID = csdb.CustomerSettingOptionID LEFT OUTER JOIN
                         Route.CustomerSettingOption AS cspf ON cs.PetFoodID = cspf.CustomerSettingOptionID LEFT OUTER JOIN
                         Route.Route AS r ON r.RouteID = cs.RouteID
WHERE        (rm.ADRSCODE = 'MAIN')

GO
INSERT [Route].[CustomerSettingOption] ([CustomerSettingOptionID], [Name]) VALUES (0, N'No')
GO
INSERT [Route].[CustomerSettingOption] ([CustomerSettingOptionID], [Name]) VALUES (1, N'Yes')
GO
INSERT [Route].[CustomerSettingOption] ([CustomerSettingOptionID], [Name]) VALUES (3, N'Decide on Order')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (1, N'Sunday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (2, N'Monday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (3, N'Tuesday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (4, N'Wednesday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (5, N'Thursday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (6, N'Friday')
GO
INSERT [Route].[DayOfWeek] ([DayOfWeekID], [Name]) VALUES (7, N'Saturday')
GO
SET IDENTITY_INSERT [Route].[MapCoordinates] ON 

GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (513, N'00001', CAST(45.46811 AS Decimal(18, 5)), CAST(-73.54459 AS Decimal(18, 5)), N'1 PLACE DU COMMERCE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (514, N'000010', CAST(48.57147 AS Decimal(18, 5)), CAST(-123.44787 AS Decimal(18, 5)), N'1235 - Marin Park close', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (515, N'00004', CAST(51.03445 AS Decimal(18, 5)), CAST(-114.07204 AS Decimal(18, 5)), N'#B2, 510 21st Avenue SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (516, N'00005', CAST(43.83306 AS Decimal(18, 5)), CAST(-79.31618 AS Decimal(18, 5)), N'1405 DENISON STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (517, N'00006', CAST(44.36752 AS Decimal(18, 5)), CAST(-79.67951 AS Decimal(18, 5)), N'12 WOODCREST ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (518, N'00007', CAST(44.33939 AS Decimal(18, 5)), CAST(-79.66336 AS Decimal(18, 5)), N'233 MAPLEVIEW DR. E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (519, N'00008', CAST(48.76929 AS Decimal(18, 5)), CAST(-123.70094 AS Decimal(18, 5)), N'#2, BOYS ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (520, N'00009', CAST(51.01405 AS Decimal(18, 5)), CAST(-114.03846 AS Decimal(18, 5)), N'UNIT D  1140 - 44 AVENUE S E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (521, N'00010', CAST(51.11386 AS Decimal(18, 5)), CAST(-114.18904 AS Decimal(18, 5)), N'212 SILVERSPRINGS RISE NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (522, N'00011', CAST(51.11553 AS Decimal(18, 5)), CAST(-114.18354 AS Decimal(18, 5)), N'822 Ranchview Circle NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (523, N'000118', CAST(49.15067 AS Decimal(18, 5)), CAST(-122.93995 AS Decimal(18, 5)), N'8188 SWENSON WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (524, N'00012', CAST(50.57319 AS Decimal(18, 5)), CAST(-113.87152 AS Decimal(18, 5)), N'12A  11 AVENUE SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (525, N'00015_ARD', CAST(43.19225 AS Decimal(18, 5)), CAST(-89.45106 AS Decimal(18, 5)), N'U OF A - LIVESTOCK RESEARCH BRAND', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (526, N'00015_DOUBLEBAR', CAST(50.10364 AS Decimal(18, 5)), CAST(-102.64135 AS Decimal(18, 5)), N'905 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (527, N'00015_PICKUP', CAST(-27.98045 AS Decimal(18, 5)), CAST(153.38624 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (528, N'00016', CAST(45.49177 AS Decimal(18, 5)), CAST(-73.72294 AS Decimal(18, 5)), N'4490 GARAND', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (529, N'00017', CAST(51.04618 AS Decimal(18, 5)), CAST(-114.07568 AS Decimal(18, 5)), N'200, 630 - 8th Avenue SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (530, N'000178', CAST(53.55981 AS Decimal(18, 5)), CAST(-113.52818 AS Decimal(18, 5)), N'11910 - 111 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (531, N'00018', CAST(53.54089 AS Decimal(18, 5)), CAST(-113.49560 AS Decimal(18, 5)), N'Suite 809, 10088 102 Avenue NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (532, N'00019', CAST(52.45374 AS Decimal(18, 5)), CAST(-113.72594 AS Decimal(18, 5)), N'4524 - 45 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (533, N'00020', CAST(43.53252 AS Decimal(18, 5)), CAST(-80.31847 AS Decimal(18, 5)), N'400 MICHENER RD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (534, N'00020_SANGUDO', CAST(53.88904 AS Decimal(18, 5)), CAST(-114.89986 AS Decimal(18, 5)), N'SANGUDO VETERINARY CLINIC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (535, N'00021', CAST(43.61088 AS Decimal(18, 5)), CAST(-79.75237 AS Decimal(18, 5)), N'7125 MISSISSAUGA ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (536, N'00022', CAST(43.59770 AS Decimal(18, 5)), CAST(-79.74564 AS Decimal(18, 5)), N'SUITE 200 EAST TOWER', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (537, N'00023', CAST(43.60855 AS Decimal(18, 5)), CAST(-79.75322 AS Decimal(18, 5)), N'2100 Derry Road West, Suite 100', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (538, N'00024', CAST(53.38247 AS Decimal(18, 5)), CAST(-113.49179 AS Decimal(18, 5)), N'2160, 50302 RG. RD. 244A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (539, N'00024_DELIBREX', CAST(53.56550 AS Decimal(18, 5)), CAST(-113.60538 AS Decimal(18, 5)), N'c/o DELIBREX', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (540, N'00025', CAST(43.38509 AS Decimal(18, 5)), CAST(-79.76655 AS Decimal(18, 5)), N'5180 SOUTH SERVICE RD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (541, N'00025_CLAYTON', CAST(50.02514 AS Decimal(18, 5)), CAST(-113.58307 AS Decimal(18, 5)), N'C/O FLOWERS ON 49TH (PURO DEPOT)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (542, N'00025_GARNER', CAST(50.10954 AS Decimal(18, 5)), CAST(-106.96038 AS Decimal(18, 5)), N'EMTA AGENCIES', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (543, N'00025_MAURY', CAST(50.22360 AS Decimal(18, 5)), CAST(-119.13215 AS Decimal(18, 5)), N'7000 LEARMOUTH ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (544, N'00025_MILES', CAST(52.24135 AS Decimal(18, 5)), CAST(-113.81690 AS Decimal(18, 5)), N'PUROLATOR DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (545, N'00025_MISSIONRI', CAST(53.64647 AS Decimal(18, 5)), CAST(-113.62827 AS Decimal(18, 5)), N'51 LIBERTON DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (546, N'00026', CAST(43.63051 AS Decimal(18, 5)), CAST(-79.67853 AS Decimal(18, 5)), N'175 BRITANNIA ROAD EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (547, N'00027', CAST(43.71465 AS Decimal(18, 5)), CAST(-79.62538 AS Decimal(18, 5)), N'6889 REXWOOD ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (548, N'00028', CAST(45.50480 AS Decimal(18, 5)), CAST(-73.73660 AS Decimal(18, 5)), N'3150 GUENETTE ST.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (549, N'00029', CAST(43.41924 AS Decimal(18, 5)), CAST(-80.37777 AS Decimal(18, 5)), N'6-1040 FOUNTAIN STREET NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (550, N'00030_ATSWINNIP', CAST(30.39749 AS Decimal(18, 5)), CAST(-91.15700 AS Decimal(18, 5)), N'1725 Bangor Ave', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (551, N'00031', CAST(43.33931 AS Decimal(18, 5)), CAST(-80.36725 AS Decimal(18, 5)), N'1211 EDWORTHY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (552, N'00033', CAST(51.03806 AS Decimal(18, 5)), CAST(-114.08604 AS Decimal(18, 5)), N'#420, 1032 - 17th Ave SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (553, N'000334', CAST(45.50363 AS Decimal(18, 5)), CAST(-73.56637 AS Decimal(18, 5)), N'555 BOUL RENE-LEVESQUE BLD W 17 FLR', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (554, N'00034_AGRAI', CAST(53.37509 AS Decimal(18, 5)), CAST(-113.51709 AS Decimal(18, 5)), N'3260 - 8th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (555, N'00034_CAMBRIDGE', CAST(43.35351 AS Decimal(18, 5)), CAST(-80.29487 AS Decimal(18, 5)), N'39 ELGIN STREET SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (556, N'00034_INNOVATIV', CAST(49.89492 AS Decimal(18, 5)), CAST(-97.09834 AS Decimal(18, 5)), N'627 PLINGUET STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (557, N'00034_TUDORGLEN', CAST(53.61906 AS Decimal(18, 5)), CAST(-113.61163 AS Decimal(18, 5)), N'1005 TUDOR GLEN PLACE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (558, N'00034_WOODSTOCK', CAST(43.11117 AS Decimal(18, 5)), CAST(-80.71911 AS Decimal(18, 5)), N'688 JACK ROSS AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (559, N'00035', CAST(51.01235 AS Decimal(18, 5)), CAST(-113.96588 AS Decimal(18, 5)), N'4807 - 47 Street SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (560, N'00036', CAST(45.26942 AS Decimal(18, 5)), CAST(-75.30547 AS Decimal(18, 5)), N'165 BAY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (561, N'00039', CAST(39.10263 AS Decimal(18, 5)), CAST(-94.58341 AS Decimal(18, 5)), N'SUITE 1850, 920 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (562, N'00040', CAST(45.49479 AS Decimal(18, 5)), CAST(-73.58204 AS Decimal(18, 5)), N'1827 LINCOLN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (563, N'00041', CAST(39.09330 AS Decimal(18, 5)), CAST(-94.59014 AS Decimal(18, 5)), N'1656 WASHINGTON', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (564, N'00042', CAST(45.45040 AS Decimal(18, 5)), CAST(-73.84358 AS Decimal(18, 5)), N'16667 HYMUS BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (565, N'00043', CAST(53.78369 AS Decimal(18, 5)), CAST(-113.63924 AS Decimal(18, 5)), N'8702A - 98 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (566, N'00044', CAST(53.54536 AS Decimal(18, 5)), CAST(-113.63522 AS Decimal(18, 5)), N'18208 - 102 Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (567, N'00045', CAST(53.53853 AS Decimal(18, 5)), CAST(-113.61557 AS Decimal(18, 5)), N'9966-170 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (568, N'00046_CHARLENEH', CAST(53.58769 AS Decimal(18, 5)), CAST(-113.52784 AS Decimal(18, 5)), N'PICKUP AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (569, N'00047', CAST(43.52208 AS Decimal(18, 5)), CAST(-80.22838 AS Decimal(18, 5)), N'RESEARCH PARK CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (570, N'00048', CAST(53.54594 AS Decimal(18, 5)), CAST(-113.51825 AS Decimal(18, 5)), N'11419-104 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (571, N'00049', CAST(43.69981 AS Decimal(18, 5)), CAST(-79.80094 AS Decimal(18, 5)), N'1-14 REGAN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (572, N'00050_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'17611 - 109a AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (573, N'00052', CAST(53.60014 AS Decimal(18, 5)), CAST(-113.51757 AS Decimal(18, 5)), N'13714 CASTLEDOWNS RD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (574, N'00053', CAST(38.07699 AS Decimal(18, 5)), CAST(-84.50000 AS Decimal(18, 5)), N'944 NANDINO BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (575, N'00054', CAST(53.49204 AS Decimal(18, 5)), CAST(-113.49589 AS Decimal(18, 5)), N'5508 CALGARY TRAIL NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (576, N'00055', CAST(50.47723 AS Decimal(18, 5)), CAST(-104.56237 AS Decimal(18, 5)), N'240 HENDERSON DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (577, N'00056', CAST(43.59511 AS Decimal(18, 5)), CAST(-79.74893 AS Decimal(18, 5)), N'6725 MILLCREEK DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (578, N'00057', CAST(43.64616 AS Decimal(18, 5)), CAST(-79.37502 AS Decimal(18, 5)), N'P.O. BOX 70535', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (579, N'00058_JANICEB', CAST(50.97082 AS Decimal(18, 5)), CAST(-114.13072 AS Decimal(18, 5)), N'3120 PALLISER DRIVE S.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (580, N'00058_QUEBEC', CAST(45.45509 AS Decimal(18, 5)), CAST(-73.84522 AS Decimal(18, 5)), N'16750 TRANS CANADA HWY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (581, N'00058_STTHOMAS', CAST(45.64776 AS Decimal(18, 5)), CAST(-72.96826 AS Decimal(18, 5)), N'7755 A, Duplessis', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (582, N'00059', CAST(44.61633 AS Decimal(18, 5)), CAST(-75.69463 AS Decimal(18, 5)), N'1245 CALIFORNIA AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (583, N'00060', CAST(53.61576 AS Decimal(18, 5)), CAST(-113.39752 AS Decimal(18, 5)), N'15335-37 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (584, N'00061', CAST(53.54228 AS Decimal(18, 5)), CAST(-113.29933 AS Decimal(18, 5)), N'225-390 BASELINE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (585, N'00062', CAST(53.55667 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'17611-109 A. AVE.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (586, N'00063', CAST(53.27772 AS Decimal(18, 5)), CAST(-110.04510 AS Decimal(18, 5)), N'UNIT 107', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (587, N'00065_ANDREA', CAST(45.12840 AS Decimal(18, 5)), CAST(-76.13071 AS Decimal(18, 5)), N'B2  #85 Findlay Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (588, N'00065_APEX', CAST(51.30041 AS Decimal(18, 5)), CAST(-114.02392 AS Decimal(18, 5)), N'#305, 800 VETERANS BLVD. N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (589, N'00065_BEAUPRE', CAST(47.68284 AS Decimal(18, 5)), CAST(-68.89109 AS Decimal(18, 5)), N'34 RUE COMMERCIALE NORD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (590, N'00065_BETES', CAST(45.94252 AS Decimal(18, 5)), CAST(-71.98959 AS Decimal(18, 5)), N'208 RUE SAINT LOUIS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (591, N'00065_BUREAU', CAST(45.66597 AS Decimal(18, 5)), CAST(-72.13185 AS Decimal(18, 5)), N'44, DES CEDRES', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (592, N'00065_CAOUETTE', CAST(45.85435 AS Decimal(18, 5)), CAST(-72.53755 AS Decimal(18, 5)), N'3630 RUE ST PIERRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (593, N'00065_CARLA', CAST(52.16661 AS Decimal(18, 5)), CAST(-106.68279 AS Decimal(18, 5)), N'C/O SASK DHL DEPOT (HOLD FOR P/U)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (594, N'00065_CATHERINE', CAST(45.83512 AS Decimal(18, 5)), CAST(-64.19915 AS Decimal(18, 5)), N'31 Westminster Ave', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (595, N'00065_CDMV2', CAST(45.63059 AS Decimal(18, 5)), CAST(-72.97142 AS Decimal(18, 5)), N'2999 BOULEVARD CHOQUETTE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (596, N'00065_CDMVBRAMP', CAST(43.74655 AS Decimal(18, 5)), CAST(-79.71598 AS Decimal(18, 5)), N'UNIT 6, 1925 WILLIAMS PARKWAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (597, N'00065_CDMVNOVAS', CAST(44.70707 AS Decimal(18, 5)), CAST(-63.58479 AS Decimal(18, 5)), N'340 WRIGHT AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (598, N'00065_CDMVQUEBE', CAST(46.78212 AS Decimal(18, 5)), CAST(-71.33043 AS Decimal(18, 5)), N'3220 RUE WATT BUREAU 220', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (599, N'00065_CLINIQUE', CAST(46.71597 AS Decimal(18, 5)), CAST(-71.34677 AS Decimal(18, 5)), N'845, MARIE-VICTORIAN LOCAL 38', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (600, N'00065_CLINIQUEV', CAST(46.59177 AS Decimal(18, 5)), CAST(-71.20479 AS Decimal(18, 5)), N'1215 rue du Pont', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (601, N'00065_DANIELLE', CAST(46.59927 AS Decimal(18, 5)), CAST(-71.09105 AS Decimal(18, 5)), N'237 A rue Ste-Geneviève', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (602, N'00065_DRUMMOND', CAST(45.86024 AS Decimal(18, 5)), CAST(-72.47742 AS Decimal(18, 5)), N'1320, BOUL. JEAN DE BREBEUF', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (603, N'00065_EVEBIRON', CAST(45.85318 AS Decimal(18, 5)), CAST(-72.45776 AS Decimal(18, 5)), N'40 RUE BEGIN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (604, N'00065_HEADON', CAST(43.39109 AS Decimal(18, 5)), CAST(-79.82395 AS Decimal(18, 5)), N'3500 DUNDAS STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (605, N'00065_JWOELFE', CAST(43.38461 AS Decimal(18, 5)), CAST(-80.33941 AS Decimal(18, 5)), N'126 PINEWOOD AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (606, N'00065_KATRINA', CAST(43.14961 AS Decimal(18, 5)), CAST(-79.38926 AS Decimal(18, 5)), N'3336 King Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (607, N'00065_LABORATOI', CAST(45.64776 AS Decimal(18, 5)), CAST(-72.96826 AS Decimal(18, 5)), N'7755A DUPLESSIS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (608, N'00065_LEGARDEUR', CAST(45.76015 AS Decimal(18, 5)), CAST(-73.48544 AS Decimal(18, 5)), N'413 RUE ST-PAUL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (609, N'00065_LIVESTOCK', CAST(43.58279 AS Decimal(18, 5)), CAST(-80.72787 AS Decimal(18, 5)), N'3860 Manser Road', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (610, N'00065_LOUIS', CAST(45.49325 AS Decimal(18, 5)), CAST(-73.43771 AS Decimal(18, 5)), N'3960 LESSARD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (611, N'00065_MENARD', CAST(45.35771 AS Decimal(18, 5)), CAST(-72.93850 AS Decimal(18, 5)), N'251, ROUTE 235', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (612, N'00065_MIDWEST', CAST(49.94516 AS Decimal(18, 5)), CAST(-97.18176 AS Decimal(18, 5)), N'1600 INKSTER BOULEVARD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (613, N'00065_REGEHR', CAST(50.23070 AS Decimal(18, 5)), CAST(-119.22857 AS Decimal(18, 5)), N'9900 MATNER LANE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (614, N'00065_RENFORTH', CAST(43.66117 AS Decimal(18, 5)), CAST(-79.58390 AS Decimal(18, 5)), N'735 RENFORTH DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (615, N'00065_SAGAMIE', CAST(48.56078 AS Decimal(18, 5)), CAST(-71.63671 AS Decimal(18, 5)), N'741, CH DU PONT-TACHE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (616, N'00065_SOUTHEAST', CAST(43.05960 AS Decimal(18, 5)), CAST(-92.71185 AS Decimal(18, 5)), N'c/o SOUTHEAST VET SERVICES LTD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (617, N'00065_SOUTHEND', CAST(49.82304 AS Decimal(18, 5)), CAST(-97.11437 AS Decimal(18, 5)), N'1590 ST. MARRY''S ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (618, N'00065_SOUTHHAMP', CAST(44.48147 AS Decimal(18, 5)), CAST(-81.37342 AS Decimal(18, 5)), N'370 RAILWAY STREET HWY 21', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (619, N'00065_SUNNY', CAST(49.71579 AS Decimal(18, 5)), CAST(-112.78189 AS Decimal(18, 5)), N'SUNNY SOUTH VETERINARY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (620, N'00065_TANYA', CAST(49.11096 AS Decimal(18, 5)), CAST(-122.66830 AS Decimal(18, 5)), N'c/o Packaging Depot', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (621, N'00065_THERESA', CAST(49.80907 AS Decimal(18, 5)), CAST(-97.17304 AS Decimal(18, 5)), N'59  Lakedale Place', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (622, N'00065_UOFCAL', CAST(51.07765 AS Decimal(18, 5)), CAST(-114.13341 AS Decimal(18, 5)), N'2500 University Drive NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (623, N'00065_VANKLEEK', CAST(45.52466 AS Decimal(18, 5)), CAST(-74.64806 AS Decimal(18, 5)), N'69 PERREAULT STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (624, N'00065_VPCL', CAST(43.25837 AS Decimal(18, 5)), CAST(-81.16041 AS Decimal(18, 5)), N'485 QUEEN STREET W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (625, N'00065_VTH', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'UNIVERSITY OF SASKATCHEWAN -  WCVM', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (626, N'00068', CAST(43.72902 AS Decimal(18, 5)), CAST(-79.33885 AS Decimal(18, 5)), N'19  GREENBELT DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (627, N'00072', CAST(43.37470 AS Decimal(18, 5)), CAST(-80.30483 AS Decimal(18, 5)), N'292 Elgin Street N.  Unit 3', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (628, N'00074', CAST(43.72718 AS Decimal(18, 5)), CAST(-79.33971 AS Decimal(18, 5)), N'#2 MORNEAU SHEPELL CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (629, N'00074_ACADIA', CAST(52.11515 AS Decimal(18, 5)), CAST(-106.59733 AS Decimal(18, 5)), N'UNIT 4, 3421 - 8TH STREET  EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (630, N'00074_ACADRIVE', CAST(50.96004 AS Decimal(18, 5)), CAST(-114.04511 AS Decimal(18, 5)), N'816 WILLOW PARK DRIVE SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (631, N'00074_AIRDRIEAN', CAST(51.29375 AS Decimal(18, 5)), CAST(-114.01279 AS Decimal(18, 5)), N'BAY 112, 120 - 2 AVENUE N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (632, N'00074_ALBERTNOR', CAST(50.47501 AS Decimal(18, 5)), CAST(-104.61706 AS Decimal(18, 5)), N'216 McINTYRE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (633, N'00074_ALLABOUT', CAST(52.10693 AS Decimal(18, 5)), CAST(-106.64613 AS Decimal(18, 5)), N'1004 TAYLOR STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (634, N'00074_ALLWEST', CAST(52.13495 AS Decimal(18, 5)), CAST(-106.72058 AS Decimal(18, 5)), N'3120 LAURIER DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (635, N'00074_ANIMALMED', CAST(53.45384 AS Decimal(18, 5)), CAST(-113.47985 AS Decimal(18, 5)), N'2308 PARSONS ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (636, N'00074_ANIMALSFI', CAST(55.18583 AS Decimal(18, 5)), CAST(-118.76861 AS Decimal(18, 5)), N'UNIT 101, 9151 CRYSTAL LAKE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (637, N'00074_ASSINIBOI', CAST(49.62992 AS Decimal(18, 5)), CAST(-105.99108 AS Decimal(18, 5)), N'116 5 AVENUE EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (638, N'00074_AURORA', CAST(56.73258 AS Decimal(18, 5)), CAST(-111.46353 AS Decimal(18, 5)), N'14 - 100 REAL MARTIN DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (639, N'00074_BEARCREEK', CAST(55.19659 AS Decimal(18, 5)), CAST(-118.78675 AS Decimal(18, 5)), N'9708 128 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (640, N'00074_BELLAMY', CAST(50.38417 AS Decimal(18, 5)), CAST(-105.55411 AS Decimal(18, 5)), N'790 LILLOOET STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (641, N'00074_CARIBOUW', CAST(50.39669 AS Decimal(18, 5)), CAST(-105.57347 AS Decimal(18, 5)), N'1333 CARIBOU STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (642, N'00074_CARMAN', CAST(49.50217 AS Decimal(18, 5)), CAST(-97.99691 AS Decimal(18, 5)), N'100, 4TH AVENUE SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (643, N'00074_CASEVET', CAST(55.35039 AS Decimal(18, 5)), CAST(-118.78573 AS Decimal(18, 5)), N'10013 - 100 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (644, N'00074_CENTRAL', CAST(50.26345 AS Decimal(18, 5)), CAST(-119.26688 AS Decimal(18, 5)), N'2700 30th Ave', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (645, N'00074_CITYVET', CAST(50.03097 AS Decimal(18, 5)), CAST(-110.66867 AS Decimal(18, 5)), N'#4, 840 KINGSWAY AVENUE S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (646, N'00074_COMPANION', CAST(51.20983 AS Decimal(18, 5)), CAST(-102.48245 AS Decimal(18, 5)), N'308 BROADWAY STREET W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (647, N'00074_COMPNCARE', CAST(53.25378 AS Decimal(18, 5)), CAST(-110.00550 AS Decimal(18, 5)), N'1716 - 50th AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (648, N'00074_CUMBERLAN', CAST(52.11587 AS Decimal(18, 5)), CAST(-106.63243 AS Decimal(18, 5)), N'25, 1501 - 8TH STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (649, N'00074_DEEPSOUTH', CAST(49.57317 AS Decimal(18, 5)), CAST(-104.91778 AS Decimal(18, 5)), N'CORNER OF RAILWAY & ALFRED', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (650, N'00074_DEVIONIAN', CAST(53.34302 AS Decimal(18, 5)), CAST(-113.73138 AS Decimal(18, 5)), N'1 EXPLORATION DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (651, N'00074_EARLGREY', CAST(50.93580 AS Decimal(18, 5)), CAST(-104.70877 AS Decimal(18, 5)), N'109 ASSINIBOIA AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (652, N'00074_EDMONTNOR', CAST(53.61618 AS Decimal(18, 5)), CAST(-113.51520 AS Decimal(18, 5)), N'15387 CASTLEDOWNS ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (653, N'00074_EDSONVETC', CAST(53.58500 AS Decimal(18, 5)), CAST(-116.41676 AS Decimal(18, 5)), N'4403 - 2ND AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (654, N'00074_ELLERSLIE', CAST(53.42887 AS Decimal(18, 5)), CAST(-113.47847 AS Decimal(18, 5)), N'2943 ELLWOOD DRIVE S.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (655, N'00074_ERINDALE', CAST(52.14758 AS Decimal(18, 5)), CAST(-106.57075 AS Decimal(18, 5)), N'#14, 410 LUDLOW STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (656, N'00074_FORTSASK', CAST(53.71315 AS Decimal(18, 5)), CAST(-113.21167 AS Decimal(18, 5)), N'10310 - 100 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (657, N'00074_FURRYFREI', CAST(52.14562 AS Decimal(18, 5)), CAST(-106.72596 AS Decimal(18, 5)), N'#9-110 Wedge Road', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (658, N'00074_GRANDSPCA', CAST(55.17511 AS Decimal(18, 5)), CAST(-118.86638 AS Decimal(18, 5)), N'12220-104 Ave', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (659, N'00074_GRANDVAL', CAST(49.84929 AS Decimal(18, 5)), CAST(-99.94215 AS Decimal(18, 5)), N'304 Pacific Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (660, N'00074_GRASSLAND', CAST(49.91249 AS Decimal(18, 5)), CAST(-109.47708 AS Decimal(18, 5)), N'515 - 2nd AVENUE NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (661, N'00074_HERITAGEH', CAST(53.54072 AS Decimal(18, 5)), CAST(-113.26020 AS Decimal(18, 5)), N'#50 - 665 BASELINE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (662, N'00074_HICKORY', CAST(52.84765 AS Decimal(18, 5)), CAST(-110.84438 AS Decimal(18, 5)), N'1811 - 19 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (663, N'00074_HIGHLANDS', CAST(49.69316 AS Decimal(18, 5)), CAST(-112.89464 AS Decimal(18, 5)), N'2550 HIGHLANDS ROAD WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (664, N'00074_INNISFAIL', CAST(52.02683 AS Decimal(18, 5)), CAST(-113.95860 AS Decimal(18, 5)), N'5239 - 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (665, N'00074_JASPER', CAST(52.87619 AS Decimal(18, 5)), CAST(-118.07959 AS Decimal(18, 5)), N'PO BOX 968', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (666, N'00074_KRISTIN', CAST(52.28685 AS Decimal(18, 5)), CAST(-113.76944 AS Decimal(18, 5)), N'C/O CLEARVIEW DOG & CAT HOSP.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (667, N'00074_LACOMBE', CAST(52.47560 AS Decimal(18, 5)), CAST(-113.71699 AS Decimal(18, 5)), N'5828 HWY 2A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (668, N'00074_LAKELAND', CAST(52.74952 AS Decimal(18, 5)), CAST(-108.25747 AS Decimal(18, 5)), N'10020 THATCHER AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (669, N'00074_LAKESIDE', CAST(53.51302 AS Decimal(18, 5)), CAST(-113.32191 AS Decimal(18, 5)), N'993 FIR STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (670, N'00074_LAKEWOOD', CAST(50.49600 AS Decimal(18, 5)), CAST(-104.66622 AS Decimal(18, 5)), N'O/A NORMANVIEW PET HOSPITAL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (671, N'00074_LAWSON', CAST(52.16929 AS Decimal(18, 5)), CAST(-106.63396 AS Decimal(18, 5)), N'#120, 227 PRIMROSE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (672, N'00074_LLOYDMIN', CAST(53.29730 AS Decimal(18, 5)), CAST(-110.00673 AS Decimal(18, 5)), N'6002 50TH AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (673, N'00074_LYNNWOOD', CAST(53.52128 AS Decimal(18, 5)), CAST(-113.57852 AS Decimal(18, 5)), N'14911 - 89 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (674, N'00074_MELVILLE', CAST(50.93721 AS Decimal(18, 5)), CAST(-102.82150 AS Decimal(18, 5)), N'202 HERITAGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (675, N'00074_MILLCREEK', CAST(53.52203 AS Decimal(18, 5)), CAST(-113.48629 AS Decimal(18, 5)), N'8606 - 99 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (676, N'00074_MOOSEJAW', CAST(50.38979 AS Decimal(18, 5)), CAST(-105.54246 AS Decimal(18, 5)), N'302 MANITOBA STREET W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (677, N'00074_MORINVILL', CAST(53.78826 AS Decimal(18, 5)), CAST(-113.64128 AS Decimal(18, 5)), N'9804 - 90 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (678, N'00074_MURDOCH', CAST(53.90202 AS Decimal(18, 5)), CAST(-122.67971 AS Decimal(18, 5)), N'2933 GUNN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (679, N'00074_NATHAN', CAST(22.68109 AS Decimal(18, 5)), CAST(85.61393 AS Decimal(18, 5)), N'C/O  WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (680, N'00074_OLDSPIONE', CAST(51.79788 AS Decimal(18, 5)), CAST(-114.12639 AS Decimal(18, 5)), N'6110 IMPERIAL WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (681, N'00074_OSPIKA', CAST(53.90000 AS Decimal(18, 5)), CAST(-122.79200 AS Decimal(18, 5)), N'2392 S. OSPIKA BOUL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (682, N'00074_PATHWAYS', CAST(52.30393 AS Decimal(18, 5)), CAST(-114.07620 AS Decimal(18, 5)), N'#410, 3715 - 47TH AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (683, N'00074_PEACERIVE', CAST(56.23355 AS Decimal(18, 5)), CAST(-117.33958 AS Decimal(18, 5)), N'7710 - 100 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (684, N'00074_PRAIRIE', CAST(49.66768 AS Decimal(18, 5)), CAST(-103.86782 AS Decimal(18, 5)), N'416 7  STREET NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (685, N'00074_PRAIRIEEA', CAST(50.84235 AS Decimal(18, 5)), CAST(-101.70069 AS Decimal(18, 5)), N'HIGHWAY 16 WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (686, N'00074_PREECEVIL', CAST(51.95240 AS Decimal(18, 5)), CAST(-102.65882 AS Decimal(18, 5)), N'72 - 7th SREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (687, N'00074_RENEE', CAST(50.91297 AS Decimal(18, 5)), CAST(-113.95760 AS Decimal(18, 5)), N'231 McKENZIE TOWNE LINK SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (688, N'00074_RIDGEVET', CAST(50.00166 AS Decimal(18, 5)), CAST(-110.66734 AS Decimal(18, 5)), N'#9, 1224 STRACHAN ROAD S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (689, N'00074_RIMBEY', CAST(52.63957 AS Decimal(18, 5)), CAST(-114.23026 AS Decimal(18, 5)), N'4605 50 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (690, N'00074_RIVERBEND', CAST(53.49415 AS Decimal(18, 5)), CAST(-113.57755 AS Decimal(18, 5)), N'5611 RIVERBEND ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (691, N'00074_RIVERHEIG', CAST(52.16026 AS Decimal(18, 5)), CAST(-106.64502 AS Decimal(18, 5)), N'7 ASSINIBOINE DR', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (692, N'00074_ROBERTA', CAST(49.26895 AS Decimal(18, 5)), CAST(-123.10229 AS Decimal(18, 5)), N'1818 Quebec street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (693, N'00074_ROSSLYN', CAST(53.59746 AS Decimal(18, 5)), CAST(-113.49339 AS Decimal(18, 5)), N'13540 97TH STREET N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (694, N'00074_SELKIRK', CAST(50.16045 AS Decimal(18, 5)), CAST(-96.88520 AS Decimal(18, 5)), N'6 WERSH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (695, N'00074_SHERWOOD', CAST(50.45190 AS Decimal(18, 5)), CAST(-104.61431 AS Decimal(18, 5)), N'HWY 1 E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (696, N'00074_SLAVELAKE', CAST(55.28658 AS Decimal(18, 5)), CAST(-114.77332 AS Decimal(18, 5)), N'121 - 6th AVENUE N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (697, N'00074_SOUTHPEAC', CAST(55.76099 AS Decimal(18, 5)), CAST(-120.24455 AS Decimal(18, 5)), N'1500 - 101 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (698, N'00074_SOUTHWOOD', CAST(50.96215 AS Decimal(18, 5)), CAST(-114.08600 AS Decimal(18, 5)), N'#140. 10233 ELBOW DRIVE SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (699, N'00074_STPIERRE', CAST(49.43265 AS Decimal(18, 5)), CAST(-96.98473 AS Decimal(18, 5)), N'29041 HIGHWAY 59 SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (700, N'00074_STRATHMOR', CAST(51.03193 AS Decimal(18, 5)), CAST(-113.38602 AS Decimal(18, 5)), N'43 SPRUCE LANE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (701, N'00074_TERWILLIG', CAST(53.47625 AS Decimal(18, 5)), CAST(-113.57733 AS Decimal(18, 5)), N'14735 - 40 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (702, N'00074_THICKWOOD', CAST(56.73035 AS Decimal(18, 5)), CAST(-111.42739 AS Decimal(18, 5)), N'101 SIGNAL ROAD BAY 10', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (703, N'00074_TMZ', CAST(50.65110 AS Decimal(18, 5)), CAST(-104.87461 AS Decimal(18, 5)), N'720 PLEASANT STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (704, N'00074_VALLEYDRU', CAST(51.46189 AS Decimal(18, 5)), CAST(-112.73513 AS Decimal(18, 5)), N'1141 SOUTH RAILWAY AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (705, N'00074_VALLEYHAN', CAST(51.64591 AS Decimal(18, 5)), CAST(-111.91686 AS Decimal(18, 5)), N'321 - 3rd AVENUE EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (706, N'00074_VICTORIA', CAST(50.44732 AS Decimal(18, 5)), CAST(-104.59029 AS Decimal(18, 5)), N'628 VICTORIA AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (707, N'00074_WARMAN', CAST(52.30896 AS Decimal(18, 5)), CAST(-106.57570 AS Decimal(18, 5)), N'903 6TH AVE S', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (708, N'00074_WESTLOCK', CAST(54.16302 AS Decimal(18, 5)), CAST(-113.84847 AS Decimal(18, 5)), N'10819 - 104 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (709, N'00074_WESTWARD', CAST(52.12960 AS Decimal(18, 5)), CAST(-106.68489 AS Decimal(18, 5)), N'1006 - 22nd STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (710, N'00074_YELLOWHEA', CAST(53.53903 AS Decimal(18, 5)), CAST(-113.97813 AS Decimal(18, 5)), N'300 - 4305 SOUTH PARK DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (711, N'00075', CAST(51.04855 AS Decimal(18, 5)), CAST(-114.07591 AS Decimal(18, 5)), N'P.O. BOX 2810', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (712, N'00078', CAST(53.55387 AS Decimal(18, 5)), CAST(-113.68176 AS Decimal(18, 5)), N'17848-108 A AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (713, N'00082', CAST(44.61231 AS Decimal(18, 5)), CAST(-63.49289 AS Decimal(18, 5)), N'26 COW BAY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (714, N'00086', CAST(50.91230 AS Decimal(18, 5)), CAST(-114.08789 AS Decimal(18, 5)), N'28 SHANNON CIRCLE SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (715, N'00086_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (716, N'00087', CAST(45.60517 AS Decimal(18, 5)), CAST(-73.60652 AS Decimal(18, 5)), N'6373 DES GRANDES PRAIRIES', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (717, N'00091_BORDER', CAST(52.35958 AS Decimal(18, 5)), CAST(-110.24522 AS Decimal(18, 5)), N'40 WHEATLAND CR.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (718, N'00091_VDRRETURN', CAST(51.05956 AS Decimal(18, 5)), CAST(-113.99395 AS Decimal(18, 5)), N'919 - 28th STREET N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (719, N'00091_WWILLIAMS', CAST(49.99588 AS Decimal(18, 5)), CAST(-97.31995 AS Decimal(18, 5)), N'HWY 6 at PR236', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (720, N'00093', CAST(53.56674 AS Decimal(18, 5)), CAST(-113.63501 AS Decimal(18, 5)), N'11620 - 181 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (721, N'00095', CAST(43.18218 AS Decimal(18, 5)), CAST(-95.85445 AS Decimal(18, 5)), N'SALES OFFICE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (722, N'00096', CAST(49.04402 AS Decimal(18, 5)), CAST(-122.27964 AS Decimal(18, 5)), N'34079 GLADYS AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (723, N'00096_OLDS', CAST(51.79583 AS Decimal(18, 5)), CAST(-114.11237 AS Decimal(18, 5)), N'5314 - 46th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (724, N'00096_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (725, N'00099', CAST(43.52208 AS Decimal(18, 5)), CAST(-80.22838 AS Decimal(18, 5)), N'RESEARCH PARK CENTER', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (726, N'00104', CAST(43.50020 AS Decimal(18, 5)), CAST(-79.64043 AS Decimal(18, 5)), N'2500 ROYAL WINSOR DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (727, N'00104_24HOUR', CAST(50.44721 AS Decimal(18, 5)), CAST(-104.55938 AS Decimal(18, 5)), N'1846 VICTORIA AVENUE EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (728, N'00104_ACADRIVE', CAST(50.96004 AS Decimal(18, 5)), CAST(-114.04511 AS Decimal(18, 5)), N'816 WILLOW PARK DRIVE SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (729, N'00104_ALLWEST', CAST(52.13495 AS Decimal(18, 5)), CAST(-106.72058 AS Decimal(18, 5)), N'3120 LAURIER DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (730, N'00104_ANIMALFIR', CAST(55.18583 AS Decimal(18, 5)), CAST(-118.76861 AS Decimal(18, 5)), N'Unit 101', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (731, N'00104_AURORA', CAST(56.73258 AS Decimal(18, 5)), CAST(-111.46353 AS Decimal(18, 5)), N'14 - 100 REAL MARTIN DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (732, N'00104_AVP', CAST(43.50020 AS Decimal(18, 5)), CAST(-79.64043 AS Decimal(18, 5)), N'2500 ROYAL WINSOR DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (733, N'00104_BATTLE', CAST(53.02439 AS Decimal(18, 5)), CAST(-112.82869 AS Decimal(18, 5)), N'5208 - 51 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (734, N'00104_BECK', CAST(53.52295 AS Decimal(18, 5)), CAST(-113.51135 AS Decimal(18, 5)), N'8705 109 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (735, N'00104_BELLIS', CAST(54.14420 AS Decimal(18, 5)), CAST(-112.15112 AS Decimal(18, 5)), N'59460 Range Road 152', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (736, N'00104_BONNYVILL', CAST(54.26831 AS Decimal(18, 5)), CAST(-110.75524 AS Decimal(18, 5)), N'61219 HIGHWAY 41 NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (737, N'00104_CALGARYTR', CAST(53.47304 AS Decimal(18, 5)), CAST(-113.49391 AS Decimal(18, 5)), N'#810, 3803 CALGARY TRAIL N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (738, N'00104_CAMROSE', CAST(53.01579 AS Decimal(18, 5)), CAST(-112.81147 AS Decimal(18, 5)), N'4712 - 41ST STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (739, N'00104_CASTLEDOW', CAST(53.62550 AS Decimal(18, 5)), CAST(-113.50099 AS Decimal(18, 5)), N'10223  164 aVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (740, N'00104_CATCLINIC', CAST(51.07021 AS Decimal(18, 5)), CAST(-114.11672 AS Decimal(18, 5)), N'2116 CROWCHILD TRAIL N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (741, N'00104_CENTRAL', CAST(52.24353 AS Decimal(18, 5)), CAST(-113.81559 AS Decimal(18, 5)), N'2404 Gaetz AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (742, N'00104_CENTRALSK', CAST(52.13042 AS Decimal(18, 5)), CAST(-106.59829 AS Decimal(18, 5)), N'106 103 STREET E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (743, N'00104_CLAREVIEW', CAST(53.60879 AS Decimal(18, 5)), CAST(-113.41730 AS Decimal(18, 5)), N'14604 - 50th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (744, N'00104_COMPANION', CAST(53.42949 AS Decimal(18, 5)), CAST(-113.51635 AS Decimal(18, 5)), N'#8 BLACKBURN DRIVE, WEST SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (745, N'00104_CRESTWOOD', CAST(53.53432 AS Decimal(18, 5)), CAST(-113.57864 AS Decimal(18, 5)), N'9640 - 149  STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (746, N'00104_CROSSROAD', CAST(50.00993 AS Decimal(18, 5)), CAST(-110.63789 AS Decimal(18, 5)), N'#5, 181 CARRY DRIVE S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (747, N'00104_CYPRESS', CAST(50.01596 AS Decimal(18, 5)), CAST(-110.70652 AS Decimal(18, 5)), N'2458  9 AVE SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (748, N'00104_DELTON', CAST(53.58449 AS Decimal(18, 5)), CAST(-113.46786 AS Decimal(18, 5)), N'8203 127  AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (749, N'00104_DOGSWINGS', CAST(53.56034 AS Decimal(18, 5)), CAST(-113.62028 AS Decimal(18, 5)), N'11343 174th Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (750, N'00104_EDMSOUTH', CAST(53.47220 AS Decimal(18, 5)), CAST(-113.48536 AS Decimal(18, 5)), N'3823 - 99 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (751, N'00104_ELLERSLIE', CAST(53.42887 AS Decimal(18, 5)), CAST(-113.47847 AS Decimal(18, 5)), N'2943 ELLWOOD DRIVE S.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (752, N'00104_ERINDALE', CAST(52.14761 AS Decimal(18, 5)), CAST(-106.57064 AS Decimal(18, 5)), N'#14, 410 LUDLOW STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (753, N'00104_FAIRVIEW', CAST(56.06112 AS Decimal(18, 5)), CAST(-118.38658 AS Decimal(18, 5)), N'11235 - 98th AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (754, N'00104_FAMILYPET', CAST(53.64829 AS Decimal(18, 5)), CAST(-113.62471 AS Decimal(18, 5)), N'140 - 12 INGLEWOOD DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (755, N'00104_FORTSASK', CAST(53.71349 AS Decimal(18, 5)), CAST(-113.21045 AS Decimal(18, 5)), N'10408 - 100 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (756, N'00104_FRONTIERS', CAST(52.15756 AS Decimal(18, 5)), CAST(-106.66770 AS Decimal(18, 5)), N'2035A ALBERTA AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (757, N'00104_GARDINER', CAST(50.43528 AS Decimal(18, 5)), CAST(-104.55486 AS Decimal(18, 5)), N'330 GARDINER PARK COURT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (758, N'00104_GATEWAY', CAST(52.37808 AS Decimal(18, 5)), CAST(-114.91662 AS Decimal(18, 5)), N'6, 5208 - 48 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (759, N'00104_GENERAL', CAST(53.56320 AS Decimal(18, 5)), CAST(-113.56704 AS Decimal(18, 5)), N'11403 143 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (760, N'00104_GLENORA', CAST(53.55122 AS Decimal(18, 5)), CAST(-113.53362 AS Decimal(18, 5)), N'12230  107 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (761, N'00104_GREENBANK', CAST(53.54163 AS Decimal(18, 5)), CAST(-113.43265 AS Decimal(18, 5)), N'6710  101 AVENUE  NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (762, N'00104_GUARDIAN', CAST(53.49218 AS Decimal(18, 5)), CAST(-113.48759 AS Decimal(18, 5)), N'5620 - 99th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (763, N'00104_HERMITAGE', CAST(53.59005 AS Decimal(18, 5)), CAST(-113.41964 AS Decimal(18, 5)), N'5050 130 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (764, N'00104_HICKORY', CAST(52.84765 AS Decimal(18, 5)), CAST(-110.84438 AS Decimal(18, 5)), N'1811 - 19 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (765, N'00104_HOOVES', CAST(51.20206 AS Decimal(18, 5)), CAST(-108.03331 AS Decimal(18, 5)), N'116 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (766, N'00104_INNISFAIL', CAST(52.02683 AS Decimal(18, 5)), CAST(-113.95860 AS Decimal(18, 5)), N'5239 - 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (767, N'00104_IRONCREEK', CAST(52.76927 AS Decimal(18, 5)), CAST(-111.69123 AS Decimal(18, 5)), N'#8  SPRUCE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (768, N'00104_JASPER', CAST(52.87619 AS Decimal(18, 5)), CAST(-118.07959 AS Decimal(18, 5)), N'LOT 50 BLOCK S', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (769, N'00104_LACOMBE', CAST(52.47560 AS Decimal(18, 5)), CAST(-113.71699 AS Decimal(18, 5)), N'5828 Highway 2A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (770, N'00104_LACSTANNE', CAST(53.72514 AS Decimal(18, 5)), CAST(-114.34275 AS Decimal(18, 5)), N'#410, 55022 St Anne Trail', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (771, N'00104_LAKELAND', CAST(53.35005 AS Decimal(18, 5)), CAST(-110.87252 AS Decimal(18, 5)), N'5707 COLLEGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (772, N'00104_LANDING', CAST(50.97343 AS Decimal(18, 5)), CAST(-114.09750 AS Decimal(18, 5)), N'C155, 1600 -  90  AVENUE  SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (773, N'00104_LOYDMINST', CAST(53.29730 AS Decimal(18, 5)), CAST(-110.00673 AS Decimal(18, 5)), N'6002 - 50 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (774, N'00104_MARDALOOP', CAST(51.01869 AS Decimal(18, 5)), CAST(-114.10018 AS Decimal(18, 5)), N'4016 16 STREET SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (775, N'00104_MAYERTHOR', CAST(53.94773 AS Decimal(18, 5)), CAST(-115.13753 AS Decimal(18, 5)), N'4818 - 42 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (776, N'00104_MEADOWBRO', CAST(53.47451 AS Decimal(18, 5)), CAST(-113.39189 AS Decimal(18, 5)), N'3903 - 34th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (777, N'00104_MILLCREEK', CAST(53.52203 AS Decimal(18, 5)), CAST(-113.48629 AS Decimal(18, 5)), N'8606 99 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (778, N'00104_MISSIONRI', CAST(53.64647 AS Decimal(18, 5)), CAST(-113.62827 AS Decimal(18, 5)), N'51 LIBERTON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (779, N'00104_NAIT', CAST(53.56832 AS Decimal(18, 5)), CAST(-113.50495 AS Decimal(18, 5)), N'11762 - 106 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (780, N'00104_NOTIKEWIN', CAST(56.92332 AS Decimal(18, 5)), CAST(-117.62865 AS Decimal(18, 5)), N'P.O. BOX 688', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (781, N'00104_OLDSPIONE', CAST(51.79788 AS Decimal(18, 5)), CAST(-114.12639 AS Decimal(18, 5)), N'6110 IMPERIAL WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (782, N'00104_ONOWAY', CAST(53.70668 AS Decimal(18, 5)), CAST(-114.18481 AS Decimal(18, 5)), N'5119 LAC STE ANNE TRAIL NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (783, N'00104_ORCHARDVE', CAST(52.08274 AS Decimal(18, 5)), CAST(-106.64132 AS Decimal(18, 5)), N'BAY #21 & 22, 2605 BROADWAY AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (784, N'00104_OTTEWELL', CAST(53.52526 AS Decimal(18, 5)), CAST(-113.42700 AS Decimal(18, 5)), N'6120 - 90 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (785, N'00104_PARKLAND', CAST(53.53992 AS Decimal(18, 5)), CAST(-113.93257 AS Decimal(18, 5)), N'UNIT #58, 96 CAMPSITE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (786, N'00104_PEACERIVE', CAST(56.23355 AS Decimal(18, 5)), CAST(-117.33958 AS Decimal(18, 5)), N'7710-100 ave', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (787, N'00104_PONOKAVET', CAST(52.68140 AS Decimal(18, 5)), CAST(-113.58237 AS Decimal(18, 5)), N'5502  HWY 2A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (788, N'00104_POPLARGRO', CAST(52.02227 AS Decimal(18, 5)), CAST(-113.93784 AS Decimal(18, 5)), N'4408 - 42 Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (789, N'00104_PRAIRIELA', CAST(52.10001 AS Decimal(18, 5)), CAST(-106.66940 AS Decimal(18, 5)), N'118, 110 RUTH STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (790, N'00104_REDWILLOW', CAST(53.62245 AS Decimal(18, 5)), CAST(-113.60975 AS Decimal(18, 5)), N'119 - 1 HEBERT ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (791, N'00104_RIVERSAN', CAST(56.24608 AS Decimal(18, 5)), CAST(-120.86255 AS Decimal(18, 5)), N'10903 - 100 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (792, N'00104_RIVERVIEW', CAST(53.35207 AS Decimal(18, 5)), CAST(-113.72694 AS Decimal(18, 5)), N'UNIT 7, 102 ERIE STREET SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (793, N'00104_ROCKYRAP', CAST(53.21801 AS Decimal(18, 5)), CAST(-114.98826 AS Decimal(18, 5)), N'5606 - 56 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (794, N'00104_ROYALOAK', CAST(48.49301 AS Decimal(18, 5)), CAST(-123.38817 AS Decimal(18, 5)), N'#101, 4478 WEST SAANICH ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (795, N'00104_SEVICK', CAST(51.04183 AS Decimal(18, 5)), CAST(-113.39621 AS Decimal(18, 5)), N'1, 219 -3RD  AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (796, N'00104_SHEEPRIVE', CAST(50.72084 AS Decimal(18, 5)), CAST(-113.95259 AS Decimal(18, 5)), N'209 STOCKTON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (797, N'00104_SIFTON', CAST(53.59637 AS Decimal(18, 5)), CAST(-113.41433 AS Decimal(18, 5)), N'13680 - 50th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (798, N'00104_SOUTHPOIN', CAST(50.93266 AS Decimal(18, 5)), CAST(-113.96962 AS Decimal(18, 5)), N'#210, 4600 - 130th AVENUE S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (799, N'00104_SOUTHSIDE', CAST(53.49715 AS Decimal(18, 5)), CAST(-113.49738 AS Decimal(18, 5)), N'6003 104 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (800, N'00104_SPRUCEGRO', CAST(53.53894 AS Decimal(18, 5)), CAST(-113.90966 AS Decimal(18, 5)), N'#5 SOUTH AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (801, N'00104_STONEBRID', CAST(52.08443 AS Decimal(18, 5)), CAST(-106.64201 AS Decimal(18, 5)), N'#5, 215 STONEBRIDGE BOULEVARD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (802, N'00104_SUSAN_ONO', CAST(51.00045 AS Decimal(18, 5)), CAST(-114.03313 AS Decimal(18, 5)), N'SENTINEL SELF STORAGE # E36', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (803, N'00104_TANYAKUSH', CAST(53.54475 AS Decimal(18, 5)), CAST(-113.49845 AS Decimal(18, 5)), N'C/O AFFORDABLE MINI STORAGE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (804, N'00104_TAYLOR', CAST(52.28996 AS Decimal(18, 5)), CAST(-113.83880 AS Decimal(18, 5)), N'105, 6730 TAYLOR DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (805, N'00104_TOWN', CAST(53.45874 AS Decimal(18, 5)), CAST(-113.45989 AS Decimal(18, 5)), N'1502 LAKEWOOD ROAD WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (806, N'00104_UNCAS', CAST(53.49894 AS Decimal(18, 5)), CAST(-113.02516 AS Decimal(18, 5)), N'265-52307 Rge Rd 213', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (807, N'00104_UOFCAL', CAST(44.12280 AS Decimal(18, 5)), CAST(-92.67023 AS Decimal(18, 5)), N'MUENCH GREGORY  (DVM)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (808, N'00104_UOFSASK', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'c/o Nestle Rep VET BIO SC LOAD DOCK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (809, N'00104_VALLEYVET', CAST(51.82330 AS Decimal(18, 5)), CAST(-113.23380 AS Decimal(18, 5)), N'125 - 1ST AVENUE NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (810, N'00104_VEGREVILL', CAST(53.49327 AS Decimal(18, 5)), CAST(-112.06712 AS Decimal(18, 5)), N'5014 MAPLE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (811, N'00104_WESTBROOK', CAST(53.47241 AS Decimal(18, 5)), CAST(-113.54013 AS Decimal(18, 5)), N'21 FAIRWAY DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (812, N'00104_WESTMOUNT', CAST(51.05240 AS Decimal(18, 5)), CAST(-114.09534 AS Decimal(18, 5)), N'1609A  KENSINGTON ROAD NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (813, N'00104_WESTWARD', CAST(52.12960 AS Decimal(18, 5)), CAST(-106.68489 AS Decimal(18, 5)), N'1006 22ND STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (814, N'00104_WETASKIWI', CAST(52.95714 AS Decimal(18, 5)), CAST(-113.37271 AS Decimal(18, 5)), N'4735 - 39 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (815, N'00104_WETASKVET', CAST(52.96014 AS Decimal(18, 5)), CAST(-113.37376 AS Decimal(18, 5)), N'4808 - 40 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (816, N'00104_WILDROSE', CAST(50.96972 AS Decimal(18, 5)), CAST(-114.07011 AS Decimal(18, 5)), N'UNIT#64, 180 - 94 AVENUE S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (817, N'00105', CAST(45.44378 AS Decimal(18, 5)), CAST(-73.87497 AS Decimal(18, 5)), N'17700 Trans Canada Highway', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (818, N'00106', CAST(52.26457 AS Decimal(18, 5)), CAST(-113.82648 AS Decimal(18, 5)), N'#1, 5551 - 45 St', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (819, N'00107', CAST(53.56550 AS Decimal(18, 5)), CAST(-113.60538 AS Decimal(18, 5)), N'16507 - 116 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (820, N'00109', CAST(43.52244 AS Decimal(18, 5)), CAST(-80.22816 AS Decimal(18, 5)), N'#225, 150  Research Lane', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (821, N'00111', CAST(43.77437 AS Decimal(18, 5)), CAST(-79.32427 AS Decimal(18, 5)), N'6 LANSING SQUARE, SUITE 218', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (822, N'00112', CAST(53.56595 AS Decimal(18, 5)), CAST(-113.59304 AS Decimal(18, 5)), N'15783 -116 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (823, N'00113', CAST(43.64787 AS Decimal(18, 5)), CAST(-79.37947 AS Decimal(18, 5)), N'P.O.BOX 3616', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (824, N'00114', CAST(38.04727 AS Decimal(18, 5)), CAST(-84.49757 AS Decimal(18, 5)), N'REMITTANCE PROCESSING DIVISION', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (825, N'00115', CAST(43.90910 AS Decimal(18, 5)), CAST(-80.10926 AS Decimal(18, 5)), N'40 CENTENNIAL ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (826, N'00118', CAST(53.56535 AS Decimal(18, 5)), CAST(-113.57956 AS Decimal(18, 5)), N'11468-149 STREET\', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (827, N'00119', CAST(43.45876 AS Decimal(18, 5)), CAST(-80.12284 AS Decimal(18, 5)), N'100 BEIBER ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (828, N'00119_CARTY', CAST(49.87460 AS Decimal(18, 5)), CAST(-97.12045 AS Decimal(18, 5)), N'#206-108 CHANDOS AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (829, N'00119_GREENHALG', CAST(49.94588 AS Decimal(18, 5)), CAST(-119.43718 AS Decimal(18, 5)), N'1979 TWIN RIDGE COURT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (830, N'00119_HENDRICKS', CAST(52.07582 AS Decimal(18, 5)), CAST(-106.60749 AS Decimal(18, 5)), N'455 VELTKAMP CRES.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (831, N'00119_KELSEY', CAST(51.03839 AS Decimal(18, 5)), CAST(-113.44878 AS Decimal(18, 5)), N'c/o ANIMAL CARE CENTRE OF STRATH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (832, N'00120', CAST(44.16288 AS Decimal(18, 5)), CAST(-77.36793 AS Decimal(18, 5)), N'231 DUMDAS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (833, N'00121', CAST(43.03151 AS Decimal(18, 5)), CAST(-88.08221 AS Decimal(18, 5)), N'BISHOP''S WOODS CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (834, N'00122', CAST(43.82221 AS Decimal(18, 5)), CAST(-79.33057 AS Decimal(18, 5)), N'165 Gibson Drive', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (835, N'00123', CAST(53.56381 AS Decimal(18, 5)), CAST(-113.61114 AS Decimal(18, 5)), N'16814-114TH AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (836, N'00124', CAST(43.64804 AS Decimal(18, 5)), CAST(-79.38220 AS Decimal(18, 5)), N'77 KING ST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (837, N'00126', CAST(43.76194 AS Decimal(18, 5)), CAST(-79.54603 AS Decimal(18, 5)), N'3700 WESTON ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (838, N'00128', CAST(43.32479 AS Decimal(18, 5)), CAST(-79.85147 AS Decimal(18, 5)), N'UNIT # 13, 1550 YORKTON COURT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (839, N'00135_CALGARY', CAST(50.98453 AS Decimal(18, 5)), CAST(-113.97107 AS Decimal(18, 5)), N'4441 - 76 th Avenue SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (840, N'00135_FERGUSON', CAST(42.41516 AS Decimal(18, 5)), CAST(-82.17949 AS Decimal(18, 5)), N'332 GRAND AVENUE EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (841, N'00135_GREENACRE', CAST(49.67274 AS Decimal(18, 5)), CAST(-112.77201 AS Decimal(18, 5)), N'4651 - 24th AVENUE SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (842, N'00137', CAST(43.71112 AS Decimal(18, 5)), CAST(-79.62792 AS Decimal(18, 5)), N'6870 GOREWAY DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (843, N'00138', CAST(51.05894 AS Decimal(18, 5)), CAST(-113.99180 AS Decimal(18, 5)), N'#7 640 28TH STREET N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (844, N'00141_WHITCOURT', CAST(54.14152 AS Decimal(18, 5)), CAST(-115.67190 AS Decimal(18, 5)), N'4439 - 52 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (845, N'00142', CAST(42.23914 AS Decimal(18, 5)), CAST(-87.99842 AS Decimal(18, 5)), N'WAREHOUSE 11', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (846, N'00144', CAST(45.62928 AS Decimal(18, 5)), CAST(-72.97053 AS Decimal(18, 5)), N'2900 VANIER AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (847, N'00148', CAST(43.89119 AS Decimal(18, 5)), CAST(-78.95005 AS Decimal(18, 5)), N'828 CENTRE STREET NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (848, N'00150', CAST(43.52244 AS Decimal(18, 5)), CAST(-80.22816 AS Decimal(18, 5)), N'#225  150 RESEARCH LANE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (849, N'00153', CAST(51.09010 AS Decimal(18, 5)), CAST(-114.03784 AS Decimal(18, 5)), N'#1, 4216  10th STREET N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (850, N'00161', CAST(45.49038 AS Decimal(18, 5)), CAST(-73.73672 AS Decimal(18, 5)), N'8455 TRANS CANADA HWY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (851, N'00169', CAST(51.04661 AS Decimal(18, 5)), CAST(-114.06890 AS Decimal(18, 5)), N'P.O. BOX 2877', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (852, N'00170', CAST(49.83672 AS Decimal(18, 5)), CAST(-99.97709 AS Decimal(18, 5)), N'18 BALSAM CRESENT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (853, N'00172', CAST(32.84000 AS Decimal(18, 5)), CAST(-97.14000 AS Decimal(18, 5)), N'P.O. BOX 210037', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (854, N'00176', CAST(53.78712 AS Decimal(18, 5)), CAST(-113.63601 AS Decimal(18, 5)), N'9503-90TH AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (855, N'00178', CAST(53.56012 AS Decimal(18, 5)), CAST(-113.52794 AS Decimal(18, 5)), N'100, 11910-111 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (856, N'00185', CAST(53.49777 AS Decimal(18, 5)), CAST(-113.64311 AS Decimal(18, 5)), N'6309 - 187 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (857, N'00186', CAST(53.46448 AS Decimal(18, 5)), CAST(-113.56864 AS Decimal(18, 5)), N'352 O''CONNOR CLOSE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (858, N'00187', CAST(43.85364 AS Decimal(18, 5)), CAST(-79.05766 AS Decimal(18, 5)), N'60 RANDALL DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (859, N'00188', CAST(53.55835 AS Decimal(18, 5)), CAST(-113.64654 AS Decimal(18, 5)), N'18719 -111 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (860, N'00192', CAST(42.76601 AS Decimal(18, 5)), CAST(-81.19103 AS Decimal(18, 5)), N'80 ELM STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (861, N'00196', CAST(45.41985 AS Decimal(18, 5)), CAST(-74.24227 AS Decimal(18, 5)), N'79', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (862, N'00197', CAST(40.53837 AS Decimal(18, 5)), CAST(-74.83386 AS Decimal(18, 5)), N'2 DARTS MILL ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (863, N'00202', CAST(43.76424 AS Decimal(18, 5)), CAST(-79.54692 AS Decimal(18, 5)), N'200 BARMAC DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (864, N'00207', CAST(43.33339 AS Decimal(18, 5)), CAST(-5.77224 AS Decimal(18, 5)), N'408 GRAND RANG ST FRANCOIS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (865, N'00211', CAST(53.53464 AS Decimal(18, 5)), CAST(-113.32487 AS Decimal(18, 5)), N'14 CHIPPEWA ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (866, N'00212', CAST(53.49487 AS Decimal(18, 5)), CAST(-113.48676 AS Decimal(18, 5)), N'5830 - 99 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (867, N'00213', CAST(43.48404 AS Decimal(18, 5)), CAST(-80.15323 AS Decimal(18, 5)), N'40 FOX RUN DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (868, N'00215', CAST(43.23092 AS Decimal(18, 5)), CAST(-79.73114 AS Decimal(18, 5)), N'263 BARTON STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (869, N'00216', CAST(43.60258 AS Decimal(18, 5)), CAST(-79.77443 AS Decimal(18, 5)), N'2455 MEADOWPINE BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (870, N'00217', CAST(43.03346 AS Decimal(18, 5)), CAST(-70.79142 AS Decimal(18, 5)), N'20 POST ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (871, N'00218', CAST(50.58010 AS Decimal(18, 5)), CAST(-113.87073 AS Decimal(18, 5)), N'PO BOX 5007', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (872, N'00225', CAST(43.37426 AS Decimal(18, 5)), CAST(-80.33543 AS Decimal(18, 5)), N'12 ESTHER AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (873, N'00228', CAST(45.20142 AS Decimal(18, 5)), CAST(-72.73951 AS Decimal(18, 5)), N'105 LAUDER', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (874, N'00228_LEAH', CAST(51.11421 AS Decimal(18, 5)), CAST(-114.16748 AS Decimal(18, 5)), N'142 Dal Castle Close NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (875, N'00231_COTTONWOO', CAST(49.49000 AS Decimal(18, 5)), CAST(-117.29190 AS Decimal(18, 5)), N'501 CARBONATE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (876, N'00231_PICKUP', CAST(33.02183 AS Decimal(18, 5)), CAST(-117.08266 AS Decimal(18, 5)), N'TAMMY SORENSEN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (877, N'00231_SOUTHPEAC', CAST(55.76099 AS Decimal(18, 5)), CAST(-120.24455 AS Decimal(18, 5)), N'1500-101 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (878, N'00239', CAST(53.51656 AS Decimal(18, 5)), CAST(-113.37916 AS Decimal(18, 5)), N'2310 - 80TH AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (879, N'00243', CAST(43.80103 AS Decimal(18, 5)), CAST(-79.54571 AS Decimal(18, 5)), N'410 CHRISLEA RD.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (880, N'00244', CAST(53.63907 AS Decimal(18, 5)), CAST(-113.56723 AS Decimal(18, 5)), N'15 CALDER PLACE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (881, N'00248', CAST(45.64762 AS Decimal(18, 5)), CAST(-72.69615 AS Decimal(18, 5)), N'42 ST-CYRILLE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (882, N'00251', CAST(53.56518 AS Decimal(18, 5)), CAST(-113.58938 AS Decimal(18, 5)), N'15515-115A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (883, N'00252', CAST(43.71888 AS Decimal(18, 5)), CAST(-79.46305 AS Decimal(18, 5)), N'80 ORFUS ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (884, N'00253', CAST(47.99026 AS Decimal(18, 5)), CAST(8.79540 AS Decimal(18, 5)), N'ELTASTRASSE 8', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (885, N'00266', CAST(53.33857 AS Decimal(18, 5)), CAST(-113.51605 AS Decimal(18, 5)), N'#7 2002 - 8th Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (886, N'00272', CAST(49.88325 AS Decimal(18, 5)), CAST(-97.18428 AS Decimal(18, 5)), N'200 - 1200 PORTAGE AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (887, N'00283', CAST(49.32847 AS Decimal(18, 5)), CAST(-123.15581 AS Decimal(18, 5)), N'#200B - MARINE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (888, N'00291', CAST(53.48902 AS Decimal(18, 5)), CAST(-113.47396 AS Decimal(18, 5)), N'9450 - 51 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (889, N'00293', CAST(43.32479 AS Decimal(18, 5)), CAST(-79.85147 AS Decimal(18, 5)), N'UNIT # 13', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (890, N'00294', CAST(43.32479 AS Decimal(18, 5)), CAST(-79.85147 AS Decimal(18, 5)), N'UNIT # 13', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (891, N'00295', CAST(49.15514 AS Decimal(18, 5)), CAST(-122.86509 AS Decimal(18, 5)), N'12920-84th AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (892, N'00295_LACOMBE', CAST(52.47560 AS Decimal(18, 5)), CAST(-113.71699 AS Decimal(18, 5)), N'5828 HWY 2A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (893, N'00298', CAST(29.55987 AS Decimal(18, 5)), CAST(-98.58994 AS Decimal(18, 5)), N'P.O. BOX 696517', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (894, N'00298_UNIVSASK', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'ROOM 1525   52 CAMPUS DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (895, N'00302', CAST(38.90102 AS Decimal(18, 5)), CAST(-77.24211 AS Decimal(18, 5)), N'BRAD VAN DER VEEN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (896, N'00312', CAST(43.52117 AS Decimal(18, 5)), CAST(-80.21029 AS Decimal(18, 5)), N'1030 GORDON STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (897, N'00312_PICKUP', CAST(40.81060 AS Decimal(18, 5)), CAST(-73.94482 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (898, N'00314', CAST(45.34933 AS Decimal(18, 5)), CAST(-72.78604 AS Decimal(18, 5)), N'207A des Alouettes', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (899, N'00317', CAST(34.00335 AS Decimal(18, 5)), CAST(-117.70549 AS Decimal(18, 5)), N'13775 Ramona Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (900, N'00320', CAST(52.17741 AS Decimal(18, 5)), CAST(-106.64472 AS Decimal(18, 5)), N'30 MOLARO PLACE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (901, N'00323', CAST(51.09760 AS Decimal(18, 5)), CAST(-114.04503 AS Decimal(18, 5)), N'87 SKYLINE CR. NE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (902, N'00325', CAST(50.96034 AS Decimal(18, 5)), CAST(-113.97015 AS Decimal(18, 5)), N'4535 - 104 AVE  SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (903, N'00327', CAST(39.92238 AS Decimal(18, 5)), CAST(-105.10210 AS Decimal(18, 5)), N'3001 INDUSTRIAL LANE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (904, N'00329', CAST(42.11289 AS Decimal(18, 5)), CAST(-72.10215 AS Decimal(18, 5)), N'443 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (905, N'00353', CAST(34.28236 AS Decimal(18, 5)), CAST(-118.43016 AS Decimal(18, 5)), N'547 LIBRARY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (906, N'00358', CAST(45.61961 AS Decimal(18, 5)), CAST(-73.58128 AS Decimal(18, 5)), N'10, 900 SECANT STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (907, N'00359', CAST(49.20685 AS Decimal(18, 5)), CAST(-123.09372 AS Decimal(18, 5)), N'550 East Kent Avenue South', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (908, N'00362', CAST(46.78683 AS Decimal(18, 5)), CAST(-71.30713 AS Decimal(18, 5)), N'3220 rue WATT,', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (909, N'00367', CAST(50.92951 AS Decimal(18, 5)), CAST(-114.02150 AS Decimal(18, 5)), N'27 DEERVIEW WAY SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (910, N'00370', CAST(43.45876 AS Decimal(18, 5)), CAST(-80.12284 AS Decimal(18, 5)), N'100 BEIBER ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (911, N'00372', CAST(21.38448 AS Decimal(18, 5)), CAST(-157.95164 AS Decimal(18, 5)), N'98-030 HEKAHA STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (912, N'00374', CAST(52.18069 AS Decimal(18, 5)), CAST(-106.64864 AS Decimal(18, 5)), N'850C 56TH ST E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (913, N'00375_DISASTER', CAST(53.90710 AS Decimal(18, 5)), CAST(-122.78966 AS Decimal(18, 5)), N'c/o  PRINCE GEORGE VET CLINIC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (914, N'00383', CAST(43.35297 AS Decimal(18, 5)), CAST(-80.31939 AS Decimal(18, 5)), N'31-130 CEDAR STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (915, N'00388', CAST(33.79875 AS Decimal(18, 5)), CAST(-117.86611 AS Decimal(18, 5)), N'675 NORTH MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (916, N'00394', CAST(42.91675 AS Decimal(18, 5)), CAST(-78.85149 AS Decimal(18, 5)), N'C/O AGENCE AUDREY SMITH AGENCY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (917, N'00394_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (918, N'00396', CAST(53.53528 AS Decimal(18, 5)), CAST(-113.41276 AS Decimal(18, 5)), N'9471 49TH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (919, N'00398', CAST(43.75962 AS Decimal(18, 5)), CAST(-79.40993 AS Decimal(18, 5)), N'4711 YONGE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (920, N'00398_17THAVENU', CAST(51.03767 AS Decimal(18, 5)), CAST(-114.06777 AS Decimal(18, 5)), N'233 - 17 AVENUE SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (921, N'00398_DUESOUTH', CAST(50.90369 AS Decimal(18, 5)), CAST(-113.98983 AS Decimal(18, 5)), N'16626 McKENZIE LAKE BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (922, N'00398_FOODFORTH', CAST(52.13338 AS Decimal(18, 5)), CAST(-106.63081 AS Decimal(18, 5)), N'52 CAMPUS DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (923, N'00398_HERMITAGE', CAST(53.58994 AS Decimal(18, 5)), CAST(-113.41975 AS Decimal(18, 5)), N'c/o HERMITAGE VETERINARY HOSP.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (924, N'00398_KEVIN', CAST(51.05438 AS Decimal(18, 5)), CAST(-114.20694 AS Decimal(18, 5)), N'7875 WENTWORTH DRIVE SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (925, N'00398_MARLBORO', CAST(51.06360 AS Decimal(18, 5)), CAST(-113.95602 AS Decimal(18, 5)), N'BAY 186', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (926, N'00398_NAGEL', CAST(51.43206 AS Decimal(18, 5)), CAST(-114.02600 AS Decimal(18, 5)), N'1626 RAILWAY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (927, N'00398_WCVM', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'WESTERN COLLEGE OF VET MEDICINE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (928, N'00401', CAST(42.92080 AS Decimal(18, 5)), CAST(-71.53809 AS Decimal(18, 5)), N'360 ROUTE 101', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (929, N'00402', CAST(40.80482 AS Decimal(18, 5)), CAST(-73.22029 AS Decimal(18, 5)), N'2100 PACIFIC STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (930, N'00403', CAST(43.70341 AS Decimal(18, 5)), CAST(-79.64394 AS Decimal(18, 5)), N'2895 DERRY ROAD EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (931, N'00405', CAST(43.82605 AS Decimal(18, 5)), CAST(-79.33960 AS Decimal(18, 5)), N'151 ESNA PARK DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (932, N'00406', CAST(39.15865 AS Decimal(18, 5)), CAST(-78.31299 AS Decimal(18, 5)), N'ACCT# 61546', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (933, N'00406_COPPER', CAST(50.91308 AS Decimal(18, 5)), CAST(-113.95020 AS Decimal(18, 5)), N'115, 15566 McIVOR BLVD. S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (934, N'00407', CAST(37.60296 AS Decimal(18, 5)), CAST(-122.07974 AS Decimal(18, 5)), N'3240 WHIPPLE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (935, N'00411', CAST(44.46753 AS Decimal(18, 5)), CAST(-73.12270 AS Decimal(18, 5)), N'340 AVE D, SUITE 40', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (936, N'00417', CAST(43.67117 AS Decimal(18, 5)), CAST(-79.29418 AS Decimal(18, 5)), N'2255 B QUEEN STREET E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (937, N'00418', CAST(53.55659 AS Decimal(18, 5)), CAST(-113.47286 AS Decimal(18, 5)), N'8520-106 A AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (938, N'00421', CAST(33.72527 AS Decimal(18, 5)), CAST(-118.00070 AS Decimal(18, 5)), N'16321 GOTHARD ST.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (939, N'00424', CAST(51.07411 AS Decimal(18, 5)), CAST(-114.04667 AS Decimal(18, 5)), N'2424 - 7 STREET N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (940, N'00426', CAST(43.74719 AS Decimal(18, 5)), CAST(-79.52544 AS Decimal(18, 5)), N'420 EDDYSTONE AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (941, N'00431', CAST(43.69096 AS Decimal(18, 5)), CAST(-79.77797 AS Decimal(18, 5)), N'32 TALBOT STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (942, N'00432', CAST(42.96583 AS Decimal(18, 5)), CAST(-81.22089 AS Decimal(18, 5)), N'160 ADELAIDE STREET, SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (943, N'00440', CAST(32.95093 AS Decimal(18, 5)), CAST(-96.85848 AS Decimal(18, 5)), N'14822 VENTUE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (944, N'00446', CAST(43.51858 AS Decimal(18, 5)), CAST(-80.23429 AS Decimal(18, 5)), N'Suite 328', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (945, N'00449', CAST(53.55443 AS Decimal(18, 5)), CAST(-113.62391 AS Decimal(18, 5)), N'17559-108 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (946, N'00463', CAST(43.09208 AS Decimal(18, 5)), CAST(-81.33377 AS Decimal(18, 5)), N'14057 Ilderton Road', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (947, N'00466', CAST(35.94889 AS Decimal(18, 5)), CAST(-95.64680 AS Decimal(18, 5)), N'100 JAMES STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (948, N'00466_INGERSOLL', CAST(43.03724 AS Decimal(18, 5)), CAST(-80.88437 AS Decimal(18, 5)), N'56 KING STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (949, N'00466_OTTAWAHUM', CAST(45.39891 AS Decimal(18, 5)), CAST(-75.71128 AS Decimal(18, 5)), N'101 Champagne Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (950, N'00469', CAST(53.52748 AS Decimal(18, 5)), CAST(-113.41654 AS Decimal(18, 5)), N'4990 - 92 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (951, N'00470', CAST(53.58619 AS Decimal(18, 5)), CAST(-113.57687 AS Decimal(18, 5)), N'12803-149 STREET NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (952, N'00473', CAST(49.14518 AS Decimal(18, 5)), CAST(-122.30679 AS Decimal(18, 5)), N'BOX 3386', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (953, N'00474', CAST(49.88325 AS Decimal(18, 5)), CAST(-97.18428 AS Decimal(18, 5)), N'200 - 1200 PORTAGE AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (954, N'00475', CAST(45.48779 AS Decimal(18, 5)), CAST(-73.76408 AS Decimal(18, 5)), N'2600 Alfred-Nobel Blvd', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (955, N'00478', CAST(43.43941 AS Decimal(18, 5)), CAST(-79.69668 AS Decimal(18, 5)), N'407 SPEERS ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (956, N'00482', CAST(43.17380 AS Decimal(18, 5)), CAST(-79.22672 AS Decimal(18, 5)), N'10 Elberta Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (957, N'00487', CAST(43.61546 AS Decimal(18, 5)), CAST(-79.66080 AS Decimal(18, 5)), N'Suite 322, 60-8 Bristol Road East', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (958, N'00487_CALGARY', CAST(50.99970 AS Decimal(18, 5)), CAST(-113.99846 AS Decimal(18, 5)), N'2620 - 61  AVENUE SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (959, N'00494', CAST(44.38747 AS Decimal(18, 5)), CAST(-97.55035 AS Decimal(18, 5)), N'P.O. BOX 476', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (960, N'00495', CAST(43.62260 AS Decimal(18, 5)), CAST(-79.66533 AS Decimal(18, 5)), N'160 MATHESON BLVD EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (961, N'00498', CAST(39.44678 AS Decimal(18, 5)), CAST(-76.31668 AS Decimal(18, 5)), N'2208 LAKESIDE BOULEVARD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (962, N'00500', CAST(43.69135 AS Decimal(18, 5)), CAST(-79.67327 AS Decimal(18, 5)), N'7370 BRAMALEA ROAD UNIT 36', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (963, N'00501', CAST(32.78000 AS Decimal(18, 5)), CAST(-96.80000 AS Decimal(18, 5)), N'P.O. BOX 655450', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (964, N'00502', CAST(43.76434 AS Decimal(18, 5)), CAST(-79.27783 AS Decimal(18, 5)), N'1399 KENNEDY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (965, N'00503', CAST(40.91104 AS Decimal(18, 5)), CAST(-81.14050 AS Decimal(18, 5)), N'911 LEADWAY AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (966, N'00523', CAST(51.04902 AS Decimal(18, 5)), CAST(-114.00877 AS Decimal(18, 5)), N'411-19TH STREET S.E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (967, N'00524', CAST(51.04902 AS Decimal(18, 5)), CAST(-114.00877 AS Decimal(18, 5)), N'411-19th STREET S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (968, N'00525', CAST(47.39919 AS Decimal(18, 5)), CAST(8.46040 AS Decimal(18, 5)), N'WAGISTRASSE 27A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (969, N'00526', CAST(45.56743 AS Decimal(18, 5)), CAST(-73.73612 AS Decimal(18, 5)), N'1800, LE CORBUSIER BLVD  SUITE 138', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (970, N'00527', CAST(45.49479 AS Decimal(18, 5)), CAST(-73.58204 AS Decimal(18, 5)), N'1827 LINCOLN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (971, N'00528', CAST(43.46066 AS Decimal(18, 5)), CAST(-80.51936 AS Decimal(18, 5)), N'180 KING STREET SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (972, N'00529', CAST(45.45926 AS Decimal(18, 5)), CAST(-73.81150 AS Decimal(18, 5)), N'PO BOX 800', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (973, N'00530', CAST(45.47568 AS Decimal(18, 5)), CAST(-73.57989 AS Decimal(18, 5)), N'4000 RUE ST-AMBROISE BUREAU 387', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (974, N'00533', CAST(50.01905 AS Decimal(18, 5)), CAST(-119.38541 AS Decimal(18, 5)), N'9526 HALDANE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (975, N'00544', CAST(40.80901 AS Decimal(18, 5)), CAST(-73.23184 AS Decimal(18, 5)), N'250 POWER DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (976, N'00547', CAST(39.84894 AS Decimal(18, 5)), CAST(-75.72261 AS Decimal(18, 5)), N'340 NORTH MILL ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (977, N'00551', CAST(25.60384 AS Decimal(18, 5)), CAST(-80.31100 AS Decimal(18, 5)), N'Suite 633', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (978, N'00561', CAST(53.55174 AS Decimal(18, 5)), CAST(-113.61025 AS Decimal(18, 5)), N'16808 - 106 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (979, N'00563', CAST(55.35059 AS Decimal(18, 5)), CAST(10.57340 AS Decimal(18, 5)), N'HAVRETOFTEN 4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (980, N'00563_TORONTO', CAST(43.64097 AS Decimal(18, 5)), CAST(-79.37560 AS Decimal(18, 5)), N'1 HARBOUR SQUARE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (981, N'00569', CAST(45.02149 AS Decimal(18, 5)), CAST(-93.50973 AS Decimal(18, 5)), N'3505 Ranier Lane North', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (982, N'00579', CAST(49.20820 AS Decimal(18, 5)), CAST(-123.14095 AS Decimal(18, 5)), N'8623 GRANVILLE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (983, N'00579_PICKUP', CAST(43.83185 AS Decimal(18, 5)), CAST(-79.36352 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (984, N'00582', CAST(50.58010 AS Decimal(18, 5)), CAST(-113.87073 AS Decimal(18, 5)), N'PO BOX 5367', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (985, N'00583', CAST(41.28875 AS Decimal(18, 5)), CAST(-81.34329 AS Decimal(18, 5)), N'65 AURORA INDUSTRIAL PKWY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (986, N'00584', CAST(43.86502 AS Decimal(18, 5)), CAST(-79.37893 AS Decimal(18, 5)), N'45 VOGELL RD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (987, N'00589', CAST(35.99112 AS Decimal(18, 5)), CAST(-78.90200 AS Decimal(18, 5)), N'905 JACKIE ROBINSON DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (988, N'00593', CAST(43.51858 AS Decimal(18, 5)), CAST(-80.23429 AS Decimal(18, 5)), N'3-304 STONE ROAD WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (989, N'00597', CAST(53.61611 AS Decimal(18, 5)), CAST(-113.64657 AS Decimal(18, 5)), N'170 - 16 RENAULT CRESCENT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (990, N'00600', CAST(53.25624 AS Decimal(18, 5)), CAST(-113.54700 AS Decimal(18, 5)), N'4301 - 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (991, N'00601', CAST(49.25429 AS Decimal(18, 5)), CAST(-122.91901 AS Decimal(18, 5)), N'107, 3191 THUNDERBIRD CRES.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (992, N'00603', CAST(32.38463 AS Decimal(18, 5)), CAST(-80.75671 AS Decimal(18, 5)), N'218 WILLOW POINT ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (993, N'00604', CAST(45.45160 AS Decimal(18, 5)), CAST(-73.72104 AS Decimal(18, 5)), N'1370 55TH AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (994, N'00611', CAST(53.52748 AS Decimal(18, 5)), CAST(-113.41654 AS Decimal(18, 5)), N'4990 - 92 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (995, N'00616', CAST(45.46173 AS Decimal(18, 5)), CAST(-73.82631 AS Decimal(18, 5)), N'1 HOLIDAY AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (996, N'00618', CAST(41.96317 AS Decimal(18, 5)), CAST(-93.70537 AS Decimal(18, 5)), N'2366 270TH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (997, N'00619', CAST(49.19156 AS Decimal(18, 5)), CAST(-123.10180 AS Decimal(18, 5)), N'11080 BRIDGEPORT ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (998, N'00621', CAST(45.02814 AS Decimal(18, 5)), CAST(-71.93788 AS Decimal(18, 5)), N'447 CH. LYON', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (999, N'00623', CAST(49.11239 AS Decimal(18, 5)), CAST(-122.75114 AS Decimal(18, 5)), N'6040 - 170 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1000, N'00628', CAST(27.87696 AS Decimal(18, 5)), CAST(-82.74528 AS Decimal(18, 5)), N'11401 BELCHER ROAD SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1001, N'00637_AGRAI', CAST(53.37509 AS Decimal(18, 5)), CAST(-113.51709 AS Decimal(18, 5)), N'3260 -  8 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1002, N'00641', CAST(39.56982 AS Decimal(18, 5)), CAST(-105.12833 AS Decimal(18, 5)), N'8091 Shaffer Parkway', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1003, N'00642', CAST(43.68117 AS Decimal(18, 5)), CAST(-79.58763 AS Decimal(18, 5)), N'17-83 GALAXY BOULEVARD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1004, N'00644', CAST(49.80340 AS Decimal(18, 5)), CAST(-97.14411 AS Decimal(18, 5)), N'162-196 INNOVATION DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1005, N'00645', CAST(45.40326 AS Decimal(18, 5)), CAST(-75.73361 AS Decimal(18, 5)), N'11 HOLLAND AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1006, N'00999', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62321 AS Decimal(18, 5)), N'17509 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1007, N'01128', CAST(43.78887 AS Decimal(18, 5)), CAST(-79.22922 AS Decimal(18, 5)), N'30 NOVOPHARM COURT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1008, N'01601', CAST(49.25429 AS Decimal(18, 5)), CAST(-122.91901 AS Decimal(18, 5)), N'#107 3191 THUNDERBIRD CRESENT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1009, N'03037', CAST(53.58133 AS Decimal(18, 5)), CAST(-113.53480 AS Decimal(18, 5)), N'12510 - 123 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1010, N'03112', CAST(43.72836 AS Decimal(18, 5)), CAST(-79.47633 AS Decimal(18, 5)), N'1011 WILSON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1011, N'03130', CAST(51.04661 AS Decimal(18, 5)), CAST(-114.06890 AS Decimal(18, 5)), N'PO BOX 2338, STATION M', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1012, N'03137', CAST(26.06461 AS Decimal(18, 5)), CAST(-80.25662 AS Decimal(18, 5)), N'c/o WCVSA YEARBOOK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1013, N'03146', CAST(51.19238 AS Decimal(18, 5)), CAST(-114.43354 AS Decimal(18, 5)), N'#50 EAGLEVIEW WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1014, N'03219', CAST(53.63959 AS Decimal(18, 5)), CAST(-113.65071 AS Decimal(18, 5)), N'69 LAFONDE CRESCENT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1015, N'03393', CAST(53.54570 AS Decimal(18, 5)), CAST(-113.62655 AS Decimal(18, 5)), N'SUITE 200, 17704 - 103 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1016, N'03433', CAST(49.94535 AS Decimal(18, 5)), CAST(-97.18133 AS Decimal(18, 5)), N'1590 INKSTER BLVD.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1017, N'03452', CAST(53.54373 AS Decimal(18, 5)), CAST(-113.90967 AS Decimal(18, 5)), N'306 CALAHOO ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1018, N'03457', CAST(46.09840 AS Decimal(18, 5)), CAST(-64.80902 AS Decimal(18, 5)), N'PO BOX 6157', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1019, N'03724', CAST(53.48640 AS Decimal(18, 5)), CAST(-113.46577 AS Decimal(18, 5)), N'4904 89 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1020, N'03767', CAST(53.48284 AS Decimal(18, 5)), CAST(-113.47247 AS Decimal(18, 5)), N'4404 94 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1021, N'03797', CAST(38.58338 AS Decimal(18, 5)), CAST(-90.12511 AS Decimal(18, 5)), N'BOX 11118', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1022, N'04641', CAST(51.03916 AS Decimal(18, 5)), CAST(-114.09403 AS Decimal(18, 5)), N'c/o 1107129 ALBERTA LTD.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1023, N'04806', CAST(49.90704 AS Decimal(18, 5)), CAST(-97.14431 AS Decimal(18, 5)), N'442 HIGGINS AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1024, N'06001', CAST(43.45184 AS Decimal(18, 5)), CAST(-79.67167 AS Decimal(18, 5)), N'605 - 265 REYNOLDS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1025, N'11927', CAST(49.53436 AS Decimal(18, 5)), CAST(-96.69115 AS Decimal(18, 5)), N'26 Millwork Drive', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1026, N'12002', CAST(49.89575 AS Decimal(18, 5)), CAST(-97.13925 AS Decimal(18, 5)), N'18th FLOOR CAN WEST BUILDING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1027, N'12020', CAST(49.79858 AS Decimal(18, 5)), CAST(-97.19531 AS Decimal(18, 5)), N'100-350 NORTH TOWN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1028, N'12020_SOUTHGLEN', CAST(49.82370 AS Decimal(18, 5)), CAST(-97.08526 AS Decimal(18, 5)), N'V-730 ST. ANNE''S ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1029, N'12022', CAST(49.91268 AS Decimal(18, 5)), CAST(-97.13158 AS Decimal(18, 5)), N'995 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1030, N'12023', CAST(51.15304 AS Decimal(18, 5)), CAST(-100.04528 AS Decimal(18, 5)), N'519 MAIN STREET NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1031, N'12026', CAST(49.86844 AS Decimal(18, 5)), CAST(-97.16091 AS Decimal(18, 5)), N'945 CORYDON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1032, N'12027', CAST(55.74060 AS Decimal(18, 5)), CAST(-97.84487 AS Decimal(18, 5)), N'40 NELSON ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1033, N'12028', CAST(49.88117 AS Decimal(18, 5)), CAST(-97.12664 AS Decimal(18, 5)), N'60 MARION STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1034, N'12029', CAST(49.87440 AS Decimal(18, 5)), CAST(-97.20021 AS Decimal(18, 5)), N'620 ACADEMY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1035, N'12031', CAST(49.93349 AS Decimal(18, 5)), CAST(-97.16455 AS Decimal(18, 5)), N'1039 MCPHILLIPS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1036, N'12055', CAST(49.83328 AS Decimal(18, 5)), CAST(-99.91719 AS Decimal(18, 5)), N'c/o PURO DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1037, N'12217_PUROAIR', CAST(49.86927 AS Decimal(18, 5)), CAST(-97.14480 AS Decimal(18, 5)), N'400 PEMBINA HIGHWAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1038, N'12260_AIREXPRES', CAST(49.85378 AS Decimal(18, 5)), CAST(-97.10330 AS Decimal(18, 5)), N'260 ST. ANNES ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1039, N'12602', CAST(49.91268 AS Decimal(18, 5)), CAST(-97.13158 AS Decimal(18, 5)), N'995 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1040, N'12611_PUROAIR', CAST(49.86842 AS Decimal(18, 5)), CAST(-97.26287 AS Decimal(18, 5)), N'3717 ROBLIN BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1041, N'12617_PUROAIR', CAST(49.86927 AS Decimal(18, 5)), CAST(-97.14480 AS Decimal(18, 5)), N'400 PEMBINA HIGHWAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1042, N'12647_PUROAIR', CAST(49.79270 AS Decimal(18, 5)), CAST(-97.15811 AS Decimal(18, 5)), N'2747 PEMBINA HIGHWAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1043, N'12900', CAST(49.88825 AS Decimal(18, 5)), CAST(-97.27939 AS Decimal(18, 5)), N'3025 NESS AVE UNIT E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1044, N'13000_STCLAUDE', CAST(49.66517 AS Decimal(18, 5)), CAST(-98.34183 AS Decimal(18, 5)), N'127 PTH 2 EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1045, N'13019', CAST(-22.89562 AS Decimal(18, 5)), CAST(-43.34951 AS Decimal(18, 5)), N'HWY 2 & HWY 21 SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1046, N'13021', CAST(49.23056 AS Decimal(18, 5)), CAST(-100.05642 AS Decimal(18, 5)), N'C/O PURO DEPOT HAZELWOOD DRUGS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1047, N'13022', CAST(49.91964 AS Decimal(18, 5)), CAST(-97.21113 AS Decimal(18, 5)), N'2055 NOTRE DAME AVE- RRC CAMPUS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1048, N'13023', CAST(50.44604 AS Decimal(18, 5)), CAST(-100.61071 AS Decimal(18, 5)), N'152 INDUSTRIAL ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1049, N'13024', CAST(51.19987 AS Decimal(18, 5)), CAST(-98.35584 AS Decimal(18, 5)), N'HWY 6 & SILVER BAY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1050, N'13027_PUROAIR', CAST(49.66517 AS Decimal(18, 5)), CAST(-98.34183 AS Decimal(18, 5)), N'127 PTH 2 EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1051, N'13060', CAST(51.08088 AS Decimal(18, 5)), CAST(-97.60754 AS Decimal(18, 5)), N'4 MICHAELS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1052, N'13083_LANGENBER', CAST(50.84424 AS Decimal(18, 5)), CAST(-101.70799 AS Decimal(18, 5)), N'c/o Prairie East Vet clnic', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1053, N'13133', CAST(40.73921 AS Decimal(18, 5)), CAST(-73.98021 AS Decimal(18, 5)), N'C/O McCREARY TRUE VALUE- PURO AGNT.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1054, N'13610_DHLAIR', CAST(49.23044 AS Decimal(18, 5)), CAST(-100.05955 AS Decimal(18, 5)), N'HIGHWAY #10 NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1055, N'13610_PURO', CAST(40.63682 AS Decimal(18, 5)), CAST(-97.58902 AS Decimal(18, 5)), N'PURO DEPOT (CARLEEN DOERKSEN)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1056, N'13628', CAST(49.50775 AS Decimal(18, 5)), CAST(-98.00262 AS Decimal(18, 5)), N'C/O PURO DEPOT TOEWS PRINTING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1057, N'13630', CAST(49.81424 AS Decimal(18, 5)), CAST(-97.15376 AS Decimal(18, 5)), N'C/O PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1058, N'13634_PUROAIR', CAST(49.83915 AS Decimal(18, 5)), CAST(-97.09397 AS Decimal(18, 5)), N'534 ST. ANNE''S ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1059, N'13635_CALGARY', CAST(51.06671 AS Decimal(18, 5)), CAST(-114.13347 AS Decimal(18, 5)), N'UNIT B153, 3330 HOSPITAL DRIVE N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1060, N'13635_CALGARY2', CAST(51.06638 AS Decimal(18, 5)), CAST(-114.13610 AS Decimal(18, 5)), N'3280 HOSPITAL DRIVE N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1061, N'13635_PUROAIR', CAST(49.89377 AS Decimal(18, 5)), CAST(-97.15025 AS Decimal(18, 5)), N'435 ELLICE AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1062, N'13637_AIR', CAST(49.90415 AS Decimal(18, 5)), CAST(-97.20983 AS Decimal(18, 5)), N'UNIT #41, 820 BERRY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1063, N'13924', CAST(51.22648 AS Decimal(18, 5)), CAST(-101.35239 AS Decimal(18, 5)), N'140 2ND AVE. S.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1064, N'13933', CAST(49.18067 AS Decimal(18, 5)), CAST(-97.93293 AS Decimal(18, 5)), N'225 - 1st  STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1065, N'13951_PUROAIR', CAST(49.89492 AS Decimal(18, 5)), CAST(-97.09834 AS Decimal(18, 5)), N'627 PLINGUET STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1066, N'14005_ATSDEPOT', CAST(49.91390 AS Decimal(18, 5)), CAST(-97.19675 AS Decimal(18, 5)), N'C/O ATS WINNIPEG DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1067, N'14006', CAST(40.72950 AS Decimal(18, 5)), CAST(-73.98952 AS Decimal(18, 5)), N'c/o PURO DEPOT (NUTTER''S BULK)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1068, N'21006_PURO', CAST(50.46672 AS Decimal(18, 5)), CAST(-104.60023 AS Decimal(18, 5)), N'HOLD FOR PICKUP PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1069, N'21007_PUROLATOR', CAST(50.27212 AS Decimal(18, 5)), CAST(-107.80731 AS Decimal(18, 5)), N'2225 GLADSTONE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1070, N'21009', CAST(49.17563 AS Decimal(18, 5)), CAST(-101.79691 AS Decimal(18, 5)), N'C/O CA SHAW INSURANCE COMPANY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1071, N'21010', CAST(52.13042 AS Decimal(18, 5)), CAST(-106.59829 AS Decimal(18, 5)), N'106 103 STREET E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1072, N'21012', CAST(53.28458 AS Decimal(18, 5)), CAST(-110.00722 AS Decimal(18, 5)), N'C/O PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1073, N'21053_ALTERNATE', CAST(51.63688 AS Decimal(18, 5)), CAST(-103.53393 AS Decimal(18, 5)), N'c/o  BURGER PIT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1074, N'21056_BUS', CAST(42.36679 AS Decimal(18, 5)), CAST(-71.18686 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT C/O BURGER PIT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1075, N'21078_BUS', CAST(50.45131 AS Decimal(18, 5)), CAST(-104.60552 AS Decimal(18, 5)), N'C/O GREYHOUND DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1076, N'21118', CAST(53.39677 AS Decimal(18, 5)), CAST(-108.96825 AS Decimal(18, 5)), N'PO BOX 328', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1077, N'21118_FOOD', CAST(53.38798 AS Decimal(18, 5)), CAST(-108.95840 AS Decimal(18, 5)), N'PO BOX 328', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1078, N'21118_PICKUP', CAST(37.07598 AS Decimal(18, 5)), CAST(-87.61964 AS Decimal(18, 5)), N'FOR PICKUP AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1079, N'21133_ALBERTAHM', CAST(35.23217 AS Decimal(18, 5)), CAST(-97.61025 AS Decimal(18, 5)), N'C/O PURO DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1080, N'21133_LOOMIS', CAST(-27.32827 AS Decimal(18, 5)), CAST(153.01169 AS Decimal(18, 5)), N'HIGHWAY 18', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1081, N'21600_PUROLATOR', CAST(52.11393 AS Decimal(18, 5)), CAST(-106.62389 AS Decimal(18, 5)), N'C/O PUROLATOR DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1082, N'21607', CAST(52.16387 AS Decimal(18, 5)), CAST(-106.67384 AS Decimal(18, 5)), N'2-502 45 STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1083, N'21610_BROOKS', CAST(51.10527 AS Decimal(18, 5)), CAST(-114.03712 AS Decimal(18, 5)), N'C/O CFIA - CALGARY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1084, N'21610_MOOSEJAW', CAST(50.39731 AS Decimal(18, 5)), CAST(-105.58392 AS Decimal(18, 5)), N'1410 B CARIBOU STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1085, N'21610_WYNYARD', CAST(51.76833 AS Decimal(18, 5)), CAST(-104.18621 AS Decimal(18, 5)), N'325 BOSWORTH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1086, N'21610_YORKTON', CAST(51.20770 AS Decimal(18, 5)), CAST(-102.44427 AS Decimal(18, 5)), N'80 PALLISER WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1087, N'21620', CAST(50.09867 AS Decimal(18, 5)), CAST(-102.63578 AS Decimal(18, 5)), N'613 - 4TH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1088, N'21670_SPIRITWOO', CAST(38.41591 AS Decimal(18, 5)), CAST(-82.58416 AS Decimal(18, 5)), N'C/O PHILLIP WILLSON', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1089, N'22023', CAST(51.63846 AS Decimal(18, 5)), CAST(-103.53553 AS Decimal(18, 5)), N'124 CAMERON STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1090, N'22080_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1091, N'22104', CAST(51.20983 AS Decimal(18, 5)), CAST(-102.48245 AS Decimal(18, 5)), N'308 BROADWAY STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1092, N'22300_CLIENTORD', CAST(51.92436 AS Decimal(18, 5)), CAST(-107.13084 AS Decimal(18, 5)), N'#300, 2ND STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1093, N'22300_PICKUP', CAST(53.55666 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1094, N'22605', CAST(52.16610 AS Decimal(18, 5)), CAST(-106.65471 AS Decimal(18, 5)), N'ATS MAIN DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1095, N'22611', CAST(52.11393 AS Decimal(18, 5)), CAST(-106.62389 AS Decimal(18, 5)), N'C/O PURO DEPOT (PRESTON)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1096, N'22614', CAST(52.11393 AS Decimal(18, 5)), CAST(-106.62389 AS Decimal(18, 5)), N'C/O PRESTON (PURO DEPOT)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1097, N'22614_KELOWNA', CAST(39.59085 AS Decimal(18, 5)), CAST(-76.99996 AS Decimal(18, 5)), N'C/O PURO SPARTAN DRY CLEANERS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1098, N'22616', CAST(52.11393 AS Decimal(18, 5)), CAST(-106.62389 AS Decimal(18, 5)), N'C/O PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1099, N'22623', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'WCVM 52 CAMPUS DRIVE (U OF S)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1100, N'22624', CAST(52.16897 AS Decimal(18, 5)), CAST(-106.67425 AS Decimal(18, 5)), N'C/O PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1101, N'22626', CAST(52.16897 AS Decimal(18, 5)), CAST(-106.67425 AS Decimal(18, 5)), N'C/O PURO DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1102, N'23004', CAST(51.20610 AS Decimal(18, 5)), CAST(-102.46387 AS Decimal(18, 5)), N'12 PARK STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1103, N'23011_BUS', CAST(35.57642 AS Decimal(18, 5)), CAST(-78.49872 AS Decimal(18, 5)), N'c/o GREYHOUND WEYBURN SHELL CANADA', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1104, N'23012_BUSMOOSE', CAST(50.39134 AS Decimal(18, 5)), CAST(-105.53318 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1105, N'23012_HEADFOR', CAST(49.57248 AS Decimal(18, 5)), CAST(-101.69160 AS Decimal(18, 5)), N'#1 SERVICE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1106, N'23012_MOOSEJAW', CAST(50.38979 AS Decimal(18, 5)), CAST(-105.54246 AS Decimal(18, 5)), N'302 MANITOBA STREET W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1107, N'23013', CAST(32.33139 AS Decimal(18, 5)), CAST(-96.13779 AS Decimal(18, 5)), N'98 COOK ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1108, N'23013_FOOD', CAST(50.14849 AS Decimal(18, 5)), CAST(-101.67663 AS Decimal(18, 5)), N'98 COOK ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1109, N'23014_BUS', CAST(52.79822 AS Decimal(18, 5)), CAST(-108.30307 AS Decimal(18, 5)), N'GREYHOUND DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1110, N'23015', CAST(48.97168 AS Decimal(18, 5)), CAST(-123.78849 AS Decimal(18, 5)), N'417 BLAIR PLACE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1111, N'23021_BUS', CAST(50.45177 AS Decimal(18, 5)), CAST(-104.60550 AS Decimal(18, 5)), N'C/O STC BUS DEPOT - HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1112, N'23021_SERENA', CAST(29.55965 AS Decimal(18, 5)), CAST(-98.42898 AS Decimal(18, 5)), N'308-1167 Kensignton Cr. N.W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1113, N'23023', CAST(50.93721 AS Decimal(18, 5)), CAST(-102.82150 AS Decimal(18, 5)), N'202 HERITAGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1114, N'23027', CAST(50.39634 AS Decimal(18, 5)), CAST(-105.58852 AS Decimal(18, 5)), N'1885 CARIBOU STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1115, N'23029_BUS', CAST(52.36070 AS Decimal(18, 5)), CAST(-110.26836 AS Decimal(18, 5)), N'C/O PROVOST MARKET SERV- ESSO', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1116, N'23031_BUS', CAST(50.28396 AS Decimal(18, 5)), CAST(-107.80507 AS Decimal(18, 5)), N'HOLD FOR PICK UP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1117, N'23031_PUROLATOR', CAST(42.96589 AS Decimal(18, 5)), CAST(-78.71148 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT PUROLATOR DEPOT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1118, N'23033', CAST(28.21694 AS Decimal(18, 5)), CAST(-82.72755 AS Decimal(18, 5)), N'C/O PURO DEPOT -  HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1119, N'23038_PUROLATOR', CAST(49.91249 AS Decimal(18, 5)), CAST(-109.47708 AS Decimal(18, 5)), N'515 - 2nd AVENUE NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1120, N'23046', CAST(50.93721 AS Decimal(18, 5)), CAST(-102.82150 AS Decimal(18, 5)), N'202 HERITAGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1121, N'23047_BUS', CAST(50.39134 AS Decimal(18, 5)), CAST(-105.53318 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1122, N'23048', CAST(51.85192 AS Decimal(18, 5)), CAST(-105.03489 AS Decimal(18, 5)), N'c/o LANIGAN PHARMACY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1123, N'23049_ATS', CAST(50.38417 AS Decimal(18, 5)), CAST(-105.55411 AS Decimal(18, 5)), N'C/O BELLAMY HARRISON ANIMAL HOSPITAL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1124, N'23051', CAST(49.64634 AS Decimal(18, 5)), CAST(-108.42157 AS Decimal(18, 5)), N'HWY 37 S', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1125, N'23051_FOOD', CAST(49.64634 AS Decimal(18, 5)), CAST(-108.42157 AS Decimal(18, 5)), N'HWY 37 S', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1126, N'00030', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Bay 49, 5353 72nd Ave SE  Calgary AB,  T2C 4X6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1127, N'00030_ATSCALGAR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Bay 49, 5353 72nd Ave SE HOLD AT DEPOT FOR PICK UP CALGARY AB,  ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1128, N'00032', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'6040 - 170 STREET  SURREY BC,  V3S 3Y8', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1129, N'00034_QUEBEC', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'251 ROUTE 235  ANGE-GARDIEN QC, CANADA J0E 1E0', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1130, N'00037', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'10734 178 St NW  Edmonton AB,  T5S 1J3', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1131, N'00058', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O SHARED SERVICES P.O. BOX 982156 EL PASO TX, CANADA 79998-2156', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1132, N'00065', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'87 Skyline Crescent N.E.  CALGARY AB, CANADA T2K 5X2', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1133, N'00065_CDMV', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'BAY 7 5375 - 50 TH STREET SE CALGARY AB, CANADA T2C 3W1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1134, N'00065_FEEDLOT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SOUTHERN ALBERTA VET SERVICES 370181 - 79 Street East OKOTOKS AB,  T1S 2A2', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1135, N'00065_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD AT WDDC 17611 - 109 A AVENUE EDMONTON AB,  T5S 2W4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1136, N'00074_DAVID', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'82 NOTTINGHAM INLET NO SIGNATURE REQUIRED SHERWOOD PARK AB, CANADA T8A 6N2', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1137, N'00074_GRANDPRAI', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'10126 - 100TH AVENUE  Grand Prairie AB,  T8V 0V5', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1138, N'00074_JOANNE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'74-1821 Willow Crescent NO SIGNATURE REQUIRED Squamish BC,  V8B 0L9', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1139, N'00074_MORGAN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'410 LEHRER MANOR NO SIGNATURE REQUIRED SASKATOON SK, CANADA S7R 0L3', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1140, N'00074_PAUL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O NOLAN HILL VET HOSPITAL 8 NOLAN HILL BLVD NORTHWEST CALGARY AB, CANADA T3G 0L6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1141, N'00074_PICKUP', CAST(43.82787 AS Decimal(18, 5)), CAST(-79.24777 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC TRADESHOW BOOTH #9 EDMONTON AB, CANADA T5S 2W4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1142, N'00080', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'420 BEAVERDALE RD  CAMBRIDGE ON, CANADA N3C 2W4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1143, N'00083', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'10931 - 177 STREET  EDMONTON AB, CANADA T5S 1P6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1144, N'00091', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'16740 TRANS-CANADA HIGHWAY  KIRKLAND QC, CANADA H9H 4M7', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1145, N'00098', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'4441 - 76th Avenue SE West Building Calgary AB,  T2C 2G8', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1146, N'00104_ALLABOUT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'1004 TAYLOR STREET EAST  SASKATOON SK,  S7H 1W5', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1147, N'00104_CENTPONOK', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'4102  64 STREET  PONOKA AB,  T4J 1J8', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1148, N'00104_SHERWOOD', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWY 1 E (2 MILES EAST OF RING ROAD) TOWER ROAD (LANDMARK CTV BUILDING) REGINA SK,  S4P 3H1', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1149, N'00119_PICKUP', CAST(33.02182 AS Decimal(18, 5)), CAST(-117.08265 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC TRADESHOW BOOTH #44 EDMONTON AB, CANADA T5S 2W4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1150, N'00135', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'20000 CLARK GRAHAM  BAIE-D''URFE QC, CANADA H9X 4B6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1151, N'00141', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'1199 Sanford Street  WINNIPEG MB, CANADA R3H 3A1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1152, N'00155', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'8225 - 105 STREET  EDMONTON AB,  T6E 4H2', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1153, N'00155_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP EDMONTON AB, CANADA T5S 2W4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1154, N'00204', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'452 McNICOLL AVENUE  TORONTO ON, CANADA M2H 2E1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1155, N'00231', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY  EDMONTON AB, canada ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1156, N'00290_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'WDDC PICK UP ONLY HOLD FOR PICK UP WDDC PICK UP ,  ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1157, N'00430', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Unit 5, 131 Saunders Road  Barrie ON, CANADA L4N 9A7', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1158, N'00464', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'34079 GLADYS AVENUE ACCT#WES121 ABBOTSFORD BC, CANADA V2S 5E8', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1159, N'00509', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'1501B QUEBEC AVENUE  SASKATOON SK, CANADA S7K 1V6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1160, N'00014', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DO NOT SHIP ', N'The remote server returned an error: (400) Bad Request.')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1161, N'00015', CAST(45.93603 AS Decimal(18, 5)), CAST(-73.34920 AS Decimal(18, 5)), N'2000 CHEMIN GEORGES ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1162, N'00034', CAST(30.34716 AS Decimal(18, 5)), CAST(-97.74790 AS Decimal(18, 5)), N'SUITE 400, PLAZA 3 2000 ARGENTIA RD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1163, N'00034_HIGHLIFE', CAST(61.34371 AS Decimal(18, 5)), CAST(16.36073 AS Decimal(18, 5)), N'5 SAVAS STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1164, N'00034_LAKEVIEW', CAST(48.84499 AS Decimal(18, 5)), CAST(-123.29656 AS Decimal(18, 5)), N'BAY#2, 1945 McKERCHER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1165, N'00050', CAST(41.11026 AS Decimal(18, 5)), CAST(-90.16859 AS Decimal(18, 5)), N'PO BOX 6000  STN B ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1166, N'00058_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1167, N'00065_AVP', CAST(44.91517 AS Decimal(18, 5)), CAST(-91.12119 AS Decimal(18, 5)), N'27533 - 50th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1168, N'00065_BONDET', CAST(32.75406 AS Decimal(18, 5)), CAST(-81.24041 AS Decimal(18, 5)), N'250 - 3 route 139 Sud ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1169, N'00065_CENTRE', CAST(41.09614 AS Decimal(18, 5)), CAST(-85.29467 AS Decimal(18, 5)), N'2300 - 541 EME AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1170, N'00065_WESTCOUNT', CAST(39.81254 AS Decimal(18, 5)), CAST(-78.29263 AS Decimal(18, 5)), N'1341 TOWNSHIP ROAD 334 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1171, N'00074_CHINOOK', CAST(39.44504 AS Decimal(18, 5)), CAST(-78.98635 AS Decimal(18, 5)), N'4501 - 46 AVENUE HIGHWAY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1172, N'00074_FRONTIER', CAST(34.79442 AS Decimal(18, 5)), CAST(-86.96393 AS Decimal(18, 5)), N'BOX 670 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1173, N'00074_LAKEVIEW', CAST(48.84499 AS Decimal(18, 5)), CAST(-123.29656 AS Decimal(18, 5)), N'BAY 2, 1945 McKERCHER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1174, N'00074_PIPERCREE', CAST(30.51267 AS Decimal(18, 5)), CAST(-86.19497 AS Decimal(18, 5)), N'#1-66-37428-RR 273 Unit/Site: 66 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1175, N'00091_AVP', CAST(44.91517 AS Decimal(18, 5)), CAST(-91.12119 AS Decimal(18, 5)), N'27533 - 50th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1176, N'00104_BEAVERHIL', CAST(34.69001 AS Decimal(18, 5)), CAST(-118.09671 AS Decimal(18, 5)), N'Box158, 4916-52 Ave ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1177, N'00104_HILLTOP', CAST(25.71238 AS Decimal(18, 5)), CAST(-80.26109 AS Decimal(18, 5)), N'BAY 2, 4213 - 42 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1178, N'00104_NORTHPEAC', CAST(43.50502 AS Decimal(18, 5)), CAST(-75.52450 AS Decimal(18, 5)), N'RR 1 - FISH CREEK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1179, N'00104_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1180, N'00129', CAST(46.68793 AS Decimal(18, 5)), CAST(-97.95540 AS Decimal(18, 5)), N'14704 119 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1181, N'00135_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WDDC PICK UP AT SHIPPING ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1182, N'00139', CAST(27.81305 AS Decimal(18, 5)), CAST(-82.64066 AS Decimal(18, 5)), N'4500 - 5th STREE N.E. #200 BAY 6 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1183, N'00163', CAST(33.85961 AS Decimal(18, 5)), CAST(-84.58815 AS Decimal(18, 5)), N'RR1   BOX 35 DURRELL SITE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1184, N'00198_KEVINREGA', CAST(51.05437 AS Decimal(18, 5)), CAST(-114.20694 AS Decimal(18, 5)), N'7875 Wentworth Drive  SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1185, N'00206', CAST(43.39600 AS Decimal(18, 5)), CAST(-84.60637 AS Decimal(18, 5)), N'10979 - 127 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1186, N'00242', CAST(29.72675 AS Decimal(18, 5)), CAST(-84.98545 AS Decimal(18, 5)), N'#29, 15037 - 58 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1187, N'00261', CAST(41.45169 AS Decimal(18, 5)), CAST(-83.88552 AS Decimal(18, 5)), N'BOX 3178 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1188, N'00290', CAST(43.39793 AS Decimal(18, 5)), CAST(-80.29559 AS Decimal(18, 5)), N'231 Shearson Crescent, Suite 209 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1189, N'00326', CAST(30.79211 AS Decimal(18, 5)), CAST(-85.36843 AS Decimal(18, 5)), N'4707 LEVY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1190, N'00370_KEVINREGA', CAST(51.05437 AS Decimal(18, 5)), CAST(-114.20694 AS Decimal(18, 5)), N'7875 WENTWORTH DRIVE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1191, N'00391', CAST(35.61451 AS Decimal(18, 5)), CAST(-77.35479 AS Decimal(18, 5)), N'PO BOX 25004 RIVER HEIGHTS RPO ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1192, N'00400', CAST(-7.13853 AS Decimal(18, 5)), CAST(-34.88841 AS Decimal(18, 5)), N'HC 50 BOX 4058 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1193, N'00447', CAST(35.22656 AS Decimal(18, 5)), CAST(-81.44391 AS Decimal(18, 5)), N'1040, 50125 RGE RD. 233 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1194, N'00483', CAST(42.23645 AS Decimal(18, 5)), CAST(-82.96184 AS Decimal(18, 5)), N'2516 BINDER CRES. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1195, N'00539', CAST(30.62797 AS Decimal(18, 5)), CAST(-96.33440 AS Decimal(18, 5)), N'P.O. BOX 56536, STATION A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1196, N'00554', CAST(41.45129 AS Decimal(18, 5)), CAST(-83.88880 AS Decimal(18, 5)), N'BOX 1283 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1197, N'00561_AVP', CAST(44.91517 AS Decimal(18, 5)), CAST(-91.12119 AS Decimal(18, 5)), N'27533 - 50th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1198, N'00563_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC TRADESHOW BOOTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1199, N'03019', CAST(34.24833 AS Decimal(18, 5)), CAST(-117.18920 AS Decimal(18, 5)), N'P.O. BOX 759 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1200, N'03450', CAST(34.98244 AS Decimal(18, 5)), CAST(-101.91867 AS Decimal(18, 5)), N'BOX 79053 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1201, N'03521', CAST(41.69297 AS Decimal(18, 5)), CAST(-88.14304 AS Decimal(18, 5)), N'RR #3, SITE 10, BOX 5 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1202, N'035562', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Bldg #3, Elm Business Park 9452 - 51 Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1203, N'035563', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'BLDG. #3, ELM BUSINESS PARK 9452-51 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1204, N'035564', CAST(39.36606 AS Decimal(18, 5)), CAST(-74.41299 AS Decimal(18, 5)), N'#202, 224 PACIFIC AVE. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1205, N'11000', CAST(39.77892 AS Decimal(18, 5)), CAST(-84.16453 AS Decimal(18, 5)), N'UNIT3, 20 BRANDT STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1206, N'11002', CAST(40.22316 AS Decimal(18, 5)), CAST(-100.65006 AS Decimal(18, 5)), N'BOX 1390, HWY 83 SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1207, N'11020', CAST(51.15333 AS Decimal(18, 5)), CAST(-100.04550 AS Decimal(18, 5)), N'C/O UPTOWN PET CLINIC 519 MAIN STREET N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1208, N'11022', CAST(41.80352 AS Decimal(18, 5)), CAST(-88.34107 AS Decimal(18, 5)), N'22 POPLAR PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1209, N'11049', CAST(51.64728 AS Decimal(18, 5)), CAST(-99.92465 AS Decimal(18, 5)), N'C/O FOXY''S GAS BAR 4 JUBLIEE AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1210, N'11050', CAST(49.96745 AS Decimal(18, 5)), CAST(-98.28354 AS Decimal(18, 5)), N'PO BOX 90 196 PROVINCIAL ROAD 240', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1211, N'11329', CAST(39.86994 AS Decimal(18, 5)), CAST(-84.30500 AS Decimal(18, 5)), N'329 BRONSTONE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1212, N'11602', CAST(45.15174 AS Decimal(18, 5)), CAST(-122.88381 AS Decimal(18, 5)), N'BOX 110 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1213, N'11928', CAST(42.03461 AS Decimal(18, 5)), CAST(-91.59808 AS Decimal(18, 5)), N'846 MARION STREET,  UNIT 11 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1214, N'11929', CAST(39.95421 AS Decimal(18, 5)), CAST(-75.60377 AS Decimal(18, 5)), N'186 HWY 52 WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1215, N'12001', CAST(49.89367 AS Decimal(18, 5)), CAST(-97.01644 AS Decimal(18, 5)), N'501 PANDORA AVENUE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1216, N'12003', CAST(49.91021 AS Decimal(18, 5)), CAST(-97.02427 AS Decimal(18, 5)), N'17 - 1783 PLESSIS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1217, N'12004', CAST(45.88946 AS Decimal(18, 5)), CAST(-95.37733 AS Decimal(18, 5)), N'115 - 3RD AVE E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1218, N'12005', CAST(49.86842 AS Decimal(18, 5)), CAST(-97.26286 AS Decimal(18, 5)), N'3717 ROBLIN BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1219, N'12006', CAST(50.16045 AS Decimal(18, 5)), CAST(-96.88519 AS Decimal(18, 5)), N'6 WERSH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1220, N'12007', CAST(49.98663 AS Decimal(18, 5)), CAST(-97.04750 AS Decimal(18, 5)), N'UNIT 9 - 3014 HENDERSON HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1221, N'12008', CAST(49.89085 AS Decimal(18, 5)), CAST(-97.15856 AS Decimal(18, 5)), N'399 SHERBROOK STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1222, N'12009', CAST(49.89910 AS Decimal(18, 5)), CAST(-97.08161 AS Decimal(18, 5)), N'UNIT H, 10 KEENLEYSIDE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1223, N'12010', CAST(49.94422 AS Decimal(18, 5)), CAST(-97.03582 AS Decimal(18, 5)), N'925 HEADMASTER ROW UNIT 1 ARROWWOOD PLAZA', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1224, N'12011', CAST(42.99715 AS Decimal(18, 5)), CAST(-78.31296 AS Decimal(18, 5)), N'2539 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1225, N'12012', CAST(30.31199 AS Decimal(18, 5)), CAST(-91.79603 AS Decimal(18, 5)), N'1434 HENDERSON HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1226, N'12013', CAST(42.76811 AS Decimal(18, 5)), CAST(-75.73722 AS Decimal(18, 5)), N'965 HWY 26 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1227, N'12014', CAST(49.83701 AS Decimal(18, 5)), CAST(-97.15036 AS Decimal(18, 5)), N'1444 PEMBINA HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1228, N'12015', CAST(41.04617 AS Decimal(18, 5)), CAST(-80.61808 AS Decimal(18, 5)), N'2015 UNIT A BRANDON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1229, N'12016', CAST(49.83275 AS Decimal(18, 5)), CAST(-97.04760 AS Decimal(18, 5)), N'#102, 50 SAGE CREEK BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1230, N'12017', CAST(-26.10944 AS Decimal(18, 5)), CAST(27.86088 AS Decimal(18, 5)), N'4 DOLOMITE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1231, N'12018', CAST(49.83915 AS Decimal(18, 5)), CAST(-97.09396 AS Decimal(18, 5)), N'534 ST. ANNE''S ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1232, N'12019', CAST(36.08193 AS Decimal(18, 5)), CAST(-79.07969 AS Decimal(18, 5)), N'1026 ST MARY''S RD UNIT G ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1233, N'12021', CAST(49.95080 AS Decimal(18, 5)), CAST(-97.14866 AS Decimal(18, 5)), N'2211B MCPHILLIPS STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1234, N'12024', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'100, 2355 McGILLIVRAY BOULEVARD KENASTON COMMON', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1235, N'12025', CAST(28.46022 AS Decimal(18, 5)), CAST(-82.51567 AS Decimal(18, 5)), N'192 - 2025 CORYDON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1236, N'12030', CAST(49.85729 AS Decimal(18, 5)), CAST(-97.28342 AS Decimal(18, 5)), N'#104 - 4910 ROBLIN BLVD. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1237, N'12047', CAST(49.79270 AS Decimal(18, 5)), CAST(-97.15810 AS Decimal(18, 5)), N'2747 PEMBINA HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1238, N'12050', CAST(49.77222 AS Decimal(18, 5)), CAST(-97.15687 AS Decimal(18, 5)), N'B - 3311 PEMBINA HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1239, N'12090', CAST(32.22775 AS Decimal(18, 5)), CAST(-110.99747 AS Decimal(18, 5)), N'#2 - 1549 ST. MARY''S ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1240, N'12110', CAST(42.30135 AS Decimal(18, 5)), CAST(-88.12213 AS Decimal(18, 5)), N'2595 PORTAGE AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1241, N'12125', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O CAROLYN SIFTON VET CLINIC 45 HURST WAY 2ND DOOR ON RIGHT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1242, N'12130', CAST(42.92195 AS Decimal(18, 5)), CAST(-78.85825 AS Decimal(18, 5)), N'1832 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1243, N'12130_AIR', CAST(40.68812 AS Decimal(18, 5)), CAST(-75.49831 AS Decimal(18, 5)), N'1830 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1244, N'12150', CAST(49.87964 AS Decimal(18, 5)), CAST(-97.28189 AS Decimal(18, 5)), N'3050 F PORTAGE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1245, N'12151', CAST(49.81675 AS Decimal(18, 5)), CAST(-97.19598 AS Decimal(18, 5)), N'151 SCURFIELD BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1246, N'12217', CAST(49.86927 AS Decimal(18, 5)), CAST(-97.14480 AS Decimal(18, 5)), N'400 PEMBINA HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1247, N'12230', CAST(49.82366 AS Decimal(18, 5)), CAST(-97.08527 AS Decimal(18, 5)), N'V-730 ST. ANNE''S ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1248, N'12260', CAST(49.85378 AS Decimal(18, 5)), CAST(-97.10330 AS Decimal(18, 5)), N'260 ST. ANNES ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1249, N'12600', CAST(49.91854 AS Decimal(18, 5)), CAST(-97.21017 AS Decimal(18, 5)), N'c/o RED RIVER COLLEGE RM AB 71 - 2055 NOTRE DAME AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1250, N'12603', CAST(44.22557 AS Decimal(18, 5)), CAST(-69.69067 AS Decimal(18, 5)), N'40 NELSON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1251, N'12604', CAST(49.93348 AS Decimal(18, 5)), CAST(-97.16455 AS Decimal(18, 5)), N'1039 McPHILLIPS STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1252, N'12607', CAST(37.87499 AS Decimal(18, 5)), CAST(-94.02124 AS Decimal(18, 5)), N'287 MAIN STREET BOX 22158', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1253, N'12609', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'REFER TO MEMBER #12001 ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1254, N'12618', CAST(38.97883 AS Decimal(18, 5)), CAST(-76.50432 AS Decimal(18, 5)), N'10-1580 TAYLOR AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1255, N'12620', CAST(49.89789 AS Decimal(18, 5)), CAST(-97.07095 AS Decimal(18, 5)), N'7-1600 REGENT AVE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1256, N'12635', CAST(37.80357 AS Decimal(18, 5)), CAST(-122.42542 AS Decimal(18, 5)), N'3025 NESS AVENUE UNIT E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1257, N'12694', CAST(49.86775 AS Decimal(18, 5)), CAST(-97.21349 AS Decimal(18, 5)), N'c/o TUXEDO ANIMAL HOSPITAL 192 - 2025 CORYDON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1258, N'13000', CAST(49.94516 AS Decimal(18, 5)), CAST(-97.18175 AS Decimal(18, 5)), N'1600 INKSTER BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1259, N'13000_GLADSTONE', CAST(34.27859 AS Decimal(18, 5)), CAST(-118.88827 AS Decimal(18, 5)), N'BOX 538 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1260, N'13000_LIVESTOCK', CAST(41.90751 AS Decimal(18, 5)), CAST(-87.90430 AS Decimal(18, 5)), N'#64 HIGHWAY #12 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1261, N'13000_PILOTMND', CAST(44.16289 AS Decimal(18, 5)), CAST(-94.02258 AS Decimal(18, 5)), N'334 MOUND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1262, N'13000_R', CAST(49.94516 AS Decimal(18, 5)), CAST(-97.18175 AS Decimal(18, 5)), N'1600 INKSTER BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1263, N'13004', CAST(41.77905 AS Decimal(18, 5)), CAST(-113.19158 AS Decimal(18, 5)), N'208 MORRIS AVENUE SOUTH BOX 538', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1264, N'13005', CAST(40.62110 AS Decimal(18, 5)), CAST(-73.73296 AS Decimal(18, 5)), N'304 PACIFIC AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1265, N'13009', CAST(37.28636 AS Decimal(18, 5)), CAST(-121.94238 AS Decimal(18, 5)), N'45 RAILWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1266, N'13010', CAST(34.49477 AS Decimal(18, 5)), CAST(-85.84900 AS Decimal(18, 5)), N'135 MAIN STREET W ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1267, N'13012', CAST(29.61328 AS Decimal(18, 5)), CAST(-95.64906 AS Decimal(18, 5)), N'#8 HIGHWAY 6 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1268, N'13013', CAST(41.58329 AS Decimal(18, 5)), CAST(-89.85056 AS Decimal(18, 5)), N'38010 ROAD35 EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1269, N'13014', CAST(34.05798 AS Decimal(18, 5)), CAST(-118.17957 AS Decimal(18, 5)), N'HIGHWAY 10 EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1270, N'13015', CAST(42.56323 AS Decimal(18, 5)), CAST(-71.18388 AS Decimal(18, 5)), N'123 MAIN ST PO BOX 250', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1271, N'13016', CAST(44.62495 AS Decimal(18, 5)), CAST(-90.17980 AS Decimal(18, 5)), N'HWY #10 NORTH PO BOX 416', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1272, N'13017', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'STEPHAINE VAN DEYNZE-SNELL 8092 100 SOUTH PERIMETER HIGHWAY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1273, N'13018', CAST(33.91461 AS Decimal(18, 5)), CAST(-117.58810 AS Decimal(18, 5)), N'1675 CORYDON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1274, N'13020', CAST(41.50429 AS Decimal(18, 5)), CAST(-90.57565 AS Decimal(18, 5)), N'733 - 17TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1275, N'13027', CAST(39.71380 AS Decimal(18, 5)), CAST(-104.94093 AS Decimal(18, 5)), N'127 PTH 2 EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1276, N'13033', CAST(35.96083 AS Decimal(18, 5)), CAST(-85.81615 AS Decimal(18, 5)), N'333 MOUNTAIN STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1277, N'13050', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O GLADSTONE VET CLINIC 208 MORRIS AVENUE SOUTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1278, N'13070', CAST(42.25616 AS Decimal(18, 5)), CAST(-71.07498 AS Decimal(18, 5)), N'70 CENTRE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1279, N'13077', CAST(27.76829 AS Decimal(18, 5)), CAST(-98.25495 AS Decimal(18, 5)), N'CORNER OF HWY. 302 AND HWY. 44 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1280, N'13083', CAST(42.93769 AS Decimal(18, 5)), CAST(-88.34626 AS Decimal(18, 5)), N'HIGHWAY 83 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1281, N'13215', CAST(33.26161 AS Decimal(18, 5)), CAST(-86.81130 AS Decimal(18, 5)), N'1528 - 1st STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1282, N'13234', CAST(41.71856 AS Decimal(18, 5)), CAST(-86.28244 AS Decimal(18, 5)), N'3234 PORTAGE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1283, N'13290', CAST(39.98327 AS Decimal(18, 5)), CAST(-95.13091 AS Decimal(18, 5)), N'29041 HIGHWAY 59 SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1284, N'13290_VITA', CAST(40.61910 AS Decimal(18, 5)), CAST(-80.92764 AS Decimal(18, 5)), N'8160 ROAD 39 EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1285, N'13324', CAST(28.36457 AS Decimal(18, 5)), CAST(-82.20379 AS Decimal(18, 5)), N'36016 HWY  52 East ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1286, N'13335', CAST(35.73667 AS Decimal(18, 5)), CAST(-81.34765 AS Decimal(18, 5)), N'335 - 6th AVENUE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1287, N'13444', CAST(38.03954 AS Decimal(18, 5)), CAST(-78.49765 AS Decimal(18, 5)), N'1444 GORDON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1288, N'13607', CAST(44.86336 AS Decimal(18, 5)), CAST(-93.60041 AS Decimal(18, 5)), N'HWY 5 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1289, N'13610', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HIGHWAY #10 NORTH ', N'The remote server returned an error: (500) Internal Server Error.')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1290, N'13610_BOISSEVAI', CAST(46.87606 AS Decimal(18, 5)), CAST(-96.81937 AS Decimal(18, 5)), N'HIWAY 10 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1291, N'13611', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'cancelled SEE NEW MEMBER 13335 ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1292, N'13617', CAST(35.29985 AS Decimal(18, 5)), CAST(-80.11233 AS Decimal(18, 5)), N'26157 OAKWOOD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1293, N'13622', CAST(49.91854 AS Decimal(18, 5)), CAST(-97.21017 AS Decimal(18, 5)), N'2055 NOTRE DAME AVE-RRC CAMPUS ATTENTION RECEIVING DEPT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1294, N'13623', CAST(31.78899 AS Decimal(18, 5)), CAST(-97.58047 AS Decimal(18, 5)), N'HIGHWAY 6 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1295, N'13626', CAST(30.13350 AS Decimal(18, 5)), CAST(-94.18924 AS Decimal(18, 5)), N'BOX 105 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1296, N'13636', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PUROLATOR DEPOT H & L MOTORS HWY 2', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1297, N'13637', CAST(37.77715 AS Decimal(18, 5)), CAST(-122.39161 AS Decimal(18, 5)), N'UNIT 41, 820 BERRY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1298, N'13645', CAST(49.80350 AS Decimal(18, 5)), CAST(-97.13892 AS Decimal(18, 5)), N'545 UNIVERSITY CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1299, N'13655', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PURO DEPOT HOLD FOR PICKUP 939 DOUGLAS STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1300, N'13660', CAST(36.13119 AS Decimal(18, 5)), CAST(-90.64393 AS Decimal(18, 5)), N'15 COMMISSARY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1301, N'13685', CAST(39.95870 AS Decimal(18, 5)), CAST(-75.20328 AS Decimal(18, 5)), N'39 PRESTON STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1302, N'13905', CAST(-37.70332 AS Decimal(18, 5)), CAST(144.94787 AS Decimal(18, 5)), N'39 PRESTON STREET NORTH BOX 476', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1303, N'13905_BRANDON', CAST(40.62110 AS Decimal(18, 5)), CAST(-73.73296 AS Decimal(18, 5)), N'304 PACIFIC AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1304, N'13906', CAST(36.17443 AS Decimal(18, 5)), CAST(-94.44899 AS Decimal(18, 5)), N'JCTN OF PTH HIGHWAY# 68 HIGHWAY #7', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1305, N'13924_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP ONLY WDDC FACILITY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1306, N'13934', CAST(40.75815 AS Decimal(18, 5)), CAST(-82.50415 AS Decimal(18, 5)), N'334 PARK AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1307, N'13934_PUROAIR', CAST(40.75815 AS Decimal(18, 5)), CAST(-82.50415 AS Decimal(18, 5)), N'334 PARK AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1308, N'13951', CAST(49.89491 AS Decimal(18, 5)), CAST(-97.09833 AS Decimal(18, 5)), N'627 PLINGUET STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1309, N'13951_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1310, N'14001', CAST(49.86997 AS Decimal(18, 5)), CAST(-97.50825 AS Decimal(18, 5)), N'2911 LIDO PLAGE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1311, N'14003', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'NEUFELD ROXANE (DVM) HWY 10 SOUTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1312, N'14004', CAST(49.86791 AS Decimal(18, 5)), CAST(-97.26175 AS Decimal(18, 5)), N'3700 ROBLIN BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1313, N'14005', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DR. GILLIAN DOBSON 43 CHURCH AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1314, N'14602', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WHITE OWL SERVICES-PURO DEPO 21 FIRST AVE S', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1315, N'14604', CAST(36.13771 AS Decimal(18, 5)), CAST(-95.98089 AS Decimal(18, 5)), N'702 17TH STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1316, N'14903', CAST(42.26010 AS Decimal(18, 5)), CAST(-71.09825 AS Decimal(18, 5)), N'15 TUCKER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1317, N'21002', CAST(41.88566 AS Decimal(18, 5)), CAST(-87.61468 AS Decimal(18, 5)), N'HEALTH SERVICES P.C. INC. #1 SERVICE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1318, N'21005', CAST(50.28337 AS Decimal(18, 5)), CAST(-107.82189 AS Decimal(18, 5)), N'1616 CHEADLE STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1319, N'21005_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1320, N'21005_PURO', CAST(50.28337 AS Decimal(18, 5)), CAST(-107.82189 AS Decimal(18, 5)), N'1616 CHEADLE STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1321, N'21006', CAST(43.69531 AS Decimal(18, 5)), CAST(-79.74766 AS Decimal(18, 5)), N'#12 KENNEDY ROAD SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1322, N'21007', CAST(50.27454 AS Decimal(18, 5)), CAST(-107.76843 AS Decimal(18, 5)), N'2225 GLADSTONE STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1323, N'21007_LOOMIS', CAST(50.27454 AS Decimal(18, 5)), CAST(-107.76843 AS Decimal(18, 5)), N'2225 GLADSTONE STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1324, N'21008', CAST(32.89505 AS Decimal(18, 5)), CAST(-85.16499 AS Decimal(18, 5)), N'HWY 14 WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1325, N'21016_DHL', CAST(9.60290 AS Decimal(18, 5)), CAST(76.53211 AS Decimal(18, 5)), N'HIGHWAY 10 JUNCT HIGHWAY 133 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1326, N'21022', CAST(52.66799 AS Decimal(18, 5)), CAST(-106.33935 AS Decimal(18, 5)), N'c/o NORSASK VETERINARY GROUP 4016 SASKATCHEWAN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1327, N'21025', CAST(41.83134 AS Decimal(18, 5)), CAST(-72.48196 AS Decimal(18, 5)), N'25 DISCOVERY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1328, N'21031', CAST(34.06575 AS Decimal(18, 5)), CAST(74.42958 AS Decimal(18, 5)), N'402 - GRID ROAD SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1329, N'21053', CAST(51.63809 AS Decimal(18, 5)), CAST(-103.54113 AS Decimal(18, 5)), N'C/O TEMPO REEL MARINE 529 HIGHWAY 16 WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1330, N'21056', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PO BOX 968 ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1331, N'21058', CAST(40.17414 AS Decimal(18, 5)), CAST(-76.80187 AS Decimal(18, 5)), N'RR3 BOX 115A 280 VALLEY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1332, N'21067_ERICDANE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1333, N'21068', CAST(52.69405 AS Decimal(18, 5)), CAST(-2.48658 AS Decimal(18, 5)), N'PO BOX 3 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1334, N'21075', CAST(41.84327 AS Decimal(18, 5)), CAST(-89.48027 AS Decimal(18, 5)), N'215 2nd Street East ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1335, N'21078', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O ANDERSON FAMILY FOOD 18 - 1ST AVENUE N.E.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1336, N'21097', CAST(41.02019 AS Decimal(18, 5)), CAST(-76.85144 AS Decimal(18, 5)), N'106 BROADWAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1337, N'21111', CAST(53.28458 AS Decimal(18, 5)), CAST(-110.00721 AS Decimal(18, 5)), N'5010 A 51 STREET (PURO DEPOT) ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1338, N'21118_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1339, N'21125', CAST(40.69268 AS Decimal(18, 5)), CAST(-99.08764 AS Decimal(18, 5)), N'1802 - 4th AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1340, N'21131', CAST(37.89003 AS Decimal(18, 5)), CAST(-89.49666 AS Decimal(18, 5)), N'PO BOX 309 210 4  AVENUE W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1341, N'21133', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWY 18    13 KILOMETERS EAST OF BRACKEN', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1342, N'21133_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC FACILITY (HOLD FOR PICK UP) 17611 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1343, N'21136', CAST(49.42067 AS Decimal(18, 5)), CAST(-107.07558 AS Decimal(18, 5)), N'HWY 18 east of mankota PO BOX 68', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1344, N'21136_LOOMIS', CAST(49.42067 AS Decimal(18, 5)), CAST(-107.07558 AS Decimal(18, 5)), N'HWY 18 EAST OF MANKOTA PO BOX 68', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1345, N'21136_PUROLATOR', CAST(49.42067 AS Decimal(18, 5)), CAST(-107.07558 AS Decimal(18, 5)), N'HIGHWAY 18 EAST OF MANKOTA ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1346, N'21150', CAST(50.47851 AS Decimal(18, 5)), CAST(-104.57783 AS Decimal(18, 5)), N'c/o PURO DEPOT 120 HODSMAN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1347, N'21600', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O HOLD FOR PICKUP ATS DEPOT 801B 47 STREET EAST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1348, N'21601', CAST(52.09284 AS Decimal(18, 5)), CAST(-106.62863 AS Decimal(18, 5)), N'139 RIEL CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1349, N'21603', CAST(50.28867 AS Decimal(18, 5)), CAST(-107.82229 AS Decimal(18, 5)), N'1677 SIDNEY STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1350, N'21604', CAST(41.69970 AS Decimal(18, 5)), CAST(-93.06067 AS Decimal(18, 5)), N'606A - 1ST AVENUE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1351, N'21610_BATTLEFOR', CAST(33.89536 AS Decimal(18, 5)), CAST(-118.41410 AS Decimal(18, 5)), N'401 - 27TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1352, N'21610_NORTHPORT', CAST(33.81176 AS Decimal(18, 5)), CAST(-117.99311 AS Decimal(18, 5)), N'HWY 39 & 1ST STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1353, N'21610_PRINCEALB', CAST(34.51561 AS Decimal(18, 5)), CAST(-93.05368 AS Decimal(18, 5)), N'FLOOR 3, ROOM 320 1288 CENTRAL AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1354, N'21610_REGINA', CAST(44.04753 AS Decimal(18, 5)), CAST(-123.12055 AS Decimal(18, 5)), N'FLOOR 3, ROOM 301 1800 - 11th AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1355, N'21610_SWIFTCUR', CAST(50.28867 AS Decimal(18, 5)), CAST(-107.82229 AS Decimal(18, 5)), N'1677 SIDNEY STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1356, N'21611', CAST(52.66750 AS Decimal(18, 5)), CAST(-106.34298 AS Decimal(18, 5)), N'C/O PETRO CANADA 6051 SASKATCHEWAN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1357, N'21612', CAST(43.81053 AS Decimal(18, 5)), CAST(-91.25205 AS Decimal(18, 5)), N'314 - 4TH STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1358, N'21670', CAST(52.13338 AS Decimal(18, 5)), CAST(-106.63081 AS Decimal(18, 5)), N'52 CAMPUS DRIVE ROOM 1255 UNIVERSITY OF SASKATCHEWAN', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1359, N'21902', CAST(35.36853 AS Decimal(18, 5)), CAST(-78.01164 AS Decimal(18, 5)), N'HWY 13 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1360, N'21903', CAST(29.75729 AS Decimal(18, 5)), CAST(-95.36429 AS Decimal(18, 5)), N'905 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1361, N'21905', CAST(52.12571 AS Decimal(18, 5)), CAST(-106.88541 AS Decimal(18, 5)), N'C/O SASK LIVESTOCK SALES HWY 14 WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1362, N'21905_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1363, N'21931', CAST(40.80788 AS Decimal(18, 5)), CAST(-74.07830 AS Decimal(18, 5)), N'HIGHWAY 3 EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1364, N'21976', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD AT PUROLATOR DEPOT UNIT 106, 2100 - 8TH STREET E.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1365, N'22001', CAST(52.11511 AS Decimal(18, 5)), CAST(-106.59730 AS Decimal(18, 5)), N'4  3421 8 STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1366, N'22002', CAST(37.40615 AS Decimal(18, 5)), CAST(-79.13227 AS Decimal(18, 5)), N'1800 GARNET STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1367, N'22003', CAST(37.96306 AS Decimal(18, 5)), CAST(-87.61247 AS Decimal(18, 5)), N'3010 B ARLINGTON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1368, N'22004', CAST(48.84499 AS Decimal(18, 5)), CAST(-123.29656 AS Decimal(18, 5)), N'BAY 2, 1945 McKERCHER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1369, N'22006', CAST(32.08542 AS Decimal(18, 5)), CAST(-81.12027 AS Decimal(18, 5)), N'216 McINTYRE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1370, N'22007', CAST(31.21070 AS Decimal(18, 5)), CAST(-85.35055 AS Decimal(18, 5)), N'120, 227 PRIMROSE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1371, N'22008', CAST(30.13269 AS Decimal(18, 5)), CAST(-94.01550 AS Decimal(18, 5)), N'#8, 415 - 115 STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1372, N'22009', CAST(52.16101 AS Decimal(18, 5)), CAST(-106.64500 AS Decimal(18, 5)), N'12, 7 ASSINIBOINE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1373, N'22011', CAST(50.40532 AS Decimal(18, 5)), CAST(-104.62042 AS Decimal(18, 5)), N'4645 RAE Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1374, N'22014', CAST(27.98439 AS Decimal(18, 5)), CAST(-97.39237 AS Decimal(18, 5)), N'628 VICTORIA AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1375, N'22016', CAST(50.43527 AS Decimal(18, 5)), CAST(-104.55486 AS Decimal(18, 5)), N'330 GARDINER PARK COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1376, N'22018', CAST(50.49600 AS Decimal(18, 5)), CAST(-104.66621 AS Decimal(18, 5)), N'O/A NORMANVIEW PET HOSPITAL 1151 LAKEWOOD COURT  N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1377, N'22018_FOOD', CAST(50.49600 AS Decimal(18, 5)), CAST(-104.66621 AS Decimal(18, 5)), N'O/A NORMANVIEW PET HOSPITAL 1151 LAKEWOOD COURT N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1378, N'22019', CAST(36.13211 AS Decimal(18, 5)), CAST(-80.25449 AS Decimal(18, 5)), N'102 - 32nd STREET  WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1379, N'22020', CAST(47.71439 AS Decimal(18, 5)), CAST(-116.83179 AS Decimal(18, 5)), N'3853 SHERWOOD DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1380, N'22021', CAST(34.02625 AS Decimal(18, 5)), CAST(-118.50655 AS Decimal(18, 5)), N'605 - 4TH STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1381, N'22022', CAST(40.83684 AS Decimal(18, 5)), CAST(-111.89410 AS Decimal(18, 5)), N'7 - 239 CENTENNIAL DRIVE NOTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1382, N'22025', CAST(45.65777 AS Decimal(18, 5)), CAST(-68.71087 AS Decimal(18, 5)), N'205 CENTRAL STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1383, N'22028', CAST(52.04658 AS Decimal(18, 5)), CAST(-106.64750 AS Decimal(18, 5)), N'5028 CLARENCE AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1384, N'22042', CAST(40.70076 AS Decimal(18, 5)), CAST(-89.49565 AS Decimal(18, 5)), N'118, 110 RUTH STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1385, N'22043', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CORNER OF ALBERT ST & ARMOUR RD. HIGHWAY #6 BOX 3143', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1386, N'22050', CAST(27.78076 AS Decimal(18, 5)), CAST(-82.66678 AS Decimal(18, 5)), N'2438 - 9TH  AVE  N ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1387, N'22087', CAST(40.71520 AS Decimal(18, 5)), CAST(-73.99086 AS Decimal(18, 5)), N'#14, 410 LUDLOW STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1388, N'22100', CAST(40.47632 AS Decimal(18, 5)), CAST(-88.97959 AS Decimal(18, 5)), N'1004 TAYLOR STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1389, N'22102', CAST(52.16896 AS Decimal(18, 5)), CAST(-106.67425 AS Decimal(18, 5)), N'C/O PURO DEPOT 2675 C AVE N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1390, N'22106', CAST(40.68359 AS Decimal(18, 5)), CAST(-74.41933 AS Decimal(18, 5)), N'309 TIMBER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1391, N'22110', CAST(33.89341 AS Decimal(18, 5)), CAST(-81.09489 AS Decimal(18, 5)), N'#9, 110 WEDGE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1392, N'22260', CAST(47.98975 AS Decimal(18, 5)), CAST(-122.20130 AS Decimal(18, 5)), N'BAY #21 & 22, 2605 BROADWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1393, N'22300', CAST(34.75923 AS Decimal(18, 5)), CAST(-87.67376 AS Decimal(18, 5)), N'#300, 2ND STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1394, N'22300_NATIONAL', CAST(34.75923 AS Decimal(18, 5)), CAST(-87.67376 AS Decimal(18, 5)), N'300 2nd STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1395, N'22411', CAST(52.09790 AS Decimal(18, 5)), CAST(-106.56778 AS Decimal(18, 5)), N'411-D HEROLD COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1396, N'22607', CAST(30.74620 AS Decimal(18, 5)), CAST(-98.06236 AS Decimal(18, 5)), N'747 VAUGHAN STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1397, N'22608', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PRESTON (PURO DEPOT) 2100 - 8 STREET EAST  SUITE 106', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1398, N'22609', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'SUNITA SESHIA - DEPART OF VET PATH U OF S - 52 CAMPUS DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1399, N'22612', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF S 52 CAMPUS DRIVE RM1622/1621 VET PATHOLOGY DEPARTMENT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1400, N'22613', CAST(40.69931 AS Decimal(18, 5)), CAST(-73.93888 AS Decimal(18, 5)), N'835 BROADWAY AVE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1401, N'22614_REGINA', CAST(37.75669 AS Decimal(18, 5)), CAST(-122.24900 AS Decimal(18, 5)), N'665 Park St ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1402, N'22615', CAST(39.36606 AS Decimal(18, 5)), CAST(-74.41299 AS Decimal(18, 5)), N'#202 - 224 PACIFIC AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1403, N'22617', CAST(52.11392 AS Decimal(18, 5)), CAST(-106.62388 AS Decimal(18, 5)), N'C/O PRESTON (PURO DEPOT) #106  2100 - 8TH STREET E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1404, N'22618', CAST(52.16896 AS Decimal(18, 5)), CAST(-106.67425 AS Decimal(18, 5)), N'C/O PURO DEPOT 2675 C AVE N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1405, N'22619', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PRESTON (PURO DEPOT) 2100 - 8TH E SUITE 106', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1406, N'22620', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT #106 2100 8th STREET E', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1407, N'22621', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'U OF S - VET PATHOLOGY 52 CAMPUS DR.   WCVM 1663', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1408, N'22622', CAST(52.11392 AS Decimal(18, 5)), CAST(-106.62388 AS Decimal(18, 5)), N'C/O PURO DEPOT 2100 8TH STREET E  #106', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1409, N'22625', CAST(52.11392 AS Decimal(18, 5)), CAST(-106.62388 AS Decimal(18, 5)), N'C/O PURO DEPOT #106 2100 - 8TH STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1410, N'22631', CAST(41.63857 AS Decimal(18, 5)), CAST(-83.61769 AS Decimal(18, 5)), N'3138 HILL AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1411, N'22655', CAST(50.39435 AS Decimal(18, 5)), CAST(-105.58532 AS Decimal(18, 5)), N'1755 STADACONA STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1412, N'22903', CAST(52.11586 AS Decimal(18, 5)), CAST(-106.63243 AS Decimal(18, 5)), N'25,  1501 - 8 STREET E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1413, N'22904', CAST(48.84499 AS Decimal(18, 5)), CAST(-123.29656 AS Decimal(18, 5)), N'BAY 2, 1945 McKERCHER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1414, N'22905', CAST(52.13495 AS Decimal(18, 5)), CAST(-106.72057 AS Decimal(18, 5)), N'3120 LAURIER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1415, N'22910', CAST(52.13034 AS Decimal(18, 5)), CAST(-106.59825 AS Decimal(18, 5)), N'106 103 STREET E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1416, N'23005', CAST(35.54181 AS Decimal(18, 5)), CAST(-79.78217 AS Decimal(18, 5)), N'PO BOX 299 139 PARKS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1417, N'23006', CAST(37.28239 AS Decimal(18, 5)), CAST(-121.94535 AS Decimal(18, 5)), N'424 RAILWAY AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1418, N'23007', CAST(46.57989 AS Decimal(18, 5)), CAST(-90.88584 AS Decimal(18, 5)), N'1020 - 9TH AVENUE WEST PO BOX 2289', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1419, N'23007_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1420, N'23008', CAST(40.87994 AS Decimal(18, 5)), CAST(-73.98067 AS Decimal(18, 5)), N'420 GRAND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1421, N'23009', CAST(40.47116 AS Decimal(18, 5)), CAST(-74.29609 AS Decimal(18, 5)), N'HIGHWAY 9 SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1422, N'23009_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1423, N'23009_FOOD', CAST(40.47116 AS Decimal(18, 5)), CAST(-74.29609 AS Decimal(18, 5)), N'HIGHWAY 9 SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1424, N'23010', CAST(42.37608 AS Decimal(18, 5)), CAST(-71.24140 AS Decimal(18, 5)), N'116 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1425, N'23011', CAST(38.89546 AS Decimal(18, 5)), CAST(-77.02191 AS Decimal(18, 5)), N'416 7  STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1426, N'23011_FOOD', CAST(38.89546 AS Decimal(18, 5)), CAST(-77.02191 AS Decimal(18, 5)), N'416 - 7 STREET  NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1427, N'23012', CAST(41.51817 AS Decimal(18, 5)), CAST(-90.35929 AS Decimal(18, 5)), N'600 - 1ST AVE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1428, N'23013_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICK UP BUS DEPOT ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1429, N'23014', CAST(42.42249 AS Decimal(18, 5)), CAST(-83.16084 AS Decimal(18, 5)), N'10020 THATCHER AVENUE PO BOX 1334', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1430, N'23016', CAST(49.18342 AS Decimal(18, 5)), CAST(-2.10855 AS Decimal(18, 5)), N'#1 COMMERCIAL CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1431, N'23016_FOOD', CAST(49.18342 AS Decimal(18, 5)), CAST(-2.10855 AS Decimal(18, 5)), N'#1 COMMERCIAL CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1432, N'23017', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROSS CAROL (DVM) HIGHWAY 39 WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1433, N'23017_FOOD', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HIGHWAY 39 WEST ', N'The remote server returned an error: (500) Internal Server Error.')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1434, N'23017_PAHPET', CAST(35.39815 AS Decimal(18, 5)), CAST(-82.54622 AS Decimal(18, 5)), N'501 NESBITT DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1435, N'23017_SOURISVAL', CAST(46.72326 AS Decimal(18, 5)), CAST(-92.07048 AS Decimal(18, 5)), N'202 - 2nd STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1436, N'23019', CAST(37.28242 AS Decimal(18, 5)), CAST(-121.94532 AS Decimal(18, 5)), N'410 RAILWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1437, N'23021', CAST(50.44721 AS Decimal(18, 5)), CAST(-104.55938 AS Decimal(18, 5)), N'1846 VICTORIA AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1438, N'23021_SAANICH', CAST(48.52406 AS Decimal(18, 5)), CAST(-123.37210 AS Decimal(18, 5)), N'5157 LOCHSIDE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1439, N'23024', CAST(42.72233 AS Decimal(18, 5)), CAST(-73.69387 AS Decimal(18, 5)), N'RM 104, 241-2ND STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1440, N'23024_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1441, N'23025', CAST(50.39633 AS Decimal(18, 5)), CAST(-105.58852 AS Decimal(18, 5)), N'1885 CARIBOU STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1442, N'23025_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1443, N'23025_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pick up at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1444, N'23029', CAST(42.53418 AS Decimal(18, 5)), CAST(-71.19623 AS Decimal(18, 5)), N'#40 WHEATLAND CR ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1445, N'23029_FOOD', CAST(42.53418 AS Decimal(18, 5)), CAST(-71.19623 AS Decimal(18, 5)), N'#40 WHEATLAND CR ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1446, N'23029_UNITY', CAST(48.14515 AS Decimal(18, 5)), CAST(-103.62575 AS Decimal(18, 5)), N'181 - 2ND AVENUE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1447, N'23030', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWAY 15, 7 KMS S ON BRATTON RD ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1448, N'23031', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o AM DEL. PURO AGNT- HOLD PICKUP 910 NORTH RAILWAY STREET WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1449, N'23033_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611 - 109A AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1450, N'23035', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'BIG-N-SMALL VETERINARY SERVICE SW34-36-27-W2  RURAL MUNICIPAL #342', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1451, N'23036', CAST(49.62580 AS Decimal(18, 5)), CAST(-105.98826 AS Decimal(18, 5)), N'PO BOX 51   109 ASSINIBOIA AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1452, N'23036_FOOD', CAST(49.62580 AS Decimal(18, 5)), CAST(-105.98826 AS Decimal(18, 5)), N'PO BOX 51  109 ASSINIBOIA AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1453, N'23037', CAST(50.38416 AS Decimal(18, 5)), CAST(-105.55410 AS Decimal(18, 5)), N'790 LILLOOET STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1454, N'23037_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1455, N'23038', CAST(48.36657 AS Decimal(18, 5)), CAST(-119.57774 AS Decimal(18, 5)), N'515 - 2nd AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1456, N'23038_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT C/O GATEWAY ESSO HWY 1&21 WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1457, N'23038_FOOD', CAST(48.36657 AS Decimal(18, 5)), CAST(-119.57774 AS Decimal(18, 5)), N'515 - 2ND AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1458, N'23039', CAST(42.72636 AS Decimal(18, 5)), CAST(-87.78106 AS Decimal(18, 5)), N'72 7th  STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1459, N'23039_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1460, N'23041', CAST(52.12571 AS Decimal(18, 5)), CAST(-106.88541 AS Decimal(18, 5)), N'c/o SASK LIVESTOCK SALES HWY 14 WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1461, N'23043', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWY 1 E (2 MILES EAST OF RING ROAD) TOWER ROAD (LANDMARK CTV BUILDING)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1462, N'23047', CAST(50.39617 AS Decimal(18, 5)), CAST(-105.58002 AS Decimal(18, 5)), N'1550 HOCHELAGA STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1463, N'23049', CAST(9.16124 AS Decimal(18, 5)), CAST(76.72368 AS Decimal(18, 5)), N'C/O THE PILGRIM CENTRE 1 HWY W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1464, N'23050', CAST(42.67797 AS Decimal(18, 5)), CAST(-105.79951 AS Decimal(18, 5)), N'HIGHWAY 14 AND CRESCENT STREET BOX 1750', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1465, N'23052', CAST(49.88742 AS Decimal(18, 5)), CAST(-97.13424 AS Decimal(18, 5)), N'HIGHWAY 52 BROADWAY WEST P.O. BOX 1238', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1466, N'23052_FOOD', CAST(49.96907 AS Decimal(18, 5)), CAST(-97.07636 AS Decimal(18, 5)), N'HIGHWAY 52 BROADWAY WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1467, N'23054', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PENNER OIL JUNCTION OF HWY #1 AND HIGHWAY #19', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1468, N'23054_CENTRALBU', CAST(50.79381 AS Decimal(18, 5)), CAST(-106.50731 AS Decimal(18, 5)), N'C/O HICKS STORE 181 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1469, N'23054_SOUTHWEST', CAST(30.59701 AS Decimal(18, 5)), CAST(-88.17169 AS Decimal(18, 5)), N'2997 NORTH SERVICE ROAD WEST HWY 1 W MOBILE DEL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1470, N'23056', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ELINORAH RIPLEY (DVM) 1 HWY 26 NORTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1471, N'23056_FOOD', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ELINORAH RIPLEY (DVM) 1 HWY 26 NORTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1472, N'23057', CAST(50.39185 AS Decimal(18, 5)), CAST(-105.54799 AS Decimal(18, 5)), N'790 A LILLOOET STREET WEST EAST BUILDING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1473, N'23059', CAST(52.15755 AS Decimal(18, 5)), CAST(-106.66769 AS Decimal(18, 5)), N'2035A ALBERTA AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1474, N'23061', CAST(53.18016 AS Decimal(18, 5)), CAST(-105.75172 AS Decimal(18, 5)), N'C/O PURO DEPOT 99 INDUSTRIAL DRIVE SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1475, N'23063_BUS', CAST(40.74657 AS Decimal(18, 5)), CAST(-73.97148 AS Decimal(18, 5)), N'C/O GREYHOUND DEPOT - FAS GAS 502 PARK AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1476, N'23070', CAST(42.28836 AS Decimal(18, 5)), CAST(-93.79325 AS Decimal(18, 5)), N'CORNER OF RAILWAY & ALFRED ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1477, N'23070_PURO', CAST(42.28836 AS Decimal(18, 5)), CAST(-93.79325 AS Decimal(18, 5)), N'CORNER OF RAILWAY & ALFRED ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1478, N'23073', CAST(42.10826 AS Decimal(18, 5)), CAST(-86.47974 AS Decimal(18, 5)), N'720 PLEASANT STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1479, N'23073_REGINA', CAST(50.47851 AS Decimal(18, 5)), CAST(-104.57783 AS Decimal(18, 5)), N'HOLD FOR PICKUP REGINA PURO DEPOT 702 TORONTO STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1480, N'23080', CAST(41.69955 AS Decimal(18, 5)), CAST(-93.04793 AS Decimal(18, 5)), N'PO BOX 1335 501 1ST AVENUE E', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1481, N'23082', CAST(26.12281 AS Decimal(18, 5)), CAST(-80.14297 AS Decimal(18, 5)), N'C/O MOORE & COMPANY PO BOX 460', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1482, N'23087', CAST(40.83148 AS Decimal(18, 5)), CAST(-115.76111 AS Decimal(18, 5)), N'204 - 5TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1483, N'23096', CAST(36.16977 AS Decimal(18, 5)), CAST(-119.33669 AS Decimal(18, 5)), N'4016 - SASKATCHEWAN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1484, N'23096_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/0 312 ESSO SERVICE 6051 SASKATCHEWAN ST. HOLD FOR', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1485, N'23099', CAST(51.48218 AS Decimal(18, 5)), CAST(-2.50682 AS Decimal(18, 5)), N'C/O VICTORIA VET CLINIC 628 VICTORIA AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1486, N'23100', CAST(32.78086 AS Decimal(18, 5)), CAST(-96.80011 AS Decimal(18, 5)), N'1409 M AIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1487, N'23100_CFIA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o CANADIAN FOOD INSP AGENCY 201, 421 DOWNEY ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1488, N'23101', CAST(37.94478 AS Decimal(18, 5)), CAST(-120.94034 AS Decimal(18, 5)), N'HIGHWAY 4 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1489, N'23103', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WENDY SCHMALTZ (DVM) HWY 18 EAST OF MANKOTA', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1490, N'23103_PURO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WENDY SCHMALTZ (DVM) HWY 18 EAST OF MANKOTA', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1491, N'23110', CAST(35.02497 AS Decimal(18, 5)), CAST(-82.33670 AS Decimal(18, 5)), N'92 HALL STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1492, N'23112', CAST(52.76325 AS Decimal(18, 5)), CAST(-108.28075 AS Decimal(18, 5)), N'#7A 11204 Railway Ave East ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1493, N'23112_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O GREYHOUND DEPOT-HOLD FOR PICKUP 2691 - 98 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1494, N'23120', CAST(47.41353 AS Decimal(18, 5)), CAST(-100.07565 AS Decimal(18, 5)), N'#4, 22nd Avenue SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1495, N'23120_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'123 MAIN ST.(BUS DEPOT) HOLD PICKUP ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1496, N'23122', CAST(53.36519 AS Decimal(18, 5)), CAST(-103.99816 AS Decimal(18, 5)), N'802 NIPAWIN ROAD EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1497, N'23122_BUS', CAST(46.29750 AS Decimal(18, 5)), CAST(-109.25956 AS Decimal(18, 5)), N'314 RAIL WAY AVE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1498, N'23125', CAST(34.83766 AS Decimal(18, 5)), CAST(-82.35052 AS Decimal(18, 5)), N'380A SOUTH  INDUSTRIAL DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1499, N'23125_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pick up at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1500, N'23130', CAST(30.59701 AS Decimal(18, 5)), CAST(-88.17169 AS Decimal(18, 5)), N'2997 NORTH SERVICE ROAD WEST HWY 1 W MOBILE DEL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1501, N'23130_FOOD', CAST(30.59701 AS Decimal(18, 5)), CAST(-88.17169 AS Decimal(18, 5)), N'2997 NORTH SERVICE ROAD WEST HWY 1 W MOBILE DEL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1502, N'23175', CAST(50.94580 AS Decimal(18, 5)), CAST(-102.77118 AS Decimal(18, 5)), N'1 AGRI-PARK ROAD NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1503, N'23175_FOOD', CAST(50.94580 AS Decimal(18, 5)), CAST(-102.77118 AS Decimal(18, 5)), N'1 AGRI-PARK ROAD NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1504, N'23193', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SIGFRID KAREN  (DVM) 1211 - 93 AVENUE HIGHWAY 3 E.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1505, N'23193_FOOD', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SIGFRID KAREN (DVM) 1211 - 93 AVENUE HIGHWAY 3 E', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1506, N'23199', CAST(34.75761 AS Decimal(18, 5)), CAST(-92.26849 AS Decimal(18, 5)), N'424 MAPLE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1507, N'23199_LOOMIS', CAST(34.75761 AS Decimal(18, 5)), CAST(-92.26849 AS Decimal(18, 5)), N'424 MAPLE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1508, N'23202', CAST(31.59889 AS Decimal(18, 5)), CAST(-84.23000 AS Decimal(18, 5)), N'3259 EASTGATE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1509, N'23203', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O NELSON MOTORS HIGHWAY 18 WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1510, N'23204', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PIONEER COOP FARM CENTER 103 RAILWAY AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1511, N'23210', CAST(49.91099 AS Decimal(18, 5)), CAST(-109.48467 AS Decimal(18, 5)), N'C/O B & A PETROLEUM #1 PACIFIC AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1512, N'23215', CAST(32.56522 AS Decimal(18, 5)), CAST(-93.66410 AS Decimal(18, 5)), N'#5, 215 STONEBRIDGE BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1513, N'23220', CAST(52.16661 AS Decimal(18, 5)), CAST(-106.68279 AS Decimal(18, 5)), N'C/O LOOMIS DEPOT 2519 KOYL AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1514, N'23220_GATEWAY', CAST(52.86744 AS Decimal(18, 5)), CAST(-104.62918 AS Decimal(18, 5)), N'C/O GATEWAY VETERINARY SERVICES 710 HAMILTON AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1515, N'23220_SOUTHHILL', CAST(53.18444 AS Decimal(18, 5)), CAST(-105.75733 AS Decimal(18, 5)), N'102 -  32ND STREET WEST C/O SOUTH HILL ANIMAL CLINIC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1516, N'23225', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O POWELL FERTILIZER & CHEM PO BOX 130', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1517, N'23225_BUS', CAST(51.21155 AS Decimal(18, 5)), CAST(-102.46253 AS Decimal(18, 5)), N'YORKTON GREYHOUND DEPOT 35 - 1ST AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1518, N'23231', CAST(35.28698 AS Decimal(18, 5)), CAST(-80.85011 AS Decimal(18, 5)), N'HWY 21 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1519, N'23231_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1520, N'23231_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1521, N'23231_PHARM', CAST(35.28698 AS Decimal(18, 5)), CAST(-80.85011 AS Decimal(18, 5)), N'HWY 21 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1522, N'23243', CAST(42.46913 AS Decimal(18, 5)), CAST(-93.82052 AS Decimal(18, 5)), N'626 2nd STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1523, N'23260', CAST(51.20630 AS Decimal(18, 5)), CAST(-102.45169 AS Decimal(18, 5)), N'c/o YORKTON COOP - PURO HOLD  P/U 180 HAMILTON ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1524, N'23268', CAST(35.17645 AS Decimal(18, 5)), CAST(-106.62386 AS Decimal(18, 5)), N'HIGHWAY 47 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1525, N'23277', CAST(42.74153 AS Decimal(18, 5)), CAST(-93.20228 AS Decimal(18, 5)), N'2  4th STREET SOUTH PO BOX 885', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1526, N'23282', CAST(40.81419 AS Decimal(18, 5)), CAST(-73.99291 AS Decimal(18, 5)), N'226E WHEELER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1527, N'23301', CAST(35.07060 AS Decimal(18, 5)), CAST(-85.30790 AS Decimal(18, 5)), N'710 HAMILTON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1528, N'23301_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1529, N'23337', CAST(49.57378 AS Decimal(18, 5)), CAST(-104.91606 AS Decimal(18, 5)), N'C/O OGEMA CO OP -  HOLD FOR PICKUP 302 RAILWAY AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1530, N'23366', CAST(32.77619 AS Decimal(18, 5)), CAST(-88.69189 AS Decimal(18, 5)), N'HIGHWAY 16 WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1531, N'23366_FOOD', CAST(32.77619 AS Decimal(18, 5)), CAST(-88.69189 AS Decimal(18, 5)), N'HIGHWAY 16 WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1532, N'23376', CAST(39.51851 AS Decimal(18, 5)), CAST(-104.76193 AS Decimal(18, 5)), N'c/o COUNTRY GENERAL STORE 108 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1533, N'23380', CAST(47.04516 AS Decimal(18, 5)), CAST(-122.89380 AS Decimal(18, 5)), N'707 - 4th AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1534, N'23380_FOOD', CAST(33.78136 AS Decimal(18, 5)), CAST(-117.21350 AS Decimal(18, 5)), N'707 - 4 AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1535, N'23396', CAST(39.65618 AS Decimal(18, 5)), CAST(-95.52621 AS Decimal(18, 5)), N'419 - 1ST AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1536, N'23396_PURO', CAST(39.65618 AS Decimal(18, 5)), CAST(-95.52621 AS Decimal(18, 5)), N'419 - 1ST AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1537, N'23600', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'c/o VTH PHARMACY   WCVM U of SASK  52 CAMPUS DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1538, N'23604', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PUROLATOR DEPOT SANDY RIDGE GAS STN     HWY 14', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1539, N'23605', CAST(52.14314 AS Decimal(18, 5)), CAST(-106.66938 AS Decimal(18, 5)), N'1130 IDYLWYLD DRIVE NORTH SASKATOON CAMPUS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1540, N'23608', CAST(45.42813 AS Decimal(18, 5)), CAST(-101.07392 AS Decimal(18, 5)), N'BOX 431 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1541, N'23610', CAST(50.28195 AS Decimal(18, 5)), CAST(-107.81211 AS Decimal(18, 5)), N'PURO DEPOT 910 NORTH RAILWAY STREET W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1542, N'23611', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'U OF S DEPT. OF VET PATHOLOGY WCVM   52 CAMPUS DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1543, N'23612', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PRESTON (PURO DEPOT) 2100 - 8TH STREET EAST SUITE 106', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1544, N'23614', CAST(50.39721 AS Decimal(18, 5)), CAST(-105.57701 AS Decimal(18, 5)), N'1410 B CARIBOU STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1545, N'23615', CAST(38.41707 AS Decimal(18, 5)), CAST(-82.58550 AS Decimal(18, 5)), N'331 - 4TH STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1546, N'23616', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT 99 INDUSTRIAL DRIVE SOUTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1547, N'23616_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1548, N'23617', CAST(35.81419 AS Decimal(18, 5)), CAST(-80.80773 AS Decimal(18, 5)), N'217 RIVER HEIGHTS DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1549, N'23618', CAST(52.11392 AS Decimal(18, 5)), CAST(-106.62388 AS Decimal(18, 5)), N'C/O PURO DEPOT - PRESTON 2100 8TH STREET SUITE 106', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1550, N'23619', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT 2100-8TH STREET SUITE 106', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1551, N'23620', CAST(41.10073 AS Decimal(18, 5)), CAST(-80.63136 AS Decimal(18, 5)), N'202 - 3085 ALBERT STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1552, N'23621', CAST(49.17756 AS Decimal(18, 5)), CAST(-101.79979 AS Decimal(18, 5)), N'C/O THIS ''N THAT STORE C-STORE 911 HWY 18', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1553, N'23622', CAST(52.11392 AS Decimal(18, 5)), CAST(-106.62388 AS Decimal(18, 5)), N'C/O PURO DEPOT #106   2100 - 8 STREET EAST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1554, N'23623', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT CIRCLE 8 2327-8th ST E', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1555, N'23624', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT 2100-8TH STREET E #106', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1556, N'23630', CAST(53.18016 AS Decimal(18, 5)), CAST(-105.75172 AS Decimal(18, 5)), N'HOLD FOR PICK UP PUROLATOR DEPOT IN PRINCE ALBERT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1557, N'23652', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'DEPT. OF VET. PATH. ROOM 1669B 52 CAMPUS DRIVE   WCVM', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1558, N'23800', CAST(50.47851 AS Decimal(18, 5)), CAST(-104.57783 AS Decimal(18, 5)), N'C/O PURO DEPOT - HOLD FOR PICKUP 120 HODSMAN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1559, N'23902', CAST(23.05442 AS Decimal(18, 5)), CAST(72.56285 AS Decimal(18, 5)), N'HWY 18 EAST 421 RAILWAY AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1560, N'23903', CAST(34.80876 AS Decimal(18, 5)), CAST(-86.73127 AS Decimal(18, 5)), N'100 A Crystal Springs Dr. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1561, N'23905', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CARLEEN NORLEEN (DVM) 2035A ALBERTA AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1562, N'23914', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PO BOX 1334 ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1563, N'23922', CAST(26.73401 AS Decimal(18, 5)), CAST(-80.06119 AS Decimal(18, 5)), N'1006 - 22ND STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1564, N'23930', CAST(35.77706 AS Decimal(18, 5)), CAST(-91.66063 AS Decimal(18, 5)), N'#1 - 1071 CENTRAL AVE N ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1565, N'23930_FOOD', CAST(35.77706 AS Decimal(18, 5)), CAST(-91.66063 AS Decimal(18, 5)), N'#1 - 1071 CENTRAL AVE N ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1566, N'23982', CAST(40.87503 AS Decimal(18, 5)), CAST(-72.40079 AS Decimal(18, 5)), N'86 GREAT PLAINS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1567, N'26002', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'ROOM 1301 WCVM LOADING DOCK WCVM  U OF SASK  52 CAMPUS DR', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1568, N'26002_FEEDING', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'ROOM 1301 WCVM LOADING DOCK WCVM  U OF SASK  52 CAMPUS DR', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1569, N'26010', CAST(52.13638 AS Decimal(18, 5)), CAST(-106.62670 AS Decimal(18, 5)), N'RM 104    U OF SASK 120 VETERINARY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1570, N'26010_INTERVAC', CAST(52.13406 AS Decimal(18, 5)), CAST(-106.62880 AS Decimal(18, 5)), N'c/o  U OF SASK 117 VETERINARY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1571, N'26050_IMMUNOLOG', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'WCVM BLDG   RM 2604 52 CAMPUS DR    U OF SASK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1572, N'26050_PDSREGINA', CAST(50.40610 AS Decimal(18, 5)), CAST(-104.57429 AS Decimal(18, 5)), N'SUITE 1, 4840 WASCANA PARKWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1573, N'26050_ROOM1550', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'WCVM LOADING DOCK ROOM 1301 52 CAMPUS DRIVE UNIV OF SASK.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1574, N'26050_ROOM1602', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'ROOM 1602, 52 CAMPUS DRIVE W.C.V.M. UNIVERSITY OF SASK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1575, N'26050_ROOM1608', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'WCVM BLDG ROOM 1608 52 CAMPUS DRIVE UNIV OF SASK.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1576, N'26601', CAST(52.13408 AS Decimal(18, 5)), CAST(-106.62876 AS Decimal(18, 5)), N'RM 1301,   WCVM BUILDING 52 CAMPUS DRIVE UNIV OF SASK.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1577, N'26601_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1578, N'26601_RM2604', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'RM 1301,  WCVM LOADING DOCK 52 CAMPUS DRIVE  UNIV OF SASK.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1579, N'26901', CAST(52.13408 AS Decimal(18, 5)), CAST(-106.62876 AS Decimal(18, 5)), N'ROOM 1501 VET TEACHING HOSPITAL WCVM 52 CAMPUS DRIVE U OF SASK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1580, N'26902', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'VET TEACHING HOSP RM 1525 WCVM 52 CAMPUS DR. U OF SASK', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1581, N'26903', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'VET TEACHING HOSP. RM 1519 WCVM 52 CAMPUS DR. U OF SASK.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1582, N'26904', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'RM 1525 52 CAMPUS DRIVE HILLS VIP PROGRAM', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1583, N'31000', CAST(54.09392 AS Decimal(18, 5)), CAST(-112.78476 AS Decimal(18, 5)), N'c/o WASKATENAU MOTORS 5045 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1584, N'31001', CAST(37.56398 AS Decimal(18, 5)), CAST(-122.32503 AS Decimal(18, 5)), N'59 EAST  3RD AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1585, N'31001_BUS', CAST(39.75079 AS Decimal(18, 5)), CAST(-104.99101 AS Decimal(18, 5)), N'c/o GREHOUND BUS DEPOT 557 2nd STREET SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1586, N'31002', CAST(34.56198 AS Decimal(18, 5)), CAST(-93.43026 AS Decimal(18, 5)), N'121e - 31 SOUTHRIDGE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1587, N'31002_CONSOL', CAST(47.50750 AS Decimal(18, 5)), CAST(-111.24987 AS Decimal(18, 5)), N'3305 - 2ND AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1588, N'31003', CAST(40.77951 AS Decimal(18, 5)), CAST(-74.01271 AS Decimal(18, 5)), N'#4  50th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1589, N'31003_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN BUS DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1590, N'31004', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o BIOCHECK LABS #6, 320 WT HILL BOULEVARD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1591, N'31004_PURO', CAST(49.83328 AS Decimal(18, 5)), CAST(-99.91719 AS Decimal(18, 5)), N'C/O PURO DEPOT 939 DOUGLAS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1592, N'31005', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'281005 DICKSON STEVENSON TRAIL N. ENTRANCE TO BARN/VET CLINIC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1593, N'31005_BUS', CAST(43.75217 AS Decimal(18, 5)), CAST(-88.45040 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT Main Depot 877', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1594, N'31005_EDMEQU', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HEWLETT VET C/OEDMONTON EQUINE 12215 WILLIAM SHORT ROAD NW', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1595, N'31005_NORTHLAND', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O EDMONTON NORTHLANDS CONTROL OFF - 11433 - 79 ST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1596, N'31005_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY BY CLINIC AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1597, N'31006_TAILORMAD', CAST(41.20070 AS Decimal(18, 5)), CAST(-80.74594 AS Decimal(18, 5)), N'52 BRENTWOOD BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1598, N'31007', CAST(38.66754 AS Decimal(18, 5)), CAST(-90.61897 AS Decimal(18, 5)), N'11762 - 106 STREET DIRECTLY TO ROOM X100', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1599, N'31007_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'BOSVIK NATHAN  (DVM) FOR PICK UP ONLY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1600, N'31008', CAST(33.75415 AS Decimal(18, 5)), CAST(-84.44434 AS Decimal(18, 5)), N'1A-4 EAST LAKE AVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1601, N'31008_AVENUE', CAST(51.29657 AS Decimal(18, 5)), CAST(-113.99712 AS Decimal(18, 5)), N'97 EAST LAKE RAMP N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1602, N'31008_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHND DEP. HOLD FOR P/U 1, 4834 - 51 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1603, N'31009', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O SEARS (PURO DEPOT) 5101 - 51 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1604, N'31009_CENTRALVE', CAST(27.72812 AS Decimal(18, 5)), CAST(-82.63912 AS Decimal(18, 5)), N'C/O CENTRAL VETERINARY CLINIC 4102-64 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1605, N'31009_WETASKIWI', CAST(52.95734 AS Decimal(18, 5)), CAST(-113.37295 AS Decimal(18, 5)), N'C/O WETASKIWIN ANIMAL CLINIC 4735 - 39 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1606, N'31011', CAST(34.58854 AS Decimal(18, 5)), CAST(-90.16337 AS Decimal(18, 5)), N'C/O DR.  LYNN TAIT RR1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1607, N'31011_BUS', CAST(52.26235 AS Decimal(18, 5)), CAST(-113.81354 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT 4305 GAETZ AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1608, N'31011_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1609, N'31011_PURODEP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT - HOLD FOR PICKUP 2319 TAYLOR DRIVE, BUIDLING B', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1610, N'31012', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Patty''s Place (Puro Agent) 4905 50 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1611, N'31012_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o GREYHOUND AGENT 5006 - 50TH STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1612, N'31013', CAST(39.09004 AS Decimal(18, 5)), CAST(-84.54033 AS Decimal(18, 5)), N'339 HIGHWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1613, N'31014', CAST(55.19661 AS Decimal(18, 5)), CAST(-118.78684 AS Decimal(18, 5)), N'C/O BEAR CREEK ANIMAL CLINIC 9708 - 128 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1614, N'31015', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Lakeside Feedlot hwy #1 West 192058 Range Road 150 (MAIN BLDG)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1615, N'31016', CAST(35.94717 AS Decimal(18, 5)), CAST(-95.64640 AS Decimal(18, 5)), N'BOX6371 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1616, N'31016_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD AT MAIN BUS DEPOT ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1617, N'31017', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o CLANCY GRAPHICS (puro agent) 9940 107th Street', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1618, N'31017_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1619, N'31017_SAMEDAY', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O CLANCY GRAPHICS 9940 - 107th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1620, N'31018', CAST(43.65037 AS Decimal(18, 5)), CAST(-79.37766 AS Decimal(18, 5)), N'C/O PUROLATOR DEPOT 5010A-51 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1621, N'31018_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1622, N'31019', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Lakeside Feedlot Hwy #1 West 192058 Range Road 150 (MAIN BLDG)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1623, N'31020', CAST(36.31294 AS Decimal(18, 5)), CAST(-119.80810 AS Decimal(18, 5)), N'12328 HWY 41 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1624, N'31021', CAST(41.11969 AS Decimal(18, 5)), CAST(-80.05867 AS Decimal(18, 5)), N'4329 TOWNSHIP ROAD 302 (HIGHWAY 22)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1625, N'31023', CAST(30.26728 AS Decimal(18, 5)), CAST(-97.73740 AS Decimal(18, 5)), N'519  7 STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1626, N'31023_ALTABEEF', CAST(37.37072 AS Decimal(18, 5)), CAST(-121.90574 AS Decimal(18, 5)), N'ROGERS AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1627, N'31023_ASSINIBOI', CAST(41.69972 AS Decimal(18, 5)), CAST(-93.04692 AS Decimal(18, 5)), N'600 - 1st AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1628, N'31023_BORDER', CAST(42.53418 AS Decimal(18, 5)), CAST(-71.19623 AS Decimal(18, 5)), N'#40 WHEATLAND CR ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1629, N'31023_GREENBELT', CAST(49.15567 AS Decimal(18, 5)), CAST(-121.95789 AS Decimal(18, 5)), N'8451 HARVARD PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1630, N'31023_PRAIRIESW', CAST(40.75348 AS Decimal(18, 5)), CAST(-73.88783 AS Decimal(18, 5)), N'#10, 4845 - 79 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1631, N'31023_SWINEHEAL', CAST(40.60555 AS Decimal(18, 5)), CAST(-74.00397 AS Decimal(18, 5)), N'Bay #2, 3655 - 18 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1632, N'31023_VETAG', CAST(28.15203 AS Decimal(18, 5)), CAST(-82.69563 AS Decimal(18, 5)), N'#201 - 151 EAST LAKE BLVD. N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1633, N'31023_WARMAN', CAST(40.87503 AS Decimal(18, 5)), CAST(-72.40049 AS Decimal(18, 5)), N'78 GREAT PLAINS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1634, N'31023_WARMAN_2', CAST(40.81419 AS Decimal(18, 5)), CAST(-73.99291 AS Decimal(18, 5)), N'226E WHEELER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1635, N'31024', CAST(46.59848 AS Decimal(18, 5)), CAST(-107.86510 AS Decimal(18, 5)), N'5615 RAILWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1636, N'31024_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1637, N'31025', CAST(37.20237 AS Decimal(18, 5)), CAST(-93.55057 AS Decimal(18, 5)), N'C/O IVS 807 - 45th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1638, N'31025_BEARCREEK', CAST(55.19661 AS Decimal(18, 5)), CAST(-118.78684 AS Decimal(18, 5)), N'C/O BEAR CREEK ANIMAL CLINIC 9708-128 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1639, N'31026', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'421012 HWY 792 5.5mi W LACOM. HWY12 9 mi N HWY 792', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1640, N'31028', CAST(40.75348 AS Decimal(18, 5)), CAST(-73.88783 AS Decimal(18, 5)), N'#10, 4845 - 79 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1641, N'31028_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC FACILITY 17611 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1642, N'31029', CAST(35.96031 AS Decimal(18, 5)), CAST(-78.69614 AS Decimal(18, 5)), N'103 - 143073 TR 192 EAST GUN CLUB ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1643, N'31030', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O URBAN CANDI APPAREL -PURO DEPOT 1006 - 2nd AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1644, N'31030_BUDDMOBIL', CAST(55.20108 AS Decimal(18, 5)), CAST(-119.42787 AS Decimal(18, 5)), N'c/o WEST COUNTY VETERINARY CLINIC 314 - 3rd AVE WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1645, N'31030_GRANDE', CAST(55.17083 AS Decimal(18, 5)), CAST(-118.80019 AS Decimal(18, 5)), N'C/O GRANDE PRAIRIE ANIMAL HOSPITAL 10126-100th AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1646, N'31031', CAST(51.23161 AS Decimal(18, 5)), CAST(-114.02250 AS Decimal(18, 5)), N'1-263090 RR 11 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1647, N'31032', CAST(40.47839 AS Decimal(18, 5)), CAST(-104.91848 AS Decimal(18, 5)), N'C/O WATER VALLEY HARDWARE STORE #1 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1648, N'31032_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1649, N'31033', CAST(37.37072 AS Decimal(18, 5)), CAST(-121.90574 AS Decimal(18, 5)), N'ROGERS AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1650, N'31033_BUS', CAST(49.69377 AS Decimal(18, 5)), CAST(-112.83972 AS Decimal(18, 5)), N'c/o GREYHOUND DEPOT LETHBRIDGE 411 5th STREET SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1651, N'31035', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O EVOLVED ENERGY 61 MICA LINK', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1652, N'31036', CAST(27.78119 AS Decimal(18, 5)), CAST(-82.68290 AS Decimal(18, 5)), N'3613 - 9th AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1653, N'31038_CENTERST', CAST(44.93403 AS Decimal(18, 5)), CAST(-68.64838 AS Decimal(18, 5)), N'238 CENTER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1654, N'31040', CAST(50.02513 AS Decimal(18, 5)), CAST(-113.58307 AS Decimal(18, 5)), N'C/O FLOWERS ON 49TH 122 - 49 AVE W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1655, N'31041', CAST(44.11487 AS Decimal(18, 5)), CAST(-103.07659 AS Decimal(18, 5)), N'124 51 Ave W Box 2649', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1656, N'31041_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'17611-109A AVE PICK UP AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1657, N'31044', CAST(52.30426 AS Decimal(18, 5)), CAST(-114.07509 AS Decimal(18, 5)), N'C/O PATHWAYS ANIMAL CLINIC #410, 3715 - 47th AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1658, N'31046', CAST(50.95161 AS Decimal(18, 5)), CAST(-114.00024 AS Decimal(18, 5)), N'136 - 11520 - 24 STREET SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1659, N'31054', CAST(50.90060 AS Decimal(18, 5)), CAST(-114.09452 AS Decimal(18, 5)), N'C/O BRIDLEWOOD VET CLINIC 17107 JAMES MCKEVITT ROAD SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1660, N'31055_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN BUS DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1661, N'31061', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O BELL STORE - HOLD FOR PICKUP 5004 - 50 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1662, N'31064_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1663, N'31065', CAST(50.57940 AS Decimal(18, 5)), CAST(-111.89744 AS Decimal(18, 5)), N'C/O NEWELL VET CLINIC 1103 - 2 STREET W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1664, N'31067', CAST(41.99528 AS Decimal(18, 5)), CAST(-88.25215 AS Decimal(18, 5)), N'144 PRIMROSE LANE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1665, N'31067_BUS', CAST(51.64035 AS Decimal(18, 5)), CAST(-111.94182 AS Decimal(18, 5)), N'c/o CANADA GREY MOTOR INN 616 - 2nd AVENUE WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1666, N'31068', CAST(40.75738 AS Decimal(18, 5)), CAST(-73.97888 AS Decimal(18, 5)), N'#6, 5207 - 48 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1667, N'31068_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1668, N'31077', CAST(53.55599 AS Decimal(18, 5)), CAST(-113.25739 AS Decimal(18, 5)), N'6053 SUNBROOK LANDING ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1669, N'31077_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1670, N'31080', CAST(32.57497 AS Decimal(18, 5)), CAST(-84.59363 AS Decimal(18, 5)), N'30519 HIGHWAY #22 BOX 340', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1671, N'31088', CAST(35.06908 AS Decimal(18, 5)), CAST(-77.35005 AS Decimal(18, 5)), N'1118 - 41 ST. NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1672, N'31088_BUS', CAST(39.75079 AS Decimal(18, 5)), CAST(-104.99101 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT KWT TERMINAL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1673, N'31088_CROWFOOT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'2.5  MILES SOUTH OF STANDARD ON HWY 840', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1674, N'31088_VANHUIGEN', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1675, N'31090', CAST(34.90913 AS Decimal(18, 5)), CAST(-85.48239 AS Decimal(18, 5)), N'12815 - 58 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1676, N'31090_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1677, N'31095', CAST(53.27282 AS Decimal(18, 5)), CAST(-113.54954 AS Decimal(18, 5)), N'C/O LEDUC ANIMAL CLINIC #1, 5901 - 50th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1678, N'31095_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1679, N'31099', CAST(35.05889 AS Decimal(18, 5)), CAST(-106.17246 AS Decimal(18, 5)), N'41217-5 RANGE ROAD 26 - 3 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1680, N'31100', CAST(34.55659 AS Decimal(18, 5)), CAST(-111.87973 AS Decimal(18, 5)), N'c/o U.F.A. (ACCESS ROAD) PO BOX 327', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1681, N'31103', CAST(39.64904 AS Decimal(18, 5)), CAST(-106.56994 AS Decimal(18, 5)), N'39 MISSION PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1682, N'31103_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1683, N'31103_STALBERT', CAST(44.06588 AS Decimal(18, 5)), CAST(-103.21810 AS Decimal(18, 5)), N'22 ST. ANNE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1684, N'31104', CAST(50.70628 AS Decimal(18, 5)), CAST(-113.88887 AS Decimal(18, 5)), N'370181 - 79 Street East ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1685, N'31104_CLARESHOL', CAST(35.57753 AS Decimal(18, 5)), CAST(-78.25441 AS Decimal(18, 5)), N'235 STARLINE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1686, N'31104_COUNTRY', CAST(44.12642 AS Decimal(18, 5)), CAST(-89.80811 AS Decimal(18, 5)), N'1171 BIGHORN AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1687, N'31104_LETHBRIDG', CAST(51.50772 AS Decimal(18, 5)), CAST(0.29007 AS Decimal(18, 5)), N'141 BROXBURN BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1688, N'31104_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC - HOLD FOR PICKUP ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1689, N'31108', CAST(45.77907 AS Decimal(18, 5)), CAST(-95.69992 AS Decimal(18, 5)), N'72 NORTH RAILWAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1690, N'31111', CAST(53.01011 AS Decimal(18, 5)), CAST(-112.80549 AS Decimal(18, 5)), N'3843A 44 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1691, N'31111_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O GREYHOUND BUS DEPOT 3911 - 48th Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1692, N'31111_PICKUP', CAST(13.03118 AS Decimal(18, 5)), CAST(80.16418 AS Decimal(18, 5)), N'PICK UP 17611 - 109a AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1693, N'31120', CAST(50.68904 AS Decimal(18, 5)), CAST(-114.22261 AS Decimal(18, 5)), N'RONA BLACK DIAMOND (PURO DEPOT) 601 - 1 AVE NE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1694, N'31120_ATS', CAST(38.48594 AS Decimal(18, 5)), CAST(-122.38667 AS Decimal(18, 5)), N'434250-128 street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1695, N'31128', CAST(52.25564 AS Decimal(18, 5)), CAST(-113.81477 AS Decimal(18, 5)), N'3450 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1696, N'31133', CAST(52.30756 AS Decimal(18, 5)), CAST(-113.81266 AS Decimal(18, 5)), N'17  7727 50  AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1697, N'31133_PEACERIVE', CAST(38.86197 AS Decimal(18, 5)), CAST(-88.23057 AS Decimal(18, 5)), N'7710-100 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1698, N'31137', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/0 EDM. NORTHLANDS CONTROL OFF 11433 - 79 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1699, N'31137_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC FACILITY HOLD AT WDDC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1700, N'31140', CAST(51.29865 AS Decimal(18, 5)), CAST(-113.99073 AS Decimal(18, 5)), N'201 - 151 EAST LAKE BLVD. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1701, N'31150', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O TAMMY CORBIELL 221003 RANGE ROAD 213', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1702, N'31155', CAST(40.72699 AS Decimal(18, 5)), CAST(-73.90151 AS Decimal(18, 5)), N'6415 - 55 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1703, N'31176', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'#38555 RANGE ROAD 21-0 STETTLER COUNTY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1704, N'31176_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT- HOLD PICKUP 4303 GAETZ AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1705, N'31176_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1706, N'31213', CAST(53.48605 AS Decimal(18, 5)), CAST(-113.17248 AS Decimal(18, 5)), N'52218 RANGE ROAD 223 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1707, N'31213_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1708, N'31295', CAST(50.73817 AS Decimal(18, 5)), CAST(-113.95927 AS Decimal(18, 5)), N'95 CRYSTAL SHORES CRESENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1709, N'31333', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1710, N'31341', CAST(45.38119 AS Decimal(18, 5)), CAST(6.01539 AS Decimal(18, 5)), N'38262 R.R. 13 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1711, N'31389', CAST(42.94608 AS Decimal(18, 5)), CAST(-87.85988 AS Decimal(18, 5)), N'53110 RR 25 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1712, N'31389_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1713, N'31449', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1714, N'31449_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC SEE #31449', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1715, N'31600', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Midfield Supply ( DHL Agent) 4808 - 37 Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1716, N'31601', CAST(40.47839 AS Decimal(18, 5)), CAST(-104.91848 AS Decimal(18, 5)), N'C/O WATER VALLEY HARDWARE STORE #1 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1717, N'31603', CAST(53.54532 AS Decimal(18, 5)), CAST(-113.49172 AS Decimal(18, 5)), N'BOX 1391 11112 - 103rd  AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1718, N'31605', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MEDICAL THERAPY GROUP BLDG  560 RECEIVING', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1719, N'31607', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o UFA 46 STREET & RAILWAY AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1720, N'31609', CAST(38.51825 AS Decimal(18, 5)), CAST(-121.43604 AS Decimal(18, 5)), N'5729 - 40th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1721, N'31610', CAST(51.19215 AS Decimal(18, 5)), CAST(-114.47369 AS Decimal(18, 5)), N'c/o Puro Agent Tremar Computer Solutions 612 1 Street W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1722, N'31610_MOORE', CAST(51.18578 AS Decimal(18, 5)), CAST(-113.99901 AS Decimal(18, 5)), N'C/O MOORE EQUINE VETERINARY SERVICE 260048A WRITING CREEK CRES.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1723, N'31611', CAST(39.07537 AS Decimal(18, 5)), CAST(-90.32302 AS Decimal(18, 5)), N'9420 - 109 street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1724, N'31612', CAST(55.21000 AS Decimal(18, 5)), CAST(-119.42742 AS Decimal(18, 5)), N'Dungarees  &  Doo Dads 209 10 th Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1725, N'31613', CAST(42.18428 AS Decimal(18, 5)), CAST(-91.92792 AS Decimal(18, 5)), N'5100 - 58 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1726, N'31622', CAST(53.50148 AS Decimal(18, 5)), CAST(-113.45391 AS Decimal(18, 5)), N'8403 CORONET ROAD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1727, N'31622_GP', CAST(55.17059 AS Decimal(18, 5)), CAST(-118.80091 AS Decimal(18, 5)), N'CFIA GRANDE PRAIRIE 10135 - 100th AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1728, N'31622_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICKUP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1729, N'31622_VERMILLIO', CAST(39.10826 AS Decimal(18, 5)), CAST(-88.02462 AS Decimal(18, 5)), N'5016 - 49 AVENUE UNIT B ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1730, N'31626', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O READY FAST FIX IT PURO HOLD P/U 100 MAIN STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1731, N'31626_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1732, N'31630', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HRIC - GA 32 3330 HOSPITAL DRIVE N.W.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1733, N'31633', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O OLDS COLLEGE - ANIMAL SCIENCE 4500 - 50TH STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1734, N'31635', CAST(56.24620 AS Decimal(18, 5)), CAST(-120.85016 AS Decimal(18, 5)), N'10135 - 100 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1735, N'31638', CAST(27.78114 AS Decimal(18, 5)), CAST(-82.68598 AS Decimal(18, 5)), N'3865 - 9TH AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1736, N'31648', CAST(51.09992 AS Decimal(18, 5)), CAST(-114.16495 AS Decimal(18, 5)), N'248 VARSITY ESTATES LINK N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1737, N'31648_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT - HOLD PICKUP 850 - 16th STREET LOWER LEVEL', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1738, N'31648_MORSAN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR P/U PUROLATOR DEPOT 4502 - 50th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1739, N'31667', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CONVERTED TO MEMBER ACCOUNT 31307 933 - 102 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1740, N'31684', CAST(33.97582 AS Decimal(18, 5)), CAST(-80.93229 AS Decimal(18, 5)), N'CANCELLED CANCELLED', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1741, N'31699', CAST(53.50739 AS Decimal(18, 5)), CAST(-113.99035 AS Decimal(18, 5)), N'1061 WESTERRA DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1742, N'31699_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1743, N'31902', CAST(53.36322 AS Decimal(18, 5)), CAST(-112.66659 AS Decimal(18, 5)), N'5008-46 AVENUE HWY 14 E C/O BEAVERHILL AUCT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1744, N'31902_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1745, N'31902_SMOKY', CAST(54.11456 AS Decimal(18, 5)), CAST(-112.47444 AS Decimal(18, 5)), N'C/O ALL RIG SERVICES 137 WHEATLAND AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1746, N'31930', CAST(42.35232 AS Decimal(18, 5)), CAST(-71.07724 AS Decimal(18, 5)), N'BAY C, 119 - 39105 HIGHWAY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1747, N'31930_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1748, N'31954', CAST(50.90060 AS Decimal(18, 5)), CAST(-114.09452 AS Decimal(18, 5)), N'C/O BRIDLEWOOD VET CLINIC 17107 JAMES MCKEVITT ROAD SOUTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1749, N'31961', CAST(33.39053 AS Decimal(18, 5)), CAST(-111.98305 AS Decimal(18, 5)), N'6102 D - 46th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1750, N'32000', CAST(50.91452 AS Decimal(18, 5)), CAST(-114.06338 AS Decimal(18, 5)), N'704 - 22 MIDLAKE BLVD SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1751, N'32001', CAST(42.62228 AS Decimal(18, 5)), CAST(-83.96895 AS Decimal(18, 5)), N'2550 HIGHLANDS ROAD WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1752, N'32002', CAST(50.96004 AS Decimal(18, 5)), CAST(-114.04511 AS Decimal(18, 5)), N'816 WILLOW PARK DRIVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1753, N'32002_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1754, N'32003', CAST(51.03597 AS Decimal(18, 5)), CAST(-114.16664 AS Decimal(18, 5)), N'#416 1919 SIROCCO DRIVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1755, N'32005', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O SUNDRE MUSEUM (Puro Depot) 211  1 ave sw', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1756, N'32005_SUNDRE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O FORGET ME NOT FLOWER PURO AGENT 200 MAIN AVENUE WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1757, N'32006', CAST(38.51882 AS Decimal(18, 5)), CAST(-89.99725 AS Decimal(18, 5)), N'210F 12 STREET A NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1758, N'32007', CAST(38.75298 AS Decimal(18, 5)), CAST(-90.06929 AS Decimal(18, 5)), N'5848 - 111 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1759, N'32007_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP ONLY AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1760, N'32008', CAST(38.76725 AS Decimal(18, 5)), CAST(-94.64713 AS Decimal(18, 5)), N'5232 - 199 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1761, N'32008_PICKUP', CAST(28.66325 AS Decimal(18, 5)), CAST(77.14205 AS Decimal(18, 5)), N'c/o WDDC 17611 - 190 A  AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1762, N'32009', CAST(33.52197 AS Decimal(18, 5)), CAST(-86.77269 AS Decimal(18, 5)), N'487 - 41st STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1763, N'32011', CAST(53.51070 AS Decimal(18, 5)), CAST(-113.32303 AS Decimal(18, 5)), N'185 ORDZE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1764, N'32012', CAST(52.31153 AS Decimal(18, 5)), CAST(-114.07251 AS Decimal(18, 5)), N'#101, 4 CUENDET INDUSTRIAL WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1765, N'32013', CAST(44.06588 AS Decimal(18, 5)), CAST(-103.21810 AS Decimal(18, 5)), N'22 ST ANNE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1766, N'32013_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1767, N'32014_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1768, N'32016_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1769, N'32017', CAST(50.98470 AS Decimal(18, 5)), CAST(-114.08258 AS Decimal(18, 5)), N'7738 ELBOW DRIVE  SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1770, N'32018', CAST(40.66688 AS Decimal(18, 5)), CAST(-73.72176 AS Decimal(18, 5)), N'79, 993 FIR STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1771, N'32018_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY WDDC FACILITY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1772, N'32019', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DHL DEPOT HOLD FOR PICKUP 10 - 1735 BRIER PARK ROAD N.W.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1773, N'32021', CAST(51.03245 AS Decimal(18, 5)), CAST(-114.07043 AS Decimal(18, 5)), N'C/O GORDON STITT ACCOUNTANT 325 - 23 AVENUE S.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1774, N'32023', CAST(42.44872 AS Decimal(18, 5)), CAST(-83.02193 AS Decimal(18, 5)), N'8215 - 102 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1775, N'32024', CAST(46.26161 AS Decimal(18, 5)), CAST(-98.09027 AS Decimal(18, 5)), N'4455 - 110 AVENUE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1776, N'32024_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1777, N'32026', CAST(37.88607 AS Decimal(18, 5)), CAST(-89.49315 AS Decimal(18, 5)), N'#7, 321 - 61 AVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1778, N'32028', CAST(53.55865 AS Decimal(18, 5)), CAST(-113.49162 AS Decimal(18, 5)), N'11051 97 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1779, N'32033', CAST(50.97306 AS Decimal(18, 5)), CAST(-114.09718 AS Decimal(18, 5)), N'C155, 1600 -  90  AVENUE  SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1780, N'32034', CAST(44.88298 AS Decimal(18, 5)), CAST(-93.16124 AS Decimal(18, 5)), N'2111 - 110 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1781, N'32035', CAST(42.91327 AS Decimal(18, 5)), CAST(-87.86056 AS Decimal(18, 5)), N'1802 - 10TH AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1782, N'32036', CAST(42.55353 AS Decimal(18, 5)), CAST(-88.00198 AS Decimal(18, 5)), N'8320-160th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1783, N'32037', CAST(31.74788 AS Decimal(18, 5)), CAST(-93.08262 AS Decimal(18, 5)), N'#140, 10233 ELBOW DR. SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1784, N'32039', CAST(53.61905 AS Decimal(18, 5)), CAST(-113.61162 AS Decimal(18, 5)), N'1005 TUDOR GLEN PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1785, N'32039_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1786, N'32039_STRATHCON', CAST(36.78947 AS Decimal(18, 5)), CAST(-89.37671 AS Decimal(18, 5)), N'8225 - 105 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1787, N'32041', CAST(45.50489 AS Decimal(18, 5)), CAST(-122.57838 AS Decimal(18, 5)), N'PO BOX 579 2468 - 213 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1788, N'32042', CAST(44.32300 AS Decimal(18, 5)), CAST(-93.95824 AS Decimal(18, 5)), N'#420, 3020 - 22 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1789, N'32043', CAST(51.09863 AS Decimal(18, 5)), CAST(-113.95580 AS Decimal(18, 5)), N'1091 FALCONRIDGE DRIVE N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1790, N'32044', CAST(38.95533 AS Decimal(18, 5)), CAST(-92.35282 AS Decimal(18, 5)), N'142 COLUMBIA BOULEVARD WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1791, N'32044_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP  411 - 5TH STREET SOUTH', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1792, N'32045', CAST(37.89809 AS Decimal(18, 5)), CAST(-122.49422 AS Decimal(18, 5)), N'#6 - 34 SOUTHRIDGE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1793, N'32045_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O CHUNG''S RESTAURANT 108 ELIZABETH STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1794, N'32046', CAST(50.00174 AS Decimal(18, 5)), CAST(-110.66690 AS Decimal(18, 5)), N'#9, 1224 STRACHAN ROAD S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1795, N'32046_MEDHAT', CAST(50.00772 AS Decimal(18, 5)), CAST(-110.73098 AS Decimal(18, 5)), N'3377 GERSHAW DRIVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1796, N'32047', CAST(35.27780 AS Decimal(18, 5)), CAST(-84.53668 AS Decimal(18, 5)), N'#123 CAMBRIA ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1797, N'32047_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1798, N'32048_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1799, N'32049', CAST(51.01564 AS Decimal(18, 5)), CAST(-114.21343 AS Decimal(18, 5)), N'#819, 10 DISCOVERY RIDGE HILL (SW) ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1800, N'32050', CAST(51.08498 AS Decimal(18, 5)), CAST(-113.95700 AS Decimal(18, 5)), N'110,  5401 TEMPLE DRIVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1801, N'32051', CAST(50.93861 AS Decimal(18, 5)), CAST(-114.08378 AS Decimal(18, 5)), N'1057 Canyon Meadows Drive SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1802, N'32052_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1803, N'32053', CAST(45.13814 AS Decimal(18, 5)), CAST(-95.13969 AS Decimal(18, 5)), N'7140 - 12 STREET  SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1804, N'32053_VANCOUVER', CAST(46.20577 AS Decimal(18, 5)), CAST(-119.14042 AS Decimal(18, 5)), N'1590 WEST 4TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1805, N'32055', CAST(51.05809 AS Decimal(18, 5)), CAST(-114.21796 AS Decimal(18, 5)), N'129 WENTWORTH POINT SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1806, N'32056', CAST(42.88601 AS Decimal(18, 5)), CAST(-85.85186 AS Decimal(18, 5)), N'6418 - 28 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1807, N'32056_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP  AT WDDC 17611 - 109A AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1808, N'32057_ALPINE', CAST(50.99679 AS Decimal(18, 5)), CAST(-114.06846 AS Decimal(18, 5)), N'#7, 321 - 61 AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1809, N'32058', CAST(42.40041 AS Decimal(18, 5)), CAST(-86.28120 AS Decimal(18, 5)), N'UNIT7, 102 ERIE STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1810, N'32058_CALGARYFD', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o D & T Squires 154 Hidden Hills Terrace', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1811, N'32058_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1812, N'32062', CAST(51.09169 AS Decimal(18, 5)), CAST(-114.24742 AS Decimal(18, 5)), N'#202, 11245 VALLEY RIDGE DR NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1813, N'32064', CAST(42.70152 AS Decimal(18, 5)), CAST(-91.87536 AS Decimal(18, 5)), N'14604 - 50th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1814, N'32064_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pick up at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1815, N'32065', CAST(44.80997 AS Decimal(18, 5)), CAST(-93.10037 AS Decimal(18, 5)), N'9640 149 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1816, N'32065_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1817, N'32068', CAST(41.71247 AS Decimal(18, 5)), CAST(-87.76141 AS Decimal(18, 5)), N'5620 - 99th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1818, N'32068_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1819, N'32069', CAST(50.99577 AS Decimal(18, 5)), CAST(-114.11920 AS Decimal(18, 5)), N'BAY 9, 6449 CROWCHILD TRAIL SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1820, N'32075', CAST(44.51761 AS Decimal(18, 5)), CAST(-88.01205 AS Decimal(18, 5)), N'BAY 300 2700 MAIN STREET S.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1821, N'32076', CAST(52.30651 AS Decimal(18, 5)), CAST(-113.81379 AS Decimal(18, 5)), N'7644 GAETZ AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1822, N'32077', CAST(53.42887 AS Decimal(18, 5)), CAST(-113.47846 AS Decimal(18, 5)), N'2943 ELLWOOD DRIVE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1823, N'32077_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1824, N'32078', CAST(30.09043 AS Decimal(18, 5)), CAST(-81.45864 AS Decimal(18, 5)), N'229 VALLEY RIDGE GREEN NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1825, N'32078_CANADANOR', CAST(68.30416 AS Decimal(18, 5)), CAST(-133.48277 AS Decimal(18, 5)), N'c/o INUVIK  AIRPORT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1826, N'32078_NORTHWIND', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'34 TUMA DRIVE BOX 1905', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1827, N'32079', CAST(41.60140 AS Decimal(18, 5)), CAST(-93.31829 AS Decimal(18, 5)), N'13550 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1828, N'32079_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1829, N'32081', CAST(47.37153 AS Decimal(18, 5)), CAST(-122.69475 AS Decimal(18, 5)), N'12419 118 AVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1830, N'32081_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1831, N'32083', CAST(35.17845 AS Decimal(18, 5)), CAST(-101.80085 AS Decimal(18, 5)), N'3207 - 34 AVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1832, N'32084', CAST(38.61459 AS Decimal(18, 5)), CAST(-90.09171 AS Decimal(18, 5)), N'#4, 840 KINGSWAY AVENUE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1833, N'32085', CAST(55.17889 AS Decimal(18, 5)), CAST(-118.79549 AS Decimal(18, 5)), N'107A, 10814 - 100 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1834, N'32086', CAST(50.02513 AS Decimal(18, 5)), CAST(-113.58307 AS Decimal(18, 5)), N'C/O PURO AGENT FLOWERS ON 49TH 122 - 49TH AVE WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1835, N'32088_LNELSON', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1836, N'32090', CAST(25.69082 AS Decimal(18, 5)), CAST(-80.40157 AS Decimal(18, 5)), N'8203 - 127 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1837, N'32090_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1838, N'32094', CAST(53.55122 AS Decimal(18, 5)), CAST(-113.53361 AS Decimal(18, 5)), N'12230 107 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1839, N'32094_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1840, N'32095', CAST(40.68428 AS Decimal(18, 5)), CAST(-73.80039 AS Decimal(18, 5)), N'11403 143 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1841, N'32095_HARASYM', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP BY CHRISSY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1842, N'32095_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'17611 109A Avenue NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1843, N'32096', CAST(29.85372 AS Decimal(18, 5)), CAST(-91.53404 AS Decimal(18, 5)), N'119 1 HEBERT ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1844, N'32096_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1845, N'32097', CAST(45.97575 AS Decimal(18, 5)), CAST(-94.11367 AS Decimal(18, 5)), N'10116 CENTENNIAL DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1846, N'32098', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1847, N'32099', CAST(56.72952 AS Decimal(18, 5)), CAST(-111.45056 AS Decimal(18, 5)), N'5, 608 SIGNAL ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1848, N'32099_DRS', CAST(56.72952 AS Decimal(18, 5)), CAST(-111.45056 AS Decimal(18, 5)), N'5, 608 SIGNAL ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1849, N'32101', CAST(53.54173 AS Decimal(18, 5)), CAST(-113.43263 AS Decimal(18, 5)), N'6710  101 AVENUE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1850, N'32101_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1851, N'32103', CAST(51.05275 AS Decimal(18, 5)), CAST(-114.12058 AS Decimal(18, 5)), N'2604B KENSINGTON ROAD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1852, N'32104', CAST(37.88963 AS Decimal(18, 5)), CAST(-88.99291 AS Decimal(18, 5)), N'8744 - 149 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1853, N'32104_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1854, N'32104_STRATHCON', CAST(53.51885 AS Decimal(18, 5)), CAST(-113.50014 AS Decimal(18, 5)), N'c/o STRATHCONA PRESCRIPTION 8225 - 105 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1855, N'32106', CAST(53.52895 AS Decimal(18, 5)), CAST(-113.28971 AS Decimal(18, 5)), N'LAWRENCE JARED (DVM) 304 101 GRANADA BLVD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1856, N'32112', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWY #3 East of Fort Macleod North on Meadowlark RD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1857, N'32112_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1858, N'32113', CAST(50.97333 AS Decimal(18, 5)), CAST(-114.07088 AS Decimal(18, 5)), N'8910 MACLEOD TRAIL S ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1859, N'32113_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1860, N'32114', CAST(50.00156 AS Decimal(18, 5)), CAST(-110.66649 AS Decimal(18, 5)), N'C/O RIDGE VETERINARY HOSPITAL #9, 1224 STRACHAN ROAD S.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1861, N'32115', CAST(48.29830 AS Decimal(18, 5)), CAST(-109.80328 AS Decimal(18, 5)), N'BOX 2 RR 8 SITE 23 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1862, N'32117', CAST(51.09824 AS Decimal(18, 5)), CAST(-113.96104 AS Decimal(18, 5)), N'126 55 CASTLERIDGE BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1863, N'32118', CAST(40.75221 AS Decimal(18, 5)), CAST(-80.78744 AS Decimal(18, 5)), N'10223 164 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1864, N'32118_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP ONLY AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1865, N'32119', CAST(32.15067 AS Decimal(18, 5)), CAST(-90.42172 AS Decimal(18, 5)), N'2308 PARSONS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1866, N'32119_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1867, N'32123', CAST(52.87270 AS Decimal(18, 5)), CAST(-118.07934 AS Decimal(18, 5)), N'6 STAN WRIGHT DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1868, N'32129', CAST(41.47071 AS Decimal(18, 5)), CAST(-90.55234 AS Decimal(18, 5)), N'3903 - 34TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1869, N'32137', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SHEWACHUK TINA (DVM) 6142 90 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1870, N'32139', CAST(34.72105 AS Decimal(18, 5)), CAST(-78.69017 AS Decimal(18, 5)), N'75 BURNEY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1871, N'32141', CAST(35.80255 AS Decimal(18, 5)), CAST(-81.14165 AS Decimal(18, 5)), N'5611 RIVERBEND ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1872, N'32141_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1873, N'32142', CAST(40.83552 AS Decimal(18, 5)), CAST(-74.35713 AS Decimal(18, 5)), N'16 BALSAM AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1874, N'32144', CAST(35.81507 AS Decimal(18, 5)), CAST(-93.78317 AS Decimal(18, 5)), N'4016 16 STREET SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1875, N'32146', CAST(51.07193 AS Decimal(18, 5)), CAST(-113.98259 AS Decimal(18, 5)), N'3660 20 AVENUE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1876, N'32150', CAST(51.10477 AS Decimal(18, 5)), CAST(-114.18802 AS Decimal(18, 5)), N'5720 SILVERSPRINGS BLVD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1877, N'32151', CAST(50.90655 AS Decimal(18, 5)), CAST(-114.06540 AS Decimal(18, 5)), N'144, 70 SHAWVILLE BLVD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1878, N'32152', CAST(33.51281 AS Decimal(18, 5)), CAST(-112.16876 AS Decimal(18, 5)), N'5208 - 51 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1879, N'32153', CAST(53.26455 AS Decimal(18, 5)), CAST(-113.55546 AS Decimal(18, 5)), N'UPS STORE 5101 - 50TH AVE SUITE # 717', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1880, N'32153_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1881, N'32154', CAST(50.90586 AS Decimal(18, 5)), CAST(-114.04824 AS Decimal(18, 5)), N'35 SUNMILLS DRIVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1882, N'32155', CAST(53.58037 AS Decimal(18, 5)), CAST(-113.49139 AS Decimal(18, 5)), N'12429  97 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1883, N'32155_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1884, N'32156', CAST(50.91342 AS Decimal(18, 5)), CAST(-113.94924 AS Decimal(18, 5)), N'115, 15566 McIVOR BLVD. S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1885, N'32157', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1886, N'32157_DRALLAM', CAST(53.49914 AS Decimal(18, 5)), CAST(-113.61309 AS Decimal(18, 5)), N'#95 WAHSTAO CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1887, N'32157_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1888, N'32160', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'o/a CAMPBELL VET SERVICES LTD. FOR PICKUP ONLY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1889, N'32162', CAST(39.03922 AS Decimal(18, 5)), CAST(-83.05289 AS Decimal(18, 5)), N'6003 104 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1890, N'32163', CAST(52.28996 AS Decimal(18, 5)), CAST(-113.83871 AS Decimal(18, 5)), N'105, 6730 TAYLOR DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1891, N'32164', CAST(50.96706 AS Decimal(18, 5)), CAST(-114.07355 AS Decimal(18, 5)), N'415 - 9737 MACLEOD TRAIL S.W ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1892, N'32165', CAST(38.15871 AS Decimal(18, 5)), CAST(-98.23537 AS Decimal(18, 5)), N'17248 - 95 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1893, N'32165_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICKUP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1894, N'32167', CAST(42.56116 AS Decimal(18, 5)), CAST(-83.29830 AS Decimal(18, 5)), N'1502 LAKEWOOD ROAD WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1895, N'32167_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICKUP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1896, N'32167_STRATHCON', CAST(36.78947 AS Decimal(18, 5)), CAST(-89.37671 AS Decimal(18, 5)), N'8225 - 105 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1897, N'32168', CAST(50.90060 AS Decimal(18, 5)), CAST(-114.09452 AS Decimal(18, 5)), N'26 17107 JAMES MCKEVITT RD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1898, N'32169', CAST(56.66040 AS Decimal(18, 5)), CAST(-111.32961 AS Decimal(18, 5)), N'155 MACALPINE CRES ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1899, N'32170', CAST(51.05239 AS Decimal(18, 5)), CAST(-114.09534 AS Decimal(18, 5)), N'1609A  KENSINGTON ROAD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1900, N'32174', CAST(42.57849 AS Decimal(18, 5)), CAST(-87.87278 AS Decimal(18, 5)), N'6212 - 54 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1901, N'32175', CAST(46.85488 AS Decimal(18, 5)), CAST(-96.84434 AS Decimal(18, 5)), N'3871 - 17th AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1902, N'32176', CAST(-33.72652 AS Decimal(18, 5)), CAST(150.95391 AS Decimal(18, 5)), N'21 FAIRWAY DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1903, N'32176_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC WAREHOUSE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1904, N'32178', CAST(50.97011 AS Decimal(18, 5)), CAST(-114.13060 AS Decimal(18, 5)), N'#12, 3109 PALLISER DRIVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1905, N'32179', CAST(50.94147 AS Decimal(18, 5)), CAST(-114.06872 AS Decimal(18, 5)), N'# 607 12445 LAKE FRASER DRIVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1906, N'32180', CAST(50.94037 AS Decimal(18, 5)), CAST(-114.12028 AS Decimal(18, 5)), N'202 - 2525 WOODVIEW DRIVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1907, N'32181_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP AT WDDC ONLY BY CLINIC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1908, N'32182', CAST(42.09555 AS Decimal(18, 5)), CAST(-90.83973 AS Decimal(18, 5)), N'7171 - 50 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1909, N'32184', CAST(42.35078 AS Decimal(18, 5)), CAST(-85.24124 AS Decimal(18, 5)), N'101 BROADWAY BLVD. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1910, N'32187', CAST(49.07468 AS Decimal(18, 5)), CAST(-122.81644 AS Decimal(18, 5)), N'14735 - 40 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1911, N'32187_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1912, N'32187_TSHERRIFF', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1913, N'32188', CAST(41.52652 AS Decimal(18, 5)), CAST(-73.20281 AS Decimal(18, 5)), N'705 MAIN STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1914, N'32189', CAST(40.07408 AS Decimal(18, 5)), CAST(-82.60505 AS Decimal(18, 5)), N'921  37 STREET  SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1915, N'32191', CAST(51.11602 AS Decimal(18, 5)), CAST(-114.20436 AS Decimal(18, 5)), N'126  8060 SILVER SPRINGS BLVD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1916, N'32192', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DEVRIES MIKE (DVM) # 113, 4707 - 49 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1917, N'32193', CAST(47.71120 AS Decimal(18, 5)), CAST(-122.19991 AS Decimal(18, 5)), N'10544 - 124 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1918, N'32194', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'UNIT#58, 96 CAMPSITE ROAD (IN WALMART PARKING LOT)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1919, N'32195', CAST(51.19329 AS Decimal(18, 5)), CAST(-114.48974 AS Decimal(18, 5)), N'7 - 57 WEST AARSBY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1920, N'32196', CAST(53.38623 AS Decimal(18, 5)), CAST(-113.00102 AS Decimal(18, 5)), N'c/o WEST WIND VET HOSPITAL 51136 RR 212', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1921, N'32196_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1922, N'32197', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1923, N'32197_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1924, N'32198', CAST(36.84567 AS Decimal(18, 5)), CAST(-77.28744 AS Decimal(18, 5)), N'20123 - 56 Ave (home) ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1925, N'32198_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1926, N'32199_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1927, N'32200', CAST(51.29242 AS Decimal(18, 5)), CAST(-114.02410 AS Decimal(18, 5)), N'1105, 35 MACKENZIE WAY SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1928, N'32201', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1929, N'32201_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY PICK UP ONLY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1930, N'32202', CAST(53.42978 AS Decimal(18, 5)), CAST(-113.51579 AS Decimal(18, 5)), N'#8 BLACKBURN DRIVE, WEST SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1931, N'32202_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1932, N'32203', CAST(42.09285 AS Decimal(18, 5)), CAST(-90.79832 AS Decimal(18, 5)), N'7510-82 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1933, N'32206', CAST(50.87758 AS Decimal(18, 5)), CAST(-114.03576 AS Decimal(18, 5)), N'#220,  803 CHAPARRAL DRIVE S.E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1934, N'32207', CAST(40.75738 AS Decimal(18, 5)), CAST(-73.97888 AS Decimal(18, 5)), N'#6, 5207 - 48 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1935, N'32207_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1936, N'32208', CAST(53.59637 AS Decimal(18, 5)), CAST(-113.41433 AS Decimal(18, 5)), N'13680 - 50TH STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1937, N'32209', CAST(51.10797 AS Decimal(18, 5)), CAST(-114.06271 AS Decimal(18, 5)), N'#15  6219 CENTRE STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1938, N'32212', CAST(40.61705 AS Decimal(18, 5)), CAST(-79.32191 AS Decimal(18, 5)), N'5025 PARKWOOD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1939, N'32213', CAST(43.05789 AS Decimal(18, 5)), CAST(-85.93076 AS Decimal(18, 5)), N'#101-144 CRESENT ROAD W ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1940, N'32214', CAST(41.64467 AS Decimal(18, 5)), CAST(-93.48002 AS Decimal(18, 5)), N'# 5, 1301 - 8TH STREET  SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1941, N'32215', CAST(42.86905 AS Decimal(18, 5)), CAST(-85.57797 AS Decimal(18, 5)), N'#3563 - 52ND STREET SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1942, N'32216', CAST(53.41505 AS Decimal(18, 5)), CAST(-113.47917 AS Decimal(18, 5)), N'4351 SAVARYN DRIVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1943, N'32216_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1944, N'32217', CAST(40.95258 AS Decimal(18, 5)), CAST(-72.95175 AS Decimal(18, 5)), N'7 MAHOGANY PLAZA SE UNIT 1440', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1945, N'32218', CAST(46.25914 AS Decimal(18, 5)), CAST(-99.55604 AS Decimal(18, 5)), N'728,  13 STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1946, N'32219', CAST(50.96177 AS Decimal(18, 5)), CAST(-114.05923 AS Decimal(18, 5)), N'9945 FAIRMOUNT DRIVE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1947, N'32221', CAST(29.03272 AS Decimal(18, 5)), CAST(-82.07164 AS Decimal(18, 5)), N'#210, 4600 - 130th AVENUE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1948, N'32222', CAST(34.03382 AS Decimal(18, 5)), CAST(-118.28088 AS Decimal(18, 5)), N'2201 PORTLAND STREET S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1949, N'32223', CAST(36.25565 AS Decimal(18, 5)), CAST(-119.71017 AS Decimal(18, 5)), N'14020 - 23rd AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1950, N'32223_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP @ WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1951, N'32224', CAST(40.64636 AS Decimal(18, 5)), CAST(-74.01308 AS Decimal(18, 5)), N'#34, 5010 - 4th STREET N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1952, N'32224_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1953, N'32225', CAST(53.48000 AS Decimal(18, 5)), CAST(-113.50349 AS Decimal(18, 5)), N'#110  4211 - 106 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1954, N'32225_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'HOLD FOR PICK UP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1955, N'32226', CAST(36.71169 AS Decimal(18, 5)), CAST(-107.97690 AS Decimal(18, 5)), N'#3, 210 BROADWAY AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1956, N'32227', CAST(56.73250 AS Decimal(18, 5)), CAST(-111.46322 AS Decimal(18, 5)), N'14 - 100 REAL MARTIN DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1957, N'32227_BYLAW', CAST(56.73250 AS Decimal(18, 5)), CAST(-111.46322 AS Decimal(18, 5)), N'14 - 100 REAL MARTIN DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1958, N'32227_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1959, N'32229', CAST(42.24729 AS Decimal(18, 5)), CAST(-87.84386 AS Decimal(18, 5)), N'HIGH COUNTRY DRIVE NW BAY 404', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1960, N'32230', CAST(44.19903 AS Decimal(18, 5)), CAST(-88.65128 AS Decimal(18, 5)), N'UNIT #2 5030 HWY #2A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1961, N'32231', CAST(53.66984 AS Decimal(18, 5)), CAST(-113.63749 AS Decimal(18, 5)), N'#105 975 ST. ALBERT TRAIL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1962, N'32232', CAST(41.57267 AS Decimal(18, 5)), CAST(-87.81663 AS Decimal(18, 5)), N'8232 - 175 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1963, N'32232_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1964, N'32233', CAST(51.03482 AS Decimal(18, 5)), CAST(-114.04205 AS Decimal(18, 5)), N'2012 SPILLER ROAD SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1965, N'32234', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1966, N'32235', CAST(39.56726 AS Decimal(18, 5)), CAST(-76.36075 AS Decimal(18, 5)), N'BLUE SIGN 38131 RR 19-3', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1967, N'32236', CAST(50.88129 AS Decimal(18, 5)), CAST(-114.08150 AS Decimal(18, 5)), N'293 SILVERADO WAY SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1968, N'32237', CAST(53.42495 AS Decimal(18, 5)), CAST(-113.44577 AS Decimal(18, 5)), N'6941 ELLERSLIE ROAD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1969, N'32237_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1970, N'32238', CAST(53.59974 AS Decimal(18, 5)), CAST(-113.39554 AS Decimal(18, 5)), N'C/O MEDI DRUGS #3 3504A - 137 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1971, N'32238_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC  (HOLD FOR PICK UP) 17611 - 106 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1972, N'32239', CAST(50.03331 AS Decimal(18, 5)), CAST(-110.55226 AS Decimal(18, 5)), N'12328 HWY 41 CYPRESS COUNTRY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1973, N'32240', CAST(51.07021 AS Decimal(18, 5)), CAST(-114.11671 AS Decimal(18, 5)), N'2116 CROWCHILD TRAIL N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1974, N'32241', CAST(50.99577 AS Decimal(18, 5)), CAST(-114.11920 AS Decimal(18, 5)), N'BAY 9 6449 CROWCHILD TRAIL SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1975, N'32242', CAST(43.61899 AS Decimal(18, 5)), CAST(-83.90390 AS Decimal(18, 5)), N'BAY 116- 65 SAGE HILL PLAZA ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1976, N'32243', CAST(51.08896 AS Decimal(18, 5)), CAST(-114.20117 AS Decimal(18, 5)), N'7930 BOWNESS ROAD NW BAY 18', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1977, N'32245', CAST(40.63160 AS Decimal(18, 5)), CAST(-74.12067 AS Decimal(18, 5)), N'ELIZABETH STREET 98 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1978, N'32247', CAST(51.79065 AS Decimal(18, 5)), CAST(-114.09463 AS Decimal(18, 5)), N'C/O OLDS COLLEGE 4500 - 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1979, N'32247_FMSPCA', CAST(56.66022 AS Decimal(18, 5)), CAST(-111.32957 AS Decimal(18, 5)), N'C/O FORT MCMURRAY SPCA 155 MACALPINE CRES', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1980, N'32247_PICKUP', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 109A Ave ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1981, N'32250', CAST(32.91676 AS Decimal(18, 5)), CAST(-96.94944 AS Decimal(18, 5)), N'#8, 7750 RANCHVIEW DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1982, N'32256', CAST(51.28614 AS Decimal(18, 5)), CAST(-114.42694 AS Decimal(18, 5)), N'271011 RANGE ROAD 40 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1983, N'32256_BUS', CAST(29.74812 AS Decimal(18, 5)), CAST(-95.37134 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1984, N'32264', CAST(51.02085 AS Decimal(18, 5)), CAST(-114.14343 AS Decimal(18, 5)), N'8, 3919 RICHMOND ROAD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1985, N'32265', CAST(40.00007 AS Decimal(18, 5)), CAST(-105.28572 AS Decimal(18, 5)), N'#50 - 665 BASELINE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1986, N'32265_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICKUP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1987, N'32266', CAST(55.18583 AS Decimal(18, 5)), CAST(-118.76861 AS Decimal(18, 5)), N'UNIT 101, 9151 CRYSTAL LAKE DR ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1988, N'32266_STRATHCON', CAST(36.78947 AS Decimal(18, 5)), CAST(-89.37671 AS Decimal(18, 5)), N'8225 - 105 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1989, N'32267', CAST(33.50915 AS Decimal(18, 5)), CAST(-86.79616 AS Decimal(18, 5)), N'2303 - 6TH AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1990, N'32270', CAST(48.14452 AS Decimal(18, 5)), CAST(-103.62573 AS Decimal(18, 5)), N'118 - 2nd AVENUE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1991, N'32275', CAST(53.54938 AS Decimal(18, 5)), CAST(-113.51191 AS Decimal(18, 5)), N'10575 - 111TH STREET N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1992, N'32275_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1993, N'32277', CAST(53.46213 AS Decimal(18, 5)), CAST(-113.50315 AS Decimal(18, 5)), N'3016A - 106 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1994, N'32277_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1995, N'32283', CAST(50.95322 AS Decimal(18, 5)), CAST(-114.11650 AS Decimal(18, 5)), N'15, 11440 BRAESIDE DRIVE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1996, N'32284', CAST(45.27266 AS Decimal(18, 5)), CAST(-93.15234 AS Decimal(18, 5)), N'5227 - 167 AVENUE N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1997, N'32284_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1998, N'32285', CAST(51.08247 AS Decimal(18, 5)), CAST(-114.09567 AS Decimal(18, 5)), N'765 NORTH MOUNT DRIVE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (1999, N'32286', CAST(51.16537 AS Decimal(18, 5)), CAST(-114.12906 AS Decimal(18, 5)), N'#27, 12424 SYMONS VALLEY ROAD N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2000, N'32288', CAST(44.89017 AS Decimal(18, 5)), CAST(-97.13208 AS Decimal(18, 5)), N'1016  9 AVENUE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2001, N'32300', CAST(51.07507 AS Decimal(18, 5)), CAST(-114.16760 AS Decimal(18, 5)), N'5111 BOWNESS ROAD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2002, N'32301_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'HOLD FOR PICK UP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2003, N'32302', CAST(51.12384 AS Decimal(18, 5)), CAST(-114.24866 AS Decimal(18, 5)), N'1058, 11300 TUSCANY BLVD. N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2004, N'32303', CAST(51.03987 AS Decimal(18, 5)), CAST(-114.20778 AS Decimal(18, 5)), N'UNIT#103, 333 ASPEN GLEN LANDG. SW. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2005, N'32303_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611 - 109a AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2006, N'32304', CAST(51.12703 AS Decimal(18, 5)), CAST(-114.05594 AS Decimal(18, 5)), N'BAY #5  176 BEDFORD DRIVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2007, N'32306', CAST(38.76724 AS Decimal(18, 5)), CAST(-94.65495 AS Decimal(18, 5)), N'6023 - 199 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2008, N'32307', CAST(43.02123 AS Decimal(18, 5)), CAST(-88.01896 AS Decimal(18, 5)), N'#307, 917 - 85th STREET S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2009, N'32308', CAST(51.03337 AS Decimal(18, 5)), CAST(-114.11738 AS Decimal(18, 5)), N'BAY 1, 2308 - 24th STREET S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2010, N'32309', CAST(53.60731 AS Decimal(18, 5)), CAST(-113.46796 AS Decimal(18, 5)), N'8204 - 144 AVE  NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2011, N'32310', CAST(50.88027 AS Decimal(18, 5)), CAST(-113.97723 AS Decimal(18, 5)), N'#4020, 356 CRANSTON ROAD SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2012, N'32310_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pickup at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2013, N'32311', CAST(50.87856 AS Decimal(18, 5)), CAST(-114.07243 AS Decimal(18, 5)), N'#318   19369 SHERIFF KING STREET SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2014, N'32313', CAST(31.27876 AS Decimal(18, 5)), CAST(-92.49998 AS Decimal(18, 5)), N'5138 WINDERMERE BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2015, N'32313_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC 17611 - 109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2016, N'32314', CAST(33.55286 AS Decimal(18, 5)), CAST(-101.92602 AS Decimal(18, 5)), N'5314 - 46th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2017, N'32315', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY 17611 - 109A Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2018, N'32316', CAST(40.83458 AS Decimal(18, 5)), CAST(-96.62746 AS Decimal(18, 5)), N'917 2220 - 68 STREET NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2019, N'32317', CAST(41.83300 AS Decimal(18, 5)), CAST(-87.74730 AS Decimal(18, 5)), N'4704 - 50TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2020, N'32317_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC 17611 109A AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2021, N'32318', CAST(44.12512 AS Decimal(18, 5)), CAST(-102.70886 AS Decimal(18, 5)), N'12764 - 167 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2022, N'32318_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'HOLD FOR PICK UP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2023, N'32319', CAST(51.00156 AS Decimal(18, 5)), CAST(-114.06963 AS Decimal(18, 5)), N'107, 358 - 58th AVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2024, N'32320', CAST(29.67189 AS Decimal(18, 5)), CAST(-98.10001 AS Decimal(18, 5)), N'#203   105 SOUTHBANK BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2025, N'32321', CAST(42.49016 AS Decimal(18, 5)), CAST(-83.14909 AS Decimal(18, 5)), N'108 - 500 ROYAL OAK DRIVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2026, N'32322', CAST(53.53199 AS Decimal(18, 5)), CAST(-113.59163 AS Decimal(18, 5)), N'15614 - 95 AVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2027, N'32323', CAST(53.51410 AS Decimal(18, 5)), CAST(-113.67687 AS Decimal(18, 5)), N'23 LEWIS ESTATES BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2028, N'32323_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2029, N'32324', CAST(38.95867 AS Decimal(18, 5)), CAST(-92.72073 AS Decimal(18, 5)), N'18924 - 87 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2030, N'32324_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2031, N'32325', CAST(50.90627 AS Decimal(18, 5)), CAST(-114.11097 AS Decimal(18, 5)), N'UNIT 511  2335 - 162 AVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2032, N'32326', CAST(29.16305 AS Decimal(18, 5)), CAST(-82.17799 AS Decimal(18, 5)), N'2, 3315 - 26 AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2033, N'32327', CAST(42.31483 AS Decimal(18, 5)), CAST(-83.08005 AS Decimal(18, 5)), N'318 24 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2034, N'32328', CAST(50.91409 AS Decimal(18, 5)), CAST(-114.07143 AS Decimal(18, 5)), N'3125 - 150 MILLRISE BLVD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2035, N'32329', CAST(50.57681 AS Decimal(18, 5)), CAST(-113.88470 AS Decimal(18, 5)), N'820 MACLEOD TRAIL SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2036, N'32330', CAST(53.43443 AS Decimal(18, 5)), CAST(-113.57141 AS Decimal(18, 5)), N'5120 MULLEN ROAD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2037, N'32331', CAST(53.54318 AS Decimal(18, 5)), CAST(-113.56607 AS Decimal(18, 5)), N'10214 - 142 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2038, N'32331_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2039, N'32332', CAST(53.58673 AS Decimal(18, 5)), CAST(-113.49147 AS Decimal(18, 5)), N'12831 - 97 Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2040, N'32332_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pickup at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2041, N'32333', CAST(48.59738 AS Decimal(18, 5)), CAST(-119.60682 AS Decimal(18, 5)), N'#450, 412 PINE CREEK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2042, N'32334', CAST(51.05171 AS Decimal(18, 5)), CAST(-113.81439 AS Decimal(18, 5)), N'#34, 140 EAST CHESTERMERE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2043, N'32335', CAST(37.78718 AS Decimal(18, 5)), CAST(-122.40362 AS Decimal(18, 5)), N'BAY 4  4209 - 3RD STREET E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2044, N'32336', CAST(53.65637 AS Decimal(18, 5)), CAST(-113.62898 AS Decimal(18, 5)), N'#360, 665 ST. ALBERT TRAIL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2045, N'32336_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'C/O WDDC 17611 - 109A Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2046, N'32337', CAST(46.54391 AS Decimal(18, 5)), CAST(-94.37190 AS Decimal(18, 5)), N'11464 - 17 AVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2047, N'32337_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2048, N'32338', CAST(53.61455 AS Decimal(18, 5)), CAST(-113.54258 AS Decimal(18, 5)), N'AWADIN WESAM (DVM) 15154 - 127 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2049, N'32338_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2050, N'32339', CAST(51.29020 AS Decimal(18, 5)), CAST(-113.99857 AS Decimal(18, 5)), N'C/O AIRDRIE ANIMAL CLINIC 101 - 117 EAST LAKE CRES. NE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2051, N'32340', CAST(51.10851 AS Decimal(18, 5)), CAST(-113.96981 AS Decimal(18, 5)), N'319 - 3690 WESTWINDS DRIVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2052, N'32341', CAST(48.25418 AS Decimal(18, 5)), CAST(-101.29651 AS Decimal(18, 5)), N'220 - 19TH AVENUE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2053, N'32342', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WHITTAKER PATRICK (DVM) 1117 WINDERMERE WAY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2054, N'32342_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WHITTAKER PATRICK (DVM) WDDC FACILITY - HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2055, N'32343', CAST(51.16796 AS Decimal(18, 5)), CAST(-114.09126 AS Decimal(18, 5)), N'410,  1110 PANATELLA BOULEVARD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2056, N'32344', CAST(53.50733 AS Decimal(18, 5)), CAST(-113.68606 AS Decimal(18, 5)), N'7183 WINTERBURN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2057, N'32344_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2058, N'32346', CAST(53.61933 AS Decimal(18, 5)), CAST(-113.49001 AS Decimal(18, 5)), N'15825 - 97 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2059, N'32347', CAST(51.17213 AS Decimal(18, 5)), CAST(-114.15799 AS Decimal(18, 5)), N'102, 8 NOLAN HILL BLVD NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2060, N'32348', CAST(34.10317 AS Decimal(18, 5)), CAST(-84.81847 AS Decimal(18, 5)), N'UNIT 20, 10 RIDGEMONT WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2061, N'32348_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLDFOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2062, N'32349', CAST(51.30050 AS Decimal(18, 5)), CAST(-114.02361 AS Decimal(18, 5)), N'#305, 800 VETERANS BLVD. N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2063, N'32350', CAST(48.28270 AS Decimal(18, 5)), CAST(-99.99888 AS Decimal(18, 5)), N'UNIT#109,  6002 - 29 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2064, N'32350_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2065, N'32351', CAST(40.44551 AS Decimal(18, 5)), CAST(-79.97364 AS Decimal(18, 5)), N'2309 CENTRE AVE E ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2066, N'32352', CAST(42.55741 AS Decimal(18, 5)), CAST(-87.98165 AS Decimal(18, 5)), N'8204 - 144 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2067, N'32353', CAST(42.35908 AS Decimal(18, 5)), CAST(-71.33234 AS Decimal(18, 5)), N'#120, 16 WESTWAY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2068, N'32354', CAST(53.59746 AS Decimal(18, 5)), CAST(-113.49338 AS Decimal(18, 5)), N'13540 - 97 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2069, N'32354_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2070, N'32355', CAST(39.82986 AS Decimal(18, 5)), CAST(-104.92832 AS Decimal(18, 5)), N'5060-74 Ave SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2071, N'32356', CAST(40.92319 AS Decimal(18, 5)), CAST(-98.58865 AS Decimal(18, 5)), N'635 - 36 AVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2072, N'32356_ATS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Dennis C. Relf Bay 49, 5353 72nd Ave SE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2073, N'32356_PHARM', CAST(40.92319 AS Decimal(18, 5)), CAST(-98.58865 AS Decimal(18, 5)), N'635 - 36 AVE NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2074, N'32357', CAST(53.66962 AS Decimal(18, 5)), CAST(-113.63619 AS Decimal(18, 5)), N'105, 975 ST ALBERT TRAIL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2075, N'32358', CAST(36.82404 AS Decimal(18, 5)), CAST(-76.30946 AS Decimal(18, 5)), N'51 LIBERTON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2076, N'32358_KILLARNEY', CAST(29.16305 AS Decimal(18, 5)), CAST(-82.17799 AS Decimal(18, 5)), N'2, 3315 - 26 AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2077, N'32358_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pickup at wddc ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2078, N'32359', CAST(32.30788 AS Decimal(18, 5)), CAST(-99.78182 AS Decimal(18, 5)), N'102 SOUTHFORK DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2079, N'32360', CAST(51.17469 AS Decimal(18, 5)), CAST(-114.10833 AS Decimal(18, 5)), N'2024 2060 SYMONS VALLEY PARKWAY NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2080, N'32361', CAST(51.07095 AS Decimal(18, 5)), CAST(-113.94333 AS Decimal(18, 5)), N'6208 RUNDLEHORN DR. NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2081, N'32362', CAST(37.76441 AS Decimal(18, 5)), CAST(-122.40874 AS Decimal(18, 5)), N'2531 - 17 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2082, N'32362_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2083, N'32363', CAST(40.60533 AS Decimal(18, 5)), CAST(-76.12681 AS Decimal(18, 5)), N'#334, 100 AUBURN MEADOW DRIVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2084, N'32364', CAST(33.86626 AS Decimal(18, 5)), CAST(-84.83420 AS Decimal(18, 5)), N'2308 PARSON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2085, N'32366', CAST(44.16719 AS Decimal(18, 5)), CAST(-93.39912 AS Decimal(18, 5)), N'13667 - 66 STREET N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2086, N'32366_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICK UP WDDC FACILITY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2087, N'32377', CAST(40.74544 AS Decimal(18, 5)), CAST(-73.88835 AS Decimal(18, 5)), N'4505 - 77 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2088, N'32382', CAST(33.50410 AS Decimal(18, 5)), CAST(-101.94352 AS Decimal(18, 5)), N'3823 - 99 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2089, N'32382_PICKUP', CAST(37.68573 AS Decimal(18, 5)), CAST(-97.33255 AS Decimal(18, 5)), N'WDDC ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2090, N'32387', CAST(53.61637 AS Decimal(18, 5)), CAST(-113.51554 AS Decimal(18, 5)), N'15387 CASTLEDOWNS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2091, N'32387_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2092, N'32393', CAST(42.30762 AS Decimal(18, 5)), CAST(-71.12236 AS Decimal(18, 5)), N'#3, 938 CENTRE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2093, N'32409', CAST(42.98270 AS Decimal(18, 5)), CAST(-87.93893 AS Decimal(18, 5)), N'3409 - 20th STREET S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2094, N'32411', CAST(51.05028 AS Decimal(18, 5)), CAST(-113.82693 AS Decimal(18, 5)), N'#211, 175 CHESTERMERE STATION WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2095, N'32420', CAST(42.50110 AS Decimal(18, 5)), CAST(-96.43094 AS Decimal(18, 5)), N'4, 420 ALLAN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2096, N'32448', CAST(28.15105 AS Decimal(18, 5)), CAST(-82.69554 AS Decimal(18, 5)), N'101 - 117 EAST LAKE CRESENT N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2097, N'32518', CAST(53.50273 AS Decimal(18, 5)), CAST(-113.62803 AS Decimal(18, 5)), N'518, 6655 - 178 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2098, N'32518_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2099, N'32550', CAST(50.91580 AS Decimal(18, 5)), CAST(-114.06731 AS Decimal(18, 5)), N'15311 BANNISTER ROAD SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2100, N'32566', CAST(33.43338 AS Decimal(18, 5)), CAST(-101.70520 AS Decimal(18, 5)), N'7514 - 178 ST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2101, N'32595', CAST(51.14775 AS Decimal(18, 5)), CAST(-114.25509 AS Decimal(18, 5)), N'UNIT 2010, 11595 ROCKYVALLEY DR NW. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2102, N'32603', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PURO AGENT NANTON DRUG IDAACY 2212 - 20th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2103, N'32607', CAST(29.66109 AS Decimal(18, 5)), CAST(-82.32618 AS Decimal(18, 5)), N'138 - 10 AVENUE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2104, N'32612_ACADIA', CAST(50.96004 AS Decimal(18, 5)), CAST(-114.04511 AS Decimal(18, 5)), N'816 WILLOW PARK DRIVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2105, N'32612_YELLOWH', CAST(53.53877 AS Decimal(18, 5)), CAST(-113.97772 AS Decimal(18, 5)), N'C/O YELLOWHEAD VETERINARY CLINIC 300, 4305 SOUTH PARK DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2106, N'32613', CAST(53.56797 AS Decimal(18, 5)), CAST(-113.50622 AS Decimal(18, 5)), N'11762 - 106 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2107, N'32624', CAST(44.12279 AS Decimal(18, 5)), CAST(-92.67137 AS Decimal(18, 5)), N'11555 - 85TH STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2108, N'32626', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O STIEG & ASSOCIATES - PAT H #220, 3132 - 26 STREET N.E.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2109, N'32629', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'C/O UNIV. OF LETHBRIDGE -CCBN BLDG. 4401 UNIVERSITY DRIVE WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2110, N'32630', CAST(53.26367 AS Decimal(18, 5)), CAST(-113.58147 AS Decimal(18, 5)), N'#2 WM BRADBURY PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2111, N'32630_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WDDC pickup account', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2112, N'32631_BUS', CAST(51.04675 AS Decimal(18, 5)), CAST(-114.09956 AS Decimal(18, 5)), N'GREYHOUND DEPOT 833 GREYHOUND WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2113, N'32632', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o NAIT 780-911-7916 cell 11762 106 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2114, N'32632_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2115, N'32633', CAST(51.18413 AS Decimal(18, 5)), CAST(-114.45233 AS Decimal(18, 5)), N'62 GRIFFIN INDUSTRIAL POINT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2116, N'32635', CAST(43.22696 AS Decimal(18, 5)), CAST(-123.35405 AS Decimal(18, 5)), N'122 VALLEY CREST RISE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2117, N'32637', CAST(27.81745 AS Decimal(18, 5)), CAST(-82.72070 AS Decimal(18, 5)), N'5008 - 62 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2118, N'32637_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2119, N'32639', CAST(53.53195 AS Decimal(18, 5)), CAST(-113.59168 AS Decimal(18, 5)), N'C/O SANDY LANE PET CLINIC 15614 - 95 AVE NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2120, N'32639_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2121, N'32641', CAST(53.51090 AS Decimal(18, 5)), CAST(-113.55356 AS Decimal(18, 5)), N'C/O VALLEY ZOO VET HOSPITAL 13315 BUENA VISTA ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2122, N'32642', CAST(51.12096 AS Decimal(18, 5)), CAST(-114.03503 AS Decimal(18, 5)), N'C/O AERO (PURO DEPOT) 30 AERO DRIVE NE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2123, N'32643', CAST(51.06670 AS Decimal(18, 5)), CAST(-114.13346 AS Decimal(18, 5)), N'403D; 3330 HOSPITAL DRIVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2124, N'32645', CAST(53.56786 AS Decimal(18, 5)), CAST(-113.50453 AS Decimal(18, 5)), N'NAIT 11762 - 106 STREET DIRECTLY TO ROOM X100', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2125, N'32645_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2126, N'32646', CAST(33.25410 AS Decimal(18, 5)), CAST(-87.62942 AS Decimal(18, 5)), N'4601 - 70th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2127, N'32648', CAST(56.66022 AS Decimal(18, 5)), CAST(-111.32957 AS Decimal(18, 5)), N'FORT MCMURRAY SPCA 155 MACALPINE CRES', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2128, N'32649', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2129, N'32651', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'176 SHAWNESSY DRIVE SW (HOME ADDRESS)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2130, N'32652', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2131, N'32654', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PURO DEPOT 2319 TAYLOR DRIVE SUITE BLDG B', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2132, N'32655', CAST(41.26809 AS Decimal(18, 5)), CAST(-98.55473 AS Decimal(18, 5)), N'#3310, 2280 - 68 STREET NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2133, N'32657', CAST(50.90473 AS Decimal(18, 5)), CAST(-114.02982 AS Decimal(18, 5)), N'81 SUN CANYON WAY SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2134, N'32659', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109A  AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2135, N'32660', CAST(53.56786 AS Decimal(18, 5)), CAST(-113.50453 AS Decimal(18, 5)), N'NAIT 11762 - 106 STREET RM X100', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2136, N'32661', CAST(28.66311 AS Decimal(18, 5)), CAST(-81.30330 AS Decimal(18, 5)), N'461 EAGLE HEIGHTS ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2137, N'32662', CAST(51.09580 AS Decimal(18, 5)), CAST(-114.14095 AS Decimal(18, 5)), N'C/O PUROLATOR 4820 NORTHLAND DR NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2138, N'32663', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC FACILITY 17611-109 A Ave', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2139, N'32664', CAST(13.13976 AS Decimal(18, 5)), CAST(80.20323 AS Decimal(18, 5)), N'C/O LOOMIS DEPOT 4853-40TH STREET #1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2140, N'32667', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2141, N'32668', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2142, N'32671', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2143, N'32679', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2144, N'32686', CAST(30.44675 AS Decimal(18, 5)), CAST(-86.91190 AS Decimal(18, 5)), N'286 VANTAGE LANE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2145, N'32686_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2146, N'32687', CAST(49.71165 AS Decimal(18, 5)), CAST(-112.79367 AS Decimal(18, 5)), N'c/o PURO DEPOT 810 - 32 STREET N', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2147, N'32690', CAST(50.73565 AS Decimal(18, 5)), CAST(-113.94239 AS Decimal(18, 5)), N'105 CRYSTAL GREEN COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2148, N'32693', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O RONA (PURO DEPOT) 601 - 1 AVE NE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2149, N'32693_MARDA', CAST(51.01870 AS Decimal(18, 5)), CAST(-114.10026 AS Decimal(18, 5)), N'C/O MARDA LOOP VET CENTRE 4016  16 STREET SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2150, N'32695', CAST(50.57788 AS Decimal(18, 5)), CAST(-113.87265 AS Decimal(18, 5)), N'C/O HIGHWOOD PRINTING INC. 515 - 1 STREET  SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2151, N'32900', CAST(43.39600 AS Decimal(18, 5)), CAST(-84.60637 AS Decimal(18, 5)), N'13731 - 127 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2152, N'32900_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2153, N'32901', CAST(28.52230 AS Decimal(18, 5)), CAST(-82.56173 AS Decimal(18, 5)), N'9945 50 STREET    UNIT 107 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2154, N'32902', CAST(44.94864 AS Decimal(18, 5)), CAST(-95.47603 AS Decimal(18, 5)), N'5901 50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2155, N'32903_BUS', CAST(52.26235 AS Decimal(18, 5)), CAST(-113.81354 AS Decimal(18, 5)), N'C/O GREYHOUND DEPOT 4303 - 50 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2156, N'32904', CAST(53.57012 AS Decimal(18, 5)), CAST(-113.53665 AS Decimal(18, 5)), N'12419 - 118 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2157, N'32906_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2158, N'32907_PICKUP', CAST(-27.20723 AS Decimal(18, 5)), CAST(153.11331 AS Decimal(18, 5)), N'CANCELLED ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2159, N'32908', CAST(50.93031 AS Decimal(18, 5)), CAST(-113.97123 AS Decimal(18, 5)), N'75, 4307-130 AVENUE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2160, N'32909', CAST(51.09206 AS Decimal(18, 5)), CAST(-114.15395 AS Decimal(18, 5)), N'UNIT 107, 4625 VARSITY DRIVE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2161, N'32911', CAST(51.15533 AS Decimal(18, 5)), CAST(-114.05417 AS Decimal(18, 5)), N'Bay 711, 500 Country Hills Blv ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2162, N'32913', CAST(47.67289 AS Decimal(18, 5)), CAST(-122.34718 AS Decimal(18, 5)), N'5620-99 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2163, N'32913_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2164, N'32916', CAST(51.13531 AS Decimal(18, 5)), CAST(-114.10878 AS Decimal(18, 5)), N'BAY 9, 16 MACEWAN DRIVE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2165, N'32917', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CHYNOWETH IAIN (DVM) 354, 8338 - 18 STREET SE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2166, N'32918', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CHYNOWETH IAIN (DVM) 40 HIGH STREET SE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2167, N'32919', CAST(53.47304 AS Decimal(18, 5)), CAST(-113.49390 AS Decimal(18, 5)), N'#810, 3803 CALGARY TRAIL NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2168, N'32920', CAST(34.43827 AS Decimal(18, 5)), CAST(-83.26438 AS Decimal(18, 5)), N'16808 - 106 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2169, N'32920_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2170, N'32922', CAST(38.92239 AS Decimal(18, 5)), CAST(-77.01832 AS Decimal(18, 5)), N'4204 4 STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2171, N'32923', CAST(50.90655 AS Decimal(18, 5)), CAST(-114.06540 AS Decimal(18, 5)), N'144, 70 SHAWVILLE BLVD SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2172, N'32924', CAST(51.06090 AS Decimal(18, 5)), CAST(-114.17986 AS Decimal(18, 5)), N'6424 OLD BANFF COACH ROAD S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2173, N'32926', CAST(42.62872 AS Decimal(18, 5)), CAST(-83.31720 AS Decimal(18, 5)), N'240 CHIPPEWA ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2174, N'32928', CAST(50.91409 AS Decimal(18, 5)), CAST(-114.07143 AS Decimal(18, 5)), N'c/o LITTLE CREEK VET CLINIC 3125 - 150 MILLRISE BLVD SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2175, N'32934', CAST(37.04510 AS Decimal(18, 5)), CAST(-76.37534 AS Decimal(18, 5)), N'#140 12 INGLEWOOD DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2176, N'32934_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2177, N'32937', CAST(53.58673 AS Decimal(18, 5)), CAST(-113.49146 AS Decimal(18, 5)), N'12831-97 ST NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2178, N'32937_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP WDDC 17611-109 A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2179, N'32938', CAST(38.19644 AS Decimal(18, 5)), CAST(-87.29710 AS Decimal(18, 5)), N'UNIT 107 9505 - 68 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2180, N'32941', CAST(38.51065 AS Decimal(18, 5)), CAST(-121.46581 AS Decimal(18, 5)), N'#410, 3715 - 47TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2181, N'32942', CAST(52.28684 AS Decimal(18, 5)), CAST(-113.76905 AS Decimal(18, 5)), N'#110,  31 CLEARVIEW MARKET WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2182, N'32944', CAST(35.81507 AS Decimal(18, 5)), CAST(-93.78317 AS Decimal(18, 5)), N'4016 16 STREET SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2183, N'32944_SALTSPRIN', CAST(40.63526 AS Decimal(18, 5)), CAST(-74.15271 AS Decimal(18, 5)), N'130 MARINERS LANE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2184, N'32945', CAST(51.06716 AS Decimal(18, 5)), CAST(-114.09934 AS Decimal(18, 5)), N'105 1640 16 AVENUE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2185, N'32946', CAST(35.80255 AS Decimal(18, 5)), CAST(-81.14165 AS Decimal(18, 5)), N'5611 RIVERBEND ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2186, N'32946_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC 17611-109A Ave', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2187, N'32947', CAST(51.03766 AS Decimal(18, 5)), CAST(-114.06777 AS Decimal(18, 5)), N'233 - 17 AVENUE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2188, N'32948', CAST(45.13814 AS Decimal(18, 5)), CAST(-95.13969 AS Decimal(18, 5)), N'7140 - 12 STREET SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2189, N'32949', CAST(42.61531 AS Decimal(18, 5)), CAST(-73.12301 AS Decimal(18, 5)), N'70 COMMERCIAL COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2190, N'32949_RETAIL', CAST(42.61531 AS Decimal(18, 5)), CAST(-73.12301 AS Decimal(18, 5)), N'70 COMMERCIAL COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2191, N'32950', CAST(51.12777 AS Decimal(18, 5)), CAST(-114.19574 AS Decimal(18, 5)), N'211 - 150 CROWFOOT CRESENT N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2192, N'32951', CAST(41.01094 AS Decimal(18, 5)), CAST(-96.79678 AS Decimal(18, 5)), N'20123 - 56 avenue NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2193, N'32951_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICK UP AT WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2194, N'32953', CAST(51.03610 AS Decimal(18, 5)), CAST(-113.98116 AS Decimal(18, 5)), N'CHYNOWETH IAIN (DVM) 2002 - 36 STREET SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2195, N'32956', CAST(33.50915 AS Decimal(18, 5)), CAST(-86.79616 AS Decimal(18, 5)), N'2303 - 6TH AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2196, N'32957', CAST(27.99692 AS Decimal(18, 5)), CAST(-82.40228 AS Decimal(18, 5)), N'UNIT #1  5302 - 50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2197, N'32958', CAST(45.58704 AS Decimal(18, 5)), CAST(-122.66434 AS Decimal(18, 5)), N'8606 - 99 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2198, N'32958_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2199, N'32959', CAST(51.13790 AS Decimal(18, 5)), CAST(-114.15879 AS Decimal(18, 5)), N'Suite 214 5149 COUNTRY HILLS BLVD NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2200, N'32962', CAST(50.90369 AS Decimal(18, 5)), CAST(-113.98982 AS Decimal(18, 5)), N'16626 MCKENZIE LAKE BLVD  SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2201, N'32963', CAST(51.10469 AS Decimal(18, 5)), CAST(-114.16154 AS Decimal(18, 5)), N'405 - 5005 DALHOUSIE DRIVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2202, N'32965_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2203, N'32966', CAST(51.11180 AS Decimal(18, 5)), CAST(-114.05588 AS Decimal(18, 5)), N'6536 4 STREET NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2204, N'32968', CAST(30.34979 AS Decimal(18, 5)), CAST(-92.79456 AS Decimal(18, 5)), N'11104 - 102 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2205, N'32968_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2206, N'32969', CAST(51.15075 AS Decimal(18, 5)), CAST(-114.21284 AS Decimal(18, 5)), N'#180 8888 COUNTRY HILLS BLVD. NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2207, N'32979', CAST(51.06360 AS Decimal(18, 5)), CAST(-113.95601 AS Decimal(18, 5)), N'BAY 186 1440 52 STREET NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2208, N'32985', CAST(42.91327 AS Decimal(18, 5)), CAST(-87.86056 AS Decimal(18, 5)), N'1802 - 10TH AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2209, N'32987', CAST(41.85677 AS Decimal(18, 5)), CAST(-87.74935 AS Decimal(18, 5)), N'1716 - 50th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2210, N'32998', CAST(45.89539 AS Decimal(18, 5)), CAST(-94.47280 AS Decimal(18, 5)), N'9804 - 90 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2211, N'32998_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2212, N'33001', CAST(51.29242 AS Decimal(18, 5)), CAST(-114.02410 AS Decimal(18, 5)), N'1105, 35 MACKENZIE WAY SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2213, N'33002', CAST(44.07483 AS Decimal(18, 5)), CAST(-103.13118 AS Decimal(18, 5)), N'BOX 310 4201 - 53 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2214, N'33003', CAST(33.50052 AS Decimal(18, 5)), CAST(-112.15962 AS Decimal(18, 5)), N'4401 - 47 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2215, N'33003_BUS', CAST(37.80257 AS Decimal(18, 5)), CAST(-92.14423 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT 4318 - 52 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2216, N'33004', CAST(42.04361 AS Decimal(18, 5)), CAST(-91.07331 AS Decimal(18, 5)), N'7710 - 100 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2217, N'33004_STRATHCON', CAST(36.78947 AS Decimal(18, 5)), CAST(-89.37671 AS Decimal(18, 5)), N'8225 - 105 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2218, N'33005', CAST(53.55392 AS Decimal(18, 5)), CAST(-113.14885 AS Decimal(18, 5)), N'53074 RANGE ROAD 222 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2219, N'33005_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2220, N'33007', CAST(33.73406 AS Decimal(18, 5)), CAST(-78.88625 AS Decimal(18, 5)), N'1124 WATERTON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2221, N'33008', CAST(56.06543 AS Decimal(18, 5)), CAST(-118.38298 AS Decimal(18, 5)), N'FAIRVIEW PURO AGNT MAD DOG CREST. 10915 - 102 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2222, N'33009', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C./O HAY LAKES GENERAL STORE PURO DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2223, N'33009_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD PICKUP AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2224, N'33010', CAST(41.46972 AS Decimal(18, 5)), CAST(-90.46794 AS Decimal(18, 5)), N'4920 - 44th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2225, N'33010_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2226, N'33011_BUS', CAST(-33.80783 AS Decimal(18, 5)), CAST(151.00854 AS Decimal(18, 5)), N'P.O. BOX  89 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2227, N'33014', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o BARE BOBBINS (PURO DEPOT) 406 MAIN ST.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2228, N'33015', CAST(35.98449 AS Decimal(18, 5)), CAST(-90.54242 AS Decimal(18, 5)), N'6302 - 49 Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2229, N'33015_LARGE', CAST(35.98529 AS Decimal(18, 5)), CAST(-90.54201 AS Decimal(18, 5)), N'6302 - 49 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2230, N'33015_PICKUP', CAST(39.42613 AS Decimal(18, 5)), CAST(-80.19312 AS Decimal(18, 5)), N'PICKUP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2231, N'33015_WESTLOCK', CAST(27.85796 AS Decimal(18, 5)), CAST(-82.77767 AS Decimal(18, 5)), N'10004 - 94 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2232, N'33017', CAST(53.28210 AS Decimal(18, 5)), CAST(-110.00570 AS Decimal(18, 5)), N'4816 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2233, N'33018', CAST(25.72166 AS Decimal(18, 5)), CAST(-80.28629 AS Decimal(18, 5)), N'5304 - 57 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2234, N'33018_GRANDESPC', CAST(42.99026 AS Decimal(18, 5)), CAST(-86.04400 AS Decimal(18, 5)), N'12220 - 104 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2235, N'33018_PEACESPCA', CAST(27.85789 AS Decimal(18, 5)), CAST(-82.77178 AS Decimal(18, 5)), N'9510 - 94th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2236, N'33020', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PURO DEPOT 818A 16 STREET SW', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2237, N'33021', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PO BOX 5 ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2238, N'33023', CAST(39.44504 AS Decimal(18, 5)), CAST(-78.98635 AS Decimal(18, 5)), N'4501 - 46 AVENUE HIGHWAY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2239, N'33023_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2240, N'33023_DRKNOX', CAST(52.96076 AS Decimal(18, 5)), CAST(-113.36604 AS Decimal(18, 5)), N'PARKLAND AG AND AUTO 4102-47 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2241, N'33024', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GENERAL DELIVERY RR 262 SOUTH OF HIGHWAY 13', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2242, N'33024_HAGEN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O ALBERTA TREASURY BRANCH 5019 MAIN STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2243, N'33024_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2244, N'33025', CAST(43.87247 AS Decimal(18, 5)), CAST(-93.30632 AS Decimal(18, 5)), N'4916 - 52 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2245, N'33025_ACRACKERS', CAST(53.51828 AS Decimal(18, 5)), CAST(-113.44116 AS Decimal(18, 5)), N'7338 - 82 AVENUE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2246, N'33025_PICKUP', CAST(43.52831 AS Decimal(18, 5)), CAST(-89.43380 AS Decimal(18, 5)), N'c/o WDDC ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2247, N'33026', CAST(41.83424 AS Decimal(18, 5)), CAST(-71.43927 AS Decimal(18, 5)), N'236 RIVER AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2248, N'33029', CAST(42.78711 AS Decimal(18, 5)), CAST(-71.28869 AS Decimal(18, 5)), N'59460 Range Road 152 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2249, N'33029_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2250, N'33029_PICKUP', CAST(37.08160 AS Decimal(18, 5)), CAST(-88.66516 AS Decimal(18, 5)), N'PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2251, N'33030', CAST(53.99171 AS Decimal(18, 5)), CAST(-111.31063 AS Decimal(18, 5)), N'5508 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2252, N'33035_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2253, N'33037', CAST(29.70990 AS Decimal(18, 5)), CAST(-95.12398 AS Decimal(18, 5)), N'1ST &  CENTER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2254, N'33038', CAST(40.74132 AS Decimal(18, 5)), CAST(-73.92406 AS Decimal(18, 5)), N'4712 - 41ST STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2255, N'33038_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN BUS DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2256, N'33038_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP ONLY AT WDDC WAREHOUSE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2257, N'33039', CAST(41.80191 AS Decimal(18, 5)), CAST(-87.75082 AS Decimal(18, 5)), N'5113  50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2258, N'33039_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC BY CLINI ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2259, N'33040', CAST(39.91317 AS Decimal(18, 5)), CAST(-88.89157 AS Decimal(18, 5)), N'4906  48 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2260, N'33040_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT 4902 - 50th Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2261, N'33042', CAST(49.78974 AS Decimal(18, 5)), CAST(-112.12889 AS Decimal(18, 5)), N'C/O TABER ANIMAL CLINIC 6212- 54 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2262, N'33042_BUS', CAST(11.10595 AS Decimal(18, 5)), CAST(77.34694 AS Decimal(18, 5)), N'ISLAND VETERINARY CLINIC c/o 5414 - 50 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2263, N'33042_LAZYT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN LOOMIS DEPOT HOLD FOR PICKUP[', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2264, N'33043', CAST(47.45086 AS Decimal(18, 5)), CAST(-120.27780 AS Decimal(18, 5)), N'EAST GUN CLUB ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2265, N'33043_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP BY CLINIC AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2266, N'33043_STOCKYARD', CAST(34.90913 AS Decimal(18, 5)), CAST(-85.48239 AS Decimal(18, 5)), N'12815 - 58 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2267, N'33044', CAST(25.99200 AS Decimal(18, 5)), CAST(-80.23906 AS Decimal(18, 5)), N'230271   RR 51A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2268, N'33044_LITTLECRE', CAST(50.91409 AS Decimal(18, 5)), CAST(-114.07143 AS Decimal(18, 5)), N'LITTLE CREEK VET 3125 - 150 MILLRISE BLVD SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2269, N'33045', CAST(38.19644 AS Decimal(18, 5)), CAST(-87.29710 AS Decimal(18, 5)), N'Unit 107, 9505 - 68 Avenue ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2270, N'33046', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'202 28042 HWY 11 BURNT LAKE BUSINESS PARK', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2271, N'33046_BUS', CAST(52.26235 AS Decimal(18, 5)), CAST(-113.81354 AS Decimal(18, 5)), N'c/o GREYHOUND DEPOT 4303 GATEZ AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2272, N'33046_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2273, N'33047', CAST(50.57422 AS Decimal(18, 5)), CAST(-113.87138 AS Decimal(18, 5)), N'C/O HIGH RIVER VETERINARY CLINIC 3  938 CENTER STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2274, N'33048', CAST(39.27977 AS Decimal(18, 5)), CAST(-84.91931 AS Decimal(18, 5)), N'5404-46 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2275, N'33048_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT FTG mechanical   4923-51street', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2276, N'33048_DHL', CAST(39.27977 AS Decimal(18, 5)), CAST(-84.91931 AS Decimal(18, 5)), N'5404-46 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2277, N'33048_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2278, N'33048_PUROLATOR', CAST(39.27977 AS Decimal(18, 5)), CAST(-84.91931 AS Decimal(18, 5)), N'5404-46 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2279, N'33049', CAST(30.27754 AS Decimal(18, 5)), CAST(-97.75337 AS Decimal(18, 5)), N'CASTLES ROAD & 12 STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2280, N'33049_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2281, N'33049_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2282, N'33050', CAST(49.78440 AS Decimal(18, 5)), CAST(-112.13224 AS Decimal(18, 5)), N'o/a BUFFALO HEAD VETERINARY 6012 46 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2283, N'33050_BUS', CAST(52.39902 AS Decimal(18, 5)), CAST(-113.19220 AS Decimal(18, 5)), N'c/o GREYHOUND DEPOT 5414 - 50th Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2284, N'33050_GREENACRE', CAST(44.14333 AS Decimal(18, 5)), CAST(-93.18677 AS Decimal(18, 5)), N'4651 - 24th AVENUE SOUTH HIGHWAY 4', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2285, N'33052', CAST(42.07370 AS Decimal(18, 5)), CAST(-90.84104 AS Decimal(18, 5)), N'4620  50 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2286, N'33053', CAST(51.01427 AS Decimal(18, 5)), CAST(-114.17090 AS Decimal(18, 5)), N'276 STEWART GREEN SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2287, N'33054', CAST(51.09552 AS Decimal(18, 5)), CAST(-115.35829 AS Decimal(18, 5)), N'1510 RAILWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2288, N'33057', CAST(50.92857 AS Decimal(18, 5)), CAST(-114.02729 AS Decimal(18, 5)), N'1186 137 th AVE SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2289, N'33057_CALGEMERG', CAST(44.89033 AS Decimal(18, 5)), CAST(-97.09821 AS Decimal(18, 5)), N'1139 - 9TH AVENUE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2290, N'33061', CAST(52.30651 AS Decimal(18, 5)), CAST(-113.81379 AS Decimal(18, 5)), N'7644 GAETZ AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2291, N'33063', CAST(43.40799 AS Decimal(18, 5)), CAST(-84.52003 AS Decimal(18, 5)), N'4405 - 46 STREET P.O. BOX 670', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2292, N'33063_HIGHLEVEL', CAST(38.60676 AS Decimal(18, 5)), CAST(-90.37333 AS Decimal(18, 5)), N'9804 - 100 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2293, N'33063_PURO', CAST(43.40799 AS Decimal(18, 5)), CAST(-84.52003 AS Decimal(18, 5)), N'4405 - 46 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2294, N'33064', CAST(52.24352 AS Decimal(18, 5)), CAST(-113.81559 AS Decimal(18, 5)), N'2404 GAETZ AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2295, N'33065_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2296, N'33066', CAST(40.74322 AS Decimal(18, 5)), CAST(-73.92058 AS Decimal(18, 5)), N'5214-44 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2297, N'33066_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND DEPOT - HOLD FOR PICKUP 4419 - 45 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2298, N'33066_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'p/u  at WDDC 17611 - 109 A Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2299, N'33067', CAST(35.57753 AS Decimal(18, 5)), CAST(-78.25441 AS Decimal(18, 5)), N'235 STARLINE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2300, N'33067_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2301, N'33070', CAST(38.87213 AS Decimal(18, 5)), CAST(-107.59410 AS Decimal(18, 5)), N'4607 -  50 AVENUE BOX 389', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2302, N'33070_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT 4705 - 50 Avenue', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2303, N'33071', CAST(40.60555 AS Decimal(18, 5)), CAST(-74.00397 AS Decimal(18, 5)), N'Bay #2, 3655 - 18 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2304, N'33071_BUS', CAST(47.50045 AS Decimal(18, 5)), CAST(-111.29909 AS Decimal(18, 5)), N'411 5th STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2305, N'33072', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'TREVOR HOOK (DVM) 4102  64 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2306, N'33072_DHL', CAST(41.92152 AS Decimal(18, 5)), CAST(-88.25492 AS Decimal(18, 5)), N'4102  64 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2307, N'33072_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2308, N'33075', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DAVIS VETERINARY SERVICES HWAY 13A BETWEEN RR 275 AND HWY 780', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2309, N'33075_LEDUC', CAST(41.20321 AS Decimal(18, 5)), CAST(-88.41682 AS Decimal(18, 5)), N'5710 - 47 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2310, N'33075_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2311, N'33076', CAST(40.74352 AS Decimal(18, 5)), CAST(-74.00324 AS Decimal(18, 5)), N'130 - 9 TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2312, N'33076_PRAIRIE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PRAIRIE PARTNERS VET SERV SUITE 3, 306 - 6th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2313, N'33080', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'O/A HINTON VETERINARY CLINIC 117 SUNSET BLVD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2314, N'33083', CAST(51.18645 AS Decimal(18, 5)), CAST(-114.46448 AS Decimal(18, 5)), N'BAY 3, 124 RIVER AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2315, N'33086', CAST(51.50381 AS Decimal(18, 5)), CAST(-114.11890 AS Decimal(18, 5)), N'11118 TWP ROAD  294 HWY 2A SOUTH OF CARSTAIRS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2316, N'33087', CAST(35.63887 AS Decimal(18, 5)), CAST(-82.54747 AS Decimal(18, 5)), N'12 34 EDGEDALE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2317, N'33091', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'4342 TWP RD. 301A (BIG PRAIRIE RD. po box 456', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2318, N'33092', CAST(33.78623 AS Decimal(18, 5)), CAST(-84.39426 AS Decimal(18, 5)), N'200, 417 14th Street NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2319, N'33092_EDMONTON', CAST(53.54211 AS Decimal(18, 5)), CAST(-113.50834 AS Decimal(18, 5)), N'SUITE 206 10145-109 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2320, N'33095', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC FACILITY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2321, N'33096', CAST(45.77983 AS Decimal(18, 5)), CAST(-95.70046 AS Decimal(18, 5)), N'1626 RAILWAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2322, N'33097', CAST(42.80895 AS Decimal(18, 5)), CAST(-71.25862 AS Decimal(18, 5)), N'31441 RANGE ROAD 53 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2323, N'33098', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'NW34 4 53 8 WEST OF 5TH HWY 22 NORTH HWY 16 53519', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2324, N'33098_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WILDWOOD CONFECTIONARY 5119 - 50 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2325, N'33099', CAST(54.16011 AS Decimal(18, 5)), CAST(-113.12418 AS Decimal(18, 5)), N'c/o THORHILD DRUG STORE 722 - 1ST STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2326, N'33099_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2327, N'33100', CAST(40.73625 AS Decimal(18, 5)), CAST(-73.97898 AS Decimal(18, 5)), N'376 1 AVE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2328, N'33101', CAST(44.89025 AS Decimal(18, 5)), CAST(-97.15378 AS Decimal(18, 5)), N'2458  9 AVE SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2329, N'33102', CAST(53.29729 AS Decimal(18, 5)), CAST(-110.00672 AS Decimal(18, 5)), N'6002 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2330, N'33102_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HANDLY DARYL (DVM) c/o GREYHOUND 5217 - 51 Street', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2331, N'33102_WESTERN', CAST(42.91327 AS Decimal(18, 5)), CAST(-87.86056 AS Decimal(18, 5)), N'1802 - 10TH AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2332, N'33103', CAST(40.86859 AS Decimal(18, 5)), CAST(-96.64298 AS Decimal(18, 5)), N'5606 - 56 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2333, N'33103_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WINDER KEVIN  (DVM) MAIN GREYHOUND DEPOT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2334, N'33103_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2335, N'33104', CAST(49.09927 AS Decimal(18, 5)), CAST(3.75719 AS Decimal(18, 5)), N'51136  RR212 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2336, N'33104_EDMEQUINE', CAST(53.57695 AS Decimal(18, 5)), CAST(-113.45675 AS Decimal(18, 5)), N'12215 WILLIAM SHORT ROAD N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2337, N'33104_EVERGREEN', CAST(55.15114 AS Decimal(18, 5)), CAST(-118.77291 AS Decimal(18, 5)), N'7701 RESOURCES ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2338, N'33104_MOSTEWART', CAST(51.18578 AS Decimal(18, 5)), CAST(-113.99901 AS Decimal(18, 5)), N'C/O MOORE AND COMPANY VETERINARY 144 AVENUE AND BARLOW TRAIL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2339, N'33104_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2340, N'33105', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'NORTH OF TRANSCANADA HWY RR254 2KM WEST OF STATHMORE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2341, N'33107', CAST(53.70667 AS Decimal(18, 5)), CAST(-114.18481 AS Decimal(18, 5)), N'5119 LAC STE ANNE TRAIL NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2342, N'33107_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2343, N'33108', CAST(25.78288 AS Decimal(18, 5)), CAST(-80.13463 AS Decimal(18, 5)), N'609 - 12 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2344, N'33108_BUS', CAST(29.74812 AS Decimal(18, 5)), CAST(-95.37134 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2345, N'33108_RANCHDOCS', CAST(49.64693 AS Decimal(18, 5)), CAST(-112.71226 AS Decimal(18, 5)), N'C/O RANCH DOCS VETERINARY SERVICE 82038 RR 210', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2346, N'33109', CAST(44.54176 AS Decimal(18, 5)), CAST(-95.39090 AS Decimal(18, 5)), N'10408 100 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2347, N'33109_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2348, N'33109_STRATHCON', CAST(36.78947 AS Decimal(18, 5)), CAST(-89.37671 AS Decimal(18, 5)), N'8225 - 105 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2349, N'33112', CAST(55.17094 AS Decimal(18, 5)), CAST(-118.79980 AS Decimal(18, 5)), N'10126 100 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2350, N'33113', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O MIDFIELD SUPPLY (LOOMIS DEPOT) 4808 - 37 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2351, N'33115', CAST(42.78493 AS Decimal(18, 5)), CAST(-95.15100 AS Decimal(18, 5)), N'5050 130 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2352, N'33115_MCRCORDER', CAST(42.78493 AS Decimal(18, 5)), CAST(-95.15100 AS Decimal(18, 5)), N'5050 130 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2353, N'33115_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2354, N'33116', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SOBCHUK TAYLOR (DVM) 4403 2ND AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2355, N'33116_BUS', CAST(53.57888 AS Decimal(18, 5)), CAST(-116.44820 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT 5630 - 4 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2356, N'33116_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2357, N'33117', CAST(54.15595 AS Decimal(18, 5)), CAST(-113.85958 AS Decimal(18, 5)), N'C/O ASSOCIATE MEDICAL CLINIC #203, 10030 - 106 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2358, N'33117_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2359, N'33119', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'32539 Range RD 43 OFF HWY 27 BOX 9 SITE 11 RR 1', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2360, N'33122', CAST(35.17591 AS Decimal(18, 5)), CAST(-84.88286 AS Decimal(18, 5)), N'1104 - 18 STREET  SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2361, N'33122_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'BUS DEPT C/O HIGHWOOD GROCERY 601 - 1ST STREET WEST (FOR P/U', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2362, N'33122_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2363, N'33123', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CLINICAL SKILL BUILD. SPY HILL 11877 - 85 STREET NW  ROOM: 154', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2364, N'33123_NORMANAIR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Great Slave Lake 129 KAM LAKE ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2365, N'33123_PRODANHTH', CAST(51.06658 AS Decimal(18, 5)), CAST(-114.13393 AS Decimal(18, 5)), N'Health Sciences Centre Room room 2518, 3330 Hospital Drive N.W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2366, N'33123_ROCKY', CAST(40.86859 AS Decimal(18, 5)), CAST(-96.64298 AS Decimal(18, 5)), N'5606 - 56 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2367, N'33124', CAST(34.60470 AS Decimal(18, 5)), CAST(-79.69181 AS Decimal(18, 5)), N'47 McRAE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2368, N'33126', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'AGRICULTURE/FORESTRY CENTER ROOM 3-51 90AVE & 166 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2369, N'33126_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2370, N'33128', CAST(33.69368 AS Decimal(18, 5)), CAST(-84.37687 AS Decimal(18, 5)), N'#5, 181 CARRY DRIVE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2371, N'33128_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2372, N'33129', CAST(27.46163 AS Decimal(18, 5)), CAST(-82.60076 AS Decimal(18, 5)), N'3831  BAY G   44  AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2373, N'33129_BEARHILL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'LOOMIS AGENT c/o SASK WHEAT POOL', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2374, N'33129_CALMARMIL', CAST(41.46442 AS Decimal(18, 5)), CAST(-90.46843 AS Decimal(18, 5)), N'4905 - 49th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2375, N'33129_CARROTRIV', CAST(53.27591 AS Decimal(18, 5)), CAST(-103.58854 AS Decimal(18, 5)), N'C/O CARROT RIVER MOTEL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2376, N'33129_DIEFENBAK', CAST(50.44700 AS Decimal(18, 5)), CAST(-104.61889 AS Decimal(18, 5)), N'C/O SASK WHEAT POOL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2377, N'33129_DINSMORE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o DINSMORE AUTO PARTS HWY 48', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2378, N'33129_ELMSPRING', CAST(33.19979 AS Decimal(18, 5)), CAST(-117.36908 AS Decimal(18, 5)), N'C/O LUCKY DOLLAR ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2379, N'33129_HEARLAND', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PRO HARDWARE CARLTON TRAIL #1', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2380, N'33129_HEARTLAND', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PRO HARDWARE CARLTON TRAIL #1', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2381, N'33129_MANITOU1', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O STREAMLINE INDUSTRIAL 204 WILLIAMS INDUSTRIAL DRIVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2382, N'33129_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2383, N'33129_VETAGRIH', CAST(39.36904 AS Decimal(18, 5)), CAST(-76.62291 AS Decimal(18, 5)), N'#20 EAST LAKE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2384, N'33130', CAST(36.30516 AS Decimal(18, 5)), CAST(-76.22225 AS Decimal(18, 5)), N'#1 20332 TWP ROAD 512 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2385, N'33130_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC FACILITY 17611 - 109 A Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2386, N'33131', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT LOOMIS 269 LAURA AVENUE', N'The remote server returned an error: (500) Internal Server Error.')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2387, N'33131_BUS', CAST(50.58424 AS Decimal(18, 5)), CAST(-111.89568 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT 1308 - 2A STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2388, N'33134', CAST(42.78650 AS Decimal(18, 5)), CAST(-71.28737 AS Decimal(18, 5)), N'50519 RANGE ROAD 161 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2389, N'33136', CAST(44.94860 AS Decimal(18, 5)), CAST(-95.48460 AS Decimal(18, 5)), N'5239 50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2390, N'33136_BUSREDDER', CAST(52.26235 AS Decimal(18, 5)), CAST(-113.81354 AS Decimal(18, 5)), N'c/o RED DEER GREYHOUND DEPOT 4303 - GAETZ  AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2391, N'33136_PIONEER', CAST(46.87692 AS Decimal(18, 5)), CAST(-96.91116 AS Decimal(18, 5)), N'709 MAIN AVENUE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2392, N'33137', CAST(53.42494 AS Decimal(18, 5)), CAST(-117.54233 AS Decimal(18, 5)), N'107 ATHABASCA AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2393, N'33139', CAST(45.48736 AS Decimal(18, 5)), CAST(-122.60846 AS Decimal(18, 5)), N'4848 - 52 AVENUE PO BOX 425', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2394, N'33141', CAST(36.97357 AS Decimal(18, 5)), CAST(-121.95197 AS Decimal(18, 5)), N'209 STOCKTON AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2395, N'33141_DANBYRNE', CAST(50.77688 AS Decimal(18, 5)), CAST(-101.28830 AS Decimal(18, 5)), N'CO-OP FUEL STATION ATTN:  GUY RUSSELL', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2396, N'33142', CAST(25.72750 AS Decimal(18, 5)), CAST(-80.26171 AS Decimal(18, 5)), N'4818 - 42 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2397, N'33142_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2398, N'33145', CAST(44.39954 AS Decimal(18, 5)), CAST(-73.12767 AS Decimal(18, 5)), N'5828 HWY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2399, N'33146', CAST(27.74702 AS Decimal(18, 5)), CAST(-82.69666 AS Decimal(18, 5)), N'4651 - 24th AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2400, N'33146_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2401, N'33147', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CRAIG DORIN (DVM) 10216 - 101 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2402, N'33148', CAST(51.07045 AS Decimal(18, 5)), CAST(-115.36891 AS Decimal(18, 5)), N'948 Lawrence Grassie Ridge ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2403, N'33149', CAST(41.20321 AS Decimal(18, 5)), CAST(-88.41682 AS Decimal(18, 5)), N'5710  47 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2404, N'33149_PICKUP', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'HOLD FOR PICK UP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2405, N'33151', CAST(44.39954 AS Decimal(18, 5)), CAST(-73.12767 AS Decimal(18, 5)), N'5828 HWY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2406, N'33157', CAST(51.50772 AS Decimal(18, 5)), CAST(0.29007 AS Decimal(18, 5)), N'141 BROXBURN BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2407, N'33158', CAST(22.59245 AS Decimal(18, 5)), CAST(88.41266 AS Decimal(18, 5)), N'C/O TAURUS SALT 1098- 1ST AVE W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2408, N'33159_PICTUREBU', CAST(38.02920 AS Decimal(18, 5)), CAST(-121.93417 AS Decimal(18, 5)), N'232 HIGHWAY AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2409, N'33159_SUNNYSOUT', CAST(38.89019 AS Decimal(18, 5)), CAST(-77.07155 AS Decimal(18, 5)), N'1310 - 14 STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2410, N'33161', CAST(45.68388 AS Decimal(18, 5)), CAST(-108.36822 AS Decimal(18, 5)), N'6420 Secondary HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2411, N'33163', CAST(37.56398 AS Decimal(18, 5)), CAST(-122.32503 AS Decimal(18, 5)), N'59 EAST 3RD AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2412, N'33164', CAST(37.74255 AS Decimal(18, 5)), CAST(-122.47569 AS Decimal(18, 5)), N'2401 - 19 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2413, N'33169', CAST(54.76948 AS Decimal(18, 5)), CAST(-111.97958 AS Decimal(18, 5)), N'10216  101 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2414, N'33169_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2415, N'33175', CAST(42.94495 AS Decimal(18, 5)), CAST(-86.10178 AS Decimal(18, 5)), N'9708 -  128 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2416, N'33177', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DR CECILIA RUSCHKOWSKI #2, 5TH AVENUE WEST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2417, N'33177_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2418, N'33178_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2419, N'33184', CAST(44.74398 AS Decimal(18, 5)), CAST(-92.87201 AS Decimal(18, 5)), N'1103 - 2 STREET W ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2420, N'33196', CAST(44.40455 AS Decimal(18, 5)), CAST(-73.12597 AS Decimal(18, 5)), N'5502  HWY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2421, N'33196_ALBERTAVC', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'202, 28042 HIGHWAY 11 BURNT LAKE BUSINESS PARK', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2422, N'33196_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND DEPOT BAY 12, 5103 - 48 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2423, N'33196_CHRISTINE', CAST(45.33956 AS Decimal(18, 5)), CAST(-97.53739 AS Decimal(18, 5)), N'C/O JOHN DEER DEALERSHIP HWY 12 west', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2424, N'33196_RIMBEY', CAST(52.26555 AS Decimal(18, 5)), CAST(-113.81362 AS Decimal(18, 5)), N'4605 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2425, N'33200', CAST(38.60359 AS Decimal(18, 5)), CAST(-90.38559 AS Decimal(18, 5)), N'10013 - 100 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2426, N'33200_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2427, N'33201', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ALBERTA  HWY 2 NORTH 2213  20 AVENUE BOX 584', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2428, N'33201_BUS', CAST(48.21790 AS Decimal(18, 5)), CAST(-114.27639 AS Decimal(18, 5)), N'c/o GREYHOUND DEPOT HWY 2 NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2429, N'33201_DHL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ALBERTA HWY 2 NORTH 2213  20 AVENUE BOX 584', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2430, N'33202', CAST(25.73119 AS Decimal(18, 5)), CAST(-80.26194 AS Decimal(18, 5)), N'4408-42 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2431, N'33202_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND DEPOT - HOLD FOR PICKUP 4303 GAETZ AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2432, N'33203_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2433, N'33203_LARRYDOW', CAST(-33.31436 AS Decimal(18, 5)), CAST(115.69994 AS Decimal(18, 5)), N'16 EAGLE CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2434, N'33205', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CO OP BULK SUPPLY   PURO AGENT JCT OF HWY 44 / 45', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2435, N'33210', CAST(33.55400 AS Decimal(18, 5)), CAST(-101.91830 AS Decimal(18, 5)), N'5001 - 44th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2436, N'33210_FWEEKS', CAST(34.86379 AS Decimal(18, 5)), CAST(-82.22120 AS Decimal(18, 5)), N'PO BOX 1015 HWY 14', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2437, N'33211', CAST(51.18409 AS Decimal(18, 5)), CAST(-114.46578 AS Decimal(18, 5)), N'c/o COCHRANE ANIMAL CLINIC 236 RIVER AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2438, N'33212', CAST(32.79537 AS Decimal(18, 5)), CAST(-79.94298 AS Decimal(18, 5)), N'#126, 636 KING STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2439, N'33212_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2440, N'33215', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WILLOW CREEK COUNTRY puro depot 217 - 2 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2441, N'33216', CAST(41.71109 AS Decimal(18, 5)), CAST(-112.17635 AS Decimal(18, 5)), N'709 MAIN AVE  WEST Box 569', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2442, N'33216_BUS', CAST(29.74812 AS Decimal(18, 5)), CAST(-95.37134 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2443, N'33217', CAST(38.75053 AS Decimal(18, 5)), CAST(-89.99346 AS Decimal(18, 5)), N'116 SHERWOOD DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2444, N'33217_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2445, N'33218_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620-163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2446, N'33221', CAST(38.42833 AS Decimal(18, 5)), CAST(-82.45357 AS Decimal(18, 5)), N'1, 219 -3RD  AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2447, N'33221_OKOTOKS', CAST(22.53770 AS Decimal(18, 5)), CAST(88.33811 AS Decimal(18, 5)), N'1 KM NORTH ON HIGHWAY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2448, N'33222', CAST(51.06098 AS Decimal(18, 5)), CAST(-115.31917 AS Decimal(18, 5)), N'502 BOW VALLEY TRAIL HWY 1A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2449, N'33222_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND DEPOT HOLD FR PICKUP 327 RAILWAY AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2450, N'33222_PUROLATOR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROCKY MOUNTAIN VETS INC 502 BOW VALLEY TRAIL HWY 1A', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2451, N'33225', CAST(51.05662 AS Decimal(18, 5)), CAST(-113.38141 AS Decimal(18, 5)), N'284 CAMBRIDGE CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2452, N'33228', CAST(46.43874 AS Decimal(18, 5)), CAST(-109.83348 AS Decimal(18, 5)), N'#101 - 3rd STREET N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2453, N'33228_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2454, N'33229', CAST(42.34406 AS Decimal(18, 5)), CAST(-71.26100 AS Decimal(18, 5)), N'#5 SOUTH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2455, N'33229_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2456, N'33230_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP ONLY AT WDDC WAREHOUSE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2457, N'33233', CAST(33.50462 AS Decimal(18, 5)), CAST(-112.16853 AS Decimal(18, 5)), N'4605 51 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2458, N'33233_DHL', CAST(33.50462 AS Decimal(18, 5)), CAST(-112.16853 AS Decimal(18, 5)), N'4605 - 51 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2459, N'33233_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2460, N'33240', CAST(39.42505 AS Decimal(18, 5)), CAST(-84.32827 AS Decimal(18, 5)), N'1 EXPLORATION DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2461, N'33240_DAVPICKUP', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 - 109a AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2462, N'33243', CAST(41.00487 AS Decimal(18, 5)), CAST(-75.51923 AS Decimal(18, 5)), N'43 SPRUCE LANE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2463, N'33243_LACLA', CAST(53.36550 AS Decimal(18, 5)), CAST(-104.01159 AS Decimal(18, 5)), N'30 NIPEWAN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2464, N'33247', CAST(40.75175 AS Decimal(18, 5)), CAST(-73.97111 AS Decimal(18, 5)), N'839 - 2nd AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2465, N'33247_CASES', CAST(40.75175 AS Decimal(18, 5)), CAST(-73.97111 AS Decimal(18, 5)), N'839 - 2nd AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2466, N'33247_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2467, N'33249', CAST(50.95199 AS Decimal(18, 5)), CAST(-114.56086 AS Decimal(18, 5)), N'C/O MOOSE MOUNTAIN GENERAL STORE 16 WHITE AVE  SUITE 5 & 6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2468, N'33249_LEWISFARM', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'27115A TWP RD 524 ', N'The remote server returned an error: (500) Internal Server Error.')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2469, N'33249_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2470, N'33250', CAST(33.54918 AS Decimal(18, 5)), CAST(-101.91419 AS Decimal(18, 5)), N'4802 - 50th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2471, N'33255', CAST(39.73347 AS Decimal(18, 5)), CAST(-77.50236 AS Decimal(18, 5)), N'13315 BUENA VISTA ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2472, N'33255_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2473, N'33257_HREHORETS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2474, N'33257_LAKELAND', CAST(54.77181 AS Decimal(18, 5)), CAST(-111.95728 AS Decimal(18, 5)), N'30 NIPEWON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2475, N'33262_PICKUP', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 109A avenue ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2476, N'33263', CAST(44.00795 AS Decimal(18, 5)), CAST(-107.96835 AS Decimal(18, 5)), N'1141 SOUTH RAILWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2477, N'33267', CAST(41.28503 AS Decimal(18, 5)), CAST(-95.99088 AS Decimal(18, 5)), N'5014  MAPLE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2478, N'33267_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2479, N'33271_BUS', CAST(39.75079 AS Decimal(18, 5)), CAST(-104.99101 AS Decimal(18, 5)), N'C/O GREYHOUND BUS DEPOT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2480, N'33271_PICKUP', CAST(39.42613 AS Decimal(18, 5)), CAST(-80.19312 AS Decimal(18, 5)), N'PICKUP ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2481, N'33273', CAST(34.97261 AS Decimal(18, 5)), CAST(-82.11557 AS Decimal(18, 5)), N'#108 - 166 CLEARVIEW DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2482, N'33276', CAST(28.15203 AS Decimal(18, 5)), CAST(-82.69563 AS Decimal(18, 5)), N'#201 - 151 EAST LAKE BLVD. N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2483, N'33276_ALBERTAB', CAST(38.73343 AS Decimal(18, 5)), CAST(-84.59654 AS Decimal(18, 5)), N'4 N. HY 25 4 N. 843 1/2.HY 520 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2484, N'33276_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN BUS DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2485, N'33276_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2486, N'33276_VEETEEFEE', CAST(17.39044 AS Decimal(18, 5)), CAST(78.49240 AS Decimal(18, 5)), N'c/o DHL agent depot 5710 44 Street', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2487, N'33278', CAST(34.25105 AS Decimal(18, 5)), CAST(-119.15864 AS Decimal(18, 5)), N'232 HIGHWAY AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2488, N'33278_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP/GREYHOUND BUS DEPOT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2489, N'33281', CAST(35.49270 AS Decimal(18, 5)), CAST(-81.96412 AS Decimal(18, 5)), N'339 HIGHWAY AVENUE BOX 67', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2490, N'33283_BRFEEDERS', CAST(42.88365 AS Decimal(18, 5)), CAST(-85.92212 AS Decimal(18, 5)), N'6311 - 56 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2491, N'33283_KPAULSON', CAST(50.42410 AS Decimal(18, 5)), CAST(-107.21944 AS Decimal(18, 5)), N'C/O HERBERT CO-OP 32 SHAW STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2492, N'33283_LARTERFEE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'4.5 MILES EAST OF PICTURE BUTTE ON HWY 519', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2493, N'33283_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2494, N'33287', CAST(45.49071 AS Decimal(18, 5)), CAST(-122.60937 AS Decimal(18, 5)), N'4439 52 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2495, N'33287_BUS', CAST(45.49071 AS Decimal(18, 5)), CAST(-122.60937 AS Decimal(18, 5)), N'4439 - 52 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2496, N'33292', CAST(40.74322 AS Decimal(18, 5)), CAST(-73.92058 AS Decimal(18, 5)), N'5603 44 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2497, N'33292_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2498, N'33292_PICKUP', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 109a AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2499, N'33298', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'141 BROXBURN BLVD BROXBURN BUSINESS PARK', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2500, N'33300', CAST(32.40852 AS Decimal(18, 5)), CAST(-88.71793 AS Decimal(18, 5)), N'4735 39 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2501, N'33302', CAST(40.74322 AS Decimal(18, 5)), CAST(-73.92058 AS Decimal(18, 5)), N'4640-44 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2502, N'33304', CAST(53.71103 AS Decimal(18, 5)), CAST(-113.20965 AS Decimal(18, 5)), N'10315 99 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2503, N'33304_MALOTT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2504, N'33304_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2505, N'33306', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT 2319 TAYLOR DR, SUITE BLDG B', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2506, N'33308', CAST(34.02420 AS Decimal(18, 5)), CAST(-94.73993 AS Decimal(18, 5)), N'300 4305 SOUTH PARK DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2507, N'33309', CAST(36.54508 AS Decimal(18, 5)), CAST(-88.89910 AS Decimal(18, 5)), N'10004 - 94 A AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2508, N'33309_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2509, N'33311', CAST(35.45362 AS Decimal(18, 5)), CAST(-82.52134 AS Decimal(18, 5)), N'8  SPRUCE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2510, N'33312', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2511, N'33312_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC 17611-109 A. AVE.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2512, N'33313', CAST(51.08544 AS Decimal(18, 5)), CAST(-115.34527 AS Decimal(18, 5)), N'C/O CANMORE VET HOSPITAL 502 BOW VALLEY TRAIL HWY 1A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2513, N'33314', CAST(50.87348 AS Decimal(18, 5)), CAST(-113.63437 AS Decimal(18, 5)), N'#4 RAILWAY AVENUE BOX 406', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2514, N'33315', CAST(26.13032 AS Decimal(18, 5)), CAST(-80.15043 AS Decimal(18, 5)), N'#640 - 7TH AVE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2515, N'33317', CAST(52.96013 AS Decimal(18, 5)), CAST(-113.37376 AS Decimal(18, 5)), N'4808 40 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2516, N'33318', CAST(48.29830 AS Decimal(18, 5)), CAST(-109.80328 AS Decimal(18, 5)), N'9905 100ST R.R.1, SITE 6, BOX 21', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2517, N'33318_NELSON', CAST(42.39716 AS Decimal(18, 5)), CAST(-88.43902 AS Decimal(18, 5)), N'4911 - 47 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2518, N'33320', CAST(44.12642 AS Decimal(18, 5)), CAST(-89.80811 AS Decimal(18, 5)), N'1171 BIGHORN AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2519, N'33323', CAST(39.62923 AS Decimal(18, 5)), CAST(-76.34301 AS Decimal(18, 5)), N'#410, 55022 ST.  ANNE TRAIL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2520, N'33325', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO AGENT - CLANCY GRAPHICS 9940 - 107th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2521, N'33325_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICK UP WDDC PICK UP ONLY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2522, N'33325_WESTLOCK', CAST(54.15250 AS Decimal(18, 5)), CAST(-113.88047 AS Decimal(18, 5)), N'C/O WESTLOCK VETERINARY CLINIC 10004 - 94 A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2523, N'33326', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O MIDFIELD SUPPLY (DHL DEPOT) 4808 - 37 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2524, N'33330', CAST(41.54182 AS Decimal(18, 5)), CAST(-87.50896 AS Decimal(18, 5)), N'807 - 45th STREET NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2525, N'33330_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2526, N'33340', CAST(49.64693 AS Decimal(18, 5)), CAST(-112.71226 AS Decimal(18, 5)), N'82038 RR 210 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2527, N'33343', CAST(53.78825 AS Decimal(18, 5)), CAST(-113.64128 AS Decimal(18, 5)), N'C/O MORINVILLE VETERINARY CLINIC 9804 - 90 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2528, N'33350', CAST(52.96150 AS Decimal(18, 5)), CAST(-114.02726 AS Decimal(18, 5)), N'C/O ATB FINANCIAL AGENCY 30 VILLAGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2529, N'33350_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP HOLD FOR PICK UP AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2530, N'33350_PIGEONLAK', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O CUTS ON THE LAKE #26 Village Drive', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2531, N'33351', CAST(53.36550 AS Decimal(18, 5)), CAST(-104.01159 AS Decimal(18, 5)), N'30 NIPEWAN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2532, N'33351_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'pick up at WDDC 17611 - 109a Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2533, N'33357', CAST(52.21467 AS Decimal(18, 5)), CAST(-113.78712 AS Decimal(18, 5)), N'C/O PIPER CREEK VETERINARY CLINIC UNIT 1, 166 37428 RR 273', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2534, N'33361', CAST(50.02461 AS Decimal(18, 5)), CAST(-110.70535 AS Decimal(18, 5)), N'c/o PURO DEPOT 818A - 16ST SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2535, N'33365', CAST(45.48736 AS Decimal(18, 5)), CAST(-122.60846 AS Decimal(18, 5)), N'4848 - 52 AVENUE PO BOX 581', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2536, N'33365_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2537, N'33367', CAST(46.88234 AS Decimal(18, 5)), CAST(-102.78959 AS Decimal(18, 5)), N'314 - 3rd AVE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2538, N'33368', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'RR30 TWP 282 5KM SOUTH OF MADDEN', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2539, N'33370', CAST(44.97718 AS Decimal(18, 5)), CAST(-93.27844 AS Decimal(18, 5)), N'c/o GREYHOUND DEPOT 10105 - 95 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2540, N'33370_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MANNING BUS DEPOT 102 - 4th AVENUE S.W.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2541, N'33370_FRONTIER', CAST(43.40799 AS Decimal(18, 5)), CAST(-84.52003 AS Decimal(18, 5)), N'4405 - 46 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2542, N'33373', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o RONA BLACK DIAMOND (PURO) 601 - 1 AVE NW', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2543, N'33382', CAST(39.71922 AS Decimal(18, 5)), CAST(-78.77616 AS Decimal(18, 5)), N'18208 ELLERSLIE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2544, N'33388', CAST(35.37217 AS Decimal(18, 5)), CAST(-119.03190 AS Decimal(18, 5)), N'2601 - 16TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2545, N'33398', CAST(40.71781 AS Decimal(18, 5)), CAST(-73.99621 AS Decimal(18, 5)), N'UNIT 2, 74 ELIZABETH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2546, N'33398_CATNAPS', CAST(40.71781 AS Decimal(18, 5)), CAST(-73.99621 AS Decimal(18, 5)), N'#2-74 ELIZABETH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2547, N'33400', CAST(54.12057 AS Decimal(18, 5)), CAST(-114.40240 AS Decimal(18, 5)), N'c/o TRU GARDEN CENTRE. 5112 - 49A STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2548, N'33400_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2549, N'33404', CAST(38.52584 AS Decimal(18, 5)), CAST(-121.44137 AS Decimal(18, 5)), N'5404 - 55th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2550, N'33417', CAST(29.58469 AS Decimal(18, 5)), CAST(-95.91137 AS Decimal(18, 5)), N'37211 HIGHWAY 36 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2551, N'33417_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2552, N'33601', CAST(53.30106 AS Decimal(18, 5)), CAST(-110.00667 AS Decimal(18, 5)), N'6210 - 50 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2553, N'33601_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY 17611 - 109A Ave', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2554, N'33603', CAST(52.96163 AS Decimal(18, 5)), CAST(-114.02728 AS Decimal(18, 5)), N'c/o WESTERN SPIRITS #23 VILLAGE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2555, N'33604', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O SEVICK VETERINARY SERVICES 1, 219 - 3RD AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2556, N'33606', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'OLDS COLLEGE ANIMAL SCIENCE BLDG 4500-50 ST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2557, N'33608', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'2500 University Dr  NW     S&R Animal Care Svs  Bio. Sci. 055', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2558, N'33610', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2559, N'33613', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2560, N'33613_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2561, N'33618', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Animal Res Ctr  Health Sc B301 3330 HOSPITAL DRIVE N.W. SHIP/REC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2562, N'33618_CFIALETHB', CAST(39.78527 AS Decimal(18, 5)), CAST(-85.76915 AS Decimal(18, 5)), N'TOWNSHIP ROAD 9 - 1 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2563, N'33624_BUS', CAST(39.75079 AS Decimal(18, 5)), CAST(-104.99101 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2564, N'33625', CAST(47.55398 AS Decimal(18, 5)), CAST(-122.33421 AS Decimal(18, 5)), N'5403 - 1ST AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2565, N'33625_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2566, N'33626', CAST(44.12279 AS Decimal(18, 5)), CAST(-92.67023 AS Decimal(18, 5)), N'11481 - 85th STREET NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2567, N'33627', CAST(42.34781 AS Decimal(18, 5)), CAST(-83.08585 AS Decimal(18, 5)), N'c/o 4746   14 STREET NE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2568, N'33628', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DEXTER OILFIELD 1250 BIGHORN AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2569, N'33628_FARM', CAST(50.72418 AS Decimal(18, 5)), CAST(-113.96682 AS Decimal(18, 5)), N'C/O AGRIFARM HEALTH CENTRE 72 NORH RAILWAY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2570, N'33628_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2571, N'33629', CAST(33.78623 AS Decimal(18, 5)), CAST(-84.39426 AS Decimal(18, 5)), N'200, 417 14th Street NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2572, N'33630', CAST(51.06658 AS Decimal(18, 5)), CAST(-114.13393 AS Decimal(18, 5)), N'HEALTH SC CENTRE RM 2535 C/O U OF C   3330 HOSPITAL DR.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2573, N'33631', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'17348 - TWP RD 593 (across from Royal Star Inn)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2574, N'33632', CAST(54.41079 AS Decimal(18, 5)), CAST(-7.17164 AS Decimal(18, 5)), N'PROVINCIAL BUILDING OFFICE 221 782 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2575, N'33634', CAST(53.52251 AS Decimal(18, 5)), CAST(-113.62419 AS Decimal(18, 5)), N'#1755, 8882 - 170 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2576, N'33634_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2577, N'33635', CAST(38.48489 AS Decimal(18, 5)), CAST(-122.40574 AS Decimal(18, 5)), N'12515 - 128 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2578, N'33637', CAST(51.12801 AS Decimal(18, 5)), CAST(-114.18031 AS Decimal(18, 5)), N'115 HAWKSIDE CLOSE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2579, N'33638', CAST(37.54801 AS Decimal(18, 5)), CAST(-93.87548 AS Decimal(18, 5)), N'HIGHWAY 39 NORTH AND 1ST STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2580, N'33639', CAST(51.06658 AS Decimal(18, 5)), CAST(-114.13393 AS Decimal(18, 5)), N'U OF C - HEALTH SCIENCE CENTER 3330 HOSPITAL DR. NW (RM 2535)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2581, N'33640', CAST(33.22993 AS Decimal(18, 5)), CAST(-97.19283 AS Decimal(18, 5)), N'4401 UNIVERSITY DRIVE WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2582, N'33641', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC FACILITY (HOLD FOR PICK UP) 17611 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2583, N'33641_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2584, N'33642', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O J''S FASHION AND DANCE 4909 - 50TH STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2585, N'33643', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'AGRICULTURE/FORESTRY CENTER ROOM 3-51 90 AVE & 116 ST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2586, N'33643_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2587, N'33644', CAST(39.97348 AS Decimal(18, 5)), CAST(116.30690 AS Decimal(18, 5)), N'FOOD SAFETY DIVISON ROOM 107,  6903 - 116 ST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2588, N'33644_ABAGAIRDR', CAST(51.29754 AS Decimal(18, 5)), CAST(-113.99821 AS Decimal(18, 5)), N'FOOD SAFETY DIVISION 97 EAST LAKE RAMP N.E.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2589, N'33644_ABAGFAIRV', CAST(39.97348 AS Decimal(18, 5)), CAST(116.30690 AS Decimal(18, 5)), N'FOOD SAFETY DIVISION 9309 - 113 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2590, N'33644_ABAGLETH', CAST(47.74430 AS Decimal(18, 5)), CAST(-97.49867 AS Decimal(18, 5)), N'3115 - 5 AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2591, N'33644_DIVAKER', CAST(35.58441 AS Decimal(18, 5)), CAST(-97.64305 AS Decimal(18, 5)), N'SUITE 307, 7000 - 113th STREET N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2592, N'33644_STETTLER', CAST(52.32743 AS Decimal(18, 5)), CAST(-112.70012 AS Decimal(18, 5)), N'C/O STETTLER VETERINARY CLINIC LTD. 4605 51 AVENEUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2593, N'33644_STPAUL', CAST(53.98950 AS Decimal(18, 5)), CAST(-111.29737 AS Decimal(18, 5)), N'C/O ST PAUL VETERINARY CLINIC INC 4802-50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2594, N'33645', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O HIGH RIVER VET CLINIC #3, 938 CENTRE STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2595, N'33646', CAST(53.54191 AS Decimal(18, 5)), CAST(-113.92470 AS Decimal(18, 5)), N'c/o CARTRIDGE EXPRESS (Puro Depot) 16 WESTWAY ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2596, N'33646_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2597, N'33647', CAST(51.14608 AS Decimal(18, 5)), CAST(-114.28141 AS Decimal(18, 5)), N'253147 UNIT A BEARSPAW ROAD N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2598, N'33648', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O VALUE DRUG MART HOLD PICKU #134, 4925 - 50 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2599, N'33649', CAST(53.27302 AS Decimal(18, 5)), CAST(-113.55120 AS Decimal(18, 5)), N'c/o COMMUNICATIONS 2000 (DEPOT) 5906 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2600, N'33651', CAST(50.96809 AS Decimal(18, 5)), CAST(-114.07352 AS Decimal(18, 5)), N'C/O BRICK PLAZA  (PURO DEPOT) 9661 MACLEOD TRAIL  SW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2601, N'33653', CAST(29.76624 AS Decimal(18, 5)), CAST(-95.35985 AS Decimal(18, 5)), N'1 MAIN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2602, N'33654', CAST(50.72036 AS Decimal(18, 5)), CAST(-113.99313 AS Decimal(18, 5)), N'76 SHEEP RIVER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2603, N'33655', CAST(50.72495 AS Decimal(18, 5)), CAST(-113.97132 AS Decimal(18, 5)), N'C/O BIG ROCK ANIMAL CLINIC 47 McRAE STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2604, N'33656', CAST(52.96076 AS Decimal(18, 5)), CAST(-113.36604 AS Decimal(18, 5)), N'C/O PARKLAND AG AND AUTO 4102 - 47 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2605, N'33657', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO DEPOT 4405-47 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2606, N'33658', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2607, N'33663', CAST(53.50148 AS Decimal(18, 5)), CAST(-113.45391 AS Decimal(18, 5)), N'C/O Canadian Food Inspection Agency 8403 CORONET ROAD NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2608, N'33667', CAST(46.44379 AS Decimal(18, 5)), CAST(-101.02714 AS Decimal(18, 5)), N'6503 - 67th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2609, N'33675', CAST(51.16003 AS Decimal(18, 5)), CAST(-114.21685 AS Decimal(18, 5)), N'11877 85 St. NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2610, N'33681', CAST(44.12279 AS Decimal(18, 5)), CAST(-92.67023 AS Decimal(18, 5)), N'11481 - 85th ST. N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2611, N'33682', CAST(51.06568 AS Decimal(18, 5)), CAST(-114.13502 AS Decimal(18, 5)), N'HSC 2535, 3330 HOSPITAL DRIVE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2612, N'33686_FOREST', CAST(51.01615 AS Decimal(18, 5)), CAST(-113.98303 AS Decimal(18, 5)), N'C/O FOREST LAWN AUTO PARTS 4215 - 35th STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2613, N'33691', CAST(39.78527 AS Decimal(18, 5)), CAST(-85.76915 AS Decimal(18, 5)), N'TOWNSHIP ROAD 9 - 1 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2614, N'33691_CZUB', CAST(39.78527 AS Decimal(18, 5)), CAST(-85.76915 AS Decimal(18, 5)), N'TOWNSHIP ROAD 9 - 1 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2615, N'33692', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o PUROLATOR DEPOT HOLD FOR PICKUP 2319 TAYLOR DRIVE BUILDING B', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2616, N'33693', CAST(21.70407 AS Decimal(18, 5)), CAST(73.00285 AS Decimal(18, 5)), N'C/O PUROLATOR DEPOT 200 MAIN AVENUE WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2617, N'33698', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO AGENT- COMMUNICATIONS 2000      6B, 5904 - 50 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2618, N'33699', CAST(41.69297 AS Decimal(18, 5)), CAST(-88.14304 AS Decimal(18, 5)), N'R.R. 1, SITE 16, BOX 6 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2619, N'33901', CAST(40.73362 AS Decimal(18, 5)), CAST(-73.90781 AS Decimal(18, 5)), N'4128 53 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2620, N'33903', CAST(44.82627 AS Decimal(18, 5)), CAST(-93.53300 AS Decimal(18, 5)), N'404A PIONEER TRAIL ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2621, N'33905', CAST(44.89653 AS Decimal(18, 5)), CAST(-116.09501 AS Decimal(18, 5)), N'209-3 STREET SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2622, N'33905_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'PICKUP AT WDDC 17611-109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2623, N'33906', CAST(42.73729 AS Decimal(18, 5)), CAST(-93.73365 AS Decimal(18, 5)), N'121 - 6th AVENUE N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2624, N'33907', CAST(53.70667 AS Decimal(18, 5)), CAST(-114.18481 AS Decimal(18, 5)), N'5119 LAC STE ANNE TRAIL NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2625, N'33911', CAST(44.34771 AS Decimal(18, 5)), CAST(-88.67324 AS Decimal(18, 5)), N'#20, 2902 - 15 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2626, N'33912', CAST(33.54884 AS Decimal(18, 5)), CAST(-101.92097 AS Decimal(18, 5)), N'5135 - 50TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2627, N'33915', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HWAY 44  3 MILES S.OF FAWCETT ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2628, N'33915_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2629, N'33916', CAST(38.51020 AS Decimal(18, 5)), CAST(-121.45189 AS Decimal(18, 5)), N'6411 - 46th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2630, N'33917', CAST(42.08362 AS Decimal(18, 5)), CAST(-91.07343 AS Decimal(18, 5)), N'10406 - 100 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2631, N'33917_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2632, N'33923', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CLINICAL SKILL BUILD. SPY HILL 11877-85 STREET NW ROOM: 154', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2633, N'33930', CAST(34.64199 AS Decimal(18, 5)), CAST(-78.80563 AS Decimal(18, 5)), N'61219 HIGHWAY 41 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2634, N'33931', CAST(49.64693 AS Decimal(18, 5)), CAST(-112.71226 AS Decimal(18, 5)), N'82038   RR 210 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2635, N'33931_REDDEER', CAST(42.35232 AS Decimal(18, 5)), CAST(-71.07724 AS Decimal(18, 5)), N'BAY C 119 - 39105 HIGHWAY 2A ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2636, N'33939', CAST(29.68872 AS Decimal(18, 5)), CAST(-82.39203 AS Decimal(18, 5)), N'4602 - 39 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2637, N'33940', CAST(40.77714 AS Decimal(18, 5)), CAST(-73.91810 AS Decimal(18, 5)), N'2322 - 24TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2638, N'33942', CAST(-28.06183 AS Decimal(18, 5)), CAST(153.35436 AS Decimal(18, 5)), N'#2, 4213 - 42 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2639, N'33942_FOOD', CAST(-28.06183 AS Decimal(18, 5)), CAST(153.35436 AS Decimal(18, 5)), N'#2,  4213 - 42 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2640, N'33943', CAST(42.08345 AS Decimal(18, 5)), CAST(-71.00565 AS Decimal(18, 5)), N'110 - 355 CENTRE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2641, N'33974', CAST(33.75675 AS Decimal(18, 5)), CAST(-116.97698 AS Decimal(18, 5)), N'6110 IMPERIAL WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2642, N'33978', CAST(42.97005 AS Decimal(18, 5)), CAST(-94.42185 AS Decimal(18, 5)), N'1402 - 20th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2643, N'33998', CAST(50.74813 AS Decimal(18, 5)), CAST(-113.97753 AS Decimal(18, 5)), N'322233 - 15 STREET EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2644, N'33999', CAST(33.50248 AS Decimal(18, 5)), CAST(-86.83232 AS Decimal(18, 5)), N'125 - 1ST AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2645, N'34002', CAST(27.97282 AS Decimal(18, 5)), CAST(-82.59990 AS Decimal(18, 5)), N'51424 HWY 60 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2646, N'34002_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2647, N'34004', CAST(42.73207 AS Decimal(18, 5)), CAST(-94.65586 AS Decimal(18, 5)), N'23164 TWP 520 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2648, N'34005', CAST(50.68860 AS Decimal(18, 5)), CAST(-113.97834 AS Decimal(18, 5)), N'112117 - 402 Ave E Foothills No 31', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2649, N'34006', CAST(51.75109 AS Decimal(18, 5)), CAST(-0.33430 AS Decimal(18, 5)), N'C/O NORTHLANDS CONTROL OFFICE 11433 - 79 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2650, N'34006_PICKUP', CAST(37.86637 AS Decimal(18, 5)), CAST(-122.28412 AS Decimal(18, 5)), N'WDDC FACILITY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2651, N'34007', CAST(53.48646 AS Decimal(18, 5)), CAST(-113.17596 AS Decimal(18, 5)), N'c/o DELANEY VETERINARY SERVICE 52218 RANGE ROAD 223', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2652, N'34008_NORTHLAND', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O EDM. NORTHLAND CONTROL OFF 11433-79 STREET  (DR. BURKO)', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2653, N'34010', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2654, N'34011', CAST(51.42564 AS Decimal(18, 5)), CAST(-114.02959 AS Decimal(18, 5)), N'c/o MY PLACE ESSO 920 RAILWAY ST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2655, N'34011_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2656, N'34014', CAST(40.74097 AS Decimal(18, 5)), CAST(-80.75387 AS Decimal(18, 5)), N'51110 HWY 870 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2657, N'34014_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2658, N'34019_LOOMISDEP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'LOOMIS DEPOT   HOLD FOR PICKUP BAY 108  6660 TAYLOR DRIVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2659, N'34022', CAST(-34.99059 AS Decimal(18, 5)), CAST(138.59713 AS Decimal(18, 5)), N'244071 PANORAMA RIDGE SW (SPRINGBANK)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2660, N'34032', CAST(51.18578 AS Decimal(18, 5)), CAST(-113.99901 AS Decimal(18, 5)), N'260048A WRITING CREEK CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2661, N'34032_BUS', CAST(36.17042 AS Decimal(18, 5)), CAST(-115.14747 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2662, N'34041', CAST(50.72609 AS Decimal(18, 5)), CAST(-113.98181 AS Decimal(18, 5)), N'BIG ROCK COMM.  (PURO DEPOT) 118 ELIZABETH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2663, N'34041_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2664, N'34041_PURO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'AUTO TRENDZ (PURO DEPOT) 2003 - 10 AVE SE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2665, N'34090', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2666, N'34090_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2667, N'34111', CAST(42.78169 AS Decimal(18, 5)), CAST(-71.30253 AS Decimal(18, 5)), N'265 52307 RANGE ROAD 213 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2668, N'34111_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2669, N'34222', CAST(53.45829 AS Decimal(18, 5)), CAST(-113.22259 AS Decimal(18, 5)), N'52024 RANGE ROAD 225 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2670, N'34222_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ORDERS ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2671, N'34444', CAST(40.87150 AS Decimal(18, 5)), CAST(-81.41558 AS Decimal(18, 5)), N'1425 SUMMIT STREET SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2672, N'34444_BUS', CAST(51.04612 AS Decimal(18, 5)), CAST(-114.09924 AS Decimal(18, 5)), N'833 GREYHOUND WAY SW BUS DEPOT      HOLD FOR PICKUP', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2673, N'34600', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICK UP AT WDDC ONLY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2674, N'34900', CAST(33.54880 AS Decimal(18, 5)), CAST(-101.90724 AS Decimal(18, 5)), N'4500-50TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2675, N'34908', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O EDMONTON NORTHLANDS CONTROL OFF 11433 - 79 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2676, N'34914', CAST(33.51205 AS Decimal(18, 5)), CAST(-112.19136 AS Decimal(18, 5)), N'5116 - 61 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2677, N'36001', CAST(51.79065 AS Decimal(18, 5)), CAST(-114.09463 AS Decimal(18, 5)), N'c/o OLDS COLLEGE 4500 - 50 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2678, N'36004', CAST(51.07293 AS Decimal(18, 5)), CAST(-114.14037 AS Decimal(18, 5)), N'3707 UNDERHILL PLACE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2679, N'36004_LACKAWANN', CAST(40.72793 AS Decimal(18, 5)), CAST(-73.98848 AS Decimal(18, 5)), N'c/o 115 2 nd AVENUE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2680, N'36011_ARCEDMONT', CAST(53.44557 AS Decimal(18, 5)), CAST(-113.47531 AS Decimal(18, 5)), N'250 KARL CLARK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2681, N'36011_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o WDDC pickup at WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2682, N'36016', CAST(38.66754 AS Decimal(18, 5)), CAST(-90.61897 AS Decimal(18, 5)), N'11762 - 106 STREET DIRECTLY TO ROOM X100', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2683, N'36016_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2684, N'36017', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CW401 BIO SCI BLDG U OF A ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2685, N'36017_PROVLAB', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'2B 501 Walter MacKenzie Centre 11320 83 Ave NW', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2686, N'36018', CAST(44.94874 AS Decimal(18, 5)), CAST(-95.50278 AS Decimal(18, 5)), N'4500 - 50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2687, N'36018_EQUINE', CAST(44.94874 AS Decimal(18, 5)), CAST(-95.50278 AS Decimal(18, 5)), N'4500 - 50 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2688, N'36022', CAST(27.86164 AS Decimal(18, 5)), CAST(-82.79413 AS Decimal(18, 5)), N'11235 - 98th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2689, N'36030', CAST(33.48911 AS Decimal(18, 5)), CAST(-101.87030 AS Decimal(18, 5)), N'U OF A 11560 UNIVERSITY AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2690, N'36055', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CALGARY ZOO ANIMAL HEALTH CNTR 1625 CENTER AVE E. ACCESS OFF', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2691, N'36056', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'1-132 LI KA SHING CENTRE SOUTH LOADING DOCK', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2692, N'36056_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2693, N'36106', CAST(30.43771 AS Decimal(18, 5)), CAST(-91.13060 AS Decimal(18, 5)), N'5707 COLLEGE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2694, N'36106_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2695, N'36109_STUDENT1', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O WDDC HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2696, N'36606', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HSC G380C, 3280 HOSPITAL DRIVE NW ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2697, N'36900', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'AHT PROGRAM 11235-98th AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2698, N'41000', CAST(29.38053 AS Decimal(18, 5)), CAST(-98.45329 AS Decimal(18, 5)), N'200, 33468 McDOUGALL AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2699, N'41004', CAST(50.65836 AS Decimal(18, 5)), CAST(-120.36743 AS Decimal(18, 5)), N'C/O KAMLOOPS LRGE ANIMAL VET CLINIC 1465 CARIBOO PLACE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2700, N'41042', CAST(50.41302 AS Decimal(18, 5)), CAST(-119.23259 AS Decimal(18, 5)), N'4234 HALES ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2701, N'41044', CAST(38.98606 AS Decimal(18, 5)), CAST(-82.37858 AS Decimal(18, 5)), N'1180 CHERRY POINT ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2702, N'41111', CAST(30.41932 AS Decimal(18, 5)), CAST(-91.19155 AS Decimal(18, 5)), N'#5,  1345 ASTER STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2703, N'41133', CAST(49.14006 AS Decimal(18, 5)), CAST(-123.92804 AS Decimal(18, 5)), N'C/O PETROGLYPH ANIMAL HOSPITAL 990 OLD VICTORIA ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2704, N'41601', CAST(49.78399 AS Decimal(18, 5)), CAST(-125.05837 AS Decimal(18, 5)), N'6635 B ISLAND HIGHWAY NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2705, N'41604', CAST(41.97928 AS Decimal(18, 5)), CAST(-112.70926 AS Decimal(18, 5)), N'BOX 3030 #8, 2025 GRANITE AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2706, N'41607', CAST(50.27332 AS Decimal(18, 5)), CAST(-111.19052 AS Decimal(18, 5)), N'Defence Research Suffield 19 CDN Forces Base Suffield', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2707, N'41614', CAST(48.57200 AS Decimal(18, 5)), CAST(-123.40226 AS Decimal(18, 5)), N'202-6981 EAST SAANICH ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2708, N'41615', CAST(43.16114 AS Decimal(18, 5)), CAST(-85.84919 AS Decimal(18, 5)), N'21566 - 24th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2709, N'41615_LOOMISAIR', CAST(43.16114 AS Decimal(18, 5)), CAST(-85.84919 AS Decimal(18, 5)), N'21566 - 24TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2710, N'41616', CAST(49.12950 AS Decimal(18, 5)), CAST(-122.73390 AS Decimal(18, 5)), N'6986-176 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2711, N'41620', CAST(40.77344 AS Decimal(18, 5)), CAST(-73.78989 AS Decimal(18, 5)), N'20106 - 27TH AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2712, N'41630_MAPLEPOUL', CAST(36.12509 AS Decimal(18, 5)), CAST(-95.87509 AS Decimal(18, 5)), N'2619 - 91st AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2713, N'41633', CAST(49.82325 AS Decimal(18, 5)), CAST(-119.43374 AS Decimal(18, 5)), N'4656 WALLACE HILL ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2714, N'41675', CAST(49.12950 AS Decimal(18, 5)), CAST(-122.73390 AS Decimal(18, 5)), N'6986 - 176 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2715, N'41677', CAST(44.90063 AS Decimal(18, 5)), CAST(-91.14762 AS Decimal(18, 5)), N'25930 - 40th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2716, N'41677_PUROAIR', CAST(44.90063 AS Decimal(18, 5)), CAST(-91.14762 AS Decimal(18, 5)), N'25930 - 40th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2717, N'41680', CAST(44.03801 AS Decimal(18, 5)), CAST(-102.04616 AS Decimal(18, 5)), N'8036 - 232nd STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2718, N'41686', CAST(49.10735 AS Decimal(18, 5)), CAST(-122.29386 AS Decimal(18, 5)), N'5814 RIVERSIDE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2719, N'41696', CAST(49.76210 AS Decimal(18, 5)), CAST(-125.04142 AS Decimal(18, 5)), N'6096 LEDINGHAM ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2720, N'42003', CAST(40.63363 AS Decimal(18, 5)), CAST(-73.97063 AS Decimal(18, 5)), N'3827 - 18 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2721, N'42004_BRINGNESS', CAST(38.52951 AS Decimal(18, 5)), CAST(-121.44832 AS Decimal(18, 5)), N'5024 - 49th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2722, N'42004_MRINGNESS', CAST(40.76780 AS Decimal(18, 5)), CAST(-73.86846 AS Decimal(18, 5)), N'11325 - 102 Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2723, N'42004_ROCKYM', CAST(30.32086 AS Decimal(18, 5)), CAST(-97.75357 AS Decimal(18, 5)), N'#1, 2800 - 45 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2724, N'42005', CAST(49.18997 AS Decimal(18, 5)), CAST(-122.84133 AS Decimal(18, 5)), N'#2, 10318 E, WHALLEY BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2725, N'42005_DHLAIR', CAST(49.18997 AS Decimal(18, 5)), CAST(-122.84133 AS Decimal(18, 5)), N'#2, 10318E WHALLEY BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2726, N'42006', CAST(46.61041 AS Decimal(18, 5)), CAST(-120.52309 AS Decimal(18, 5)), N'1204 WILLOW STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2727, N'42007_LOOMISAIR', CAST(40.72389 AS Decimal(18, 5)), CAST(-74.07090 AS Decimal(18, 5)), N'15 DUNCAN AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2728, N'42008', CAST(40.74221 AS Decimal(18, 5)), CAST(-73.82784 AS Decimal(18, 5)), N'155, 7135 - 138TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2729, N'42009', CAST(49.86056 AS Decimal(18, 5)), CAST(-119.47512 AS Decimal(18, 5)), N'1155 KLO ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2730, N'42010', CAST(50.03544 AS Decimal(18, 5)), CAST(-119.40323 AS Decimal(18, 5)), N'10564 POWLEY COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2731, N'42010_PUROAIR', CAST(50.03544 AS Decimal(18, 5)), CAST(-119.40323 AS Decimal(18, 5)), N'10564 POWLEY COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2732, N'42011', CAST(49.62028 AS Decimal(18, 5)), CAST(-124.02254 AS Decimal(18, 5)), N'101-12890 MADEIRA PARK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2733, N'42012', CAST(49.34345 AS Decimal(18, 5)), CAST(-123.08636 AS Decimal(18, 5)), N'3759 DELBROOK AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2734, N'42013', CAST(56.24607 AS Decimal(18, 5)), CAST(-120.86255 AS Decimal(18, 5)), N'10903 - 100 AVENUE. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2735, N'42014', CAST(49.26094 AS Decimal(18, 5)), CAST(-123.11633 AS Decimal(18, 5)), N'C/O CITY SQUARE 555 - 12TH AVE W', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2736, N'42016', CAST(41.53736 AS Decimal(18, 5)), CAST(-87.43976 AS Decimal(18, 5)), N'A   2800 45th  AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2737, N'42017', CAST(38.10666 AS Decimal(18, 5)), CAST(-78.97350 AS Decimal(18, 5)), N'130 - 3671 WESTMINISTER HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2738, N'42018', CAST(45.51684 AS Decimal(18, 5)), CAST(-123.06589 AS Decimal(18, 5)), N'460 S. DOGWOOD STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2739, N'42018_AIR', CAST(45.51684 AS Decimal(18, 5)), CAST(-123.06589 AS Decimal(18, 5)), N'460 S. DOGWOOD STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2740, N'42019', CAST(33.94386 AS Decimal(18, 5)), CAST(-84.73083 AS Decimal(18, 5)), N'152 DALLAS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2741, N'42021', CAST(34.23560 AS Decimal(18, 5)), CAST(-77.94210 AS Decimal(18, 5)), N'550 MARK STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2742, N'42022', CAST(41.59326 AS Decimal(18, 5)), CAST(-112.04292 AS Decimal(18, 5)), N'666B MEMORIAL AVE BOX 341', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2743, N'42023', CAST(49.05315 AS Decimal(18, 5)), CAST(-122.86719 AS Decimal(18, 5)), N'12823 CRESCENT ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2744, N'42024', CAST(34.28407 AS Decimal(18, 5)), CAST(-112.75991 AS Decimal(18, 5)), N'6948 PIONEER AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2745, N'42025', CAST(54.78218 AS Decimal(18, 5)), CAST(-127.16809 AS Decimal(18, 5)), N'C/O ALL SEASONS AUTOMOTIVE HWY 16 MAIN STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2746, N'42030', CAST(50.25575 AS Decimal(18, 5)), CAST(-119.26200 AS Decimal(18, 5)), N'1901 KALAMALKA LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2747, N'42030_PUROAIR', CAST(42.61331 AS Decimal(18, 5)), CAST(-87.84590 AS Decimal(18, 5)), N'2700 - 30th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2748, N'42037', CAST(42.45758 AS Decimal(18, 5)), CAST(-92.17310 AS Decimal(18, 5)), N'1 - 8337 YOUNG ROAD SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2749, N'42038', CAST(39.77074 AS Decimal(18, 5)), CAST(-105.11934 AS Decimal(18, 5)), N'3887 OAK STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2750, N'42044', CAST(45.80333 AS Decimal(18, 5)), CAST(-93.54750 AS Decimal(18, 5)), N'#106, 17670 - 65A Ave ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2751, N'42049', CAST(37.37697 AS Decimal(18, 5)), CAST(-89.38997 AS Decimal(18, 5)), N'4951 NO 3 ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2752, N'42050', CAST(49.27277 AS Decimal(18, 5)), CAST(-123.02697 AS Decimal(18, 5)), N'1350 KOOTENAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2753, N'42055', CAST(32.33356 AS Decimal(18, 5)), CAST(-90.30537 AS Decimal(18, 5)), N'111 MCDONALD DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2754, N'42055_ANNA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SANGSTER ANNA (DVM) 2124 YMIR ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2755, N'42055_PUROAIR', CAST(49.47538 AS Decimal(18, 5)), CAST(-117.29055 AS Decimal(18, 5)), N'2124 YMIR ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2756, N'42057', CAST(48.78675 AS Decimal(18, 5)), CAST(-123.70993 AS Decimal(18, 5)), N'1057 CANADA AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2757, N'42057_PUROAIR', CAST(48.78675 AS Decimal(18, 5)), CAST(-123.70993 AS Decimal(18, 5)), N'1057 CANADA AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2758, N'42063', CAST(49.23313 AS Decimal(18, 5)), CAST(-124.04786 AS Decimal(18, 5)), N'6550 METRAL DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2759, N'42082', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DHALIWAL BALWINDER/ SEKHON K 9238 - 164th STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2760, N'42087', CAST(49.87766 AS Decimal(18, 5)), CAST(-119.45762 AS Decimal(18, 5)), N'1987 KIRSCHNER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2761, N'42097', CAST(49.24370 AS Decimal(18, 5)), CAST(-124.80635 AS Decimal(18, 5)), N'4907 BUTE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2762, N'42102', CAST(50.67587 AS Decimal(18, 5)), CAST(-120.31770 AS Decimal(18, 5)), N'#102, 945 LORNE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2763, N'42111', CAST(49.48999 AS Decimal(18, 5)), CAST(-117.29190 AS Decimal(18, 5)), N'501 CARBONATE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2764, N'42111_AIRSHIP', CAST(49.48999 AS Decimal(18, 5)), CAST(-117.29190 AS Decimal(18, 5)), N'501 CARBONATE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2765, N'42112', CAST(49.86634 AS Decimal(18, 5)), CAST(-119.56683 AS Decimal(18, 5)), N'112, 2476 WESTLAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2766, N'42129', CAST(53.86910 AS Decimal(18, 5)), CAST(-122.77703 AS Decimal(18, 5)), N'5129 DOMANO BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2767, N'42138', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MALHOTRA RANDEEP (DVM) 9460 - 153 A STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2768, N'42140', CAST(49.91647 AS Decimal(18, 5)), CAST(-119.44329 AS Decimal(18, 5)), N'124 - 1940 KANE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2769, N'42150', CAST(49.88053 AS Decimal(18, 5)), CAST(-119.46442 AS Decimal(18, 5)), N'6 - 1551 SUTHERLAND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2770, N'42162', CAST(34.02450 AS Decimal(18, 5)), CAST(-118.14975 AS Decimal(18, 5)), N'6620 EAST HASTINGS STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2771, N'42188', CAST(49.26704 AS Decimal(18, 5)), CAST(-123.02554 AS Decimal(18, 5)), N'KUZMA ALAN (DVM) 1988 KOOTENAY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2772, N'42188_AIRSHIP', CAST(49.26701 AS Decimal(18, 5)), CAST(-123.02523 AS Decimal(18, 5)), N'1988 KOOTENAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2773, N'42195', CAST(33.82888 AS Decimal(18, 5)), CAST(-117.95173 AS Decimal(18, 5)), N'1956 WEST BROADWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2774, N'42260', CAST(29.77955 AS Decimal(18, 5)), CAST(-95.72167 AS Decimal(18, 5)), N'595 HOUGHTON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2775, N'42301', CAST(27.74285 AS Decimal(18, 5)), CAST(-80.53156 AS Decimal(18, 5)), N'8156 - 100TH AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2776, N'42335', CAST(49.91780 AS Decimal(18, 5)), CAST(-119.39305 AS Decimal(18, 5)), N'3355 SEXSMITH ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2777, N'42411', CAST(48.53419 AS Decimal(18, 5)), CAST(-123.38905 AS Decimal(18, 5)), N'5411 HAMSTERLY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2778, N'42425', CAST(19.27177 AS Decimal(18, 5)), CAST(-155.48010 AS Decimal(18, 5)), N'6830 WEST COAST ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2779, N'42601', CAST(49.31680 AS Decimal(18, 5)), CAST(-122.97111 AS Decimal(18, 5)), N'170-3650 MOUNT SEYMOUR PKWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2780, N'42610', CAST(40.69922 AS Decimal(18, 5)), CAST(-99.08910 AS Decimal(18, 5)), N'510 WEST 24 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2781, N'42614_BUS', CAST(49.52459 AS Decimal(18, 5)), CAST(-115.75481 AS Decimal(18, 5)), N'GREYHOUND DEPOT 1229 CRANBROOK STREET NORTH', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2782, N'42617', CAST(41.23544 AS Decimal(18, 5)), CAST(-122.27172 AS Decimal(18, 5)), N'2728 DUNSMUIR AVENUE PO BOX 1150', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2783, N'42627', CAST(44.80919 AS Decimal(18, 5)), CAST(-91.48261 AS Decimal(18, 5)), N'760 RODERICK STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2784, N'42627_LOOMISAIR', CAST(44.80919 AS Decimal(18, 5)), CAST(-91.48261 AS Decimal(18, 5)), N'760 RODERICK STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2785, N'42629', CAST(49.46904 AS Decimal(18, 5)), CAST(-119.58499 AS Decimal(18, 5)), N'2503 SKAHA LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2786, N'42634_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2787, N'42636', CAST(36.16331 AS Decimal(18, 5)), CAST(-115.13679 AS Decimal(18, 5)), N'1001 LOWIS AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2788, N'42636_PUROAIR', CAST(36.16331 AS Decimal(18, 5)), CAST(-115.13679 AS Decimal(18, 5)), N'1001 LOWIS AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2789, N'42643', CAST(46.91162 AS Decimal(18, 5)), CAST(-117.08644 AS Decimal(18, 5)), N'2962  272 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2790, N'42645', CAST(49.15482 AS Decimal(18, 5)), CAST(-123.12488 AS Decimal(18, 5)), N'140-8040 GARDEN CITY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2791, N'42651', CAST(48.78273 AS Decimal(18, 5)), CAST(-122.55991 AS Decimal(18, 5)), N'1455 MARINE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2792, N'42654', CAST(41.12094 AS Decimal(18, 5)), CAST(-87.72474 AS Decimal(18, 5)), N'#1 1835 - 56 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2793, N'42656', CAST(41.41415 AS Decimal(18, 5)), CAST(-72.98116 AS Decimal(18, 5)), N'130 - 2300 CARRINGTON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2794, N'42657', CAST(46.42070 AS Decimal(18, 5)), CAST(-94.35489 AS Decimal(18, 5)), N'8450 GREEN GABLES ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2795, N'42658', CAST(30.34412 AS Decimal(18, 5)), CAST(-81.68496 AS Decimal(18, 5)), N'1700 KINGS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2796, N'42661_DRDHALIWA', CAST(40.70536 AS Decimal(18, 5)), CAST(-73.79582 AS Decimal(18, 5)), N'11263 - 164TH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2797, N'42665', CAST(47.40428 AS Decimal(18, 5)), CAST(-92.94152 AS Decimal(18, 5)), N'3851 FIRST AVENUE PO BOX 3358', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2798, N'42668', CAST(49.11754 AS Decimal(18, 5)), CAST(-122.65666 AS Decimal(18, 5)), N'#306, 6325 - 204th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2799, N'42668_DHLAIR', CAST(49.11754 AS Decimal(18, 5)), CAST(-122.65666 AS Decimal(18, 5)), N'#306, 6325 - 204th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2800, N'42678', CAST(37.44537 AS Decimal(18, 5)), CAST(-122.16702 AS Decimal(18, 5)), N'260-2083 ALMA STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2801, N'42681', CAST(47.58277 AS Decimal(18, 5)), CAST(-122.67720 AS Decimal(18, 5)), N'2415 MARINE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2802, N'42682', CAST(45.74664 AS Decimal(18, 5)), CAST(-94.94375 AS Decimal(18, 5)), N'2800-28 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2803, N'42683', CAST(49.28135 AS Decimal(18, 5)), CAST(-123.01664 AS Decimal(18, 5)), N'BHULLAR HAKAM (DVM) 3995 HASTINGS STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2804, N'42684', CAST(49.68678 AS Decimal(18, 5)), CAST(-124.99271 AS Decimal(18, 5)), N'1380 CLIFFE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2805, N'42685', CAST(40.18149 AS Decimal(18, 5)), CAST(-75.05643 AS Decimal(18, 5)), N'#100 - 5500 WHARF STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2806, N'42686', CAST(49.28073 AS Decimal(18, 5)), CAST(-123.12491 AS Decimal(18, 5)), N'C/O PURO DEPOT (POSTNET BC104) 991 HORNBY STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2807, N'42687', CAST(38.84402 AS Decimal(18, 5)), CAST(-121.28628 AS Decimal(18, 5)), N'#726 - 2601 WESTVIEW DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2808, N'42688_PUROAIR', CAST(48.56544 AS Decimal(18, 5)), CAST(-123.41256 AS Decimal(18, 5)), N'2126A KEATING CROSS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2809, N'42695', CAST(34.78020 AS Decimal(18, 5)), CAST(-82.09241 AS Decimal(18, 5)), N'5595 HWY 101 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2810, N'42697', CAST(32.71145 AS Decimal(18, 5)), CAST(-97.40819 AS Decimal(18, 5)), N'7195 HORNE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2811, N'42698_PUROAIR', CAST(39.73303 AS Decimal(18, 5)), CAST(-105.04342 AS Decimal(18, 5)), N'4362 WEST 10th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2812, N'42699', CAST(43.31195 AS Decimal(18, 5)), CAST(-82.53383 AS Decimal(18, 5)), N'3969 LAKESHORE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2813, N'42699_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2814, N'42702', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SUMMA ANNE-LII  (DVM) 2450 HAYES ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2815, N'42702_PUROAIR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'SWABEY ANNE-LII (DVM) 2450 HAYES ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2816, N'42704_DHLAIR', CAST(49.09045 AS Decimal(18, 5)), CAST(-123.07995 AS Decimal(18, 5)), N'5229-C LADNER TRUNK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2817, N'42711_BUS', CAST(49.14211 AS Decimal(18, 5)), CAST(-121.95847 AS Decimal(18, 5)), N'c/o GREYHOUND BUS DEPOT 45745 LUCKAKUCK WAY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2818, N'42712', CAST(42.34594 AS Decimal(18, 5)), CAST(-83.10131 AS Decimal(18, 5)), N'5001 - 24 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2819, N'42714', CAST(49.11477 AS Decimal(18, 5)), CAST(-122.66604 AS Decimal(18, 5)), N'SUITE 150, 20015 LANGLEY BYPASS ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2820, N'42721', CAST(36.90382 AS Decimal(18, 5)), CAST(-121.64053 AS Decimal(18, 5)), N'1993 Riverside Road ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2821, N'42722', CAST(48.59382 AS Decimal(18, 5)), CAST(-123.40601 AS Decimal(18, 5)), N'2263 MT. NEWTON CROSS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2822, N'42726', CAST(41.51278 AS Decimal(18, 5)), CAST(-88.21484 AS Decimal(18, 5)), N'108, 2526 YALE COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2823, N'42732', CAST(49.30042 AS Decimal(18, 5)), CAST(-123.13083 AS Decimal(18, 5)), N'845 AVISON WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2824, N'42732_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2825, N'42733', CAST(49.30712 AS Decimal(18, 5)), CAST(-123.01772 AS Decimal(18, 5)), N'233 SEYMOUR RIVER PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2826, N'42738', CAST(49.21495 AS Decimal(18, 5)), CAST(-122.58968 AS Decimal(18, 5)), N'#103, 22838 LOUGHEED HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2827, N'42747', CAST(26.64346 AS Decimal(18, 5)), CAST(-81.87340 AS Decimal(18, 5)), N'#101 - 38147 CLEVELAND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2828, N'42747_DHLAIR', CAST(26.64346 AS Decimal(18, 5)), CAST(-81.87340 AS Decimal(18, 5)), N'#101, 38147 CLEVELAND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2829, N'42749', CAST(49.26511 AS Decimal(18, 5)), CAST(-122.77574 AS Decimal(18, 5)), N'2129 - 2850 SHAUGHNESSY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2830, N'42753', CAST(41.09043 AS Decimal(18, 5)), CAST(-81.54733 AS Decimal(18, 5)), N'277 WILDWOOD AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2831, N'42754', CAST(41.50188 AS Decimal(18, 5)), CAST(-72.03801 AS Decimal(18, 5)), N'128 - 8180 NO 2 ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2832, N'42756', CAST(27.72208 AS Decimal(18, 5)), CAST(-82.67879 AS Decimal(18, 5)), N'5036 - 55B STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2833, N'42765', CAST(44.44216 AS Decimal(18, 5)), CAST(-96.89141 AS Decimal(18, 5)), N'11961 - 203rd STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2834, N'42768', CAST(34.07499 AS Decimal(18, 5)), CAST(-118.27159 AS Decimal(18, 5)), N'2459 BELLEVUE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2835, N'42769', CAST(49.13687 AS Decimal(18, 5)), CAST(-122.84303 AS Decimal(18, 5)), N'UNIT 902, 7380 KING GEORGE BOULVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2836, N'42779', CAST(49.27659 AS Decimal(18, 5)), CAST(-123.11394 AS Decimal(18, 5)), N'893 EXPO BOULEVARD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2837, N'42783', CAST(49.11754 AS Decimal(18, 5)), CAST(-122.65666 AS Decimal(18, 5)), N'306, 6325 - 204th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2838, N'42783_DHLAIR', CAST(49.11754 AS Decimal(18, 5)), CAST(-122.65666 AS Decimal(18, 5)), N'306, 6325 - 204th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2839, N'42785', CAST(36.73440 AS Decimal(18, 5)), CAST(-78.72944 AS Decimal(18, 5)), N'4285 MacDONALD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2840, N'42785_PURO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O CITATION RV REPAIRS PURO DEPOT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2841, N'42789', CAST(49.10728 AS Decimal(18, 5)), CAST(-122.65974 AS Decimal(18, 5)), N'c/o LANGLEY VETERINARY CLINIC 5758 203 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2842, N'42794', CAST(49.13556 AS Decimal(18, 5)), CAST(-122.88796 AS Decimal(18, 5)), N'#110, 12101 - 72 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2843, N'42796', CAST(27.95977 AS Decimal(18, 5)), CAST(-82.44638 AS Decimal(18, 5)), N'1205 EAST 7th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2844, N'42798_PUROAIR', CAST(33.57690 AS Decimal(18, 5)), CAST(-112.07199 AS Decimal(18, 5)), N'#101, 9842 SECOND STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2845, N'42801', CAST(49.27248 AS Decimal(18, 5)), CAST(-123.02749 AS Decimal(18, 5)), N'1380 KOOTENAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2846, N'42901', CAST(48.44201 AS Decimal(18, 5)), CAST(-123.36975 AS Decimal(18, 5)), N'691 BURNSIDE ROAD EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2847, N'42902', CAST(42.53942 AS Decimal(18, 5)), CAST(-83.22043 AS Decimal(18, 5)), N'C - 591 WALLACE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2848, N'42903', CAST(50.03544 AS Decimal(18, 5)), CAST(-119.40323 AS Decimal(18, 5)), N'10564 POWLEY COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2849, N'42903_ARMSTRONG', CAST(50.44505 AS Decimal(18, 5)), CAST(-119.18462 AS Decimal(18, 5)), N'c/o ARMSTRONG VETERINARY CLINIC 3125 SMITH DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2850, N'42903_PUROAIR', CAST(50.03544 AS Decimal(18, 5)), CAST(-119.40323 AS Decimal(18, 5)), N'10564 POWLEY COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2851, N'42908', CAST(42.73278 AS Decimal(18, 5)), CAST(-94.21688 AS Decimal(18, 5)), N'611 - 10TH AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2852, N'42908_DHL', CAST(42.73278 AS Decimal(18, 5)), CAST(-94.21688 AS Decimal(18, 5)), N'611 - 10th  AVENUE NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2853, N'42953', CAST(36.50650 AS Decimal(18, 5)), CAST(-84.51406 AS Decimal(18, 5)), N'2303 ALBERTA STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2854, N'42987', CAST(49.85956 AS Decimal(18, 5)), CAST(-119.59170 AS Decimal(18, 5)), N'1816 - BYLAND ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2855, N'42990', CAST(49.21985 AS Decimal(18, 5)), CAST(-123.03967 AS Decimal(18, 5)), N'190, 3150 EAST 54TH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2856, N'43000', CAST(44.91517 AS Decimal(18, 5)), CAST(-91.12119 AS Decimal(18, 5)), N'27533  50th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2857, N'43001', CAST(49.96712 AS Decimal(18, 5)), CAST(-125.20976 AS Decimal(18, 5)), N'2566 SOUTH ISLAND HWY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2858, N'43002', CAST(43.30486 AS Decimal(18, 5)), CAST(-95.94090 AS Decimal(18, 5)), N'2372 LARCH AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2859, N'43002_DHL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DHL DEPOT C & C ESSO HIGHWAY 43', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2860, N'43003', CAST(38.61825 AS Decimal(18, 5)), CAST(-121.34162 AS Decimal(18, 5)), N'2933 GUNN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2861, N'43003_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP AT BUS DEPOT 1566- 12TH AVENUE.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2862, N'43004', CAST(29.57512 AS Decimal(18, 5)), CAST(-98.55717 AS Decimal(18, 5)), N'12229 ROAD 237 BOX 33', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2863, N'43004_EAGLESHAM', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O EAGLE 99 PARTS SERVICE DHL AGNT 240 MAIN STREET - HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2864, N'43004_FBARR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICKUP ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2865, N'43004_GRANDVIEW', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT - HOLD FOR PICKUP ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2866, N'43004_JADECASH', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PURO AGENT MIX S MERCANTILE HOLD FOR PICKUP 9905 - 100 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2867, N'43004_LEHMANN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DHL DEPOT  HOLD FOR PICKUP 8211 - 100 AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2868, N'43004_LJANSSEN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2869, N'43004_PEACELAND', CAST(45.69171 AS Decimal(18, 5)), CAST(-88.43362 AS Decimal(18, 5)), N'8824 - 101 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2870, N'43004_PEACEPORT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2871, N'43004_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2872, N'43004_PIGSRUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICKUP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2873, N'43004_PLAROUX', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2874, N'43004_RBLANCHET', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o DHL AT HEN GE FABRIC STORE MAIN STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2875, N'43004_SHADYLANE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O 49 MOTEL - DHL AGENT HOLD FOR PICKUP HIGHWAY 49', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2876, N'43004_VALLEYVIE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN DHL DEPOT HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2877, N'43004_VENTURE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O HENNEG0 FABRIC HOLD FOR PICKUP     221 MAIN STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2878, N'43006', CAST(50.51519 AS Decimal(18, 5)), CAST(-116.00930 AS Decimal(18, 5)), N'4854 ATHALMER RD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2879, N'43006_BUS', CAST(50.51515 AS Decimal(18, 5)), CAST(-116.02187 AS Decimal(18, 5)), N'INVERMERE PETRO CANADA 185 LAURIER STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2880, N'43006_DHL', CAST(42.36777 AS Decimal(18, 5)), CAST(-71.07902 AS Decimal(18, 5)), N'#5, 108 INDUSTRIAL ROAD UNIT 2 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2881, N'43006_GOLDEN', CAST(50.51519 AS Decimal(18, 5)), CAST(-116.00930 AS Decimal(18, 5)), N'c/o INVERMERE VET 4854 ATHALMER RD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2882, N'43008', CAST(40.69194 AS Decimal(18, 5)), CAST(-73.72372 AS Decimal(18, 5)), N'238 116 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2883, N'43008_PICKUP', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2884, N'43010', CAST(34.18640 AS Decimal(18, 5)), CAST(-81.94988 AS Decimal(18, 5)), N'Unit#6  111 ORIOLE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2885, N'43011', CAST(50.65836 AS Decimal(18, 5)), CAST(-120.36743 AS Decimal(18, 5)), N'1465 CARIBOO PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2886, N'43011_ALKALI', CAST(50.65836 AS Decimal(18, 5)), CAST(-120.36743 AS Decimal(18, 5)), N'1465 CARIBOO PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2887, N'43011_DOUGLAS', CAST(50.65836 AS Decimal(18, 5)), CAST(-120.36743 AS Decimal(18, 5)), N'1465 CARIBOO PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2888, N'43011_RISKECRK', CAST(50.65836 AS Decimal(18, 5)), CAST(-120.36743 AS Decimal(18, 5)), N'1465 CARIBOO PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2889, N'43012', CAST(38.78307 AS Decimal(18, 5)), CAST(-84.63404 AS Decimal(18, 5)), N'350 ALEXANDER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2890, N'43014', CAST(53.89994 AS Decimal(18, 5)), CAST(-122.79209 AS Decimal(18, 5)), N'2380 OSPIKA BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2891, N'43014_OSPPET', CAST(53.89999 AS Decimal(18, 5)), CAST(-122.79200 AS Decimal(18, 5)), N'2392 OSPIKA BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2892, N'43015', CAST(47.19707 AS Decimal(18, 5)), CAST(-98.36182 AS Decimal(18, 5)), N'1500-101 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2893, N'43015_DHL', CAST(47.19707 AS Decimal(18, 5)), CAST(-98.36182 AS Decimal(18, 5)), N'1500 - 101 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2894, N'43016', CAST(33.56794 AS Decimal(18, 5)), CAST(-101.86101 AS Decimal(18, 5)), N'2101 - 29TH CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2895, N'43017', CAST(40.56105 AS Decimal(18, 5)), CAST(-122.28654 AS Decimal(18, 5)), N'4615 CATTLE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2896, N'43017_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MAIN GREYHOUND DEPOT 215 DONALD ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2897, N'43018', CAST(35.84209 AS Decimal(18, 5)), CAST(-77.94202 AS Decimal(18, 5)), N'4568 HIGHWAY 97 NORTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2898, N'43019', CAST(54.08192 AS Decimal(18, 5)), CAST(-124.17552 AS Decimal(18, 5)), N'11879 BRAESIDE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2899, N'43019_PURO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O NORTHWEST BUSIN MACH. HOLD P/U 4721 LAZELLE AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2900, N'43021', CAST(41.39898 AS Decimal(18, 5)), CAST(-84.41921 AS Decimal(18, 5)), N'3918 WIELAND ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2901, N'43021_PHARM', CAST(41.39898 AS Decimal(18, 5)), CAST(-84.41921 AS Decimal(18, 5)), N'3918 WIELAND ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2902, N'43022', CAST(28.95976 AS Decimal(18, 5)), CAST(-96.70846 AS Decimal(18, 5)), N'990 OLD VICTORIA ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2903, N'43022_NECHAKO', CAST(54.08192 AS Decimal(18, 5)), CAST(-124.17552 AS Decimal(18, 5)), N'11879 BRAESIDE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2904, N'43023', CAST(40.55461 AS Decimal(18, 5)), CAST(-120.54931 AS Decimal(18, 5)), N'SUITE 4, 530 HORSE LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2905, N'43024', CAST(30.41932 AS Decimal(18, 5)), CAST(-91.19155 AS Decimal(18, 5)), N'5-1345 ASTER STREET PO BOX 260', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2906, N'43025', CAST(39.71068 AS Decimal(18, 5)), CAST(-88.46751 AS Decimal(18, 5)), N'460 EAST COLUMBIA STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2907, N'43026', CAST(42.15629 AS Decimal(18, 5)), CAST(-77.06072 AS Decimal(18, 5)), N'240 BRIDGE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2908, N'43028', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O LOOMIS DEPOT - HOLD FOR PICK UP 9701 - 13TH STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2909, N'43031', CAST(48.75514 AS Decimal(18, 5)), CAST(-122.47506 AS Decimal(18, 5)), N'1893 CORNWALL AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2910, N'43034', CAST(35.65110 AS Decimal(18, 5)), CAST(-93.00295 AS Decimal(18, 5)), N'3410 VICTOR ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2911, N'43043', CAST(50.24968 AS Decimal(18, 5)), CAST(-118.96563 AS Decimal(18, 5)), N'2143 SHUSWAP AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2912, N'43049', CAST(54.53579 AS Decimal(18, 5)), CAST(-128.60776 AS Decimal(18, 5)), N'4920 HALLIWELL AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2913, N'43055', CAST(33.51590 AS Decimal(18, 5)), CAST(-81.90494 AS Decimal(18, 5)), N'615 DUCAN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2914, N'43073', CAST(49.12839 AS Decimal(18, 5)), CAST(-122.61853 AS Decimal(18, 5)), N'21773 SMITH CRESCENT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2915, N'43074', CAST(41.22008 AS Decimal(18, 5)), CAST(-100.78628 AS Decimal(18, 5)), N'10412 - 97 STREET N ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2916, N'43077', CAST(36.16031 AS Decimal(18, 5)), CAST(-86.77772 AS Decimal(18, 5)), N'106 5  AVENUE S ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2917, N'43077_PUROLATOR', CAST(26.14059 AS Decimal(18, 5)), CAST(-81.80582 AS Decimal(18, 5)), N'106 - 5 AVENUE SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2918, N'43097', CAST(33.99817 AS Decimal(18, 5)), CAST(-118.32694 AS Decimal(18, 5)), N'5209 - 9 AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2919, N'43104', CAST(49.04075 AS Decimal(18, 5)), CAST(-122.26975 AS Decimal(18, 5)), N'c/o PURO DEPOT 2140 SUMAS WAY, SUITE 404', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2920, N'43105', CAST(44.39062 AS Decimal(18, 5)), CAST(-122.72724 AS Decimal(18, 5)), N'1605 DOGWOOD STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2921, N'43108', CAST(40.76735 AS Decimal(18, 5)), CAST(-73.97076 AS Decimal(18, 5)), N'829 - 5th AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2922, N'43120', CAST(48.65128 AS Decimal(18, 5)), CAST(-123.56079 AS Decimal(18, 5)), N'PO BOX 128 840 DELOUME ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2923, N'43148', CAST(50.81255 AS Decimal(18, 5)), CAST(-121.33288 AS Decimal(18, 5)), N'1348 OLD CARIBOU ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2924, N'43171', CAST(37.51433 AS Decimal(18, 5)), CAST(-122.25926 AS Decimal(18, 5)), N'315 INDUSTRIAL ROAD F ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2925, N'43185', CAST(56.27416 AS Decimal(18, 5)), CAST(-120.84739 AS Decimal(18, 5)), N'12864 ROSE PRAIRIE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2926, N'43185_BUS', CAST(40.73000 AS Decimal(18, 5)), CAST(-73.74533 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT 10355 - 101 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2927, N'43185_PGHUMANE', CAST(53.92055 AS Decimal(18, 5)), CAST(-122.75349 AS Decimal(18, 5)), N'C/O PRINCE GEORGE HUMANE SOCIETY UNIT 12A-1839 - 1ST AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2928, N'43195', CAST(49.87827 AS Decimal(18, 5)), CAST(-119.45784 AS Decimal(18, 5)), N'1955 KIRSCHNER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2929, N'43195_LOOMISAIR', CAST(49.87827 AS Decimal(18, 5)), CAST(-119.45784 AS Decimal(18, 5)), N'1955 KIRSCHNER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2930, N'43210', CAST(43.05349 AS Decimal(18, 5)), CAST(-86.04794 AS Decimal(18, 5)), N'15585 B 104 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2931, N'43450', CAST(49.30343 AS Decimal(18, 5)), CAST(-124.43282 AS Decimal(18, 5)), N'2450 ALBERNI HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2932, N'43501', CAST(33.74688 AS Decimal(18, 5)), CAST(-117.87015 AS Decimal(18, 5)), N'306 NORTH BROADWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2933, N'43501_HUMANE', CAST(41.60138 AS Decimal(18, 5)), CAST(-93.31973 AS Decimal(18, 5)), N'13620 - 163 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2934, N'43600', CAST(40.87371 AS Decimal(18, 5)), CAST(-78.72623 AS Decimal(18, 5)), N'C/O PURCHASING OFFICE 1580A WILLOW STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2935, N'43602_ANCHOR', CAST(51.79110 AS Decimal(18, 5)), CAST(-114.10531 AS Decimal(18, 5)), N'c/o VISTA TRAVEL OLDS 5051-50 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2936, N'43604', CAST(33.36136 AS Decimal(18, 5)), CAST(-86.98736 AS Decimal(18, 5)), N'1050 - 4th avenue SW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2937, N'43606', CAST(53.54790 AS Decimal(18, 5)), CAST(-113.48779 AS Decimal(18, 5)), N'10412-97 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2938, N'43611_LOOMIS', CAST(40.76105 AS Decimal(18, 5)), CAST(-73.98275 AS Decimal(18, 5)), N'761 - 7th AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2939, N'43613', CAST(37.97720 AS Decimal(18, 5)), CAST(-81.17311 AS Decimal(18, 5)), N'181 LARWOOD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2940, N'43614', CAST(48.48065 AS Decimal(18, 5)), CAST(-123.39024 AS Decimal(18, 5)), N'#5 - 4217 GLANFORD AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2941, N'43617', CAST(49.10728 AS Decimal(18, 5)), CAST(-122.65974 AS Decimal(18, 5)), N'5758 - 203 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2942, N'43618_PICKUP', CAST(19.20950 AS Decimal(18, 5)), CAST(73.09434 AS Decimal(18, 5)), N'FOR PICK UP ONLY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2943, N'43624', CAST(37.78358 AS Decimal(18, 5)), CAST(-122.30812 AS Decimal(18, 5)), N'5360 MONARCH STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2944, N'43624_NEWWESTMI', CAST(49.21354 AS Decimal(18, 5)), CAST(-122.93863 AS Decimal(18, 5)), N'7877 KINGSWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2945, N'43626', CAST(42.72712 AS Decimal(18, 5)), CAST(-83.57669 AS Decimal(18, 5)), N'8643 EAGLE ROAD R.R. 3', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2946, N'43627', CAST(42.11809 AS Decimal(18, 5)), CAST(-76.02653 AS Decimal(18, 5)), N'3125 SMITH DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2947, N'43628', CAST(49.38039 AS Decimal(18, 5)), CAST(-123.34464 AS Decimal(18, 5)), N'573 PROMETHEUS PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2948, N'43629_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O LCR HOLDINGS - GREYHOUND DEPOT 1032 - 2nd AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2949, N'43629_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O WDDC PICK UP AT WDDC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2950, N'43634', CAST(42.42164 AS Decimal(18, 5)), CAST(-94.86361 AS Decimal(18, 5)), N'616 RAILWAY STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2951, N'43634_BUS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'GREYHOUND BUS DEPOT 1112A LAKESIDE DRIVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2952, N'43636_DHLAIR', CAST(54.53579 AS Decimal(18, 5)), CAST(-128.60776 AS Decimal(18, 5)), N'4920 HALLIWELL AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2953, N'43639', CAST(50.66890 AS Decimal(18, 5)), CAST(-120.37238 AS Decimal(18, 5)), N'C/O LOOMIS EXPRESS DEPOT 1180 MCGILL ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2954, N'43641', CAST(49.51658 AS Decimal(18, 5)), CAST(-115.75514 AS Decimal(18, 5)), N'300A - 535 VICTORIA AVE N. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2955, N'43642', CAST(40.07332 AS Decimal(18, 5)), CAST(-105.17121 AS Decimal(18, 5)), N'7811 LOOKOUT ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2956, N'43643', CAST(49.25985 AS Decimal(18, 5)), CAST(-123.00974 AS Decimal(18, 5)), N'400, 4321 STILL CREEK DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2957, N'43645', CAST(28.91910 AS Decimal(18, 5)), CAST(-81.20070 AS Decimal(18, 5)), N'2450 FOUNTAIN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2958, N'43646', CAST(49.24425 AS Decimal(18, 5)), CAST(-124.02821 AS Decimal(18, 5)), N'6002 ICARUS DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2959, N'43647', CAST(54.76971 AS Decimal(18, 5)), CAST(-127.14209 AS Decimal(18, 5)), N'3155 TATLOW ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2960, N'43651', CAST(41.80421 AS Decimal(18, 5)), CAST(-86.73773 AS Decimal(18, 5)), N'13100 PROSPECT DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2961, N'43654', CAST(44.97915 AS Decimal(18, 5)), CAST(-93.26621 AS Decimal(18, 5)), N'307 - 35 SOUTH 2ND AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2962, N'43663_PUROAIR', CAST(40.71313 AS Decimal(18, 5)), CAST(-73.75637 AS Decimal(18, 5)), N'#320, 6325 - 204th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2963, N'43675', CAST(40.72932 AS Decimal(18, 5)), CAST(-73.98436 AS Decimal(18, 5)), N'ROOM 175, 17735 - 1st AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2964, N'43677', CAST(49.28816 AS Decimal(18, 5)), CAST(-122.79264 AS Decimal(18, 5)), N'1250 PINETREE WAY DAVID LAM CAMPUS', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2965, N'43680', CAST(33.43649 AS Decimal(18, 5)), CAST(-112.08252 AS Decimal(18, 5)), N'1161 - 7TH  AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2966, N'43682', CAST(48.57983 AS Decimal(18, 5)), CAST(-123.42646 AS Decimal(18, 5)), N'1782 STELLY''S CROSS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2967, N'43682_VETCETERA', CAST(48.45446 AS Decimal(18, 5)), CAST(-123.39521 AS Decimal(18, 5)), N'10A, 3170 TILLICUM ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2968, N'43686', CAST(49.87827 AS Decimal(18, 5)), CAST(-119.45784 AS Decimal(18, 5)), N'1955 KIRSCHNER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2969, N'43688', CAST(36.36434 AS Decimal(18, 5)), CAST(-94.20387 AS Decimal(18, 5)), N'UNIT #2, 12008 - 8th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2970, N'43689', CAST(40.08687 AS Decimal(18, 5)), CAST(-83.09293 AS Decimal(18, 5)), N'5889 SAWMILL ROAD PO BOX 1530', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2971, N'43691', CAST(42.61506 AS Decimal(18, 5)), CAST(-71.31709 AS Decimal(18, 5)), N'#102    402 INDUSTRIAL AVE EAST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2972, N'43692', CAST(49.15567 AS Decimal(18, 5)), CAST(-121.95789 AS Decimal(18, 5)), N'8451 HARVARD PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2973, N'43692_PUROAIR', CAST(49.15567 AS Decimal(18, 5)), CAST(-121.95789 AS Decimal(18, 5)), N'8451 HARVARD PLACE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2974, N'43693', CAST(39.38094 AS Decimal(18, 5)), CAST(-119.72629 AS Decimal(18, 5)), N'8689 SYLVESTER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2975, N'43694', CAST(50.24799 AS Decimal(18, 5)), CAST(-119.26186 AS Decimal(18, 5)), N'805 KALAMALKA LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2976, N'43695', CAST(42.71827 AS Decimal(18, 5)), CAST(-71.18186 AS Decimal(18, 5)), N'BOX 45 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2977, N'43737', CAST(49.35771 AS Decimal(18, 5)), CAST(-119.53759 AS Decimal(18, 5)), N'3831 McLEAN CREEK ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2978, N'43903', CAST(39.87258 AS Decimal(18, 5)), CAST(-99.06705 AS Decimal(18, 5)), N'1431 E JADE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2979, N'43920', CAST(48.65128 AS Decimal(18, 5)), CAST(-123.56079 AS Decimal(18, 5)), N'840 DELOUME ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2980, N'43965', CAST(42.09618 AS Decimal(18, 5)), CAST(-87.77229 AS Decimal(18, 5)), N'165 RIVERSIDE DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2981, N'43971', CAST(35.65404 AS Decimal(18, 5)), CAST(-88.18834 AS Decimal(18, 5)), N'1161 7 TH AVENUE BOX 1207', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2982, N'44000', CAST(28.95976 AS Decimal(18, 5)), CAST(-96.70846 AS Decimal(18, 5)), N'990 OLD VICTORIA ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2983, N'44010', CAST(49.61750 AS Decimal(18, 5)), CAST(-115.80577 AS Decimal(18, 5)), N'3706 MISSION - WYCLIFFE RD. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2984, N'44100', CAST(42.92783 AS Decimal(18, 5)), CAST(-82.80193 AS Decimal(18, 5)), N'1111 BRAIDWOOD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2985, N'44440', CAST(46.73606 AS Decimal(18, 5)), CAST(-100.51092 AS Decimal(18, 5)), N'17740 - 62 AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2986, N'44601_WHALLEY', CAST(29.89792 AS Decimal(18, 5)), CAST(-95.46058 AS Decimal(18, 5)), N'5338 - 249B STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2987, N'44603', CAST(37.54247 AS Decimal(18, 5)), CAST(-108.88761 AS Decimal(18, 5)), N'22970 10 HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2988, N'44614', CAST(35.28884 AS Decimal(18, 5)), CAST(-87.16027 AS Decimal(18, 5)), N'1549 MUNRO ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2989, N'50600', CAST(62.45355 AS Decimal(18, 5)), CAST(-114.37382 AS Decimal(18, 5)), N'5TH FLOOR SCOTIA CENTRE 102-50 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2990, N'51630', CAST(35.40482 AS Decimal(18, 5)), CAST(-92.81717 AS Decimal(18, 5)), N'# 2 FORESTRY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2991, N'52001', CAST(62.42746 AS Decimal(18, 5)), CAST(-114.42017 AS Decimal(18, 5)), N'129 KAM LAKE ROAD PO BOX 2255', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2992, N'52001_CANADAPOS', CAST(62.42746 AS Decimal(18, 5)), CAST(-114.42017 AS Decimal(18, 5)), N'P.O. BOX 2255 129 KAM LAKE ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2993, N'52001_FIRSTAIR', CAST(53.30841 AS Decimal(18, 5)), CAST(-113.58486 AS Decimal(18, 5)), N'EDM INT AIRPORT FIRST AIR DEPOT #104, 4565, 36 Ave east', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2994, N'52001_FORTSIMPS', CAST(46.88787 AS Decimal(18, 5)), CAST(-102.77670 AS Decimal(18, 5)), N'BOX 829 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2995, N'52001_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'pick up at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2996, N'52001_PICKUPCOU', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP BY COURIER FOR TRANSPORT TO AIRPORT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2997, N'52001_PUROAIR', CAST(62.42746 AS Decimal(18, 5)), CAST(-114.42017 AS Decimal(18, 5)), N'129 KAM LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2998, N'52001_PUROLATOR', CAST(62.42746 AS Decimal(18, 5)), CAST(-114.42017 AS Decimal(18, 5)), N'129 KAM LAKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (2999, N'52001_TREMBLAY', CAST(42.09174 AS Decimal(18, 5)), CAST(-71.96993 AS Decimal(18, 5)), N'BOX 290 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3000, N'52002', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'Environmental Health Officer Box 1000, Stn. 1000', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3001, N'52002_CAMBRI', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'#1 ENOKHOK WAY BUILDING ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3002, N'52002_IQALUIT', CAST(-77.84629 AS Decimal(18, 5)), CAST(166.66731 AS Decimal(18, 5)), N'BUILDING 155 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3003, N'52002_RANKIN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'TAPIRIIT BUILDING ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3004, N'52004', CAST(32.90097 AS Decimal(18, 5)), CAST(-80.66687 AS Decimal(18, 5)), N'19 CARN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3005, N'52004_LOOMISAIR', CAST(32.90097 AS Decimal(18, 5)), CAST(-80.66687 AS Decimal(18, 5)), N'19 CARN STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3006, N'52005', CAST(33.45014 AS Decimal(18, 5)), CAST(-80.97280 AS Decimal(18, 5)), N'128 B COPPER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3007, N'52005_AIR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o action express / AIR NORTH 128 B COPPER ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3008, N'52010', CAST(62.44420 AS Decimal(18, 5)), CAST(-114.40848 AS Decimal(18, 5)), N'308 WOOLGAR AVENUE PO BOX 1313', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3009, N'52010_BUFFALO', CAST(62.44420 AS Decimal(18, 5)), CAST(-114.40848 AS Decimal(18, 5)), N'308 WOOLGAR AVENUE PO BOX 1313', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3010, N'52030', CAST(35.22170 AS Decimal(18, 5)), CAST(-90.39849 AS Decimal(18, 5)), N'26 WANN ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3011, N'52600', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o Manitoulin 91870 Alaska HWY ph 867-633-4989', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3012, N'52600_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3013, N'52601', CAST(38.46172 AS Decimal(18, 5)), CAST(-77.42679 AS Decimal(18, 5)), N'10 BURNS ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3014, N'52602', CAST(68.30416 AS Decimal(18, 5)), CAST(-133.48277 AS Decimal(18, 5)), N'C/O CANADIAN NORTH PICKUP AT MIKE ZUBKO AIRPORT', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3015, N'52634', CAST(68.35640 AS Decimal(18, 5)), CAST(-133.70179 AS Decimal(18, 5)), N'34 TUMA DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3016, N'52634_AIR', CAST(68.35640 AS Decimal(18, 5)), CAST(-133.70179 AS Decimal(18, 5)), N'34 TUMA DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3017, N'52901', CAST(62.42746 AS Decimal(18, 5)), CAST(-114.42017 AS Decimal(18, 5)), N'129 KAM LAKE ROAD PO BOX 2255', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3018, N'53001', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FRIEDENBERG KIM (DVM) 107 COPPER ROAD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3019, N'53001_PICKUPCOU', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICKUP BY COURIER FOR TRANSPORT TO AIRPORT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3020, N'53004', CAST(31.73349 AS Decimal(18, 5)), CAST(-83.23862 AS Decimal(18, 5)), N'118 FALCON ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3021, N'53014', CAST(60.71579 AS Decimal(18, 5)), CAST(-135.08401 AS Decimal(18, 5)), N'ENVIRONMENT YUKON 10 BURNS ROAD (V-7)', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3022, N'53080', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o AIR NORTH 6th avenue & Airport Service RD', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3023, N'53171', CAST(60.68582 AS Decimal(18, 5)), CAST(-135.06314 AS Decimal(18, 5)), N'9 METROPOLIT LANE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3024, N'53631', CAST(60.68582 AS Decimal(18, 5)), CAST(-135.06314 AS Decimal(18, 5)), N'C/O ALL PAWS VETERINARY CLINIC 9 METROPOLIT LANE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3025, N'53631_AIRNORTH', CAST(60.70512 AS Decimal(18, 5)), CAST(-135.06952 AS Decimal(18, 5)), N'C/O NORTH CANADA CARGO 150 CONDOR ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3026, N'53631_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY HOLD FOR PICK UP', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3027, N'53631_WILDLIFE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O PEACE RIVER WILDLIFE OFFICE PROV BLD  BAG 90026  9621 - 96 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3028, N'62001', CAST(44.68128 AS Decimal(18, 5)), CAST(-68.40800 AS Decimal(18, 5)), N'Unit 2, 30 Whitmore Road ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3029, N'62002', CAST(36.39457 AS Decimal(18, 5)), CAST(-86.46695 AS Decimal(18, 5)), N'860 RED RIVER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3030, N'62003', CAST(40.09657 AS Decimal(18, 5)), CAST(-75.08645 AS Decimal(18, 5)), N'1160 OLIVER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3031, N'62900', CAST(48.38060 AS Decimal(18, 5)), CAST(-89.29736 AS Decimal(18, 5)), N'644 ARTHUR STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3032, N'63000', CAST(43.64818 AS Decimal(18, 5)), CAST(-79.39795 AS Decimal(18, 5)), N'PO BOX 1150 485 QUEEN STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3033, N'63000_AIR', CAST(43.64818 AS Decimal(18, 5)), CAST(-79.39795 AS Decimal(18, 5)), N'PO BOX 1150 485 QUEEN STREET WEST', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3034, N'6330702', CAST(49.94516 AS Decimal(18, 5)), CAST(-97.18175 AS Decimal(18, 5)), N'1600 INKSTER BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3035, N'63900', CAST(41.87299 AS Decimal(18, 5)), CAST(-71.41723 AS Decimal(18, 5)), N'50 STEELES AVENUE UNIT 1 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3036, N'66600', CAST(43.51654 AS Decimal(18, 5)), CAST(-79.62285 AS Decimal(18, 5)), N'981 CLARKSON ROAD  SOUTH ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3037, N'71601', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ALBERTA AGRICULTURE AND RURAL DEVELOP ROOM 104A, 6909 - 116 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3038, N'72008', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WEBSTER LYNN (DVM) 192-2025 Corydon Ave.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3039, N'72009', CAST(41.32193 AS Decimal(18, 5)), CAST(-72.95864 AS Decimal(18, 5)), N'431 Yale Avenue West ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3040, N'72010', CAST(49.89789 AS Decimal(18, 5)), CAST(-97.07095 AS Decimal(18, 5)), N'7-1600 Regent Ave. W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3041, N'73000', CAST(38.62477 AS Decimal(18, 5)), CAST(-121.38225 AS Decimal(18, 5)), N'3220 rue WATT, SUITE 220', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3042, N'73000_PUROAIR', CAST(38.62477 AS Decimal(18, 5)), CAST(-121.38225 AS Decimal(18, 5)), N'3220 RUE WATT SUITE 220', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3043, N'73900', CAST(30.85933 AS Decimal(18, 5)), CAST(-90.14618 AS Decimal(18, 5)), N'1925 WILLIAMS PARKWAY UNIT 6', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3044, N'74081', CAST(45.35302 AS Decimal(18, 5)), CAST(-75.63855 AS Decimal(18, 5)), N'2616 Bank Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3045, N'79000', CAST(45.63058 AS Decimal(18, 5)), CAST(-72.97141 AS Decimal(18, 5)), N'2999 BOULEVARD CHOQUETTE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3046, N'79400', CAST(37.13126 AS Decimal(18, 5)), CAST(-121.66465 AS Decimal(18, 5)), N'340 WRIGHT AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3047, N'79500', CAST(40.75857 AS Decimal(18, 5)), CAST(-73.97728 AS Decimal(18, 5)), N'BAY #7 5375 - 50TH STREET SE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3048, N'79750', CAST(53.56089 AS Decimal(18, 5)), CAST(-113.64532 AS Decimal(18, 5)), N'11204 - 186 STREET N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3049, N'79760', CAST(43.41309 AS Decimal(18, 5)), CAST(-80.31519 AS Decimal(18, 5)), N'30 STRUCK COURT ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3050, N'79850', CAST(42.18221 AS Decimal(18, 5)), CAST(-91.10688 AS Decimal(18, 5)), N'16703 - 116th AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3051, N'79850_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'FOR PICKUP ONLY AT WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3052, N'79900', CAST(43.69981 AS Decimal(18, 5)), CAST(-79.80093 AS Decimal(18, 5)), N'C/O PET SCIENCE LTD. 14 REGAN ROAD', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3053, N'80000', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'hold at WDDC COMPENDIUM ACCESS', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3054, N'86000', CAST(50.99282 AS Decimal(18, 5)), CAST(-114.08519 AS Decimal(18, 5)), N'1016 - 68 AVENUE S.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3055, N'89000', CAST(40.70335 AS Decimal(18, 5)), CAST(-73.94753 AS Decimal(18, 5)), N'50 TROOP AVE UNIT 200 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3056, N'89500', CAST(37.71703 AS Decimal(18, 5)), CAST(-85.82206 AS Decimal(18, 5)), N'2620 - 61 AVENUE S.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3057, N'89600', CAST(49.15067 AS Decimal(18, 5)), CAST(-122.93994 AS Decimal(18, 5)), N'8188 SWENSON WAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3058, N'99990', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'HOLD FOR PICK UP 17611 - 109A AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3059, N'99991', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'For use of students to demo web site', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3060, N'99992', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 - 109 A AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3061, N'99995', CAST(37.07598 AS Decimal(18, 5)), CAST(-87.61963 AS Decimal(18, 5)), N'17611-109 A. AVE. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3062, N'99996', CAST(37.68573 AS Decimal(18, 5)), CAST(-97.33255 AS Decimal(18, 5)), N'@ WDDC ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3063, N'99998', CAST(34.37885 AS Decimal(18, 5)), CAST(-85.42726 AS Decimal(18, 5)), N'10568 - 114 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3064, N'99999', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'DISTRIBUTION CENTER LIMITED 17611 - 109A Avenue', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3065, N'99999_225', CAST(30.92167 AS Decimal(18, 5)), CAST(-93.99668 AS Decimal(18, 5)), N'hold for pick up ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3066, N'99999_ALISON', CAST(51.09273 AS Decimal(18, 5)), CAST(-114.15362 AS Decimal(18, 5)), N'C/O VARSITY VETERINARY CLINIC UNIT 107, 4625 VARSITY DRIVE N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3067, N'99999_ALSCO', CAST(48.63311 AS Decimal(18, 5)), CAST(-103.34187 AS Decimal(18, 5)), N'14630-123 AVENUE BAY # 13', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3068, N'99999_ATSSASKAT', CAST(34.00070 AS Decimal(18, 5)), CAST(-118.28731 AS Decimal(18, 5)), N'801B 47th St E, ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3069, N'99999_BJD', CAST(42.17826 AS Decimal(18, 5)), CAST(-71.01756 AS Decimal(18, 5)), N'60 Hillview RD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3070, N'99999_BRENDA', CAST(45.51538 AS Decimal(18, 5)), CAST(-122.64858 AS Decimal(18, 5)), N'1024 - 17th Ave  SE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3071, N'99999_BRIGITTA', CAST(51.15923 AS Decimal(18, 5)), CAST(-114.08590 AS Decimal(18, 5)), N'132 Panamount Lane N.W. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3072, N'99999_CORAL', CAST(49.79207 AS Decimal(18, 5)), CAST(-97.21325 AS Decimal(18, 5)), N'124 Brookfield  Crescent ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3073, N'99999_EPSCANINE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICK UP AT WDDC FACILITY ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3074, N'99999_EQUIP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'17611 - 109 A AVE DO NOT SHIP FROM THIS ACCOUNT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3075, N'99999_HUMBER', CAST(41.21465 AS Decimal(18, 5)), CAST(-73.21972 AS Decimal(18, 5)), N'2 HERALD AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3076, N'99999_IRYNA', CAST(37.07598 AS Decimal(18, 5)), CAST(-87.61963 AS Decimal(18, 5)), N'17611 - 109 A AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3077, N'99999_JBMENTERP', CAST(40.77166 AS Decimal(18, 5)), CAST(-73.90572 AS Decimal(18, 5)), N'#13, 2221-41 AVE. N.E. ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3078, N'99999_KAREN', CAST(52.16948 AS Decimal(18, 5)), CAST(-106.63390 AS Decimal(18, 5)), N'C/O LAWSON HEIGHTS ANIMAL HOSP 120, 227 PRIMROSE DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3079, N'99999_LYNN', CAST(43.52831 AS Decimal(18, 5)), CAST(-89.43380 AS Decimal(18, 5)), N'c/o WDDC ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3080, N'99999_PRO NORTH', CAST(39.95440 AS Decimal(18, 5)), CAST(-105.22138 AS Decimal(18, 5)), N'6040-170 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3081, N'99999_ROSITA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o ATS Winnipeg depot 1725 St. James St. Unit 1', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3082, N'99999_STUDENT1', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3083, N'99999_STUDENT10', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3084, N'99999_STUDENT11', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3085, N'99999_STUDENT12', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3086, N'99999_STUDENT13', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3087, N'99999_STUDENT14', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3088, N'99999_STUDENT15', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3089, N'99999_STUDENT16', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3090, N'99999_STUDENT17', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3091, N'99999_STUDENT18', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3092, N'99999_STUDENT19', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3093, N'99999_STUDENT2', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3094, N'99999_STUDENT20', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3095, N'99999_STUDENT21', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3096, N'99999_STUDENT22', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3097, N'99999_STUDENT23', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3098, N'99999_STUDENT24', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3099, N'99999_STUDENT25', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3100, N'99999_STUDENT26', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3101, N'99999_STUDENT27', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3102, N'99999_STUDENT28', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3103, N'99999_STUDENT29', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3104, N'99999_STUDENT3', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3105, N'99999_STUDENT30', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3106, N'99999_STUDENT31', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3107, N'99999_STUDENT32', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3108, N'99999_STUDENT4', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3109, N'99999_STUDENT5', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3110, N'99999_STUDENT6', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3111, N'99999_STUDENT7', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3112, N'99999_STUDENT8', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3113, N'99999_STUDENT9', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3114, N'99999_TANYA', CAST(41.14517 AS Decimal(18, 5)), CAST(-102.97450 AS Decimal(18, 5)), N'c/o WESTERN DRUG HEAD OFFICE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3115, N'99999_TRAVELODG', CAST(38.83449 AS Decimal(18, 5)), CAST(-104.77621 AS Decimal(18, 5)), N'106 Circle Drive West ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3116, N'ATS', CAST(43.77470 AS Decimal(18, 5)), CAST(-79.62743 AS Decimal(18, 5)), N'100 VAUGHAN VALLEY BLVD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3117, N'GENERAL ACCOUNT', CAST(40.69974 AS Decimal(18, 5)), CAST(-73.77936 AS Decimal(18, 5)), N'17611 - 109 A AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3118, N'GENERAL_ADETOLA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A DEPARTMENTOF SURGERY 3-021 LIKA SHING CENTRE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3119, N'GENERAL_AGRICUL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'WDDC FACILITY NO ORDERS TO BE PROCESSED', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3120, N'GENERAL_ALTIER', CAST(51.06608 AS Decimal(18, 5)), CAST(-114.13446 AS Decimal(18, 5)), N'U OF C - FAC. OF MEDICINE 3330 HOSPITAL DR. NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3121, N'GENERAL_ANDERSO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U of A- FACULTY OF MED AND DENT 5-040 LIKA SHING CENTRE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3122, N'GENERAL_BARKEMA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF C - VET SCIENCES RESEARCH 11481 - 85TH ST NW RM QUARANTINE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3123, N'GENERAL_BENNETT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A CENTRE FOR NEUROSCIENCE 87AVE, 113 STREET HERITAGE MED RES. CENTRE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3124, N'GENERAL_BRAAM', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A 87 AVE & 112 STREET RM 275 HMRC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3125, N'GENERAL_CHAN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - FACULTY OF AGRICULTURE 6-126B LI KA SHING CENTRE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3126, N'GENERAL_CHAVES', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'MEDICAL SCIENCES BUILD. ROOM 9-31 116 STREET, 85 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3127, N'GENERAL_CHEUNG', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROOM 9-50 MEDICAL SCIENCE BUILDING DEPART. OF PEDIATRICS & PHARM', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3128, N'GENERAL_CHEZIKA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROOM HSC 1871, FACULTY OF VET MED 3330 HOSPITAL DRIVE NW', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3129, N'GENERAL_CLANACH', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'ROOM 9-43 MEDICAL SCIENCES BUILDING UNIVERSITY OF ALBERTA', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3130, N'GENERAL_COE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - FACULTY OF MEDICINE METABOLIC UNIT F-7  6004 118 ST', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3131, N'GENERAL_COLBOUR', CAST(32.23042 AS Decimal(18, 5)), CAST(-110.95136 AS Decimal(18, 5)), N'BIOLOGICAL SCIENCES BUILDING U OF A RM P428', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3132, N'GENERAL_COLMERS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A DEPT OF PHARMACOLOGY FAC. OF MEDICINE & DENTISTRY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3133, N'GENERAL_CORDAT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A FACULTY OF MED & DENT RM 7-34 MEDICAL SCI. BUILDING', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3134, N'GENERAL_DENNIS', CAST(53.52803 AS Decimal(18, 5)), CAST(-113.52535 AS Decimal(18, 5)), N'U OF A - FACULTY OF SCIENCE 11455 SASKATCHEWAN DR NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3135, N'GENERAL_DERGOUS', CAST(49.69886 AS Decimal(18, 5)), CAST(-112.76359 AS Decimal(18, 5)), N'LETHBRIDGE RESEARCH & DEVELOPMENT CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3136, N'GENERAL_DRKARIM', CAST(53.51810 AS Decimal(18, 5)), CAST(-113.52360 AS Decimal(18, 5)), N'ROOM 3-88 CORBETT HALL 8205 - 114 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3137, N'GENERAL_DYCK', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A DEPARTMENT OF PEDIATRICS 112 ST & 85 AVE RM 430 HMRC', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3138, N'GENERAL_EUSTON', CAST(31.75330 AS Decimal(18, 5)), CAST(-93.09565 AS Decimal(18, 5)), N'FACULTY OF ARTS AND SCIENCE 4401 UNIVERSITY DR. RM EP1292', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3139, N'GENERAL_FEBBRAI', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROOM 7-055 KATZ GROUP CENTRE 11361 - 87TH AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3140, N'GENERAL_GARRYOA', CAST(34.03701 AS Decimal(18, 5)), CAST(-118.24173 AS Decimal(18, 5)), N'102 - 9837 - 7th STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3141, N'GENERAL_GIBB', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LETHBRIDGE 4401 UNIVERSITY DR. ROOM EP1292', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3142, N'GENERAL_GLENBRO', CAST(37.01449 AS Decimal(18, 5)), CAST(-121.58761 AS Decimal(18, 5)), N'#130 - 815 - 1st STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3143, N'GENERAL_GONZALE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A KATZ GROUP CENTRE 114 STREET  7TH FLOOR', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3144, N'GENERAL_GOVABJU', CAST(51.06292 AS Decimal(18, 5)), CAST(-114.14773 AS Decimal(18, 5)), N'MEDICAL EXAMINERS OFFICE 4070 BOWNESS ROAD N.W.', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3145, N'GENERAL_GRAF', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A 114ST AND 87 AVE RM 7-108 KATZ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3146, N'GENERAL_GRANDBY', CAST(45.42268 AS Decimal(18, 5)), CAST(-72.71676 AS Decimal(18, 5)), N'576 DUFFERIN ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3147, N'GENERAL_GREER', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o DEPT of Physiology At U of A 513 HMRC Building', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3148, N'GENERAL_GRUBER', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'UNIV. OF LETHBRIDGE FACULTY OF ARTS & SCI.  EP1292', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3149, N'GENERAL_GUTFREU', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A DEPT. OF MED., FAC. OF MED. KATZ BLD RM 6-108, 114 ST. & 87 AVE.', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3150, N'GENERAL_HEUBNER', CAST(34.09053 AS Decimal(18, 5)), CAST(-80.95588 AS Decimal(18, 5)), N'376 BAYFIELD ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3151, N'GENERAL_HUDSON', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - DEPART. OF PHARMACOLOGY MEDICAL SCIENCES BLDG 114 St - 87 Ave', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3152, N'GENERAL_HURD', CAST(34.41200 AS Decimal(18, 5)), CAST(-119.84460 AS Decimal(18, 5)), N'U OF A - DEPT OF PSYCHOLOGY FACULTY OF SCIENCE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3153, N'GENERAL_INGLIS', CAST(49.70024 AS Decimal(18, 5)), CAST(-112.76322 AS Decimal(18, 5)), N'AGRICULTURE & AGRI-FOOD CANADA 5403 - 1ST AVE S', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3154, N'GENERAL_IWANIUK', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LETHBRIDGE RM EP1292 4401 UNIVERSITY DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3155, N'GENERAL_JACOBSO', CAST(49.87827 AS Decimal(18, 5)), CAST(-119.45784 AS Decimal(18, 5)), N'1955 KIRSCHNER ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3156, N'GENERAL_JURASZ', CAST(55.15905 AS Decimal(18, 5)), CAST(-118.83098 AS Decimal(18, 5)), N'U OF ALBERTA RM 3-081 11361 - 87 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3157, N'GENERAL_KATHER', CAST(53.56831 AS Decimal(18, 5)), CAST(-113.50495 AS Decimal(18, 5)), N'ROOM X210   11762-106 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3158, N'GENERAL_KELOWNA', CAST(42.84505 AS Decimal(18, 5)), CAST(-83.41630 AS Decimal(18, 5)), N'1955 KENT ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3159, N'GENERAL_KERR', CAST(53.52202 AS Decimal(18, 5)), CAST(-113.52430 AS Decimal(18, 5)), N'U OF A MEDICAL SCIENCES BLDG RM 9-28   114TH STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3160, N'GENERAL_KHADARO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A 87 AVE & 114 STREET RM 7-124 FACULTY OF MEDICINE & DENTISTRY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3161, N'GENERAL_LIGHT', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - DEPART OF PHARMACOLOGY ROOM 6040 LKS, 87AVE & 112 STREET', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3162, N'GENERAL_LOPASCH', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - DEPART. OF PEDIATRICS HERITAGE MED. CENTRE 114 ST & 85 AVE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3163, N'GENERAL_LOUGHEE', CAST(49.13380 AS Decimal(18, 5)), CAST(-122.32734 AS Decimal(18, 5)), N'108, 32423 LOUGHEED HIGHWAY ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3164, N'GENERAL_LOWES', CAST(35.84448 AS Decimal(18, 5)), CAST(-90.65964 AS Decimal(18, 5)), N'125 CATER DRIVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3165, N'GENERAL_LUCIE', CAST(51.13858 AS Decimal(18, 5)), CAST(-114.19248 AS Decimal(18, 5)), N'75 ARBOUR GLEN CLOSE NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3166, N'GENERAL_LUCZAK', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'UNI. OF LETHBRIDGE FACULTY OF ARTS & SCI. RM EP1114', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3167, N'GENERAL_MAJID', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LEFTBRIDGE 4401 UNIVERSITY DR W ROOM EP1292', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3168, N'GENERAL_MARTINE', CAST(47.05804 AS Decimal(18, 5)), CAST(-120.60365 AS Decimal(18, 5)), N'1125 CLARKE ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3169, N'GENERAL_MCDONAL', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LETHBRIDGE RM EP1292 4401 UNIVERSITY DRIVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3170, N'GENERAL_MCKENZI', CAST(40.92141 AS Decimal(18, 5)), CAST(-82.92615 AS Decimal(18, 5)), N'3888 CAREY ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3171, N'GENERAL_MCNAUGH', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LETHBRIDGE 4401 UNIVERSITY DR W ROOM EP1292', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3172, N'GENERAL_MEMORIA', CAST(37.98800 AS Decimal(18, 5)), CAST(-103.55278 AS Decimal(18, 5)), N'#4 - 839 1ST STREET WEST ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3173, N'GENERAL_METCALF', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'3007 LI KA SHING CENTRE 112 ST & 87 AVE U OF A', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3174, N'GENERAL_METZ', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'UNIV.OF LETHBRIDGE FAC. OF ARTS & SCI., RM EP1114,EP1018,EP1292', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3175, N'GENERAL_MICHAEL', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'U OF A - DEPART OF MEDICINE 116 ST & 85 AVE RM 424 HMRC', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3176, N'GENERAL_MILTON', CAST(43.51040 AS Decimal(18, 5)), CAST(-80.01552 AS Decimal(18, 5)), N'10207 GUELPH LINE R.R.1', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3177, N'GENERAL_MURRAY', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'U OF A DEPT. OF MEDICINE HERITAGE MEDICAL RESEARCH CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3178, N'GENERAL_NAGENDR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A  87AVE - 114 STREET HMRC RM 140', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3179, N'GENERAL_NORTHFR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O DEWDNEY TRADING CO. 37148 LOUGHEED HIGHWAY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3180, N'GENERAL_NORTHRD', CAST(49.24715 AS Decimal(18, 5)), CAST(-122.89132 AS Decimal(18, 5)), N'435F NORTH ROAD ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3181, N'GENERAL_NORWEST', CAST(37.42251 AS Decimal(18, 5)), CAST(-122.13743 AS Decimal(18, 5)), N'400 PORTAGE AVENUE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3182, N'GENERAL_OBGYN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'RM 232 HERITAGE MEDICAL RSCH CTR UOFA 112ST & 87AVE  FAC OF MED DENT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3183, N'GENERAL_PAGLIAR', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A-DEPT. OF PHYSIOLOGY KATZ BUILDING, RM 3095', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3184, N'GENERAL_PEARSON', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROOM 7-15, MEDICAL SCIENCE BUILDING UOFA FAC OF VET MED DEPT OF PHYSLGY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3185, N'GENERAL_PICKUP', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'PICKUP at WDDC ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3186, N'GENERAL_POUND', CAST(41.60140 AS Decimal(18, 5)), CAST(-93.31829 AS Decimal(18, 5)), N'13550 - 163 Street ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3187, N'GENERAL_PROCTOR', CAST(44.94992 AS Decimal(18, 5)), CAST(-93.30209 AS Decimal(18, 5)), N'U OF A - 8602 - 112 ST LKS CENTRE RM 4002, 4040, 4032', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3188, N'GENERAL_QUEENS', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'DEPT OF PATHOLOGY RICHARDSONS LABS ROOM 201', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3189, N'GENERAL_RAYAT', CAST(12.97585 AS Decimal(18, 5)), CAST(80.22045 AS Decimal(18, 5)), N'U OF A HERITAGE MEDICAL RES. CENT. RM 140', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3190, N'GENERAL_ROY', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - SURGICAL MED. RESEARCH INSTITUTE 8440 -112 ST WALTER MACKENZIE CENT', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3191, N'GENERAL_RUCKSTU', CAST(51.07730 AS Decimal(18, 5)), CAST(-114.13112 AS Decimal(18, 5)), N'U OF CALGARY, BIOLOGICAL SCIENCE DEPART 2500 UNIVERSITY DRIVE NW', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3192, N'GENERAL_RUURD', CAST(53.55665 AS Decimal(18, 5)), CAST(-113.62521 AS Decimal(18, 5)), N'WDDC (HOLD FOR PICK UP) 17611 - 109A AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3193, N'GENERAL_SAUVE', CAST(43.66016 AS Decimal(18, 5)), CAST(-79.39277 AS Decimal(18, 5)), N'U OF A  FACULTY OF MED. & DENT. MEDICAL SCEINCES BLDG', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3194, N'GENERAL_SCHULZ', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A HERITAGE MED RESEARCH 116ST & 85AVE  ROOM 4-62', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3195, N'GENERAL_SHAPIRO', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'CENTRAL RECEIVING 116ST & 85 AVENUE 5-040 LI KA SHING HTH CTR RSCH INNO', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3196, N'GENERAL_SIDNEY', CAST(31.50659 AS Decimal(18, 5)), CAST(-92.70093 AS Decimal(18, 5)), N'9842 SECOND STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3197, N'GENERAL_SILVIA', CAST(40.76044 AS Decimal(18, 5)), CAST(-73.97103 AS Decimal(18, 5)), N'U OF A KATZ BUILDING 11361 87 AVE  ROOM 3095', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3198, N'GENERAL_STEELE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A   RM4-10 AGRICULTURE/FORESTRY CENTRE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3199, N'GENERAL_STENSON', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'1-10  ZEIDLER-LEDCOR CENTRE U OF A CAMPUS', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3200, N'GENERAL_STICKLA', CAST(53.51976 AS Decimal(18, 5)), CAST(-113.52343 AS Decimal(18, 5)), N'U OF A - CLINICAL SCIENCES BLDG RM 3-135', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3201, N'GENERAL_STURDY', CAST(17.41185 AS Decimal(18, 5)), CAST(78.45153 AS Decimal(18, 5)), N'P217 BIOLOGICAL SCIENCE BUILDING 116 STREET  85 AVE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3202, N'GENERAL_SUTHERL', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'UNI. OF LETHBRIDGE FACULTY OF ARTS &  SCI. RM EP1121 & EP1115, EP1292', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3203, N'GENERAL_TATSUNO', CAST(49.67861 AS Decimal(18, 5)), CAST(-112.85962 AS Decimal(18, 5)), N'U OF LETHBRIDGE FACULTY OF ARTS 4401 UNIVERSITY DR  RM EP1292', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3204, N'GENERAL_TURNER', CAST(53.52152 AS Decimal(18, 5)), CAST(-113.52658 AS Decimal(18, 5)), N'C/O EDM.CLINIC HLTH ACAD. RM 4-594A 11405 - 87 AVENUE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3205, N'GENERAL_ULUDAG', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'ROOM 2-020A  8304 - 114 STREET RESEARCH TRANSITION FACILITY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3206, N'GENERAL_UOFA', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'UNIVERSITY OF ALBERTA 9-36 MEDICAL SCENCES BUILDING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3207, N'GENERAL_UOFCALG', CAST(44.12276 AS Decimal(18, 5)), CAST(-92.67632 AS Decimal(18, 5)), N'11877 - 85th Street  NW ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3208, N'GENERAL_UOFSASK', CAST(52.13405 AS Decimal(18, 5)), CAST(-106.62985 AS Decimal(18, 5)), N'c/o Western College of Vet Medicine 52 Campus Drive', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3209, N'GENERAL_USSHER', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A DEPARTMENT OF PHARMACY 114 ST & 85 AVE RM 2-055 KATZ', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3210, N'GENERAL_VANCE', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'UNIVERSITY OF ALBERTA 11207 - 87 AVE HERITAGE MED CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3211, N'GENERAL_VETEMER', CAST(43.67408 AS Decimal(18, 5)), CAST(-79.38964 AS Decimal(18, 5)), N'SUITE 117, 920 YONGE STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3212, N'GENERAL_VHA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'LANDMARK III SUITE 100, 1632 DICKSON AVENUE', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3213, N'GENERAL_VLIAGOF', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - FACULTY OF MED & DENTISTRY 112 STREET & 87 AVE    RM 559D', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3214, N'GENERAL_WABAMIN', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'c/o 250 DIAMOND AVE TELUS BUILDING', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3215, N'GENERAL_WEBBER', CAST(43.66016 AS Decimal(18, 5)), CAST(-79.39277 AS Decimal(18, 5)), N'FACULTY OF MEDICINE & DENTISTRY MEDICAL SCIENCES BLDG. U OF A', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3216, N'GENERAL_WESTAWA', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'U OF A - 8710-112 STREET CENTRE FOR PRIONS & PROTEIN', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3217, N'GENERAL_WEVRICK', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'U OF A  116 STREET & 85TH AVE 816 MEDICAL SCIENCES BUILDING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3218, N'GENERAL_WU', CAST(34.73093 AS Decimal(18, 5)), CAST(-92.34051 AS Decimal(18, 5)), N'U OF A AGRICULTURE & FORESTERY', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3219, N'GENERAL_WYLIE', CAST(0.00000 AS Decimal(18, 5)), CAST(0.00000 AS Decimal(18, 5)), N'C/O U OF ALBERTA   DOUG WYLIE LAB DEPT. OF PSYCHOLOGY', N'ZERO_RESULTS')
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3220, N'GENERAL_YUE', CAST(53.52321 AS Decimal(18, 5)), CAST(-113.52631 AS Decimal(18, 5)), N'U OF A - 116ST AND 85AVE RM 7-21 MEDICAL SCIENCE BUILDING', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3221, N'GENERAL_ZHANG', CAST(53.52234 AS Decimal(18, 5)), CAST(-113.52151 AS Decimal(18, 5)), N'U OF A - HEALTH RESEARCH 1-132 LI KA SHING CENTRE', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3222, N'GENERAL_ZOCHODN', CAST(53.52223 AS Decimal(18, 5)), CAST(-113.52110 AS Decimal(18, 5)), N'U OF A - LI KA SHING CENTRE RM 5-080 8602 - 112 STREET', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3223, N'GRIMSHAW', CAST(42.47481 AS Decimal(18, 5)), CAST(-95.38766 AS Decimal(18, 5)), N'11450 - 160 STREET ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3224, N'UPS', CAST(41.22235 AS Decimal(18, 5)), CAST(-73.05667 AS Decimal(18, 5)), N'ONE FACTORY LANE, SUITE 100 ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3225, N'VANKAM', CAST(41.22347 AS Decimal(18, 5)), CAST(-111.96239 AS Decimal(18, 5)), N'2355 MADISON AVE ', NULL)
GO
INSERT [Route].[MapCoordinates] ([MapCoordinatesID], [MemberNumber], [Lat], [Long], [Address], [Error]) VALUES (3226, N'WESBRO', CAST(25.61219 AS Decimal(18, 5)), CAST(-80.38199 AS Decimal(18, 5)), N'16815 - 117 AVENUE ', NULL)
GO
SET IDENTITY_INSERT [Route].[MapCoordinates] OFF
GO
SET IDENTITY_INSERT [Route].[OrderType] ON 

GO
INSERT [Route].[OrderType] ([OrderTypeID], [Name]) VALUES (1, N'Regular')
GO
INSERT [Route].[OrderType] ([OrderTypeID], [Name]) VALUES (2, N'Pet Food')
GO
INSERT [Route].[OrderType] ([OrderTypeID], [Name]) VALUES (3, N'Fridge')
GO
SET IDENTITY_INSERT [Route].[OrderType] OFF
GO
SET IDENTITY_INSERT [Route].[Site] ON 

GO
INSERT [Route].[Site] ([SiteID], [Name]) VALUES (1, N'Edmonton')
GO
INSERT [Route].[Site] ([SiteID], [Name]) VALUES (2, N'Manitoba')
GO
SET IDENTITY_INSERT [Route].[Site] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ClinicSettings]    Script Date: 10/5/2017 8:38:09 AM ******/
ALTER TABLE [Route].[CustomerSetting] ADD  CONSTRAINT [IX_ClinicSettings] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_siteOrderTypeID_DayOfWeekID]    Script Date: 10/5/2017 8:38:09 AM ******/
ALTER TABLE [Route].[DeliveryDateDefault] ADD  CONSTRAINT [UQ_siteOrderTypeID_DayOfWeekID] UNIQUE NONCLUSTERED 
(
	[SiteOrderTypeID] ASC,
	[DayOfWeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Route].[CustomerSetting] ADD  CONSTRAINT [DF_Clinics_Settings_DelayedBilling]  DEFAULT ((0)) FOR [DelayedBillingID]
GO
ALTER TABLE [Route].[CustomerSetting] ADD  CONSTRAINT [DF_Clinics_Settings_PetFood]  DEFAULT ((0)) FOR [PetFoodID]
GO
ALTER TABLE [Route].[CustomerSetting] ADD  CONSTRAINT [DF_Clinics_Settings_ShippingChargeApply]  DEFAULT ((0)) FOR [HasShippingCharge]
GO
ALTER TABLE [Route].[CustomerSetting] ADD  CONSTRAINT [DF_Clinic_Settings_PetFood_Money]  DEFAULT ((450)) FOR [PetFoodMoney]
GO
ALTER TABLE [Route].[CustomerSetting]  WITH CHECK ADD  CONSTRAINT [FK_MemberSettings_Route] FOREIGN KEY([RouteID])
REFERENCES [Route].[Route] ([RouteID])
GO
ALTER TABLE [Route].[CustomerSetting] CHECK CONSTRAINT [FK_MemberSettings_Route]
GO
ALTER TABLE [Route].[CustomerSetting]  WITH CHECK ADD  CONSTRAINT [FK_MemberSettingsOptions_DelayedBilling] FOREIGN KEY([DelayedBillingID])
REFERENCES [Route].[CustomerSettingOption] ([CustomerSettingOptionID])
GO
ALTER TABLE [Route].[CustomerSetting] CHECK CONSTRAINT [FK_MemberSettingsOptions_DelayedBilling]
GO
ALTER TABLE [Route].[CustomerSetting]  WITH CHECK ADD  CONSTRAINT [FK_MemberSettingsOptions_PetFood] FOREIGN KEY([PetFoodID])
REFERENCES [Route].[CustomerSettingOption] ([CustomerSettingOptionID])
GO
ALTER TABLE [Route].[CustomerSetting] CHECK CONSTRAINT [FK_MemberSettingsOptions_PetFood]
GO
ALTER TABLE [Route].[DeliveryDateDefault]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDateDefault_DayOfWeek] FOREIGN KEY([DayOfWeekID])
REFERENCES [Route].[DayOfWeek] ([DayOfWeekID])
GO
ALTER TABLE [Route].[DeliveryDateDefault] CHECK CONSTRAINT [FK_DeliveryDateDefault_DayOfWeek]
GO
ALTER TABLE [Route].[DeliveryDateDefault]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDateDefault_SiteOrderType] FOREIGN KEY([SiteOrderTypeID])
REFERENCES [Route].[SiteOrderType] ([SiteOrderTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[DeliveryDateDefault] CHECK CONSTRAINT [FK_DeliveryDateDefault_SiteOrderType]
GO
ALTER TABLE [Route].[DeliveryDateException]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDateException_DeliveryDateDefault] FOREIGN KEY([DeliveryDateDefaultID])
REFERENCES [Route].[DeliveryDateDefault] ([DeliveryDateDefaultID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[DeliveryDateException] CHECK CONSTRAINT [FK_DeliveryDateException_DeliveryDateDefault]
GO
ALTER TABLE [Route].[RouteSite]  WITH CHECK ADD  CONSTRAINT [FK_RouteSite_Route] FOREIGN KEY([RouteID])
REFERENCES [Route].[Route] ([RouteID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[RouteSite] CHECK CONSTRAINT [FK_RouteSite_Route]
GO
ALTER TABLE [Route].[RouteSite]  WITH CHECK ADD  CONSTRAINT [FK_RouteSite_Site] FOREIGN KEY([SiteID])
REFERENCES [Route].[Site] ([SiteID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[RouteSite] CHECK CONSTRAINT [FK_RouteSite_Site]
GO
ALTER TABLE [Route].[SiteOrderType]  WITH CHECK ADD  CONSTRAINT [FK_SiteOrderType_OrderType] FOREIGN KEY([OrderTypeID])
REFERENCES [Route].[OrderType] ([OrderTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[SiteOrderType] CHECK CONSTRAINT [FK_SiteOrderType_OrderType]
GO
ALTER TABLE [Route].[SiteOrderType]  WITH CHECK ADD  CONSTRAINT [FK_SiteOrderType_RouteSite] FOREIGN KEY([RouteSiteID])
REFERENCES [Route].[RouteSite] ([RouteSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [Route].[SiteOrderType] CHECK CONSTRAINT [FK_SiteOrderType_RouteSite]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[31] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "rm"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 6
               Left = 303
               Bottom = 136
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "csdb"
            Begin Extent = 
               Top = 6
               Left = 795
               Bottom = 102
               Right = 1014
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cspf"
            Begin Extent = 
               Top = 102
               Left = 795
               Bottom = 198
               Right = 1014
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cs"
            Begin Extent = 
               Top = 6
               Left = 563
               Bottom = 136
               Right = 757
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3690
         Alias = 2340
         Table = 117' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMemberInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Output = 1920
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMemberInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMemberInformation'
GO
