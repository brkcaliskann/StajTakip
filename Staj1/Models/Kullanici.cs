namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Kullanici")]
    public partial class Kullanici
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kullanici()
        {
            GeriGonderilenBelgeler = new HashSet<GeriGonderilenBelgeler>();
            KullaniciRol = new HashSet<KullaniciRol>();
            Staj = new HashSet<Staj>();
            StajBasvuruBelgeleri = new HashSet<StajBasvuruBelgeleri>();
            StajDefteriTeslim = new HashSet<StajDefteriTeslim>();
            StajyerOgrenciBaslatma = new HashSet<StajyerOgrenciBaslatma>();
        }

        public int KullaniciID { get; set; }

        [StringLength(50)]
        public string Adi { get; set; }

        [StringLength(100)]
        public string Soyadi { get; set; }

        [StringLength(50)]
        public string Numara { get; set; }

        [StringLength(50)]
        public string Mail { get; set; }

        [StringLength(50)]
        public string Parola { get; set; }

        public DateTime? KayıtTarihi { get; set; }

        public bool? OnaylandiMi { get; set; }
        public bool? Status { get; set; }

        public bool? AktifMi { get; set; }
        public bool? BasvuruYapildiMi { get; set; }

        public int? StajDurumID { get; set; }

        public bool BeniHatirla { get; set; }

        [StringLength(50)]
        public string TelefonNo { get; set; }

        public bool? StajBaslatilsinMi { get; set; }

        [StringLength(100)]
        public string Adres { get; set; }

        [StringLength(70)]
        public string BasvuruyuDegerlendiren { get; set; }

        [StringLength(5)]
        public string Sinif { get; set; }

        public DateTime? BasvuruDegerlendirmeTarihi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GeriGonderilenBelgeler> GeriGonderilenBelgeler { get; set; }

        public virtual StajDurum StajDurum { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KullaniciRol> KullaniciRol { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Staj> Staj { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StajBasvuruBelgeleri> StajBasvuruBelgeleri { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StajDefteriTeslim> StajDefteriTeslim { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StajyerOgrenciBaslatma> StajyerOgrenciBaslatma { get; set; }
    }
}
