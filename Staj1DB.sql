--Staj1DB adında veritabanı oluşturma. 
Create DATABASE Staj1
GO

USE [Staj1]
GO
/****** Object:  Table [dbo].[GeriGonderilenBelgeler]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeriGonderilenBelgeler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BelgeAdi] [nvarchar](250) NULL,
	[Tarih] [datetime] NULL,
	[KullaniciID] [int] NULL,
	[Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_GeriGonderilenBelgeler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](100) NULL,
	[Numara] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Parola] [nvarchar](50) NULL,
	[KayıtTarihi] [datetime] NULL,
	[OnaylandiMi] [bit] NULL,
	[AktifMi] [bit] NULL,
	[StajDurumID] [int] NULL,
	[BeniHatirla] [bit] NOT NULL,
	[TelefonNo] [nvarchar](50) NULL,
	[StajBaslatilsinMi] [bit] NULL,
	[Adres] [nvarchar](100) NULL,
	[BasvuruyuDegerlendiren] [nvarchar](70) NULL,
	[Sinif] [nvarchar](5) NULL,
	[BasvuruDegerlendirmeTarihi] [datetime] NULL,
	[BasvuruYapildiMi] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciRol]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciRol](
	[KullaniciRolID] [int] IDENTITY(1,1) NOT NULL,
	[RolID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_KullaniciRol] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC,
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResmiTatiller]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResmiTatiller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResmiTatil] [datetime] NULL,
	[Aciklama] [nvarchar](100) NULL,
 CONSTRAINT [PK_ResmiTatiller_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staj]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staj](
	[StajID] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](200) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Tarih] [datetime] NULL,
	[KullaniciID] [int] NULL,
	[StajDonemNO] [int] NULL,
 CONSTRAINT [PK_Staj] PRIMARY KEY CLUSTERED 
(
	[StajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajAdi]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajAdi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](15) NULL,
 CONSTRAINT [PK_StajAdi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajBaslatilsinMi]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajBaslatilsinMi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_StajBaslatilsinMi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajBasvuruBelgeleri]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajBasvuruBelgeleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BelgeAdi] [nvarchar](250) NULL,
	[Tarih] [datetime] NULL,
	[KullaniciID] [int] NULL,
	[StajDonemNO] [int] NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajDefteriTeslim]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajDefteriTeslim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DosyaAdi] [nvarchar](50) NULL,
	[KullaniciID] [int] NULL,
	[Tarih] [datetime] NULL,
 CONSTRAINT [PK_StajDefteriTeslim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajDurum]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajDurum](
	[StajDurumID] [int] IDENTITY(1,1) NOT NULL,
	[StajDurumAdi] [nvarchar](50) NULL,
	[Gizle] [bit] NULL,
 CONSTRAINT [PK_StajDurum] PRIMARY KEY CLUSTERED 
(
	[StajDurumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajyerOgrenciBaslatma]    Script Date: 7.05.2022 11:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajyerOgrenciBaslatma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsyeriAdi] [nvarchar](70) NULL,
	[StajBaslangicTarihi] [datetime] NULL,
	[StajBitisTarihi] [datetime] NULL,
	[HaftaIciGunSayisi] [int] NULL,
	[ResmiTatilSayisi] [int] NULL,
	[ToplamCalismaSüresi] [int] NULL,
	[Tarih] [datetime] NULL,
	[CumartesiCalisiyorMu] [nvarchar](10) NULL,
	[StajAdiID] [int] NULL,
	[KullaniciID] [int] NULL,
	[IsyeriAdresi] [nvarchar](250) NULL,
 CONSTRAINT [PK_StajyerOgrenciBaslatma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeriGonderilenBelgeler] ON 

INSERT [dbo].[GeriGonderilenBelgeler] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [Aciklama]) VALUES (180, N'', CAST(N'2022-05-04T14:34:00.637' AS DateTime), 76, N'Staj başvuru talebiniz incelenmiş ve kabul edilmemiştir. Sistem üzerinden yeni başvuru talebinde bulunabilirsiniz. ')
INSERT [dbo].[GeriGonderilenBelgeler] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [Aciklama]) VALUES (183, N'c40a0ae6_StajBasvuruBelgeleri.pdf', CAST(N'2022-05-04T14:38:27.627' AS DateTime), 76, N'Staj başvurunuz onaylanmıştır. Başvurunuza ait imzalı geri gönderilen belgeniz ektedir.')
SET IDENTITY_INSERT [dbo].[GeriGonderilenBelgeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (20, N'Admin', N'Admin', N'Admin@gmail.com', N'Admin@gmail.com', N'1', CAST(N'2021-10-20T19:05:50.980' AS DateTime), 1, 1, NULL, 0, N'0(666) 666 66 66', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (74, N'Ahmet', N'Canseven', N'33333333333', N'ahmet@gmail.com', N'1', CAST(N'2021-12-15T17:40:16.637' AS DateTime), 0, 0, 8, 0, N'0(555) 555 55 55', 0, N'Çamlıca Mah. 408. Cadde No:136 PK:06200 Yenimahalle / ANKARA', N'Admin Admin', N'4', CAST(N'2022-01-21T15:26:27.083' AS DateTime), 0, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (76, N'Burak', N'Çalışkan', N'53464560474', N'CaliskanBurak97@gmail.com', N'1', CAST(N'2021-12-15T21:04:58.773' AS DateTime), 0, 0, 1, 0, N'0(538) 036 62 76', 0, N'Adnan Kahveci Bulvarı Barış Mah. Pınar Sok. Sezgi Sitesi B Blok Kat:13 Daire:55 Beylikdüzü/İstanbul ', N'Admin Admin', N'4', CAST(N'2022-05-04T12:44:37.257' AS DateTime), 1, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (77, N'Büşra', N'Yılmaz', N'11111111111', N'Busra@gmail.com', N'1', CAST(N'2022-01-03T19:11:22.763' AS DateTime), 0, 0, 3, 0, N'0(598) 741 25 63', 0, N'Kaput mahallesi, Atatürk caddesi, 89. Sokak, 6 / 3 Şişli / İstanbul ', N'Admin Admin', N'4', CAST(N'2022-01-04T20:31:16.593' AS DateTime), 1, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (78, N'Ozan', N'Çiftçi', N'22222222222', N'Ozan@gmail.com', N'1', CAST(N'2022-01-03T19:12:44.133' AS DateTime), 0, 0, 8, 0, N'0(786) 352 14 12', 0, N'Akyamaç mahallesi, Barbaros caddesi, Kemalpaşa sokak, No/12, Daire/9, Gaziosmanpaşa/İstanbul ', N'Admin Admin', N'4', CAST(N'2022-01-21T15:20:11.930' AS DateTime), 1, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (79, N'Selin', N'Hancı', N'44444444444', N'Selin@gmail.com', N'1', CAST(N'2022-01-03T19:14:25.900' AS DateTime), 0, 0, 5, 0, N'0(362) 147 89 52', 0, N'Esentepe mahallesi, Atatürk caddesi, 134. Sokak, 3 / 5, Üsküdar / Istanbul', N'Admin Admin', N'4', NULL, 0, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (81, N'Ayşen', N'Aksoy', N'99999999999', N'Aysen@gmail.com', N'1', CAST(N'2022-01-03T19:19:40.537' AS DateTime), 0, 0, 1, 0, N'0(321) 478 56 96', 0, N'Orhaniye Mah. Zihni Derin Cad. No: 55/1 Menteşe / Muğla ', N'Admin Admin', N'4', CAST(N'2022-01-04T20:31:36.510' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciRol] ON 

INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (11, 1, 20)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (103, 2, 74)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (105, 2, 76)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (106, 2, 77)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (107, 2, 78)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (114, 2, 79)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (115, 2, 81)
SET IDENTITY_INSERT [dbo].[KullaniciRol] OFF
GO
SET IDENTITY_INSERT [dbo].[ResmiTatiller] ON 

INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (18, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Yılbaşı Tatili')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (19, CAST(N'2022-04-23T00:00:00.000' AS DateTime), N'Ulusal Egemenlik ve Çocuk Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (20, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'Emek ve Dayanışma Günü')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (21, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Atatürk''ü Anma Gençlik ve Spor Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (23, CAST(N'2022-07-15T00:00:00.000' AS DateTime), N'Demokrasi ve Milli Birlik Günü')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (24, CAST(N'2022-08-30T00:00:00.000' AS DateTime), N'Zafer Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (25, CAST(N'2022-10-29T00:00:00.000' AS DateTime), N'Cumhuriyet Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (26, CAST(N'2022-05-02T00:00:00.000' AS DateTime), N'Ramazan Bayramı 1.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (27, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'Ramazan Bayramı 2.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (28, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Ramazan Bayramı 3.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (29, CAST(N'2022-07-09T00:00:00.000' AS DateTime), N'Kurban Bayramı 1.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (30, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Kurban Bayramı 2.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (31, CAST(N'2022-07-11T00:00:00.000' AS DateTime), N'Kurban Bayramı 3.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (34, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Kurban Bayramı 4.Gün')
SET IDENTITY_INSERT [dbo].[ResmiTatiller] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (2, N'Kullanici')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (3, N'Eğitim Elemanı')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Staj] ON 

INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (201, N'JSP’de Session ve Request', N'<div style="text-align:justify"><br />
<span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><em><strong>&nbsp; </strong></em></span><span style="font-size:20px"><em><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JSP&rsquo;de Session ve Request: </strong></em>JSP dilinin web programcılarına sunduğu bir &ouml;zellik olan session kavramı, web sitesindeki erişim haklarını belirlemeyi sağlar. Yani bir ziyaret&ccedil;i web sitesindeki bazı sayfaları a&ccedil;ıp bazılarını a&ccedil;amazken, ziyaret&ccedil;inin a&ccedil;amadığı bazı sayfaları web sitesine kayıtlı olan bir kullanıcı a&ccedil;abilir. Ayrıca sayfalar arasında dolaşırken herhangi bir kullanıcının oturum bilgileri de aktarılır ve bu bilgiler vasıtasıyla kimin siteye ne zaman giriş yaptığı, hangi sayfaları dolaştığı gibi bilgiler de kolaylıkla elde edilebilir. Aşağıda session kullanımına ait bir &ouml;rnek g&ouml;sterilmektedir.</span></span><br />
<br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/effc6087_Ekran görüntüsü 2021-12-31 164844.png" style="height:214px; width:704px" /><br />
<br />
<strong><span style="font-family:Times New Roman,Times,serif">Şekil 2. Session oturumu a&ccedil;ma</span><br />
<br />
<img alt="" src="/StajDefterResimleri/images/7ecf527e_Ekran görüntüsü 2021-12-31 164858.png" style="height:94px; width:642px" /><br />
<br />
<span style="font-family:Times New Roman,Times,serif">Şekil 3. Session oturum kontrol&uuml;</span><br />
<br />
<img alt="" src="/StajDefterResimleri/images/08a84a44_Ekran görüntüsü 2021-12-31 164912.png" style="height:139px; width:550px" /><br />
<br />
<span style="font-family:Times New Roman,Times,serif">Şekil 4. Session oturum kapatma</span></strong></span><br />
&nbsp;</div>

<div><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">Şekil 1&rsquo;de &uuml;ye girişi yapan bir kullanıcının session oturumunu başlatan kodlar bulunurken, şekil 9&rsquo;da dolaştığı sayfalarda &uuml;ye girişinin yapılıp yapılmadığı ve eğer yapılmadıysa giriş sayfasına y&ouml;nlendirildiği kodlar bulunmaktadır. Ayrıca şekil 3&rsquo;de kullanıcının &ccedil;ıkış yaptığı zaman oturumunun kapatılması i&ccedil;in gerekli kodlar g&ouml;r&uuml;lmektedir.</span></span></div>
', CAST(N'2022-01-12T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (202, N'JSP – Veritabanı Bağlantısı', N'&nbsp;
<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><em><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></em></span></span><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif"><em><strong>JSP &ndash; Veritabanı Bağlantısı: </strong></em>JSP veritabanına bağlanmayı JDBC Driver ile sağlamaktadır. JSP kodları vasıtasıyla veritabanında yeni kayıtlar eklenebilir, varolanlar g&uuml;ncellenebilir veya silinebilir. JSP dosyalarında veritabanı bağlantısını ger&ccedil;ekleştirebilmek i&ccedil;in java.sql sayfası bağlantının ger&ccedil;eklenmek istendiği t&uuml;m sayfalarda import komutuyla eklenmiş olmalıdır. JSP ile programlama yaparken veritabanı kullanımına ilişkin birka&ccedil; &ouml;rnek aşağıda verilmiştir.</span></span><br />
<br />
&nbsp;</div>

<div style="text-align:center"><img alt="" src="/StajDefterResimleri/images/84be6753_Ekran görüntüsü 2021-12-31 170425.png" style="height:121px; width:820px" /><br />
<br />
<span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil 5. Veritabanı i&ccedil;in temel tanımlamalar</strong></span></span></div>

<div style="text-align:justify"><br />
<span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">Burada connectionURL olarak g&ouml;r&uuml;len string tipinden değişken: kullanılan driver (s&uuml;r&uuml;c&uuml;), kullanılan sql tipi ve veritabanının bulunduğu yer ve adını i&ccedil;ermektedir. Ayrıca veritabanı bağlantısını ger&ccedil;ekleyebilmek i&ccedil;in gerekli olan Connection, Statement ve ResultSet nesneleri yaratılmış olup başlangı&ccedil;ta null değere atanmaktadır.</span></span></div>

<div style="text-align:center"><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><img alt="" src="/StajDefterResimleri/images/af69e953_Ekran görüntüsü 2021-12-31 170437.png" style="height:101px; width:824px" /></span></span><br />
<br />
<span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Şekil 6. Veritabanı bağlantısı oluşturma</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">Buradaki ilk satır ile yeni bir bağlantı oluşturulmuştur. Ayrıca connection değişkenine yukarıda belirtilen connectionURL, veritabanı kullanıcı adı ve şifresinden elde edilen bir bağlantı atanmaktadır. Daha sonra ise bu connection değişkeni bir statament ouşturmuş olup bu statement değişkenine atanmaktadır. Bundan sonra veritabanı bağlantısı ger&ccedil;eklenmiştir. Veritabanından sorguları statement değişkeni vasıtasıyla yapabilmekteyiz.</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif"><img alt="" src="/StajDefterResimleri/images/bc8783de_Ekran görüntüsü 2022-01-20 120804.png" style="height:33px; width:675px" /></span></span></div>

<div style="text-align:center"><br />
<span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Şekil 7. Veritabanı sorgusu</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:20px">Burada &ouml;nceden tanımlanmış olan ResultSet nesnesine veritabanından yapılan sorgu aktarılmaktadır. Veritabanındaki tablonun ismi bu &ouml;rnekte m&uuml;şteri_tablosu&rsquo;dur. Eğer farklı tablodan sorgu yapılacaksa bu isim değiştirilmelidir.</span></span></div>
', CAST(N'2022-01-13T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (203, N'JSP''de MYSQL Kullanımı', N'<div style="text-align:center"><span style="font-size:24px"><span style="font-family:Times New Roman,Times,serif"><strong>MySQL</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em><strong> &nbsp;</strong></em></span><span style="font-size:20px"><em><strong>MySQL</strong></em> sql tipi bir veritabanıdır. MySQL&rsquo;de veritabanı oluşturabilmek i&ccedil;in &ouml;ncelikle MySQL&rsquo;in bilgisayara kurulmuş olması gereklidir. Kurulum işlemi ger&ccedil;ekleştirilmiş ise http://localhost/phpmyadmin/ adresinden kendi bilgisayarımıza veritabanı kurabilir, bunlarla &ccedil;alışabiliriz. Bu a&ccedil;ılan sayfada SQL sekmesini se&ccedil;ersek, &quot;localhost&quot; sunucusu &uuml;zerinde SQL sorgusunu/sorgularını &ccedil;alıştır gibi bir yazı &ccedil;ıkacak ve buraya gerekli SQL kodunu yazacağız. Projede kullandığım veritabanını &ldquo;create database deneme&rdquo; koduyla oluşturulmuştur. Daha sonra bu veritabanının altında değişik tablolar oluşturulmuştur. Bunların oluşturulma kodlarından birka&ccedil; &ouml;rnek aşağıda g&ouml;sterilmiştir.</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/33cb248c_Ekran görüntüsü 2021-12-31 171220.png" style="height:250px; width:610px" /><br />
<strong>Şekil 8. M&uuml;şteri tablosunun oluşturulması</strong></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong><img alt="" src="/StajDefterResimleri/images/bb666580_Ekran görüntüsü 2021-12-31 171230.png" style="height:142px; width:500px" /><br />
Şekil 9. Konu tablosunun oluşturulması</strong></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong><img alt="" src="/StajDefterResimleri/images/8f07ddab_Ekran görüntüsü 2021-12-31 171242.png" style="height:236px; width:490px" /></strong></span></span></div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil 10. Problem tablosunun oluşturulması</strong></span></span></div>
', CAST(N'2022-01-14T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (204, N'JSP de MYSQL kullanımı 2', N'&nbsp; &nbsp; &nbsp; &nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/StajDefterResimleri/images/b1b16ca9_Ekran görüntüsü 2022-01-18 165723.png" style="height:257px; width:600px" />
<div style="text-align:center"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Şekil 11:&nbsp;Duyuru tablosunun oluşturulması</strong></span></span></div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify"><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">Tablolara doğrudan localhosttan ekleme yapılabileceği gibi &ouml;nceki konularda değinildiği gibi JSP kodlarıyla da ekleme d&uuml;zenleme vb. işlemler ger&ccedil;ekleştirilebilir. Localhosttan ekleme işlemi i&ccedil;in SQL sorgusu da &ccedil;alıştırılabilir veya doğrudan tablodaki bilgiler metin kutularına bir bir elle girilebilir. Aşağıda bunlara ait &ouml;rnekler ekran g&ouml;r&uuml;nt&uuml;leriyle verilmiştir. Bunlara ek olarak oluşturulmuş olan tablolardan da &ouml;rnekler g&ouml;sterilmektedir.</span></span><br />
<br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><img alt="" src="/StajDefterResimleri/images/5942062a_Ekran görüntüsü 2022-01-18 165736.png" style="height:109px; width:825px" /></span></span></div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Şekil 12:&nbsp;</strong></span></span><strong><span style="font-family:Times New Roman,Times,serif">V<span style="font-size:18px">eritabanına ekleme-1</span></span></strong><br />
<br />
<br />
<img alt="" src="/StajDefterResimleri/images/2332a4ec_Ekran görüntüsü 2022-01-18 165758.png" style="height:315px; width:680px" /></div>

<div style="text-align:center"><br />
<span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Şekil 13:&nbsp;</strong></span></span><strong><span style="font-family:Times New Roman,Times,serif">V<span style="font-size:18px">eritabanına ekleme-2</span></span></strong></div>
', CAST(N'2022-01-15T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (205, N'Web Projesi Oluşturma Aşamaları', N'<div style="text-align:center"><span style="font-size:22px"><span style="font-family:Times New Roman,Times,serif"><strong>NETBEANS</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">&nbsp; </span></span><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">&nbsp; &nbsp; NetBeans C, C++ ve Java gibi programlama dillerinde yazılan kodların yazılıp derlenebileceği bir platformdur. Masa&uuml;st&uuml; uygulamalarının yazılabileceği gibi web uygulamalarının da yazılabileceği ve programcıya bir&ccedil;ok kolaylık sağlayan bir IDE&rsquo;dir.<br />
<br />
&nbsp; &nbsp;Projemi geliştirirken JSP dosyalarını NetBeans&rsquo;te oluşturup &ccedil;alıştırdım. &Ouml;ncelikle NetBeans&rsquo;te bir web uygulamasının nasıl a&ccedil;ılacağını aşağıdaki ekran g&ouml;r&uuml;nt&uuml;leriyle anlatacağım. G&ouml;r&uuml;nt&uuml;lerdeki adımlar sırasıyla uygulanmalıdır.</span></span><br />
<br />
<span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/StajDefterResimleri/images/380bf9c5_Ekran görüntüsü 2022-01-18 170404.png" style="height:355px; width:510px" /></span></span></div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil 14:&nbsp;NetBeans web projesi oluşturma-1</strong></span></span><br />
&nbsp;</div>

<div style="text-align:center"><img alt="" src="/StajDefterResimleri/images/de63036a_Ekran görüntüsü 2022-01-18 170331.png" style="height:343px; width:510px" /></div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil 15:&nbsp;NetBeans web projesi oluşturma-2</strong></span></span></div>
', CAST(N'2022-01-17T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (206, N'Müşteri Destek Sistemi', N'<span style="font-size:20px"><u><span style="font-family:Times New Roman,Times,serif"><em><strong>Kullanıcı Kısmı</strong></em></span></u><br />
<span style="font-family:&quot;Times New Roman&quot;,Times,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style="font-family:&quot;Times New Roman&quot;,Times,serif; font-size:20px; text-align:justify">Stajda tasarladığım m&uuml;şteri destek sisteminde yukarıda anlattığım gibi JSP dilini MySQL veritabanıyla birlikte kullandım. JSP kodlarını NetBeans ortamında derledim. Şimdi hazırladığım siteye ait birka&ccedil; ekran g&ouml;r&uuml;nt&uuml;s&uuml;yle sitede yapılabileceklere değinelim.</span>
<div style="text-align:justify">&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/6307fff4_Ekran görüntüsü 2022-01-18 170917.png" style="height:281px; width:532px" /><br />
<strong>Şekil 16:&nbsp;MDS - Giriş Sayfası</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">Projeyi &ccedil;alıştırdığımızda ilk olarak index.jsp sayfasıyla karşılaşıyoruz. Bu sayfada kullanıcı giriş yapması beklenmekte ve eğer &uuml;ye değilse &uuml;ye ol linkinden siteye kayıt olması gerekmektedir. Yukarıda g&ouml;r&uuml;len &quot;Anasayfa Bilgilerim&nbsp; Taleplerim&nbsp; &Ccedil;ıkış&quot; sayfalarına da eğer oturum a&ccedil;madan gitmeye &ccedil;alışırsa bu sayfalar herhangi bir oturumun a&ccedil;ık olup olmadığını kontrol edip eğer oturum a&ccedil;ılmamışsa tekrar index.jsp sayfasını a&ccedil;acaktır. Bu sayede kullanıcı giriş yapmadan veya &uuml;ye olmadan siteyi dolaşamayacaktır. Kullanıcının kayıtlı olmadığı varsayılıp &uuml;ye ol&rsquo;a tıklamasıyla aşağıda g&ouml;r&uuml;len sayfa a&ccedil;ılacaktır. Bu sayfada kullanıcı gerekli bilgileri girip &uuml;ye ol&rsquo;a tıkladığında veritabanında yeni bir kayıt oluşturulacaktır.</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/089045a0_Ekran görüntüsü 2022-01-18 171054.png" style="height:356px; width:450px" /><br />
<strong>Şekil 17:&nbsp;MDS - &Uuml;ye Olma Sayfası</strong></span></span></div>
', CAST(N'2022-01-18T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (207, N'Üye Ana Sayfasının Oluşturulması', N'<div style="text-align:center"><br />
<img alt="" src="/StajDefterResimleri/images/57188f61_Ekran görüntüsü 2022-01-18 171418.png" style="height:372px; width:470px" /><br />
<span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil:&nbsp;MDS - &Uuml;ye Ana Sayfası</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Kullanıcı giriş yaptıktan sonra anasayfaya gidilecek ve bu sayfada destek talebi g&ouml;nderebileceği bir form olacak. Aynı zamanda site y&ouml;neticilerinin yaptığı duyurular ve kullanıcının son 10 talebi bu anasayfada kayan yazı şeklinde g&ouml;r&uuml;lecektir. Ayrıca bu kayan yazılara tıklanırsa duyuru veya taleplerin ayrıntısı g&ouml;r&uuml;lebilecektir.</span></span></div>

<div style="text-align:center"><br />
<span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/57febd78_Ekran görüntüsü 2022-01-18 171529.png" style="height:99px; width:529px" /><br />
<strong>Şekil:&nbsp;</strong></span></span><span style="font-size:18px"><strong>MDS - Duyuru Detayı G&ouml;sterme<br />
<br />
<img alt="" src="/StajDefterResimleri/images/973d9dcb_Ekran görüntüsü 2022-01-18 171638.png" style="height:279px; width:463px" /><br />
<span style="font-family:Times New Roman,Times,serif">Şekil 34. MDS &ndash; Bilgilerim</span></strong></span><br />
<br />
&nbsp;</div>
', CAST(N'2022-01-19T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (208, N'Admin Panelin Oluşturulması', N'<div style="text-align:center"><br />
<img alt="" src="/StajDefterResimleri/images/3348446c_Ekran görüntüsü 2022-01-18 172030.png" style="height:198px; width:634px" /><br />
<span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><strong>Şekil : MDS - Admin Girişi</strong></span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px">Sitenin bir de admin girişi i&ccedil;in ayrı bir kısmı var. Burada admin.jsp yi &ouml;zel olarak elle &ccedil;alıştırmamız gerekiyor. Bu sitenin g&uuml;venliği i&ccedil;in tercih edildi. Site y&ouml;neticisi bunu bilecek ancak diğer kullanıcılar bundan habersiz olacaktır. Burada a&ccedil;ılan sayfadaki metin kutulardan ilkine ETIYA, ikincisine TEKNOPARK yazılırsa admin girişi başarıyla yapılmış olacak. Bunlar benim atadığım değerler, değiştirilebilir.<br />
<br />
Admin girişi yapılınca t&uuml;m m&uuml;şterilerin g&ouml;z&uuml;keceği bir sayfaya y&ouml;nlendirileceğiz.</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/bfff09e0_Ekran görüntüsü 2022-01-18 172201.png" style="height:404px; width:531px" /><br />
<strong>Şekil : MDS &ndash; M&uuml;şteriler</strong></span></span><br />
&nbsp;</div>

<div><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px">A&ccedil;ılan sayfada en başta toplam m&uuml;şteri sayısı ve toplam a&ccedil;ık talep sayısı g&ouml;sterilecek. A&ccedil;ık talep hen&uuml;z cevap verilmemiş olan talep anlamında olduğu i&ccedil;in y&ouml;netici&rsquo;nin bunu g&ouml;r&uuml;p bunlara cevap vermesi &ouml;nemlidir. Bu sayfada admin m&uuml;şteri arayabilecek ve detay linkine tıkladığı zaman m&uuml;şteriye ait bilgileri g&ouml;rebilecek. Ayrıca burada m&uuml;şterinin bilgilerini de değiştirebilecek.</span></span><br />
&nbsp;</div>
', CAST(N'2022-01-20T00:00:00.000' AS DateTime), 76, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (209, N'Şirkete Ait Bir Projenin Yardım Dosyalarının Hazırlanması', N'<br />
<span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Yardım dosyalarının hazırlandığı ortam Adobe Dreamweaver CS3, kullanılan dil ise HTML&rsquo;dir. &Ouml;ncelikle bu ortam ve dil hakkında genel bilgiler aşağıda anlatılan gibidir.</span></span><br />
&nbsp;
<div style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:26px"><strong>Adobe Dreamweaver CS3</strong></span></span></div>

<div style="text-align:justify"><br />
<span style="font-size:20px"><span style="font-family:Times New Roman,Times,serif">&nbsp; &nbsp; &nbsp; &nbsp;Adobe Dreamweaver HTML ve/veya PHP ile &ccedil;alışmak isteyen web programcılarına programlama konusunda b&uuml;y&uuml;k &ouml;l&ccedil;&uuml;de kolaylık sağlayan, ayrıca web sitelerindeki g&ouml;rselliği sağlayabilmek konusunda da tasarımcılara olduk&ccedil;a fazla se&ccedil;eneği tek bir butonla sunan bir programdır. İ&ccedil;erisinde HTML, PHP ve JavaScript gibi web programlama dillerinin derlenebileceği gibi CSS gibi web sitelerine g&ouml;rsellik kazandıran dosyalar da hazırlanabilir. Bu program programcılara yazdıkları web programını farklı tarayıcılarda &ccedil;alıştırabilme imkanını sunar. Dreamweaverda &ccedil;alışırken aşağıda g&ouml;sterildiği gibi HTML kodunu aynı zamanda hem kod, hem dizayn, hem de ikisini birden g&ouml;rebilme ve değiştirebilme imkanına sahip oluruz.</span></span></div>

<div style="text-align:center"><br />
<span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><img alt="" src="/StajDefterResimleri/images/a7af6567_Ekran görüntüsü 2022-01-18 165118.png" style="height:499px; width:834px" /></span></span></div>

<div style="text-align:center"><strong><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px">Şekil 1: Kod Kısmı</span></span></strong><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; Aynı zamanda HTML kodları (tagleri vs..) JSP dosyalarının i&ccedil;inde de kullanılabilir.&nbsp;Projede yazılım dili olarak&nbsp;JSP web programlama dili ve MySQL veritabanı kullanılmış olup, proje NetBeans ortamında oluşturulup geliştirilmiştir. &Ouml;ncelikle bu teknolojiler hakkında genel bilgiler verilip daha sonra sitenin sayfaları kısaca a&ccedil;ıklanacaktır.</span></span></div>
', CAST(N'2022-01-11T00:00:00.000' AS DateTime), 76, NULL)
SET IDENTITY_INSERT [dbo].[Staj] OFF
GO
SET IDENTITY_INSERT [dbo].[StajAdi] ON 

INSERT [dbo].[StajAdi] ([ID], [Adi]) VALUES (1, N'Staj 1')
INSERT [dbo].[StajAdi] ([ID], [Adi]) VALUES (2, N'Staj 2')
SET IDENTITY_INSERT [dbo].[StajAdi] OFF
GO
SET IDENTITY_INSERT [dbo].[StajBaslatilsinMi] ON 

INSERT [dbo].[StajBaslatilsinMi] ([ID], [Adi], [Aciklama]) VALUES (1, N'Staj Dönemi Başlat', N'Staj dönemi başvuruları  01/07 /2022 tarihinde açılacaktır. Bu tarihten önce sistem üzerinden giriş yapamazsınız.')
SET IDENTITY_INSERT [dbo].[StajBaslatilsinMi] OFF
GO
SET IDENTITY_INSERT [dbo].[StajBasvuruBelgeleri] ON 

INSERT [dbo].[StajBasvuruBelgeleri] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (281, N'fb31bbc5_FR.35.0138 Stajyer Bilgi Formu Rev.00-dönüştürüldü.pdf', CAST(N'2022-01-04T19:29:28.333' AS DateTime), 78, NULL)
INSERT [dbo].[StajBasvuruBelgeleri] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (288, N'fc0b0bcc_StajBasvuruBelgeleri.pdf', CAST(N'2022-05-04T12:43:33.713' AS DateTime), 76, NULL)
INSERT [dbo].[StajBasvuruBelgeleri] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (289, N'0e1b0bb8_StajBasvuruBelgeleri.pdf', CAST(N'2022-05-04T13:48:38.393' AS DateTime), 77, NULL)
SET IDENTITY_INSERT [dbo].[StajBasvuruBelgeleri] OFF
GO
SET IDENTITY_INSERT [dbo].[StajDurum] ON 

INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (1, N'Staj 1 Onaylandı', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (2, N'Reddedildi', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (3, N'Beklemede(Onay Bekliyor)', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (4, N'Evrak Bekleniyor', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (5, N'Başvuru Yapılmadı', 0)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (8, N'Staj 1 Tamamlandı', 1)
SET IDENTITY_INSERT [dbo].[StajDurum] OFF
GO
SET IDENTITY_INSERT [dbo].[StajyerOgrenciBaslatma] ON 

INSERT [dbo].[StajyerOgrenciBaslatma] ([ID], [IsyeriAdi], [StajBaslangicTarihi], [StajBitisTarihi], [HaftaIciGunSayisi], [ResmiTatilSayisi], [ToplamCalismaSüresi], [Tarih], [CumartesiCalisiyorMu], [StajAdiID], [KullaniciID], [IsyeriAdresi]) VALUES (85, N'Best Bilgisayar Elektronik Sanayi ve Ticaret Ltd. Şti', CAST(N'2022-01-04T00:00:00.000' AS DateTime), CAST(N'2022-01-31T00:00:00.000' AS DateTime), 20, 0, 20, CAST(N'2022-01-04T19:23:49.867' AS DateTime), N'Hayır', 1, 77, N' Best Bilgisayar Elektronik Sanayi ve Ticaret Ltd. Şti ')
INSERT [dbo].[StajyerOgrenciBaslatma] ([ID], [IsyeriAdi], [StajBaslangicTarihi], [StajBitisTarihi], [HaftaIciGunSayisi], [ResmiTatilSayisi], [ToplamCalismaSüresi], [Tarih], [CumartesiCalisiyorMu], [StajAdiID], [KullaniciID], [IsyeriAdresi]) VALUES (86, N'Güler Yazılım ', CAST(N'2022-02-07T00:00:00.000' AS DateTime), CAST(N'2022-03-04T00:00:00.000' AS DateTime), 20, 0, 20, CAST(N'2022-01-04T19:35:56.070' AS DateTime), N'Hayır', 1, 78, N' ÜSKÜPLÜ CADDESİ CİBALİ MAHALEESİ BOSTAN HAMAMI ARALIĞI SOKAK PINAR İŞ HANI NO: 2 FATİH İSTANBUL ')
INSERT [dbo].[StajyerOgrenciBaslatma] ([ID], [IsyeriAdi], [StajBaslangicTarihi], [StajBitisTarihi], [HaftaIciGunSayisi], [ResmiTatilSayisi], [ToplamCalismaSüresi], [Tarih], [CumartesiCalisiyorMu], [StajAdiID], [KullaniciID], [IsyeriAdresi]) VALUES (88, N' EVKUR ALIŞVERİŞ MERKEZLERİ TİC.A.Ş. ', CAST(N'2022-02-23T00:00:00.000' AS DateTime), CAST(N'2022-03-17T00:00:00.000' AS DateTime), 20, 0, 20, CAST(N'2022-01-04T19:41:00.380' AS DateTime), N'Evet', 1, 81, N'Halkalı Merkez Mahallesi Basın Ekspres Yolu Evkur Plaza No:33 Kat:9 Küçükçekmece / İstanbul')
INSERT [dbo].[StajyerOgrenciBaslatma] ([ID], [IsyeriAdi], [StajBaslangicTarihi], [StajBitisTarihi], [HaftaIciGunSayisi], [ResmiTatilSayisi], [ToplamCalismaSüresi], [Tarih], [CumartesiCalisiyorMu], [StajAdiID], [KullaniciID], [IsyeriAdresi]) VALUES (91, N'Türk Hava Yolları Teknoloji Ve Bilişim A.Ş', CAST(N'2022-04-04T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), 20, 0, 20, CAST(N'2022-04-21T14:26:47.210' AS DateTime), N'Hayır', 1, 76, N' Halkalı Merkez, Basın Ekspres Yolu no 33, Küçükçekmece/İstanbul ')
SET IDENTITY_INSERT [dbo].[StajyerOgrenciBaslatma] OFF
GO
ALTER TABLE [dbo].[GeriGonderilenBelgeler]  WITH CHECK ADD  CONSTRAINT [FK_GeriGonderilenBelgeler_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[GeriGonderilenBelgeler] CHECK CONSTRAINT [FK_GeriGonderilenBelgeler_Kullanici]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_StajDurum] FOREIGN KEY([StajDurumID])
REFERENCES [dbo].[StajDurum] ([StajDurumID])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_StajDurum]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Kullanici]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Rol] FOREIGN KEY([RolID])
REFERENCES [dbo].[Rol] ([RolID])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Rol]
GO
ALTER TABLE [dbo].[Staj]  WITH CHECK ADD  CONSTRAINT [FK_Staj_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Staj] CHECK CONSTRAINT [FK_Staj_Kullanici]
GO
ALTER TABLE [dbo].[StajBasvuruBelgeleri]  WITH CHECK ADD  CONSTRAINT [FK_StajBasvuru_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[StajBasvuruBelgeleri] CHECK CONSTRAINT [FK_StajBasvuru_Kullanici]
GO
ALTER TABLE [dbo].[StajDefteriTeslim]  WITH CHECK ADD  CONSTRAINT [FK_StajDefteriTeslim_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[StajDefteriTeslim] CHECK CONSTRAINT [FK_StajDefteriTeslim_Kullanici]
GO
ALTER TABLE [dbo].[StajyerOgrenciBaslatma]  WITH CHECK ADD  CONSTRAINT [FK_StajyerOgrenciBaslatma_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[StajyerOgrenciBaslatma] CHECK CONSTRAINT [FK_StajyerOgrenciBaslatma_Kullanici]
GO
ALTER TABLE [dbo].[StajyerOgrenciBaslatma]  WITH CHECK ADD  CONSTRAINT [FK_StajyerOgrenciBaslatma_StajAdi] FOREIGN KEY([StajAdiID])
REFERENCES [dbo].[StajAdi] ([ID])
GO
ALTER TABLE [dbo].[StajyerOgrenciBaslatma] CHECK CONSTRAINT [FK_StajyerOgrenciBaslatma_StajAdi]
GO
