namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StajyerOgrenciBaslatma")]
    public partial class StajyerOgrenciBaslatma
    {
        public int ID { get; set; }

        [StringLength(70)]
        public string IsyeriAdi { get; set; }

        public DateTime? StajBaslangicTarihi { get; set; }

        public DateTime? StajBitisTarihi { get; set; }

        public int? HaftaIciGunSayisi { get; set; }

        public int? ResmiTatilSayisi { get; set; }

        public int? ToplamCalismaSüresi { get; set; }

        public DateTime? Tarih { get; set; }

        [StringLength(10)]
        public string CumartesiCalisiyorMu { get; set; }

        public int? StajAdiID { get; set; }

        public int? KullaniciID { get; set; }

        public string IsyeriAdresi { get; set; }

        public virtual Kullanici Kullanici { get; set; }

        public virtual StajAdi StajAdi { get; set; }
    }
}
