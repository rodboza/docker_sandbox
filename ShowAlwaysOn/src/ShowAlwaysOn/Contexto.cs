using ShowAlwaysOn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ShowAlwaysOn
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




