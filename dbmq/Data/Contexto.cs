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

        public Contexto()
        : base()
        {
            Console.WriteLine("create do Contexto...");
            Console.WriteLine("Server=localhost;User Id=teste;Password=teste;Database=qadb");
        }

        public Contexto(DbContextOptions<Contexto> options)
            : base(options)
        {
            Console.WriteLine("create do Contexto (options)...");
            Console.WriteLine("Server=localhost;User Id=teste;Password=teste;Database=qadb");
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
           => optionsBuilder
               .UseMySql("Server=localhost;User Id=teste;Password=teste;Database=qadb");

    }
}



