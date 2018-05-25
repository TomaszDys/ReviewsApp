namespace TomaszDyskoLab5Zad1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Review
    {
        /// <summary>
        /// Id recenzji
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Id gry
        /// </summary>
        public int GameId { get; set; }
        /// <summary>
        /// Tytu³ recenzji
        /// </summary>
        [Required]
        [StringLength(50)]
        public string Title { get; set; }
        /// <summary>
        /// Opis 
        /// </summary>
        [Column(TypeName = "text")]
        [Required]
        public string Description { get; set; }
        /// <summary>
        /// Ocena gry
        /// </summary>
        public int Stars { get; set; }

        public virtual Game Game { get; set; }
    }
}
