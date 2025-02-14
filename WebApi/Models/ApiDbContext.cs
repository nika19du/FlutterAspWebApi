using Microsoft.EntityFrameworkCore;

namespace WebApi.Models
{
    public class ApiDbContext : DbContext
    {
        public ApiDbContext(DbContextOptions options) : base(options) { }

        public DbSet<User> Users { get; set; }

    }
}
