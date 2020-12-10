using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestApp03.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.TituloViewPanel = "Home";
            return View();
        }

        public ActionResult About()
        {
            ViewBag.TituloViewPanel = "Acerca de Nosotros";
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.TituloViewPanel = "Contacto";
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}