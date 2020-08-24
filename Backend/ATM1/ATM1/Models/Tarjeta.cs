using System;
using System.Collections.Generic;

namespace ATM1.Models
{
    public partial class Tarjeta
    {
        public Tarjeta()
        {
            Operacion = new HashSet<Operacion>();
        }

        public int Id { get; set; }
        public string NumeroTarjeta { get; set; }
        public bool? Estado { get; set; }
        public DateTime? FechaVencimiento { get; set; }
        public string Pin { get; set; }

        public virtual ICollection<Operacion> Operacion { get; set; }
    }
}
