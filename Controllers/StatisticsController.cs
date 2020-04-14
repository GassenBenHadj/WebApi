using BiblioModel.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace BiblioWebApi.Controllers
{
    [Route("[controller]/[action]")]
    [ApiController]
    public class StatisticsController : ControllerBase
    {
        StatisticsViewModel _model;
        public StatisticsController()
        {
            _model = new StatisticsViewModel();
        }
        [HttpGet]
        [ActionName("max")]
        public int MaxPrixLivres() =>  _model.MaxPrix();
        [HttpGet]
         [ActionName("min")]
        public int MinPrixLivres() => _model.MinPrix();
        [HttpGet]
         [ActionName("avg")]
        public int AveragePrixLivres() => _model.AveragePrix();
        [HttpGet]
         [ActionName("maxsession")]
        public int MaxSessionParJour() => _model.MaxSessionParJour();
        [HttpGet]
        [ActionName("minsession")]
        public int MinSessionParJour() => _model.MinSessionParJour();
        [HttpGet]
        [ActionName("avgsession")]
        public int AverageSessionParJour() => _model.AverageSessionParJour();
        [HttpGet]
        public int CountSessionParJour() => _model.CountSessionParJour();
    }
}