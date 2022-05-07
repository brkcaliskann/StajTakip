namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StajBaslatilsinMi")]
    public partial class StajBaslatilsinMi
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Adi { get; set; }

        [StringLength(250)]
        public string Aciklama { get; set; }
    }
}
