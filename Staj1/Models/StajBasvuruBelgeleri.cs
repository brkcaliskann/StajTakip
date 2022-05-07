namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StajBasvuruBelgeleri")]
    public partial class StajBasvuruBelgeleri
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string BelgeAdi { get; set; }

        public DateTime? Tarih { get; set; }

        public int? KullaniciID { get; set; }

        public int? StajDonemNO { get; set; }

        public virtual Kullanici Kullanici { get; set; }
    }
}
