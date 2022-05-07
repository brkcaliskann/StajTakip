using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Staj2.Models
{
    public partial class Staj2DB : DbContext
    {
        public Staj2DB()
            : base("name=Staj2DB1")
        {
        }

        public virtual DbSet<GeriGonderilenBelgeler> GeriGonderilenBelgeler { get; set; }
        public virtual DbSet<Kullanici> Kullanici { get; set; }
        public virtual DbSet<KullaniciRol> KullaniciRol { get; set; }
        public virtual DbSet<ResmiTatiller> ResmiTatiller { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<Staj> Staj { get; set; }
        public virtual DbSet<StajAdi> StajAdi { get; set; }
        public virtual DbSet<StajBaslatilsinMi> StajBaslatilsinMi { get; set; }
        public virtual DbSet<StajBasvuruBelgeleri> StajBasvuruBelgeleri { get; set; }
        public virtual DbSet<StajDefteriTeslim> StajDefteriTeslim { get; set; }
        public virtual DbSet<StajDurum> StajDurum { get; set; }
        public virtual DbSet<StajyerOgrenciBaslatma> StajyerOgrenciBaslatma { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Kullanici>()
                .HasMany(e => e.KullaniciRol)
                .WithRequired(e => e.Kullanici)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Rol>()
                .HasMany(e => e.KullaniciRol)
                .WithRequired(e => e.Rol)
                .WillCascadeOnDelete(false);
        }
    }
}
