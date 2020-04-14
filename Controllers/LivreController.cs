using BiblioModel.DAL.Interfaces;
using BiblioModel.Models;
using BiblioModel.ViewModels;
using BiblioWebApi.Filters;
using Microsoft.AspNetCore.Mvc;
using System;

namespace BiblioWebApi.Controllers
{
    [Route("[controller]/[action]")]
    [ApiController]
    public class LivreController : ControllerBase
    {
        ILivreRepository _repository;
        LivreViewModel _model;

        public LivreController(ILivreRepository repository)
        {
            _repository = repository;
            _model = new LivreViewModel(_repository);
        }
        [HttpPost]
        [ActionName("add")]
        public IActionResult Add([FromBody]Livre Livre)
        {
            _model.Add(Livre);
            return Ok(_model);
        }
        [HttpPost]
        [ActionName("addc")]
        public IActionResult Addc(Microsoft.AspNetCore.Http.IFormCollection Livrecollection)
        {
            
            foreach (var item in Livrecollection)
            {
                System.Diagnostics.Debug.WriteLine($"{item.Key}:{item.Value}");
            }
            var livre = new Livre{Titre=Livrecollection["titre"],
            Taille=(TailleLivre)Int32.Parse(Livrecollection["taille"])};

            _model.Add(livre);
            return Ok(_model);
        }
        [HttpPost]
        [ActionName("remove")]
        public IActionResult Remove([FromBody]Livre Livre)
        {
            _model.Delete(Livre);
            return Ok(_model);
        }
        [HttpPut]
        [ActionName("update")]
        public IActionResult Modify([FromBody]Livre Livre)
        {
            _model.Update(Livre);
            return Ok(_model);
        }
        [HttpGet]
        public IActionResult Count()
        {
            _model.Count();
            return Ok(_model);
        }
        [HttpGet("{id:?}")]
        public IActionResult Find(int? id)
        {
            var resultat = _model.Find(id??1);
            return Ok(resultat);
        }
        [HttpGet]
        public IActionResult FindAll(Func<Livre, bool> predicate)
        {
            var resultat = _model.FindAll(predicate);
            return Ok(resultat);
        }
        [HttpGet]
        public IActionResult GetAll()
        {
                var resultat = _model.GetAll();
                return Ok(resultat); 
        }

        [HttpGet]
        [ActionName("page")]
        public IActionResult GetLivreByPage(int index,int size)
        {
            var resultat = _model.GetLivreByPage(index,size);
            return Ok(resultat);
        }
        [HttpGet]
        [ActionName("withauteurs")]
        public IActionResult GetLivreWithAuteurs(Func<Livre,bool> predicate)
        {
            var resultat = _model.GetLivreWithAuteurs(predicate);
            return Ok(resultat);
        }
    }
}