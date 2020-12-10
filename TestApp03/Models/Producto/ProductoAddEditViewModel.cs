using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EML;

namespace TestApp03.Models.Producto
{
    public class ProductoAddEditViewModel : EML.Producto
    {
        public IEnumerable<SelectListItem> Proveedores { get; set; }
        public IEnumerable<SelectListItem> Categorias { get; set; }
        public IEnumerable<SelectListItem> Medidas { get; set; }
    }
}