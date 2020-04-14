using BiblioModel.DAL.Interfaces;
using BiblioModel.Models;
using BiblioModel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;

namespace BiblioWebApi.Controllers
{
    [Route("[controller]/[action]")]
    [ApiController]
    public class VisiteurController : ControllerBase
    {
        IVisiteurRepository _repository;
        VisiteurViewModel _model;

        public VisiteurController(IVisiteurRepository repository)
        {
            _repository = repository;
            _model = new VisiteurViewModel(_repository);
        }
        [HttpPost]
        [ActionName("addvisitieur")]
        public IActionResult Add([FromBody]Visiteur visiteur)
        {
            _model.Add(visiteur);
            return Ok(_model);
        }
        [HttpPost]
        [ActionName("rmvisitieur")]
        public IActionResult Remove([FromBody]Visiteur visiteur)
        {
            _model.Delete(visiteur);
            return Ok(_model);
        }
        [HttpPost]
        [ActionName("updvisitieur")]
        public IActionResult Modify([FromBody]Visiteur visiteur)
        {
            _model.Update(visiteur);
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
            var resultat = _model.Find(id??1228290);
            return Ok(resultat);
        }
        [HttpGet]
        public IActionResult FindAll(Func<Visiteur, bool> predicate)
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
    }
}