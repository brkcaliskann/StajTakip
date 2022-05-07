namespace Staj2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StajDefteriTeslim")]
    public partial class StajDefteriTeslim
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string DosyaAdi { get; set; }

        public int? KullaniciID { get; set; }

        public DateTime? Tarih { get; set; }

        public virtual Kullanici Kullanici { get; set; }
    }
}
