using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ATM1.Models;
using ATM1.Contract;

namespace ATM1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TarjetasController : ControllerBase
    {
        private readonly ITarjeta _tarjetaService;

        public TarjetasController(ITarjeta tarjetaService)
        {
            _tarjetaService = tarjetaService;
        }
        // GET: api/Tarjetas
        [HttpGet]
        public IEnumerable<Tarjeta> GetTarjeta()
        {
           return _tarjetaService.GetTarjetas();
        }


        [HttpPut]
        [Route("{id}/CambiarEstado")]
        public  ActionResult<bool> PutTarjeta(int id)
        {
            if (!_tarjetaService.TarjetaExists(id))
            {
                return NotFound();
            }


            return _tarjetaService.PutTarjeta(id);


        } 

        // POST: api/Tarjetas
        [HttpPost]
        [Route("ValidarTarjeta")]
        public ActionResult<Tarjeta> ValidarTarjeta(Tarjeta entidad)
        {

           var tarjeta= _tarjetaService.GetTarjetasByNumber(entidad.NumeroTarjeta);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return tarjeta;
        }


        [HttpPost]
        [Route("ValidarPin")]
        public ActionResult<Tarjeta> ValidarPin(Tarjeta entidad)
        {

            var tarjeta = _tarjetaService.GetTarjetasByPin(entidad);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return tarjeta;
        }

      

    
    }
}
