using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using dbmq.Models;


namespace dbmq.Data
{
    public class Contexto : DbContext
    {

        public DbSet<Msg> qa_msgs { get; set; }
        public IConfiguration Configuration { get; }

        public Contexto()
        : base()
        {
            Console.WriteLine("create do Contexto...");
            Console.WriteLine(Configuration.GetConnectionString("DefaultConnection"));
        }

        public Contexto(DbContextOptions<Contexto> options)
            : base(options)
        {
            Console.WriteLine("create do Contexto (options)...");
            Console.WriteLine(Configuration.GetConnectionString("DefaultConnection"));
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
           => optionsBuilder
               .UseMySql(Configuration.GetConnectionString("DefaultConnection"));

    }
}



