using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace EML
{
    public class Categoria
    {
        
        public int CategoriaId { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Display(Name ="Descripción Larga")]
        public string DescripcionLarga { get; set; }
        public string Abreviatura { get; set; }

    }
}
