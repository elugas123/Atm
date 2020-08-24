using System;
using System.Collections.Generic;

namespace ATM1.Models
{
    public partial class TipoOperacion
    {
        public TipoOperacion()
        {
            Operacion = new HashSet<Operacion>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Operacion> Operacion { get; set; }
    }
}
