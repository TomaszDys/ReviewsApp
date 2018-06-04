namespace TomaszDyskoLab5Zad1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Game
    {
        /// <summary>
        /// Kostruktor modelu gra
        /// </summary>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Game()
        {
            Reviews = new HashSet<Review>();
        }
        /// <summary>
        /// Id modelu
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Nazwa gry
        /// </summary>
        [Required]
        [StringLength(31)]
        public string Name { get; set; }
        /// <summary>
        /// Nazwa producenta
        /// </summary>
        [Required]
        [StringLength(31)]
        public string Producer { get; set; }
        /// <summary>
        /// Rok produkcji
        /// </summary>
        public int Year { get; set; }
        /// <summary>
        /// Lista recenzji
        /// </summary>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
