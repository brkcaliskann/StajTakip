namespace Staj1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StajAdi")]
    public partial class StajAdi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StajAdi()
        {
            StajyerOgrenciBaslatma = new HashSet<StajyerOgrenciBaslatma>();
        }

        public int ID { get; set; }

        [StringLength(15)]
        public string Adi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StajyerOgrenciBaslatma> StajyerOgrenciBaslatma { get; set; }
    }
}
