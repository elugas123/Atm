using System;
using System.Collections.Generic;

namespace ATM1.Models
{
    public partial class Operacion
    {
        public int Id { get; set; }
        public decimal? Cantidad { get; set; }
        public DateTime? Fecha { get; set; }
        public int? TipoOperacionId { get; set; }
        public int? TarjetaId { get; set; }

        public virtual Tarjeta Tarjeta { get; set; }
        public virtual TipoOperacion TipoOperacion { get; set; }
    }
}
