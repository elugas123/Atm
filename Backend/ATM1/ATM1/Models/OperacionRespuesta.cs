using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM1.Models
{
    public class OperacionRespuesta
    {
        public decimal? Saldo { get; set; }
    
        public virtual ICollection<OperacionR> Operacion { get; set; }
    }

    public class OperacionR
    {
        public int Id { get; set; }
        public decimal? Cantidad { get; set; }
        public DateTime? Fecha { get; set; }
        public int? TipoOperacionId { get; set; }

        public string NombreOperacion { get; set; }
       
        public int? TarjetaId { get; set; }


  
    }
}
