namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Staj")]
    public partial class Staj
    {
        public int StajID { get; set; }

        [StringLength(200)]
        public string Baslik { get; set; }

        public string Icerik { get; set; }

        public DateTime? Tarih { get; set; }

        public int? KullaniciID { get; set; }

        public int? StajDonemNO { get; set; }

        public virtual Kullanici Kullanici { get; set; }
    }
}
