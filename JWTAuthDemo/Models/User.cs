using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TestTask.Models
{
    public class User
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string lname { get; set; }
        [Required]
        public string fname { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
