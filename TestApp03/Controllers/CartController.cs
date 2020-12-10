using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestApp03.Models.Cart;

namespace TestApp03.Controllers
{
    public class CartController : Controller
    {
        private ProductoBLL productoBLL = new ProductoBLL();
        // GET: Cart
        public ActionResult Index(int? id)
        {
            var cartlist = ShoppingCartViewModel.Instance.items;

            return View(cartlist);
        }
        public ActionResult Agregar(int id)
        {
            CartViewModel item = new CartViewModel(id);

            var producto = productoBLL.ObtenerProducto(id);
            if (producto != null)
            {
                item.Nombre = producto.Nombre;
                item.Precio = producto.Precio;
                item.Cantidad = 0;
                item.Total = 0;

            }
            else
            {
                RedirectToAction("Index", "Producto");
            }
            return View(item);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregar(CartViewModel model)
        {
            if (ModelState.IsValid)
            {
                ShoppingCartViewModel.Instance.AgregarItem(model);
                RedirectToAction("Index", "Producto");
            }
            return View(model);
        }

    }


}