using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestApp03.Models.Producto;

namespace TestApp03.Controllers
{
    public class ProductoController : Controller
    {
        private ProductoBLL productobll = new ProductoBLL();
        private CategoriaBLL categoriasbll = new CategoriaBLL();
        private MedidaBLL medidasbll = new MedidaBLL();
        private ProveedorBLL proveedoresbll = new ProveedorBLL();
        // GET: Producto
        public ActionResult Index()
        {
            var ListaProducto = productobll.ObtenerListaProductos();
            return View(ListaProducto);
        }

        public ActionResult Editar(int Id)
        {
            ProductoAddEditViewModel model = (ProductoAddEditViewModel) productobll.ObtenerProducto(Id);
            model.Proveedores = this.ObtenerProveedores();
            model.Categorias = this.ObtenerCategorias();
            model.Medidas = this.ObtenerMedidas();

            return View(model);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(ProductoAddEditViewModel model)
        {
            if (ModelState.IsValid)
            {
                productobll.ActualizarProducto(model);
                return RedirectToAction("Index");

            }
            else
            {
                model.Proveedores = this.ObtenerProveedores();
                model.Categorias = this.ObtenerCategorias();
                model.Medidas = this.ObtenerMedidas();
                return View(model);

            }


        }

        public ActionResult Crear()
        {
            ProductoAddEditViewModel model = new ProductoAddEditViewModel();
            model.Proveedores = this.ObtenerProveedores();
            model.Categorias = this.ObtenerCategorias();
            model.Medidas = this.ObtenerMedidas();

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(ProductoAddEditViewModel model)
        {
            if (ModelState.IsValid)
            {
                productobll.AgregarProducto(model);
                return RedirectToAction("Index");
            }
            else
            {
                model.Proveedores = this.ObtenerProveedores();
                model.Categorias = this.ObtenerCategorias();
                model.Medidas = this.ObtenerMedidas();
                return View(model);

            }

            
        }

        public IEnumerable<SelectListItem> ObtenerCategorias()
        {
            var a = categoriasbll.ObtenerListaCategorias().Select(x => new SelectListItem
            {
                Value = x.CategoriaId.ToString(),
                Text = x.Nombre
            }).ToList();

            a.Insert(0, new SelectListItem { Value = null, Text = "--- Seleccione una Categoria ---" });
            return new SelectList(a,"Value","Text");
        }

        public IEnumerable<SelectListItem> ObtenerProveedores()
        {
            var a = proveedoresbll.ObtenerListaProveedors().Select(x => new SelectListItem
            {
                Value = x.ProveedorId.ToString(),
                Text = x.Nombre
            }).ToList();

            a.Insert(0, new SelectListItem { Value = null, Text = "--- Seleccione una Proveedor ---" });
            return new SelectList(a, "Value", "Text");
        }

        public IEnumerable<SelectListItem> ObtenerMedidas()
        {
            var a = medidasbll.ObtenerListaMedidas().Select(x => new SelectListItem
            {
                Value = x.MedidaId.ToString(),
                Text = x.Nombre
            }).ToList();

            a.Insert(0, new SelectListItem { Value = null, Text = "--- Seleccione una Medida ---" });
            return new SelectList(a, "Value", "Text");
        }


    }
}