using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace WebApi.Models
{
    public class User
    {
        [Key]
        [JsonProperty("userId")]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; } = "";
        [Required]
        public string Address { get; set; } = "";
    }
}
