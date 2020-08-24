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
    public class OperacionsController : ControllerBase
    {
        private readonly IOperacion _operacionService;

        public OperacionsController(IOperacion operacionService)
        {
            _operacionService = operacionService;
        }

     

        [HttpGet("Tarjeta/{id}")]
        public OperacionRespuesta GetOperacion(int Id)
        
        {
            return _operacionService.GetOperacionsbyNumeroTarjeta(Id);

           
        }

      
        [HttpPost]
        public ActionResult<bool> PostOperacion(Operacion Operacion)
        {
            return _operacionService.PostOperacion(Operacion);
        }

    }
}
