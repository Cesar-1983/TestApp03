using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using EML;
namespace TestApp03.Controllers
{
    public class CategoriaController : Controller
    {
        private CategoriaBLL bll = new CategoriaBLL();
        // GET: Categoria
        public ActionResult Index()
        {
            ViewBag.TituloViewPanel = "Catalogo de Categorías";
            var ListaCategoria = bll.ObtenerListaCategorias();
            return View(ListaCategoria);
        }

        public ActionResult Editar(int Id)
        {
            ViewBag.TituloViewPanel = "Edición de Categoría";
            var categoria = bll.ObtenerCategoria(Id);
            return View(categoria);
            
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Categoria model)
        {
            ViewBag.TituloViewPanel = "Edición de Categoría";
            if (ModelState.IsValid)
            {
                bll.ActualizarCategoria(model);
            }

            return RedirectToAction("Index");

        }

        public ActionResult Crear()
        {
            ViewBag.TituloViewPanel = "Agregar Categoría";
            Categoria model = new Categoria();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Categoria model)
        {
            ViewBag.TituloViewPanel = "Agregar Categoría";
            if (ModelState.IsValid)
            {
                bll.AgregarCategoria(model);
            }

            return RedirectToAction("Index");
        }

    }
}