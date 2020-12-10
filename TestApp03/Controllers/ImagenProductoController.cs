using BLL;
using EML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestApp03.Models.ImagenProducto;

namespace TestApp03.Controllers
{
    public class ImagenProductoController : Controller
    {
        private ImagenProductoBLL bll = new ImagenProductoBLL();
        // GET: ImagenProducto
        public ActionResult Index(int id)
        {
            ViewBag.TituloViewPanel = "Carga de Imagenes";

            ImagenProductoViewModel model = new ImagenProductoViewModel();
            model.ProductoId = id;
            model.ListaImagenes = bll.ObtenerImagenesPorProducto(id);
            return View(model);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Index(ImagenProductoViewModel model)
        {
            ViewBag.TituloViewPanel = "Carga de Imagenes";

            // Initialization.  
            string fileContent = string.Empty;
            string fileContentType = string.Empty;

            try
            {
                // Verification  
                if (ModelState.IsValid)
                {
                    // Converting to bytes.  
                    byte[] uploadedFile = new byte[model.FileAttach.InputStream.Length];
                    model.FileAttach.InputStream.Read(uploadedFile, 0, uploadedFile.Length);

                    // Initialization.  
                    fileContent = Convert.ToBase64String(uploadedFile);
                    fileContentType = model.FileAttach.ContentType;

                    // Saving info.  
                    ImagenProducto img = new ImagenProducto();
                    img.ProductoId = model.ProductoId;
                    img.file_name = model.FileAttach.FileName;
                    img.file_ext = fileContentType;
                    img.file_base64 = fileContent;
                    img.description = model.Descripcion ?? img.file_name;
                    img.IsPrincipal = model.IsPrincipal;
                    var a = bll.AgregarImagenPorProducto(img);
                    
                }

                // Settings.  
                model.ListaImagenes = bll.ObtenerImagenesPorProducto(model.ProductoId);
            }
            catch (Exception ex)
            {
                // Info  
                Console.Write(ex);
            }

            // Info  
            return this.View(model);
        }

        public ActionResult DownloadFile(int fileId)
        {
            // Model binding.  
            ImagenProductoViewModel model = new ImagenProductoViewModel { FileAttach = null,ListaImagenes = new List<ImagenProducto>() };

            try
            {
                // Loading dile info.  
                var fileInfo = bll.ObtenerDetalleImagenPorProducto(fileId);

                // Info.  
                return this.GetFile(fileInfo.file_base64, fileInfo.file_ext);
            }
            catch (Exception ex)
            {
                // Info  
                Console.Write(ex);
            }

            // Info.  
            return this.View(model);
        }

        private FileResult GetFile(string fileContent, string fileContentType)
        {
            // Initialization.  
            FileResult file = null;

            try
            {
                // Get file.  
                byte[] byteContent = Convert.FromBase64String(fileContent);
                file = this.File(byteContent, fileContentType);
            }
            catch (Exception ex)
            {
                // Info.  
                throw ex;
            }

            // info.  
            return file;
        }
    }
}