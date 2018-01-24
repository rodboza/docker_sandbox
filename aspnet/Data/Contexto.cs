using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace aspnet.Data
{
    public class Contexto : DbContext
    {

        public DbSet<Person> Persons { get; set; }

        public Contexto(DbContextOptions<Contexto> options)
            : base(options)
        {

        }
    }
}




