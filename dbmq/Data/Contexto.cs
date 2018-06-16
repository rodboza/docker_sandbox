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
        }

        public Contexto(DbContextOptions<Contexto> options)
            : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
           => optionsBuilder
               .UseMySql("Server=localhost;User Id=teste;Password=teste;Database=qadb");

    }
}



