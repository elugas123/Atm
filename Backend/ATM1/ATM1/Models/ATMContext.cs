using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ATM1.Models
{
    public partial class ATMContext : DbContext
    {
        public ATMContext()
        {
        }

        public ATMContext(DbContextOptions<ATMContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Operacion> Operacion { get; set; }
        public virtual DbSet<Tarjeta> Tarjeta { get; set; }
        public virtual DbSet<TipoOperacion> TipoOperacion { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=ITRP0316;Initial Catalog=ATM;Integrated Security=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Operacion>(entity =>
            {
                entity.Property(e => e.Cantidad).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Fecha).HasColumnType("datetime");

                entity.HasOne(d => d.Tarjeta)
                    .WithMany(p => p.Operacion)
                    .HasForeignKey(d => d.TarjetaId)
                    .HasConstraintName("FK_Operacion_Tarjeta");

                entity.HasOne(d => d.TipoOperacion)
                    .WithMany(p => p.Operacion)
                    .HasForeignKey(d => d.TipoOperacionId)
                    .HasConstraintName("FK_Operacion_TipoOperacion");
            });

            modelBuilder.Entity<Tarjeta>(entity =>
            {
                entity.Property(e => e.FechaVencimiento).HasColumnType("datetime");

                entity.Property(e => e.NumeroTarjeta)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Pin)
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TipoOperacion>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Nombre).HasMaxLength(20);
            });
        }
    }
}
