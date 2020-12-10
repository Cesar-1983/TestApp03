using BLL;
using EML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestApp03.Controllers
{
    public class MedidaController : Controller
    {
        private MedidaBLL bll = new MedidaBLL();
        // GET: Medida
        public ActionResult Index()
        {
            ViewBag.TituloViewPanel = "Catalogo de Medidas";

            var ListaMedida = bll.ObtenerListaMedidas();
            return View(ListaMedida);
        }

        public ActionResult Editar(int Id)
        {
            ViewBag.TituloViewPanel = "Editar Medida";
            var Medida = bll.ObtenerMedida(Id);
            return View(Medida);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Medida model)
        {
            ViewBag.TituloViewPanel = "Editar Medida";
            if (ModelState.IsValid)
            {
                bll.ActualizarMedida(model);
            }

            return RedirectToAction("Index");

        }

        public ActionResult Crear()
        {
            ViewBag.TituloViewPanel = "Crear Medida";
            Medida model = new Medida();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Medida model)
        {
            ViewBag.TituloViewPanel = "Crear Medida";
            if (ModelState.IsValid)
            {
                bll.AgregarMedida(model);
            }

            return RedirectToAction("Index");
        }
    }
}