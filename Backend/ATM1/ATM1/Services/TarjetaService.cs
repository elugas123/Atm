using ATM1.Contract;
using ATM1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM1.Services
{
    public class TarjetaService : ITarjeta
    {
        private readonly ATMContext _context = new ATMContext();
       
        public IEnumerable<Tarjeta> GetTarjetas()
        {
            return _context.Tarjeta.ToList();
        }

        public Tarjeta GetTarjetasById(Tarjeta Tarjeta)
        {
            return _context.Tarjeta.FirstOrDefault(x => x.Id == Tarjeta.Id);
        }

        public Tarjeta GetTarjetasByNumber(string NumeroTarjeta)
        {
            return _context.Tarjeta.Where(x=> x.NumeroTarjeta == NumeroTarjeta).SingleOrDefault();
        
        }

        public Tarjeta GetTarjetasByPin(Tarjeta Tarjeta )
        {
            return _context.Tarjeta.Where(x => x.Pin == Tarjeta.Pin && x.Id == Tarjeta.Id).SingleOrDefault();
        }

        public bool PutTarjeta(int Id)
        {
            bool completado;
            var tarjeta = _context.Tarjeta.FirstOrDefault(x => x.Id == Id);
            tarjeta.Estado = false; 

            try
            {
                _context.Tarjeta.Update(tarjeta);
                _context.SaveChanges();
                completado = true; 
            }
            catch (Exception ex)
            {
                completado = false;
            }

            return completado;
        }

        public bool TarjetaExists(int id)
        {
            return _context.Tarjeta.Any(x => x.Id == id);
        }
    }
}
