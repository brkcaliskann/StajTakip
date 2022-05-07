namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ResmiTatiller")]
    public partial class ResmiTatiller
    {
        public int ID { get; set; }

        public DateTime? ResmiTatil { get; set; }

        [StringLength(100)]
        public string Aciklama { get; set; }
    }
}
