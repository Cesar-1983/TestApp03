using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using EML;
namespace TestApp03.Controllers
{
    public class ProveedorController : Controller
    {
        private ProveedorBLL bll = new ProveedorBLL();
        // GET: Proveedor
        public ActionResult Index()
        {
            var ListaProveedor = bll.ObtenerListaProveedors();
            return View(ListaProveedor);
        }

        public ActionResult Editar(int Id)
        {
            var Proveedor = bll.ObtenerProveedor(Id);
            return View(Proveedor);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Proveedor model)
        {
            if (ModelState.IsValid)
            {
                bll.ActualizarProveedor(model);
            }

            return RedirectToAction("Index");

        }

        public ActionResult Crear()
        {
            Proveedor model = new Proveedor();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Proveedor model)
        {
            if (ModelState.IsValid)
            {
                bll.AgregarProveedor(model);
            }

            return RedirectToAction("Index");
        }
    }
}