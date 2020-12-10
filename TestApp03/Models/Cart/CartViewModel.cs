using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestApp03.Models.Cart
{
    public class CartViewModel
    {
        public int ProductoId { get; set; }
        public string Nombre { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Precio { get; set; }

        public decimal Total { get; set; }
        public HttpPostedFileBase FileAttach { get; set; }

        public CartViewModel(int _ProductoId)
        {
            this.ProductoId = _ProductoId;
        }
        public CartViewModel() { }
        public bool Equals(CartViewModel item)
        {
            return this.ProductoId == item.ProductoId;
        }
    }
}