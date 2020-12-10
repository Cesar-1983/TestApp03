using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestApp03.Models.Cart
{
    public class ShoppingCartViewModel
    {
        public List<CartViewModel> items { get; set; }

        public static readonly ShoppingCartViewModel Instance;

        static ShoppingCartViewModel()
        {
            if (HttpContext.Current.Session["CartTest"] == null)
            {
                Instance = new ShoppingCartViewModel();
                Instance.items = new List<CartViewModel>();

                HttpContext.Current.Session["CartTest"] = Instance;
            }
            else
            {
                Instance = (ShoppingCartViewModel)HttpContext.Current.Session["CartTest"];
            }
            
        }

        protected ShoppingCartViewModel(){ }

        public void AgregarItem( CartViewModel item)
        {
            if (item.Cantidad == 0)
                return;
            CartViewModel newitem = new CartViewModel(item.ProductoId);
            if (items.Where(x=> x.ProductoId == newitem.ProductoId).Any())
            {
                foreach (CartViewModel i in items)
                {
                    if (i.Equals(newitem))
                    {
                        i.Cantidad = item.Cantidad;
                        i.Total = i.Precio * item.Cantidad;
                    }
                }
            }
            else
            {
                items.Add(item);
            }
            
        }
    }
}