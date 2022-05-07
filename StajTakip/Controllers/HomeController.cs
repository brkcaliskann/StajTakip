using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StajTakip.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult StajBilgilendirme()
        {
            return View();
        }

        public ActionResult BasvuruBelgeleri()
        {
            return View();
        }

        public ActionResult StajSonrasiYapilacaklar()
        {
            return View();
        }
        public ActionResult DikkatEdilecekHusular()
        {
            return View();
        }

        public ActionResult BolumumuzHakkında()
        {
            return View();
        }
    }
}