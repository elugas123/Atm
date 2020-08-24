using ATM1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM1.Contract
{
    public interface ITarjeta
    {
        IEnumerable<Tarjeta> GetTarjetas();
        Tarjeta GetTarjetasByNumber(string NumeroTarjeta);

        Tarjeta GetTarjetasByPin(Tarjeta Tarjeta);

        Tarjeta GetTarjetasById(Tarjeta Tarjeta);

        bool TarjetaExists(int Id);

        bool PutTarjeta(int Id);
    }
}
