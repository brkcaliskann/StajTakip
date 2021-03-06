--Staj2DB adında veritabanı oluşturma. 
Create DATABASE Staj2
GO

USE [Staj2]
GO
/****** Object:  Table [dbo].[GeriGonderilenBelgeler]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[Kullanici]    Script Date: 7.05.2022 11:51:35 ******/
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
	[BasvuruDegerlendirilmeTarihi] [datetime] NULL,
	[BasvuruYapildiMi] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciRol]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[ResmiTatiller]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[Staj]    Script Date: 7.05.2022 11:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staj](
	[StajID] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](100) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Tarih] [datetime] NULL,
	[KullaniciID] [int] NULL,
	[StajNo] [int] NULL,
 CONSTRAINT [PK_Staj] PRIMARY KEY CLUSTERED 
(
	[StajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StajAdi]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[StajBaslatilsinMi]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[StajBasvuruBelgeleri]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[StajDefteriTeslim]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[StajDurum]    Script Date: 7.05.2022 11:51:35 ******/
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
/****** Object:  Table [dbo].[StajyerOgrenciBaslatma]    Script Date: 7.05.2022 11:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StajyerOgrenciBaslatma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsyeriAdi] [nvarchar](50) NULL,
	[StajBaslangicTarihi] [datetime] NULL,
	[StajBitisTarihi] [datetime] NULL,
	[HaftaIciGunSayisi] [int] NULL,
	[ResmiTatilSayisi] [int] NULL,
	[ToplamCalismaSüresi] [int] NULL,
	[Tarih] [datetime] NULL,
	[CumartesiCalisiyorMu] [nvarchar](10) NULL,
	[StajAdiID] [int] NULL,
	[KullaniciID] [int] NULL,
	[IsyeriAdresi] [nvarchar](150) NULL,
 CONSTRAINT [PK_StajyerOgrenciBaslatma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (6, N'Burak', N'Çalışkan', N'53464560474', N'CaliskanBurak97@gmail.com', N'1', CAST(N'2021-12-18T14:28:41.690' AS DateTime), 0, 0, 1, 0, N'0(538) 036 62 76', 0, N'Adnan Kahveci Bulvarı Barış Mah. Pınar Sok. Sezgi Sitesi B Blok Kat:13 Daire:55 Beylikdüzü/İstanbul ', N'Admin Admin', N'4', CAST(N'2022-05-04T21:29:21.257' AS DateTime), 1, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (7, N'Admin', N'Admin', N'Admin@gmail.com', N'Admin@gmail.com', N'1', CAST(N'2021-12-18T15:07:24.950' AS DateTime), 1, 0, NULL, 0, N'0(555) 555 55 55', 0, NULL, NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (8, N'Ayşen', N'Aksoy', N'33333333333', N'Aysen@gmail.com', N'1', CAST(N'2022-01-18T14:27:23.470' AS DateTime), 0, 0, 1, 0, N'0(666) 666 66 66', 0, N'Orhaniye Mah. Zihni Derin Cad. No: 55/1 Menteşe / Muğla', N'Admin Admin', N'4', CAST(N'2022-01-21T15:10:19.860' AS DateTime), NULL, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (9, N'Selin', N'Hancı', N'22222222222', N'Selin@gmail.com', N'1', CAST(N'2022-01-18T14:27:44.073' AS DateTime), 0, 0, 5, 0, N'5(555) 555 55 55', 0, N'Esentepe mahallesi, Atatürk caddesi, 134. Sokak, 3 / 5, Üsküdar / Istanbul', N'Admin Admin', N'4', CAST(N'2022-01-21T15:10:29.557' AS DateTime), NULL, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (10, N'Ozan', N'Çiftçi', N'88888888888', N'Ozan@gmail.com', N'1', CAST(N'2022-01-18T14:28:01.137' AS DateTime), 0, 0, 4, 0, N'0(598) 741 25 63', 0, N'Akyamaç mahallesi, Barbaros caddesi, Kemalpaşa sokak, No/12, Daire/9, Gaziosmanpaşa/İstanbul', N'Admin Admin', N'4', CAST(N'2022-01-21T15:10:40.167' AS DateTime), NULL, 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [Adi], [Soyadi], [Numara], [Mail], [Parola], [KayıtTarihi], [OnaylandiMi], [AktifMi], [StajDurumID], [BeniHatirla], [TelefonNo], [StajBaslatilsinMi], [Adres], [BasvuruyuDegerlendiren], [Sinif], [BasvuruDegerlendirilmeTarihi], [BasvuruYapildiMi], [Status]) VALUES (11, N'ahmet', N'canseven', N'77777777777', N'ahmet@gmail.com', N'1', CAST(N'2022-01-18T14:28:41.743' AS DateTime), 0, 0, 5, 0, N'0(563) 417 89 63', 0, N'Saffet Mahallesi, Pınar Hisar Caddesi, Gündüz Apartmanı / Daire: 22 

 İstanbul / Esenler ', N'Admin Admin', N'4', CAST(N'2022-01-21T15:10:47.110' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciRol] ON 

INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (2, 1, 7)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (4, 2, 6)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (1002, 2, 8)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (1003, 2, 9)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (1004, 2, 10)
INSERT [dbo].[KullaniciRol] ([KullaniciRolID], [RolID], [KullaniciID]) VALUES (1005, 2, 11)
SET IDENTITY_INSERT [dbo].[KullaniciRol] OFF
GO
SET IDENTITY_INSERT [dbo].[ResmiTatiller] ON 

INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Yılbaşı Tatili')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (3, CAST(N'2022-04-23T00:00:00.000' AS DateTime), N'Ulusal Egemenlik ve Çocuk Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (4, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'Emek ve Dayanışma Günü')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (5, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Atatürk''ü Anma Gençlik ve Spor Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (6, CAST(N'2022-07-15T00:00:00.000' AS DateTime), N'Demokrasi ve Milli Birlik Günü')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (7, CAST(N'2022-08-30T00:00:00.000' AS DateTime), N'Zafer Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (8, CAST(N'2022-10-29T00:00:00.000' AS DateTime), N'Cumhuriyet Bayramı')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (9, CAST(N'2022-05-02T00:00:00.000' AS DateTime), N'Ramazan Bayramı 1.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (10, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'Ramazan Bayramı 2.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (11, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Ramazan Bayramı 3.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (12, CAST(N'2022-07-09T00:00:00.000' AS DateTime), N'Kurban Bayramı 1.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (13, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Kurban Bayramı 2.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (14, CAST(N'2022-07-11T00:00:00.000' AS DateTime), N'Kurban Bayramı 3.Gün')
INSERT [dbo].[ResmiTatiller] ([ID], [ResmiTatil], [Aciklama]) VALUES (15, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Kurban Bayramı 4.Gün')
SET IDENTITY_INSERT [dbo].[ResmiTatiller] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (2, N'Kullanici')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (3, N'Eğitim Elemanı')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Staj] ON 

INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (1, N'Eğitim Amaçlı İlk Projenin Belirlenmesi ', N'<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Staj yaptığım firmada daha &ouml;nceden birinci stajımı da tamamladığım i&ccedil;in kurum ile ilgili bilgilere ve iş akışlarına h&acirc;kimdim. Bu y&uuml;zden ilk g&uuml;n neticesinde bağlı olduğum ekibin lideri ile ger&ccedil;ekleştirdiğimiz g&ouml;r&uuml;şme sonucunda staj d&ouml;nemince s&uuml;recek bir &ccedil;alışma takvimi oluşturuldu. Bu doğrultuda eğitim ama&ccedil;lı geliştirilmesi istenen ilk proje hakkında bilgilendirme yapıldı. Projede benden temel olarak kuruma ait sadece bir istasyonda kullanılabilecek, admin, denet&ccedil;i ve pilot rol adlarına sahip personellerin kendi panelleri &uuml;zerinden işlemlerini ger&ccedil;ekleştirebildikleri basit bir sistem tasarlamam istendi. Yetki mertebesine bağlı bu sistem &uuml;zerinden ilgili kayıtlı kullanıcılar kendilerine verilen yetkiler doğrultusunda işlemler yapabilmektedir. </span><br />
<br />
<span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tasarlanmış proje kapsamında ASP.NET Core yazılım mimarisi kullanılarak C# dilinde bir web projesi geliştirilmiştir.<span style="color:black"> Geliştirilmiş olan proje de veritabanı olarak&nbsp; Microsoft SQL Server (MSSQL) kullanılmış ve proje ile veritabanı arasındaki bağlantı Entity Framework Core yaklaşımı ile sağlanmıştır.</span> <span style="color:black">ASP.NET Core yazılım mimarisi ile kullanılan diğer teknolojilerle (Jquery, Javascript, Ajax, HTML) tasarım g&uuml;&ccedil;lendirilmiştir.</span></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:20px"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong><span style="color:black">ASP.NET CORE NEDİR?</span></strong></span></span></div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="color:#333333">Microsof&rsquo;tun yeni nesil </span><span style="color:#292929">uygulama geliştirme platformu olan </span><span style="color:#333333">.Net Core a&ccedil;ık&nbsp;kaynak kodlu&nbsp;(open-source) olarak geliştirilmesi devam eden, cross platform(windows, macos, linux </span><span style="color:black">işletim sistemlerinde &ccedil;alışabilen) olarak &ccedil;alışan, esnek ve modern geliştirme platformudur. ASP.NET Core ile, t&uuml;m ASP.NET altyapısı yeniden tasarlanmış,&nbsp;<strong>Web API</strong>&nbsp;ve&nbsp;<strong>MVC</strong>&nbsp;altyapıları ile birleştirilmesini sağlamış ve geliştiricilerin daha duyarlı, g&uuml;venilir ve genişletilebilir uygulamalar geliştirebilmeleri kolaylaştırılmıştır.</span></span>&nbsp;</span></span><br />
&nbsp;</div>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/StajDefterResimleri/images/dd24ad2a_ma.png" style="height:415px; width:800px" />
<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="color:black">Şekil 1: ASP.NET Core Logo</span></span></span></span><br />
&nbsp;</div>
', CAST(N'2022-06-06T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (2, N'Veritabanı Ve Tabloların Tasarlanması', N'<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px">&nbsp; &nbsp; &nbsp; &nbsp; Geliştirilmesi istenen projenin genel hatlarını oluşturmak i&ccedil;in istenilen &ouml;zelliklerin kurgulanması ve sistemin akışı nasıl olacak onu kurgulamaya &ccedil;alıştım. Bunun &uuml;zerine veritabanı olarak Microsoft SQL Server (MSSQL) teknolojisini kullanmaya karar verdim. &Ccedil;alışma doğrultusunda ilgili veritabanına ait &ldquo;User&rdquo;, &ldquo;PermissionRole&rdquo;, &ldquo;RoleCodes&rdquo;, &ldquo;Punishments&rdquo;, &ldquo;Appreciations&rdquo; tabloları tasarlanmış ve oluşturulmuş olan;</span></span></span></span></div>

<ul>
	<li style="text-align:justify"><span style="font-size:18px"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:&quot;Times New Roman&quot;,serif">User Tablosu :</span></strong><span style="font-family:&quot;Times New Roman&quot;,serif"> Kullanıcı bilgilerini tutmaktadır.</span></span></span></li>
	<li style="text-align:justify"><span style="font-size:18px"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:&quot;Times New Roman&quot;,serif">RoleCodes:</span></strong><span style="font-family:&quot;Times New Roman&quot;,serif"> <span style="color:black">Kişilere bağlı rol adlarının kodlarını tutmaktadır.</span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:18px"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:&quot;Times New Roman&quot;,serif">PermissionRole:</span></strong><span style="font-family:&quot;Times New Roman&quot;,serif"> <span style="color:black">Rol y&ouml;netimi işleminin oluşturulabilmesi,</span> <span style="color:black">her bir kullanıcının kendisine verilen yetki doğrultusunda işlemler yapabilmesi i&ccedil;in oluşturulmuştur.</span> </span></span></span></li>
	<li style="text-align:justify"><span style="font-size:18px"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:&quot;Times New Roman&quot;,serif">Punishments:</span></strong><span style="font-family:&quot;Times New Roman&quot;,serif"> Kullanıcılara bağlı ceza kayıtlarını tutmaktadır. </span></span></span></li>
	<li style="text-align:justify"><span style="font-size:18px"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:&quot;Times New Roman&quot;,serif">Appreciations:</span></strong><span style="font-family:&quot;Times New Roman&quot;,serif"> Kullanıcılara bağlı takdir belgelerinin kayıtlarını tutmaktadır.</span></span></span></li>
</ul>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 2&rsquo;de geliştirilmiş olan sisteme ait veritabanı tablolarının ilişkisel diyagram şeması g&ouml;r&uuml;lmektedir.</span></span></div>

<div style="text-align:center"><span style="font-size:20px"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong>Microsoft SQL Server (MSSQL) Nedir?</strong></span></span></div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><em><span style="color:black">Microsoft SQL Server</span></em><span style="color:black">, Microsoft tarafından geliştirilmiş, verilerin g&uuml;venle ve b&uuml;t&uuml;nl&uuml;k i&ccedil;erisinde depolanmasını ve aynı anda birden fazla kullanıcı tarafından erişilmesini sağlayan kurumsal &ccedil;aplı bir ilişkisel veritabanı y&ouml;netim sistemidir. Birbiriyle ilişkili verilerin sistematik bir sekilde kaydedilmesini ve bu verilerden beslenen uygulamalar tarafından ihtiya&ccedil; anında kullanılmasına olanak sağlayarak veri aktarımının sorunsuz bir şekilde y&ouml;netilmesini sağlamaktadır.</span></span></span><br />
&nbsp;</div>
<img alt="" src="/StajDefterResimleri/images/4029adf3_ma.png" style="height:505px; width:485px" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/StajDefterResimleri/images/cf7e069c_ma1.png" style="height:200px; width:200px" /><br />
<span style="font-size:12.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="font-size:18px">Şekil 2:Veritabanına ait ilişkisel diyagram şeması&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Şekil 3: MSSQL Logosu&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span><br />
&nbsp;', CAST(N'2022-06-07T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (3, N'Yeni Kullanıcı Kaydı Ekleme ', N'<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt">&nbsp;<span style="font-size:18px"> &nbsp; &nbsp; &nbsp;G&uuml;n i&ccedil;erisinde geliştirilmesi istenen projenin genel taslağını kurgulayarak &ccedil;alışmalarıma başladım. Tasarlamak istediğim sistemde yetki ve izin mekanizması rol adlarına bağlı ger&ccedil;ekleştirilmeli ve giriş yapan kullanıcı kendisine verilen yetkiler doğrultusunda işlem yapabilmelidir. Bu hususla ilk &ouml;nce sistemi kullanacak kullanıcıların rol adlarını belirledim. Sistem admini, denet&ccedil;i ve pilot rollerinin bulunduğu sistemde ilk &ouml;nce adminin panelini tasarlamakla başladım. Sistem adminin g&ouml;revi basit olarak site &uuml;zerindeki t&uuml;m kullanıcıların kontrol&uuml;n&uuml; sağlamaktır. Bu hususla ilk &ouml;nce sistem &uuml;zerinden kullanıcıların eklendiği b&ouml;l&uuml;m&uuml; tasarladım. Şekil 4&rsquo;de kullanıcıların eklendiği panele ait ekran g&ouml;r&uuml;nt&uuml;s&uuml; g&ouml;r&uuml;lmektedir. Şekil 5&rsquo;de oluşturulmuş olan &ldquo;<strong>UserAdd</strong>&rdquo; methodu ile Şekil 4 &uuml;zerinden eklenmesi istenen her bir kullanıcın bilgisine bağlı se&ccedil;ilen rol adının id bilgisi yakalanmakta ve yine se&ccedil;ilen profil resmi ise proje i&ccedil;erisinde oluşturulmuş &ldquo;Image&rdquo; klas&ouml;r&uuml; altında tutulmaktadır. İlgili kullanıcı bilgileri daha sonra veritabanında bulunan &ldquo;<strong>User</strong>&rdquo;, &ldquo;<strong>Punishments</strong>&rdquo;, &ldquo;<strong>Appreciations</strong>&rdquo; tablolarına kaydedilmektedir. Şekil 6&rsquo;da sistem &uuml;zerindeki kullanıcıların rol kodlarına bağlı rol adları g&ouml;r&uuml;lmektedir.</span><br />
<br />
<span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/d31085c8_me.png" style="height:329px; width:357px" /><img alt="" src="/StajDefterResimleri/images/1ad9e259_mi.png" style="height:81px; width:250px" /><img alt="" src="/StajDefterResimleri/images/15c0a8ba_mö.png" style="height:90px; width:200px" /><br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Şekil 4: Yeni kullanıcı ekleme sayfası&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Şekil 6: Rol kodlarına bağlı rol adları</span></span></span></span></div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/ac413cfa_Resim.png" style="height:353px; width:569px" /></span></span></span></span></div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:18px">Şekil 5: Yeni kullanıcı ekleme Action metot</span></span></span></span><br />
&nbsp;</div>
', CAST(N'2022-06-08T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (4, N'Personel Kaydının Silinmesi', N'<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt">&nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:18px">G&uuml;n i&ccedil;erisinde sisteme kayıtlı kullanıcıların listelendiği &ldquo;UserLists&rdquo; sayfası &uuml;zerinden erişilebilecek ve sadece sistem admini tarafından ger&ccedil;ekleştirilebilecek se&ccedil;ili kullanıcıyı silme amacı doğrultusunda &ccedil;alışma ger&ccedil;ekleştirdim. Bu &ccedil;alışma neticesinde ilgili kayıt JQuery Ajax ile post edilmekte ve veritabanından silinmektedir. Şekil 7&rsquo;de &ldquo;UserLists&rdquo; sayfası &uuml;zerinden tıklanan her bir veri, Şekil 8&rsquo;de admin controller i&ccedil;erisinde bulunan &ldquo;UserDelete&rdquo; metodunu tetiklemekte ve şayet ilgili kullanıcıya ait kayıtlı bir belge var ise proje i&ccedil;erisinde bulunan &ldquo;AppreciationDocument&rdquo; klas&ouml;r&uuml;nden ve <span style="background-color:white"><span style="color:black">veritabanında bulunan </span></span>&ldquo;User&rdquo;, &ldquo;Punishments&rdquo;, &ldquo;Appreciations&rdquo; tablolarından <span style="background-color:white"><span style="color:black">Ajax ile Post edilerek kayıt başarıyla silinmektedir.&nbsp;</span></span></span></span></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:20px"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong>Ajax Nedir?</strong></span></span></div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Ajax, &ldquo;Asynchronous JavaScript and XML&rdquo; (T&uuml;rk&ccedil;e: Eşzamansız JavaScript ve XML) anlamına gelen ve bir &ccedil;ok programlama dili ile uyumlu &ccedil;alışan bir tekniktir. B&uuml;t&uuml;n sayfayı kullanıcıya tekrar y&uuml;kletmeden (POST/BACK) olayı olmadan, sadece gerekli olan veriyi dinamik olarak ekrana getirmek veya sunucuya veri g&ouml;ndermektir.</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="/StajDefterResimleri/images/1513009b_Resim1.png" style="height:350px; width:410px" /><br />
Şekil 7: JQuery Ajax ile silme işlemi<br />
<br />
<img alt="" src="/StajDefterResimleri/images/a2ec75c3_Resim2.png" style="height:305px; width:670px" /></span></span></div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 8: Silme işleminin yapılması i&ccedil;in tetiklenen metot</span></span></div>
', CAST(N'2022-06-09T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (5, N'Kullanıcı Bilgilerinin Listelenmesi', N'<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Admin controller i&ccedil;erisinde oluşturulmuş olan &ldquo;UserAdd&rdquo; methodu ile eklenen her bir kullanıcı bilgisi Şekil 9&rsquo;da oluşturulmuş olan PagedList (sayfalama) methodu ile &ldquo;UserLists&rdquo; sayfasında 6&rsquo;şarlı şekilde&nbsp; listelenmiş olacaktır. Şekil 10&rsquo;da kullanıcıların listelenmesi i&ccedil;in oluşturulmuş&nbsp; method&nbsp; ve Şekil 11&rsquo;de kullanıcıların listelendiği sayfaya ait ekran &ccedil;ıktısı g&ouml;r&uuml;lmektedir. Sistem admini ilgili sayfa &uuml;zerinden kullanıcıların bilgilerini silme, g&uuml;ncelleme ve detay bilgisini ulaşabilme yetkisine sahiptir. Ayrıca ilgili sayfa &uuml;zerinde bir arama men&uuml;s&uuml; (search filter) mevcut olup klavyeden girilen s&ouml;zc&uuml;ğe bağlı filtreleme işlemi yapılmaktadır. Şekil 12&rsquo;de javascript kullanılarak filtreleme işlemi yapılmış ve Şekil 11&rsquo;de yapılan filtreleme işlemine ait ekran g&ouml;r&uuml;nt&uuml;s&uuml;ne yer verilmiştir.<br />
<br />
<img alt="" src="/StajDefterResimleri/images/68ca0101_Resim3.png" style="height:115px; width:450px" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/StajDefterResimleri/images/0171d098_Resim4.png" style="height:63px; width:290px" /></span></span></div>
<span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Şekil 9: PagedList Sayfalama&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Şekil 10: Kullanıcıların listelendiği Action metot</span></span>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="/StajDefterResimleri/images/9fe95ff2_Resim5.png" style="height:353px; width:620px" /></span></span></div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 11: Kullanıcıların listelendiği sayfa<br />
<img alt="" src="/StajDefterResimleri/images/a3f51010_Resim6.png" style="height:148px; width:500px" /><br />
Şekil 12: Javacript ile filtreleme işlemi<br />
<img alt="" src="/StajDefterResimleri/images/855de3c1_Resim7.png" style="height:106px; width:700px" /><br />
Şekil 13: Kullanıcıların listelendiği sayfada filtreleme işlemi arama men&uuml;s&uuml; (search filter)</span></span><br />
&nbsp;</div>
', CAST(N'2022-06-10T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (6, N'Personel Bilgilerine Ait Detay Sayfasının Oluşturulması', N'<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt">&nbsp; &nbsp; &nbsp; &nbsp;<span style="font-size:18px">Staj g&uuml;n&uuml;m i&ccedil;erisinde admin panelinde bulunan, sisteme kayıtlı kullanıcıların listelendiği &ldquo;UserLists&rdquo; sayfası &uuml;zerinden erişilebilecek ve sadece sistem admini tarafından ger&ccedil;ekleştirilebilecek se&ccedil;ili kullanıcı bilgilerinin listelendiği detay sayfasını tasarladım. Şekil 13&rsquo;de sayfaya ait oluşturulmuş <span style="background-color:white"><span style="color:black">Action metot ile</span></span> kullanıcıya ait ceza ve takdir bilgileri kontrol edilmiş ve &ldquo;Appreciations&rdquo; ile &ldquo;Punishments&rdquo; tablolarında bulunan kayıtların &ldquo;Viewbag&rdquo; nesnesi ile controllerdan sayfa &uuml;zerine taşınması sağlanmıştır. Şekil 14&rsquo;de se&ccedil;ili kullanıcı bilgilerinin yer aldığı detay sayfasına ait ekran &ccedil;ıktısı g&ouml;r&uuml;lmektedir.</span></span></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><img alt="" src="/StajDefterResimleri/images/aabd11f6_Resim8.png" style="height:196px; width:740px" /><br />
<span style="font-size:18px">Şekil 13: Kullanıcı detay bilgilerinin listelendiği Action metot<br />
<img alt="" src="/StajDefterResimleri/images/0a61b098_Resim9.png" style="height:281px; width:684px" /></span></span></span></span></div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px">Şekil 14: </span></span></span></span><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Kullanıcı detay sayfası</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong><span style="background-color:white"><span style="color:black">ViewBag Nesnesi Nedir?</span></span></strong></span></span></div>

<div>&nbsp;</div>

<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="background-color:white"><span style="color:black">&nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:18px">&nbsp; ViewBag nesnesi ASP.NET Mvc ve ASP.NET Core yazılım mimarilerinde kullanılan&nbsp;</span></span></span></span></span></span><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="background-color:white"><span style="color:black"><span style="font-size:18px">ve dinamik bir yapı sergileyen veri taşıma nesnesidir. Bir veritabanı modeli veya herhangi bir nesne &uuml;zerinden controllerdan sayfa &uuml;zerine (view) veri g&ouml;nderme işlemini sağlamaktadır.</span></span></span></span></span></span><br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
&nbsp;</div>
', CAST(N'2022-06-11T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (7, N'Personellere Ait Ceza Bilgilerinin Görüntülenmesi', N'<div style="text-align:justify"><span style="font-size:12.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp;<span style="font-size:18px">Geliştirmiş olduğum proje de sistem adminin panelini başarıyla tamamladıktan sonra pilotların denetleme işlemlerini ger&ccedil;ekleştirecek denet&ccedil;ilerin (auditor) panelini g&uuml;n i&ccedil;erinde tasarlamaya başladım. Admin tarafından eklenen denet&ccedil;ilerin sistem &uuml;zerindeki g&ouml;revleri pilotların u&ccedil;uş programları boyunca denetlenmesine sağlamak ve kazanmış oldukları ceza ve takdir bilgilerinin sistem &uuml;zerinden kontrol&uuml;n&uuml; ger&ccedil;ekleştirmektir. Bu ama&ccedil; doğrultusunda ilk &ouml;nce sistem &uuml;zerinde kayıtlı pilot rol adına sahip kullanıcıların ceza bilgilerinin yer aldığı paneli tasarlamaktan başladım. Şekil 15&rsquo;de ceza bilgilerinin yer aldığı &ldquo;PunishmentInfo&rdquo; sayfasına ait ekran g&ouml;r&uuml;nt&uuml;s&uuml; g&ouml;z&uuml;kmektedir. Denet&ccedil;i, ilgili sayfa &uuml;zerinden pilot rol adına sahip personellerin kişisel bilgilerini g&ouml;r&uuml;p aynı zamanda ceza bilgilerini ekleme,silme,g&uuml;ncelleme işlemlerini ger&ccedil;ekleştirebilme yetkisine sahiptir. Şekil 16&rsquo;da sayfa &uuml;zerinden veritabanında bulunan &ldquo;Punishments&rdquo; tablosunda ilgili kullanıcının ceza a&ccedil;ıklaması ve puan bilgisi sorgulanmış şayet kayıt var ise a&ccedil;ıklama bilgisinin uzayıp sayfa b&uuml;t&uuml;nl&uuml;ğ&uuml;n&uuml; bozmaması adına ceza bilgisinin karakter sayısı 35.karakterden itibaren kesilmiş, kullanıcıya ait kayıt yok ise &ldquo;Personele ait ceza ve puan kaydı bulunamadı&rdquo; mesajı sayfa &uuml;zerinden g&ouml;sterilmiştir. Şekil 17&rsquo;de ise sayfaya ait oluşturulmuş <span style="background-color:white"><span style="color:black">Action metoda yer verilmiştir.</span></span></span></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:12.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:18px"><span style="background-color:white"><span style="color:black"><img alt="" src="/StajDefterResimleri/images/ee467cf7_Resim10.png" style="height:327px; width:610px" /></span></span></span></span></span><br />
<span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 15: Pilotlara ait ceza bilgilerinin g&ouml;r&uuml;nt&uuml;lendiği sayfa</span></span></div>

<div><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="/StajDefterResimleri/images/412b3240_Resim11.png" style="height:353px; width:340px" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/StajDefterResimleri/images/874078ed_Resim12.png" style="height:95px; width:380px" /></span><br />
<span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; Şekil 16: Ceza bilgi sorgulaması&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Şekil 17: Kullanıcı bilgilerinin listelendiği Action metot</span></span></div>
', CAST(N'2022-06-13T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (8, N'Ceza Bilgilerinin Eklenmesi,Silinmesi Ve Güncellenmesi', N'<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:18px">Sistem &uuml;zerinden pilot rol adlı kullanıcıların listelendiği &ldquo;PunishmentInfo&rdquo; sayfası &uuml;zerinden erişilebilecek ve sadece denet&ccedil;iler tarafından ger&ccedil;ekleştirilebilecek se&ccedil;ilen kullanıcıya ait ceza bilgilerinin eklendiği, silindiği ve g&uuml;ncellendiği b&ouml;l&uuml;mlere ait g&uuml;n i&ccedil;erisinde &ccedil;alışmalar ger&ccedil;ekleştirdim. Şekil 18&rsquo;de se&ccedil;ili kullanıcıya ait ceza kaydının eklenip, g&uuml;ncellendiği, &ldquo;PunishmentInfoEdit&rdquo; sayfası, Şekil 19&rsquo;da ise yazılan Action metot g&ouml;r&uuml;lmektedir. Kod bloğu ile denet&ccedil;iler tarafından se&ccedil;ilen kullanıcıların veritabanında ceza bilgilerinin yer aldığı &ldquo;Punishments&rdquo; tablosundaki kaydı yakalanmakta ve eklenmesi istenen ceza a&ccedil;ıklama ve puan bilgisi ilgili kullanıcının kaydı &uuml;zerinde g&uuml;ncellenmektedir. Şekil 20&rsquo;de ise silinmesi istenen kullanıcı kaydının id bilgisi Ajax ile post edilmekte ve Şekil 21&rsquo;de bulunan &ldquo;PunishmentDelete&rdquo; metoduna y&ouml;nlendirilmiştir. Se&ccedil;ilen kullanıcıya ait ceza puan ve a&ccedil;ıklama bilgisinin b&ouml;ylece ilgili veritabanı tablosunda null olarak g&uuml;ncellenmesi sağlanmıştır.</span></span></span></span></div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/282f31f9_Resim13.png" style="height:192px; width:550px" /><br />
Şekil 18: Kullanıcıya ait ceza bilgilerinin eklenip g&uuml;ncellenmesini sağlayan Action Metot<br />
<img alt="" src="/StajDefterResimleri/images/206b614e_Resim14.png" style="height:270px; width:610px" /><br />
Şekil 19: Ceza bilgilerinin eklenip g&uuml;ncellendiği sayfa</span></span></span></span></div>

<div><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/7d60e706_Resim15.png" style="height:267px; width:364px" />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/StajDefterResimleri/images/dd067431_Resim16.png" style="height:94px; width:417px" /></span></div>
<span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Şekil 20: Ajax ile silme işlemi&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Şekil 21: Silme işleminin yapılması i&ccedil;in tetiklenen metot</span></span><br />
&nbsp;', CAST(N'2022-06-14T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (9, N'Personellere Ait Takdir Belgelerinin Yüklenmesi 1', N'<div style="text-align:justify"><span style="font-size:18px">&nbsp; &nbsp; &nbsp; <span style="font-family:Times New Roman,Times,serif">&nbsp; Denet&ccedil;i panelinde yer alan &ldquo;AppreciationsInfo&rdquo; sayfası aracılığıyla erişilebilen ve pilotların u&ccedil;uş programları boyunca kazanmış oldukları takdir belgelerinin sistem &uuml;zerinden y&uuml;klenilmesi amacı doğrultusunda yapılan &ccedil;alışmalar (Şekil 22&rsquo;de &ldquo;AppreciationsEdit&rdquo; sayfası, Şekil 23&rsquo;de&nbsp; ise dosya y&uuml;kleme işleminin yapıldığı script) g&ouml;r&uuml;lmektedir. Dosya y&uuml;kleme işlemi i&ccedil;in &ldquo;Dropzone JS&rdquo; k&uuml;t&uuml;phanesinden faydalanılmış, Şekil 24&rsquo;de dropzone k&uuml;t&uuml;phanesi kullanılarak &ouml;zelleştirilmiş scripte yer verilmiştir. Şekil 25&rsquo;de ise sayfa tasarımında html form etiketi i&ccedil;erisinde oluşturulmuş olan dropzone js g&ouml;r&uuml;lmektedir.</span></span></div>

<div style="text-align:center"><img alt="" src="/StajDefterResimleri/images/4b406289_Resim17.png" style="height:212px; width:670px" /><br />
<span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 22: Kullanıcıya ait takdir belgesinin y&uuml;klendiği sayfa<br />
<img alt="" src="/StajDefterResimleri/images/db0257e8_Resim18.png" style="height:377px; width:600px" /><br />
Şekil 23: Dosya y&uuml;kleme işleminin yapıldığı script<br />
<img alt="" src="/StajDefterResimleri/images/afa367e8_Resim19.png" style="height:98px; width:590px" /><br />
Şekil 25: Sayfaya ait html etiketi</span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong>Dropzone JS K&uuml;t&uuml;phanesi Nedir?</strong></span></span></div>

<div style="text-align:justify"><span style="font-size:18px"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="color:#2c2f34">&nbsp; &nbsp; &nbsp; &nbsp; Dropzone js k&uuml;t&uuml;phanesi Web siteleri i&ccedil;in kullanılabilecek dosya y&uuml;kleme işlemi i&ccedil;in kullanılan java script eklentisidir. Bu script ile web siteleri &uuml;zerinden tekli veya &ccedil;oklu şekilde dosya y&uuml;kleme işlemi ger&ccedil;ekleştirilebilmektedir.</span></span></span></span><br />
<br />
&nbsp;</div>
', CAST(N'2022-06-15T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Staj] ([StajID], [Baslik], [Icerik], [Tarih], [KullaniciID], [StajNo]) VALUES (10, N'Personellere Ait Takdir Belgelerinin Yüklenmesi 2', N'<div style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:18px">&nbsp; &nbsp; &nbsp; Bir &ouml;nceki g&uuml;n sayfasını tasarlamış olduğum ve kullanıcıların takdir belgelerinin y&uuml;klenmesi amacıyla oluşturulmuş olan &ldquo;AppreciationsEdit&rdquo; sayfasının back-end kodlamasına ait g&uuml;n i&ccedil;erisinde &ccedil;alışmalar ger&ccedil;ekleştirdim. Bu &ccedil;alışmalar neticesinde sayfaya ait Şekil 27&rsquo;de yer alan Action metot g&ouml;r&uuml;lmekte ve oluşturulan metot ile sayfa &uuml;zerinden belge y&uuml;klenecek se&ccedil;ili personelin veritabanında takdir bilgilerinin yer aldığı &ldquo;Appreciations&rdquo; tablosundaki kullanıcı kaydı yakalanmış ve y&uuml;klenilmesi istenen dosyaya benzersiz isme sahip olması i&ccedil;in guid ataması yapılıp proje i&ccedil;erisinde oluşturulan &ldquo;AppreciationsDocument&rdquo; klas&ouml;r&uuml; i&ccedil;erisine dosya kaydedilmiştir. Daha sonra kaydedilmesi istenen dosyanın ad ve tarih bilgisi ise kullanıcının ilgili veritabanı tablosunundaki kaydının g&uuml;ncellenmesi sağlanmıştır. &nbsp;</span></span></div>

<div style="text-align:center"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/dc38f9c4_Resim20.png" style="height:308px; width:600px" /><br />
<span style="font-family:&quot;Times New Roman&quot;,serif">Şekil 27: Kullanıcıya ait takdir belgesinin proje i&ccedil;erisinde oluşturulan klas&ouml;re adının ise veritabanına kaydedilmesini sağlayan Action metot</span></span><br />
&nbsp;</div>

<div style="text-align:justify"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px">&nbsp; &nbsp; Silinmesi istenen kullanıcı belge kaydının id bilgisi Ajax ile post edilmiş ve Şekil 28&rsquo;de bulunan &ldquo;<span style="color:black">AppreciationDocumentDelete</span>&rdquo; metoduna y&ouml;nlendirilmiştir. Se&ccedil;ilen kullanıcıya ait belge ve tarih bilgisinin b&ouml;ylece ilgili veritabanı tablosunda null olarak g&uuml;ncellenmesi ve ilgili belgenin proje i&ccedil;erisinde kaydedildiği &ldquo;<span style="color:black">AppreciationsDocument</span>&rdquo; klas&ouml;r&uuml; i&ccedil;erisinden de silinmesi sağlanmıştır.&nbsp;</span></span></span></span><br />
&nbsp;</div>

<div style="text-align:center"><span style="font-size:11pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:12.0pt"><span style="font-size:18px"><img alt="" src="/StajDefterResimleri/images/cd7638ab_Resim21.png" style="height:241px; width:659px" /><br />
Şekil 28: Kullanıcıya ait takdir belgesinin klas&ouml;rden ve veritabanından silinmesini tetikleyen metot</span></span></span></span><br />
<br />
<br />
&nbsp;</div>
', CAST(N'2022-06-16T00:00:00.000' AS DateTime), 6, NULL)
SET IDENTITY_INSERT [dbo].[Staj] OFF
GO
SET IDENTITY_INSERT [dbo].[StajAdi] ON 

INSERT [dbo].[StajAdi] ([ID], [Adi]) VALUES (1, N'Staj 1')
INSERT [dbo].[StajAdi] ([ID], [Adi]) VALUES (2, N'Staj 2')
SET IDENTITY_INSERT [dbo].[StajAdi] OFF
GO
SET IDENTITY_INSERT [dbo].[StajBaslatilsinMi] ON 

INSERT [dbo].[StajBaslatilsinMi] ([ID], [Adi], [Aciklama]) VALUES (2, N'Staj Dönemi Başlat', N'deneme')
SET IDENTITY_INSERT [dbo].[StajBaslatilsinMi] OFF
GO
SET IDENTITY_INSERT [dbo].[StajBasvuruBelgeleri] ON 

INSERT [dbo].[StajBasvuruBelgeleri] ([ID], [BelgeAdi], [Tarih], [KullaniciID], [StajDonemNO]) VALUES (1005, N'091d8eba_StajBasvuruBelgeleri.pdf', CAST(N'2022-05-04T21:03:05.580' AS DateTime), 6, 2)
SET IDENTITY_INSERT [dbo].[StajBasvuruBelgeleri] OFF
GO
SET IDENTITY_INSERT [dbo].[StajDurum] ON 

INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (1, N'Staj 2 Onaylandı', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (2, N'Reddedildi', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (3, N'Beklemede(Onay Bekliyor)', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (4, N'Evrak Bekleniyor', 1)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (5, N'Başvuru Yapılmadı', 0)
INSERT [dbo].[StajDurum] ([StajDurumID], [StajDurumAdi], [Gizle]) VALUES (6, N'Staj 2 Tamamlandı', 1)
SET IDENTITY_INSERT [dbo].[StajDurum] OFF
GO
SET IDENTITY_INSERT [dbo].[StajyerOgrenciBaslatma] ON 

INSERT [dbo].[StajyerOgrenciBaslatma] ([ID], [IsyeriAdi], [StajBaslangicTarihi], [StajBitisTarihi], [HaftaIciGunSayisi], [ResmiTatilSayisi], [ToplamCalismaSüresi], [Tarih], [CumartesiCalisiyorMu], [StajAdiID], [KullaniciID], [IsyeriAdresi]) VALUES (3, N' Türk Hava Yolları Teknoloji Ve Bilişim A.Ş', CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), 20, 0, 20, CAST(N'2022-05-04T21:04:36.247' AS DateTime), N'Evet', 2, 6, N'Halkalı Merkez, Basın Ekspres Yolu no 33, Küçükçekmece/İstanbul ')
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
