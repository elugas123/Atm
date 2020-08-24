using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ATM1.Contract;
using ATM1.Models;

namespace ATM1.Services
{
    public class OperacionService : IOperacion
    {
        private readonly ATMContext _context = new ATMContext();

        public OperacionRespuesta GetOperacionsbyNumeroTarjeta(int TarjetaId)
        {
            OperacionRespuesta operacionRespuesta = new OperacionRespuesta();
            operacionRespuesta.Saldo = _context.Operacion.Where(x => x.TarjetaId == TarjetaId && x.TipoOperacionId != 1).Sum(x => x.Cantidad);
            operacionRespuesta.Operacion = (from Op in _context.Operacion
                                           join Top in _context.TipoOperacion on Op.TipoOperacionId equals Top.Id
                                           where Op.TarjetaId == TarjetaId
                                           select new OperacionR
                                           {
                                               Fecha = Op.Fecha,
                                               Cantidad = Op.Cantidad,
                                               NombreOperacion = Top.Nombre
                                              


                                           }).ToList();




            return operacionRespuesta;

          
        }

        public bool PostOperacion(Operacion operacion)
        {
            bool completado;
            operacion.Fecha = DateTime.Now;

            try
            {    
                _context.Operacion.Add(operacion);
                _context.SaveChanges();
                 completado = true;
            }
            catch (Exception)
            {

                completado = false;
            }

            return completado;
        }
            
        
    }
}
