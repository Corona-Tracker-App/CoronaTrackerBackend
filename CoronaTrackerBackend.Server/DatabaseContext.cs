using Microsoft.EntityFrameworkCore;

namespace CoronaTrackerBackend.Server
{
    public class DatabaseContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}