using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TestTask.Models
{
    public class TemperatureLog
    {
        [Required]
        public string City { get; set; }
        [Required]
        public int Temp { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
