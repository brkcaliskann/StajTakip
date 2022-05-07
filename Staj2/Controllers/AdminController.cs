using OfficeOpenXml;
using OfficeOpenXml.Style;
using Staj2.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Staj2.Controllers
{
    public class AdminController : Controller
    {
        Staj2DB context = new Staj2DB();
        List<DateTime> ResmiTatil = new List<DateTime>();
        // GET: Admin

        public class kullanicilModel
        {
            public List<Kullanici> kullanici { get; set; }
            public List<StajDurum> stajdurum { get; set; }

        }

        [Authorize(Roles = "Admin,Eğitim Elemanı,Kullanici")]
        public ActionResult Index()
        {
            var data = context.KullaniciRol.Where(x => x.Kullanici.OnaylandiMi == false && x.Kullanici.Status == false).ToList();

            return View(data);
        }

        public void OgrenciKaydiSil(int id)
        {
            var data = context.Kullanici.Where(x => x.KullaniciID == id).FirstOrDefault();

            data.Status = true;

            context.Entry(data).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
        }

        [HttpPost]
        public JsonResult StajBasvuruBelgesiGetir(int id)
        {
            //var dosya = context.StajBasvuruBelgeleri.Include("Kullanici").Where(m => m.KullaniciID == id);

            var dosya = context.StajBasvuruBelgeleri.Include("Kullanici").Where(m => m.KullaniciID == id).OrderByDescending(x => x.Tarih)/*.Take(5)*/;

            List<StajBasvuruBelgeleri> son = new List<StajBasvuruBelgeleri>();

            ViewBag.liste = context.StajDurum.ToList();

            foreach (var item in dosya)
            {
                son.Add(new StajBasvuruBelgeleri
                {
                    ID = item.ID,
                    BelgeAdi = item.BelgeAdi,
                    KullaniciID = item.KullaniciID,
                    Tarih = item.Tarih,
                    StajDonemNO = item.StajDonemNO
                });
            }
            return Json(son);
        }

        [HttpPost]
        public JsonResult GeriGonderilenBelgeGetir(int id)
        {
            var dosya = context.GeriGonderilenBelgeler.Include("Kullanici").Where(m => m.KullaniciID == id);

            List<GeriGonderilenBelgeler> son = new List<GeriGonderilenBelgeler>();

            foreach (var item in dosya)
            {

                son.Add(new GeriGonderilenBelgeler
                {
                    ID = item.ID,
                    BelgeAdi = item.BelgeAdi,
                    KullaniciID = item.KullaniciID,
                    Aciklama = item.Aciklama,
                    Tarih = item.Tarih
                });

            }

            return Json(son);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult DosyaYukle()
        {
            var kullaniciresult = context.Kullanici.Where(x => x.OnaylandiMi == false).ToList();

            kullanicilModel result = new kullanicilModel
            {
                kullanici = kullaniciresult
            };

            return View(result);
        }

        [HttpPost]
        public ActionResult DosyaYukle(IEnumerable<HttpPostedFileBase> files, GeriGonderilenBelgeler ggb, string aciklama, int KullaniciID)
        {
            string numara = User.Identity.Name;
            int kullaniciId = context.Kullanici.Where(x => x.Numara == numara).Select(x => x.KullaniciID).FirstOrDefault();

            string gd = Guid.NewGuid().ToString().Substring(0, 8);
            string fName = "";

            var kullaniciresult = context.Kullanici.Where(x => x.OnaylandiMi == false).ToList();

            kullanicilModel result = new kullanicilModel
            {
                kullanici = kullaniciresult
            };

            if (files == null)
            {
                if (aciklama != null)
                {
                    ggb.Aciklama = aciklama;
                    ggb.BelgeAdi = "";
                    ggb.Tarih = DateTime.Now;
                    ggb.KullaniciID = KullaniciID;

                    context.GeriGonderilenBelgeler.Add(ggb);
                    context.SaveChanges();

                    return View(result);
                }
            }

            if (files != null)
            {
                foreach (var file in files)
                {
                    fName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {
                        var originalDirectory = new DirectoryInfo(string.Format("{0}GeriGonderilenEvraklar\\", Server.MapPath(@"\")));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Belgeler");

                        var fileName1 = gd + "_" + Path.GetFileName(file.FileName);

                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, fileName1);
                        file.SaveAs(path);

                        ggb.BelgeAdi = fileName1;
                        ggb.KullaniciID = KullaniciID;
                        ggb.Tarih = DateTime.Now;
                        ggb.Aciklama = aciklama;

                        context.GeriGonderilenBelgeler.Add(ggb);
                        context.SaveChanges();
                    }
                }
            }
            return View(result);
        }

        [Authorize(Roles = "Admin,Kullanici,Eğitim Elemanı")]
        public FileResult Download(string file)
        {
            byte[] fileBytes = System.IO.File.ReadAllBytes(Server.MapPath("~/GeriGonderilenEvraklar/Belgeler/" + file + ""));
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, file);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult Goster(string dosya)
        {
            FileInfo file = new FileInfo(Server.MapPath("~/StajBasvuruBelgeleri/Staj2/" + dosya + ""));
            FileInfo file1 = new FileInfo(Server.MapPath("~/GeriGonderilenEvraklar/Belgeler/" + dosya + ""));
            FileInfo file2 = new FileInfo(Server.MapPath("~/StajDefterleri/Defterler/" + dosya + ""));

            if (file.Exists)
            {
                Response.ContentType = "application/pdf";
                Response.Clear();
                Response.TransmitFile(file.FullName);
                Response.End();
            }


            else if (file1.Exists)
            {
                Response.ContentType = "application/pdf";
                Response.Clear();
                Response.TransmitFile(file1.FullName);
                Response.End();
            }

            else if (file2.Exists)
            {
                Response.ContentType = "application/pdf";
                Response.Clear();
                Response.TransmitFile(file2.FullName);
                Response.End();
            }

            return View();
        }

        [Authorize(Roles = "Admin,Kullanici,Eğitim Elemanı")]

        public ActionResult DosyaSil(string adi)
        {
            var dosya = context.GeriGonderilenBelgeler.Where(m => m.BelgeAdi == adi).SingleOrDefault();
            return View(dosya);
        }

        [HttpPost]
        public ActionResult DosyaSil(string adi, FormCollection collection)
        {
            var dosya = context.GeriGonderilenBelgeler.Where(m => m.BelgeAdi == adi).FirstOrDefault();

            if (dosya == null)
            {
                return RedirectToAction("DosyaYukle", "Admin");
            }
            if (System.IO.File.Exists(Server.MapPath("~/GeriGonderilenEvraklar/Belgeler/" + dosya.BelgeAdi)))
            {
                System.IO.File.Delete(Server.MapPath("~/GeriGonderilenEvraklar/Belgeler/" + dosya.BelgeAdi));

            }

            context.GeriGonderilenBelgeler.Remove(dosya);
            context.Entry(dosya).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();

            return RedirectToAction("DosyaYukle", "Admin");
        }

        [HttpPost]
        public void StajBasvuruBelgesiSil(int id)
        {
            var dosya = context.StajBasvuruBelgeleri.Where(m => m.ID == id).FirstOrDefault();

            if (dosya != null && System.IO.File.Exists(Server.MapPath("~/StajBasvuruBelgeleri/Belgeler/" + dosya.BelgeAdi)))
            {
                System.IO.File.Delete(Server.MapPath("~/StajBasvuruBelgeleri/Belgeler/" + dosya.BelgeAdi));

            }

            context.StajBasvuruBelgeleri.Remove(dosya);
            context.Entry(dosya).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();
        }

        public void GeriGonderilenBelgeSil(int id)
        {
            var dosya = context.GeriGonderilenBelgeler.Where(m => m.ID == id).FirstOrDefault();

            if (dosya != null && System.IO.File.Exists(Server.MapPath("~/StajBasvuruBelgeleri/Belgeler/" + dosya.BelgeAdi)))
            {
                System.IO.File.Delete(Server.MapPath("~/StajBasvuruBelgeleri/Belgeler/" + dosya.BelgeAdi));

            }

            context.GeriGonderilenBelgeler.Remove(dosya);
            context.Entry(dosya).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();
        }


        [HttpPost]
        public ActionResult CikisYap()
        {
            Session.Abandon();
            Response.Cookies.Clear();

            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult BasvuruDosyalari()
        {
            var kullaniciresult = context.Kullanici.Where(x => x.OnaylandiMi == false).ToList();

            kullanicilModel result = new kullanicilModel
            {
                kullanici = kullaniciresult
            };

            ViewBag.liste = context.StajDurum.Where(x => x.Gizle == true).ToList();

            //ViewBag.liste = context.StajDurum.ToList();

            return View(result);
        }

        public JsonResult BasvuruDurumu(int? id)
        {
            ViewBag.liste = context.StajDurum.Where(x => x.Gizle == true).Select(x => x.StajDurumAdi).ToList();

            List<Kullanici> kullaniciliste = context.Kullanici.Where(f => f.KullaniciID == id).OrderBy(f => f.StajDurum.StajDurumAdi).ToList();

            List<SelectListItem> itemlist = (from i in kullaniciliste
                                             select new SelectListItem
                                             {
                                                 Value = i.StajDurumID.ToString(),
                                                 Text = i.StajDurum.StajDurumAdi

                                             }).ToList();

            return Json(itemlist, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult BasvuruDosyalari(int? stajDurumID, int? KullaniciID)
        {
            string numara = User.Identity.Name;
            int kullaniciId = context.Kullanici.Where(x => x.Numara == numara).Select(x => x.KullaniciID).FirstOrDefault();
            Kullanici kullanici = context.Kullanici.Where(x => x.KullaniciID == kullaniciId).FirstOrDefault();

            var kullaniciresult = context.Kullanici.Where(x => x.OnaylandiMi == false).ToList();

            kullanicilModel result = new kullanicilModel
            {
                kullanici = kullaniciresult
            };

            ViewBag.liste = context.StajDurum.ToList();

            Kullanici kl = context.Kullanici.Where(x => x.KullaniciID == KullaniciID).FirstOrDefault();

            if (kl != null)
            {
                kl.StajDurumID = stajDurumID;
                kl.BasvuruyuDegerlendiren = kullanici.Adi + " " + kullanici.Soyadi;
                kl.BasvuruDegerlendirilmeTarihi = DateTime.Now;
                context.Entry(kl).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();

                return View(result);
            }

            else
            {
                ViewBag.Uyari = "Lütfen öğrenci bilgisini seçiniz.";
                return View(result);
            }
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult StajDonemiBaslatDurdur()
        {
            var data = context.StajBaslatilsinMi.Where(x => x.ID == 2).FirstOrDefault();

            return View(data);
        }

        [HttpPost]
        public ActionResult StajDonemiBaslatDurdur(string StajBaslatilsinMi, string aciklama)
        {
            StajBaslatilsinMi veri = new StajBaslatilsinMi();
            StajBaslatilsinMi data = context.StajBaslatilsinMi.Where(x => x.ID == 2).FirstOrDefault();

            data.Adi = StajBaslatilsinMi;
            data.Aciklama = aciklama;

            //context.StajBaslatilsinMi.Add(data);
            context.Entry(data).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
            ViewBag.Mesaj = data.Adi + "ılmıştır";

            if (StajBaslatilsinMi == "Seçiniz")
            {
                ViewBag.Mesaj = "Lütfen staj dönemi bilgisini seçiniz.";
                return View(data);
            }

            return View(data);
        }

        //[Authorize(Roles = "Admin,Eğitim Elemanı")]
        //public ActionResult KayitSil()
        //{
        //    return RedirectToAction("Index", "Admin");
        //}

        //[HttpPost]
        //public ActionResult KayitSil(int[] customerIDs)
        //{
        //    if (customerIDs != null)
        //    {
        //        foreach (int customerId in customerIDs)
        //        {
        //            KullaniciRol rol = (from c in context.KullaniciRol
        //                                where c.KullaniciID == customerId
        //                                select c).FirstOrDefault();
        //            context.KullaniciRol.Remove(rol);
        //            context.SaveChanges();


        //            StajBasvuruBelgeleri kullanici = (from c in context.StajBasvuruBelgeleri
        //                                              where c.KullaniciID == customerId
        //                                              select c).FirstOrDefault();
        //            if (kullanici != null)
        //            {
        //                context.StajBasvuruBelgeleri.Remove(kullanici);
        //                context.SaveChanges();
        //            }

        //            Kullanici customer = (from c in context.Kullanici
        //                                  where c.KullaniciID == customerId
        //                                  select c).FirstOrDefault();
        //            context.Kullanici.Remove(customer);
        //            context.SaveChanges();
        //        }

        //    }
        //    return Json("Kayıt Silme İşlemi Başarıyla Gerçekleştirilmiştir");
        //}

        //[Authorize(Roles = "Admin,Eğitim Elemanı")]
        //public ActionResult OgrenciKayitSil(int id)
        //{
        //    var data = context.Kullanici.Where(x => x.KullaniciID == id).FirstOrDefault();

        //    return View(data);
        //}

        //[HttpPost]
        //public ActionResult OgrenciKayitSil(KullaniciRol kr, int id)
        //{
        //    var kullanici = context.KullaniciRol.Where(x => x.Kullanici.KullaniciID == id).FirstOrDefault();
        //    var data = context.Kullanici.Where(x => x.KullaniciID == id).FirstOrDefault();
        //    var belge = context.StajBasvuruBelgeleri.Where(x => x.KullaniciID == id).FirstOrDefault();
        //    var gerigonderilenbelge = context.GeriGonderilenBelgeler.Where(x => x.KullaniciID == id).FirstOrDefault();

        //    context.KullaniciRol.Remove(kullanici);
        //    context.Entry(kullanici).State = System.Data.Entity.EntityState.Deleted;
        //    context.SaveChanges();

        //    if (belge != null)
        //    {
        //        context.StajBasvuruBelgeleri.Remove(belge);
        //        context.Entry(belge).State = System.Data.Entity.EntityState.Deleted;
        //        context.SaveChanges();
        //    }

        //    if (gerigonderilenbelge != null)
        //    {
        //        context.GeriGonderilenBelgeler.Remove(gerigonderilenbelge);
        //        context.Entry(gerigonderilenbelge).State = System.Data.Entity.EntityState.Deleted;
        //        context.SaveChanges();
        //    }

        //    context.Kullanici.Remove(data);
        //    context.Entry(data).State = System.Data.Entity.EntityState.Deleted;
        //    context.SaveChanges();

        //    return RedirectToAction("Index", "Admin");
        //}

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult StajBasvuruListesi()
        {
            var data = context.StajyerOgrenciBaslatma.Where(x => x.Kullanici.StajDurumID == 1).ToList();

            return View(data);
        }

        public void BasvuruListesi()
        {
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            var data = context.Kullanici.Where(x => x.OnaylandiMi == false).ToList();

            ExcelPackage exclPckg = new ExcelPackage();

            ExcelWorksheet ws = exclPckg.Workbook.Worksheets.Add("Rapor");
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6"].Style.Font.Size = 17;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6"].Style.Font.Name = "Arial";
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6"].Style.Font.Bold = true;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6"].Style.Font.Italic = true;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130"].Style.Font.Size = 13;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130"].Style.Font.Italic = true;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130"].Style.Font.Bold = true;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130"].Style.Font.Color.SetColor(Color.White);

            ws.Cells["A1"].Value = "Rapor Adı";
            ws.Cells["B1"].Value = "Kullanıcı Başvuru Listesi";

            ws.Cells["A2"].Value = "Tarih";
            ws.Cells["B2"].Value = string.Format("{0:dd MMM yyyy} at {0:H: mm tt}", DateTimeOffset.Now);

            ws.Cells["A6"].Value = "Öğrenci Adı";
            ws.Cells["B6"].Value = "Öğrenci Soyadı";
            ws.Cells["C6"].Value = "Öğrenci Numara";
            ws.Cells["D6"].Value = "Staj Durumu ";

            int rowStart = 7;

            foreach (var item in data)
            {
                if (item.StajDurum.StajDurumID == 1)
                {
                    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("green")));
                }

                if (item.StajDurum.StajDurumID == 2)
                {
                    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("blue")));
                }

                if (item.StajDurum.StajDurumID == 3)
                {
                    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#FFEB3B"));
                }

                if (item.StajDurum.StajDurumID == 4)
                {
                    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("orange")));
                }

                if (item.StajDurum.StajDurumID == 5)
                {
                    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("red")));
                }

                ws.Cells[string.Format("A{0}", rowStart)].Value = item.Adi;
                ws.Cells[string.Format("B{0}", rowStart)].Value = item.Soyadi;
                ws.Cells[string.Format("C{0}", rowStart)].Value = item.Numara;
                ws.Cells[string.Format("D{0}", rowStart)].Value = item.StajDurum.StajDurumAdi;
                rowStart++;
            }

            ws.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.Charset = "windows-1254"; // Türkçe karakter seti
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // İçerik yani gelen verilerde Türkçe karakter seti
            Response.HeaderEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // Üst başlıklarda ki Türkçe karakter seti
            Response.AddHeader("content-disposition", "attachment:filename=" + "BasvuruDurumu.xlsx"); // excell dosyasının adı ve yolu
            Response.BinaryWrite(exclPckg.GetAsByteArray());
            Response.End();
        }

        public void BasvurusuOnaylananlarListe()
        {
               ExcelPackage.LicenseContext = LicenseContext.Commercial;
                var data = context.StajyerOgrenciBaslatma.Where(x => x.Kullanici.OnaylandiMi == false && x.Kullanici.StajDurumID == 1).ToList();

                ExcelPackage exclPckg = new ExcelPackage();

                ExcelWorksheet ws = exclPckg.Workbook.Worksheets.Add("Rapor");
                ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Size = 17;
                ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Name = "Times New Roman";
                ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Bold = true;
                ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Italic = true;
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Size = 15;
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Name = "Times New Roman";
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Italic = true;
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Bold = false;
                ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Color.SetColor(Color.Black);

                ws.Cells["A1"].Value = "Staj 2 Onaylananların Listesi";

                ws.Cells["A2"].Value = "Tarih";
                ws.Cells["B2"].Value = string.Format("{0:dd MMM yyyy} at {0:H: mm tt}", DateTimeOffset.Now);

                ws.Cells["A6"].Value = "Öğrenci Adı";
                ws.Cells["B6"].Value = "Öğrenci Soyadı";
                ws.Cells["C6"].Value = "Öğrenci Numara";
                ws.Cells["D6"].Value = "E-Posta ";
                ws.Cells["E6"].Value = "Öğrenci Tel No ";
                ws.Cells["F6"].Value = "Staj Başlangıç Tarihi ";
                ws.Cells["G6"].Value = "Staj Bitiş Tarihi ";
                ws.Cells["H6"].Value = "Başvuruyu Değerlendiren ";
                ws.Cells["I6"].Value = "Staj Durumu ";

                int rowStart = 7;

                foreach (var item in data)
                {
                    //if (item.StajDurum.StajDurumID == 1)
                    //{
                    //    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    //    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("green")));
                    //}

                    //if (item.StajDurum.StajDurumID == 2)
                    //{
                    //    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    //    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("blue")));
                    //}

                    //if (item.StajDurum.StajDurumID == 3)
                    //{
                    //    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    //    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#FFEB3B"));
                    //}

                    //if (item.StajDurum.StajDurumID == 4)
                    //{
                    //    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    //    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("orange")));
                    //}

                    //if (item.StajDurum.StajDurumID == 5)
                    //{
                    //    ws.Row(rowStart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    //    ws.Row(rowStart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("red")));
                    //}

                    ws.Cells[string.Format("A{0}", rowStart)].Value = item.Kullanici.Adi;
                    ws.Cells[string.Format("B{0}", rowStart)].Value = item.Kullanici.Soyadi;
                    ws.Cells[string.Format("C{0}", rowStart)].Value = item.Kullanici.Numara;
                    ws.Cells[string.Format("D{0}", rowStart)].Value = item.Kullanici.Mail;
                    ws.Cells[string.Format("E{0}", rowStart)].Value = item.Kullanici.TelefonNo;
                    ws.Cells[string.Format("F{0}", rowStart)].Value = item.StajBaslangicTarihi.ToString().TrimEnd('0', ':'); ;
                    ws.Cells[string.Format("G{0}", rowStart)].Value = item.StajBitisTarihi.ToString().TrimEnd('0', ':'); ;
                    ws.Cells[string.Format("H{0}", rowStart)].Value = item.Kullanici.BasvuruyuDegerlendiren;
                    ws.Cells[string.Format("I{0}", rowStart)].Value = item.Kullanici.StajDurum.StajDurumAdi;
                    rowStart++;
                }

                ws.Cells["A:AZ"].AutoFitColumns();
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.Charset = "windows-1254"; // Türkçe karakter seti
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // İçerik yani gelen verilerde Türkçe karakter seti
                Response.HeaderEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // Üst başlıklarda ki Türkçe karakter seti
                Response.AddHeader("content-disposition", "attachment:filename=" + "BasvuruDurumu.xlsx"); // excell dosyasının adı ve yolu
                Response.BinaryWrite(exclPckg.GetAsByteArray());
                Response.End();
            
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult TatilGunleri()
        {
            var data = context.ResmiTatiller.ToList();

            return View(data);
        }

        [HttpPost]
        public ActionResult TatilGunleri(ResmiTatiller rt, DateTime? resmitatiller, string Aciklama)
        {
            rt.ResmiTatil = resmitatiller;
            rt.Aciklama = Aciklama;
            context.ResmiTatiller.Add(rt);
            context.SaveChanges();
            Response.Redirect("TatilGunleri", true);

            var data = context.ResmiTatiller.ToList();

            return View(data);
        }

        public void GunSil(int id)
        {
            var data = context.ResmiTatiller.Where(m => m.ID == id).FirstOrDefault();

            context.ResmiTatiller.Remove(data);
            context.Entry(data).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();
        }

        public static int CalismaHesapla(DateTime basTarih, DateTime bitTarih)//bu metod ile iki tarih arasındaki çalışma günlerini sayıyoruz
        {
            DateTime geciciTarih = basTarih;
            int gunSayi = 0;
            string gun = string.Empty;
            while (geciciTarih <= bitTarih)
            {
                gun = geciciTarih.ToString("dddd");
                if (gun != "Cumartesi" && gun != "Pazar")
                {
                    gunSayi++;
                }
                geciciTarih = geciciTarih.AddDays(1);
            }
            return gunSayi;
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult StajyerOgrenciStajaBaslatmaBilgileri()
        {
            var data = context.StajyerOgrenciBaslatma.OrderBy(x => x.StajBaslangicTarihi).ToList();

            return View(data);
        }

        [HttpPost]
        public ActionResult StajyerOgrenciStajaBaslatmaBilgileri(DateTime? baslangicTarih, DateTime? bitisTarih)
        {
            var result = context.StajyerOgrenciBaslatma.Where(entry => entry.StajBaslangicTarihi >= baslangicTarih.Value).Where(entry => entry.StajBaslangicTarihi <= bitisTarih.Value).OrderBy(x => x.StajBaslangicTarihi).ToList();

            if (result.Count() == 0)
            {
                ViewBag.Mesaj = "Seçili tarihler arasında kayıt bulunamadı.";
                return View();
            }

            ViewBag.Mesaj1 = baslangicTarih.Value.Date.ToString().TrimEnd('0', ':') + " ve " + bitisTarih.Value.Date.ToString().TrimEnd('0', ':') + " " + " staj başlangıç tarihli öğrencilerin kayıtları listelenmiştir.";
            return View(result);
        }

        public void StajyerOgrenciStajaBaslatmaBilgileriSil(int id)
        {
            var data = context.StajyerOgrenciBaslatma.Where(m => m.ID == id).FirstOrDefault();

            context.StajyerOgrenciBaslatma.Remove(data);
            context.Entry(data).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();
        }

        public void StajyerOgrenciStajaBaslatmaFormu(DateTime? baslangicTarih, DateTime? bitisTarih)
        {
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            var result = context.StajyerOgrenciBaslatma.Where(entry => entry.StajBaslangicTarihi >= baslangicTarih.Value).Where(entry => entry.StajBaslangicTarihi <= bitisTarih.Value).OrderBy(x => x.StajBaslangicTarihi).ToList();

            ExcelPackage exclPckg = new ExcelPackage();

            ExcelWorksheet ws = exclPckg.Workbook.Worksheets.Add("Rapor");
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6:J6:K6:L6:F1:F3:F5:A8:B8:C8:D8:E8:F8:G8:H8:I8:J8:K8:L8:M8"].Style.Font.Size = 17;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6:J6:K6:L6:F1:F3:F5:A8:B8:C8:D8:E8:F8:G8:H8:I8:J8:K8:L8:M8"].Style.Font.Name = "Times New Roman";
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6:J6:K6:L6:F1:F3:F5:A8:B8:C8:D8:E8:F8:G8:H8:I8:J8:K8:L8:M8"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6:J6:K6:L6:F1:F3:F5:A8:B8:C8:D8:E8:F8:G8:H8:I8:J8:K8:L8:M8"].Style.Font.Bold = true;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6:J6:K6:L6:F1:F3:F5:A8:B8:C8:D8:E8:F8:G8:H8:I8:J8:K8:L8:M8"].Style.Font.Italic = true;
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.Font.Size = 15;
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.Font.Name = "Times New Roman";
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.Font.Italic = true;
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.Font.Bold = false;
            ws.Cells["A9:A130:B9:B130:C9:C130:D9:D130:E9:E130:F9:F130:G9:G130:H9:H130:I9:I130:J9:J130:K9:K130:L9:L130:M130"].Style.Font.Color.SetColor(Color.Black);


            ws.Cells["F1"].Value = "Bilecik Şeyh Edebali Üniversitesi Mühendislik Fakültesi";
            ws.Cells["F3"].Value = "Bilgisayar Mühendisliği Bölüm Başkanlığı";
            ws.Cells["F5"].Value = "Stajyer Öğrenci Bölüm Staja Başlatma Formu";

            //ws.Cells["A2"].Value = "Tarih";
            //ws.Cells["B2"].Value = string.Format("{0:dd MMM yyyy} at {0:H: mm tt}", DateTimeOffset.Now);

            ws.Cells["A8"].Value = "Adı Soyadı";
            ws.Cells["B8"].Value = "TC Kimlik No";
            ws.Cells["C8"].Value = "Öğrencinin Adresi";
            ws.Cells["D8"].Value = "İş Yerinin Adı ";
            ws.Cells["E8"].Value = "İş Yerinin Adresi ";
            ws.Cells["F8"].Value = "Staja Başlama Tarihi";
            ws.Cells["G8"].Value = "Stajın Bitiş Tarihi";
            ws.Cells["H8"].Value = "Staj Süresince Denk Gelen Gün Sayısı";
            ws.Cells["I8"].Value = "Staj Süresince Denk Gelen Resmi Tatil Sayısı ";
            ws.Cells["J8"].Value = "Toplam Çalışma Günü";
            ws.Cells["K8"].Value = "Cumartesi Çalışıyor Mu";
            ws.Cells["L8"].Value = "Staj Türü";
            ws.Cells["M8"].Value = "Onay Durumu";

            int rowStart = 9;

            foreach (var item in result)
            {
                ws.Cells[string.Format("A{0}", rowStart)].Value = item.Kullanici.Adi + " " + item.Kullanici.Soyadi;
                ws.Cells[string.Format("B{0}", rowStart)].Value = item.Kullanici.Numara;
                ws.Cells[string.Format("C{0}", rowStart)].Value = item.Kullanici.Adres;
                ws.Cells[string.Format("D{0}", rowStart)].Value = item.IsyeriAdi;
                ws.Cells[string.Format("E{0}", rowStart)].Value = item.IsyeriAdresi;
                ws.Cells[string.Format("F{0}", rowStart)].Value = item.StajBaslangicTarihi.ToString().TrimEnd('0', ':');
                ws.Cells[string.Format("G{0}", rowStart)].Value = item.StajBitisTarihi.ToString().TrimEnd('0', ':');
                ws.Cells[string.Format("H{0}", rowStart)].Value = item.HaftaIciGunSayisi;
                ws.Cells[string.Format("I{0}", rowStart)].Value = item.ResmiTatilSayisi;
                ws.Cells[string.Format("J{0}", rowStart)].Value = item.ToplamCalismaSüresi;
                ws.Cells[string.Format("K{0}", rowStart)].Value = item.CumartesiCalisiyorMu;
                ws.Cells[string.Format("L{0}", rowStart)].Value = item.StajAdi.Adi;
                ws.Cells[string.Format("M{0}", rowStart)].Value = item.Kullanici.StajDurum.StajDurumAdi;

                rowStart++;
            }

            ws.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.Charset = "windows-1254"; // Türkçe karakter seti
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // İçerik yani gelen verilerde Türkçe karakter seti
            Response.HeaderEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // Üst başlıklarda ki Türkçe karakter seti
            Response.AddHeader("content-disposition", "attachment:filename=" + "BasvuruDurumu.xlsx"); // excell dosyasının adı ve yolu
            Response.BinaryWrite(exclPckg.GetAsByteArray());
            Response.End();
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult YetkiVer()
        {
            var data = context.KullaniciRol.Where(x => x.Kullanici.OnaylandiMi == false).ToList();

            return View(data);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult YetkiBelirle(int id)
        {
            int kullaniciId = context.Kullanici.Where(x => x.KullaniciID == id).Select(x => x.KullaniciID).FirstOrDefault();
            var data = context.KullaniciRol.Where(x => x.Kullanici.KullaniciID == kullaniciId).FirstOrDefault();

            return View(data);
        }

        [HttpPost]
        public ActionResult YetkiBelirle(string data, int id)
        {
            if (data == "Seçiniz")
            {
                ViewBag.Mesaj = "Lütfen yetkilendirme bilgisini seçiniz";
                return View("YetkiBelirle");
            }

            KullaniciRol kl = context.KullaniciRol.Where(x => x.KullaniciID == id).FirstOrDefault();
            var rol = context.Rol.Where(x => x.RolAdi == data).Select(x => x.RolID).FirstOrDefault();

            context.Entry(kl).State = System.Data.Entity.EntityState.Deleted;
            context.SaveChanges();

            kl.RolID = rol;
            kl.KullaniciID = id;

            context.KullaniciRol.Add(kl);
            context.SaveChanges();

            ViewBag.Mesaj1 = kl.Kullanici.Adi + " " + kl.Kullanici.Soyadi + " " + "'ın yetkilendirmesi " + data + " olarak seçilmiştir.";
            return View(kl);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult StajyerOgrenciStajDefterleri()
        {
            var data = context.StajDefteriTeslim.ToList();

            return View(data);
        }

        public FileResult Download1(string file)
        {
            byte[] fileBytes = System.IO.File.ReadAllBytes(Server.MapPath("~/StajDefterleri/Defterler/" + file + ""));
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, file);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult OgrenciStajDefteri(int? id)
        {
            var veriVarmi = context.Staj.Where(x => x.KullaniciID == id).OrderBy(x => x.Tarih).ToList();

            if (veriVarmi.Count() == 0)
            {
                ViewBag.Mesaj = "Sisteme kayıtlı staj defteri bulunmamaktadır.";
                return View();
            }

            int kullaniciId = context.Kullanici.Where(x => x.KullaniciID == id).Select(x => x.KullaniciID).FirstOrDefault();
            var ogrenciAd = context.Staj.Where(x => x.Kullanici.KullaniciID == kullaniciId).Select(x => x.Kullanici.Adi).FirstOrDefault();
            var ogrenciSinif = context.Staj.Where(x => x.Kullanici.KullaniciID == kullaniciId).Select(x => x.Kullanici.Sinif).FirstOrDefault();
            var ogrenciSoyad = context.Staj.Where(x => x.Kullanici.KullaniciID == kullaniciId).Select(x => x.Kullanici.Soyadi).FirstOrDefault();
            var ogrenciNumara = context.Staj.Where(x => x.Kullanici.KullaniciID == kullaniciId).Select(x => x.Kullanici.Numara).FirstOrDefault();
            var stajbaslangic = context.StajyerOgrenciBaslatma.Where(x => x.KullaniciID == kullaniciId).Select(x => x.StajBaslangicTarihi).FirstOrDefault();
            var stajbitis = context.StajyerOgrenciBaslatma.Where(x => x.KullaniciID == kullaniciId).Select(x => x.StajBitisTarihi).FirstOrDefault();
            var calismasuresi = context.StajyerOgrenciBaslatma.Where(x => x.KullaniciID == kullaniciId).Select(x => x.ToplamCalismaSüresi).FirstOrDefault();

            ViewBag.ogrenciAd = ogrenciAd;
            ViewBag.ogrenciSoyad = ogrenciSoyad;
            ViewBag.ogrenciSinif = ogrenciSinif;
            ViewBag.ogrenciNumara = ogrenciNumara;
            ViewBag.ogrenciStajbaslangic = stajbaslangic;
            ViewBag.ogrenciStajbitis = stajbitis;
            ViewBag.ogrenciCalismasuresi = calismasuresi;

            return View(veriVarmi);
        }

        [Authorize(Roles = "Admin,Eğitim Elemanı")]
        public ActionResult BasvurusuTamamlananlarınListesi()
        {
            var data = context.Kullanici.Where(x => x.StajDurumID == 6).ToList();

            return View(data);
        }

        [HttpPost]
        public ActionResult BasvurusuTamamlananlarınListesi(DateTime? baslangicTarih, DateTime? bitisTarih)
        {
            var result = context.Kullanici.Where(entry => entry.BasvuruDegerlendirilmeTarihi >= baslangicTarih.Value).Where(entry => entry.BasvuruDegerlendirilmeTarihi <= bitisTarih.Value).Where(x => x.StajDurum.StajDurumID == 6).ToList();

            if (result.Count() == 0)
            {
                ViewBag.Mesaj = "Seçili tarihler arasında kayıt bulunamadı.";
                return View();
            }

            ViewBag.Mesaj1 = baslangicTarih.Value.Date.ToString().TrimEnd('0', ':') + " ve " + bitisTarih.Value.Date.ToString().TrimEnd('0', ':') + " " + " tarihleri arasındaki kayıtlar listelenmiştir.";
            return View(result);
        }

        public void BasvurusuTamamlananlarListe(DateTime? baslangicTarih, DateTime? bitisTarih)
        {
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            var result = context.Kullanici.Where(entry => entry.BasvuruDegerlendirilmeTarihi >= baslangicTarih.Value).Where(entry => entry.BasvuruDegerlendirilmeTarihi <= bitisTarih.Value).Where(entry => entry.OnaylandiMi == false && entry.StajDurumID == 6).ToList();

            ExcelPackage exclPckg = new ExcelPackage();

            ExcelWorksheet ws = exclPckg.Workbook.Worksheets.Add("Rapor");
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Size = 17;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Name = "Times New Roman";
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Bold = true;
            ws.Cells["A1:B1:A2:B2:A6:B6:C6:D6:E6:F6:G6:H6:I6"].Style.Font.Italic = true;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Size = 15;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Name = "Times New Roman";
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Italic = true;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Bold = false;
            ws.Cells["A7:A130:B7:B130:C7:C130:D7:D130:E130:F130:G130:H130:I130"].Style.Font.Color.SetColor(Color.Black);

            ws.Cells["A1"].Value = "Staj 2 Tamamlananların Listesi";

            ws.Cells["A2"].Value = "Tarih";
            ws.Cells["B2"].Value = string.Format("{0:dd MMM yyyy} at {0:H: mm tt}", DateTimeOffset.Now);

            ws.Cells["A6"].Value = "Öğrenci Adı";
            ws.Cells["B6"].Value = "Öğrenci Soyadı";
            ws.Cells["C6"].Value = "Öğrenci Numara";
            ws.Cells["D6"].Value = "Öğrenci Adres ";
            ws.Cells["E6"].Value = "Öğrenci E-Posta ";
            ws.Cells["F6"].Value = "Öğrenci Tel No";
            ws.Cells["G6"].Value = "Başvuruyu Değerlendiren ";
            ws.Cells["H6"].Value = "Başvuruyu Değerlendirilme Tarihi ";
            ws.Cells["I6"].Value = "Staj Durumu ";

            int rowStart = 7;

            foreach (var item in result)
            {
                ws.Cells[string.Format("A{0}", rowStart)].Value = item.Adi;
                ws.Cells[string.Format("B{0}", rowStart)].Value = item.Soyadi;
                ws.Cells[string.Format("C{0}", rowStart)].Value = item.Numara;
                ws.Cells[string.Format("D{0}", rowStart)].Value = item.Mail;
                ws.Cells[string.Format("E{0}", rowStart)].Value = item.TelefonNo;
                ws.Cells[string.Format("F{0}", rowStart)].Value = item.TelefonNo;
                ws.Cells[string.Format("G{0}", rowStart)].Value = item.BasvuruyuDegerlendiren;
                ws.Cells[string.Format("H{0}", rowStart)].Value = item.BasvuruDegerlendirilmeTarihi.ToString().TrimEnd('0', ':');
                ws.Cells[string.Format("I{0}", rowStart)].Value = item.StajDurum.StajDurumAdi;
                rowStart++;
            }

            ws.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.Charset = "windows-1254"; // Türkçe karakter seti
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // İçerik yani gelen verilerde Türkçe karakter seti
            Response.HeaderEncoding = System.Text.Encoding.GetEncoding("windows-1254"); // Üst başlıklarda ki Türkçe karakter seti
            Response.AddHeader("content-disposition", "attachment:filename=" + "BasvuruDurumu.xlsx"); // excell dosyasının adı ve yolu
            Response.BinaryWrite(exclPckg.GetAsByteArray());
            Response.End();
        }
    }
}