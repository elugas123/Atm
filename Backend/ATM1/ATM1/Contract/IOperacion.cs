using ATM1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM1.Contract
{
    public  interface IOperacion
    {
        bool PostOperacion(Operacion operacion);

       OperacionRespuesta GetOperacionsbyNumeroTarjeta(int TarjetaId);


    }
}
