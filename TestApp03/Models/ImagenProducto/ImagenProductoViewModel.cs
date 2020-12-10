using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using EML;
namespace TestApp03.Models.ImagenProducto
{
    public class ImagenProductoViewModel
    {
        public int ProductoId { get; set; }

        [Required]
        [Display(Name = "Upload")]
        public HttpPostedFileBase FileAttach { get; set; }

        [Display(Name = "Descripción")]

        public string Descripcion { get; set; }

        [Display(Name = "¿Es foto Principal?")]

        public bool IsPrincipal { get; set; }

        public List<EML.ImagenProducto> ListaImagenes { get; set; }
    }
}