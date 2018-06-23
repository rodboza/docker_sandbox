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
        public DbSet<Msg> qa_msgs { get; set; }
        
        static DbContextOptions<Contexto> Init ()
        {
            //string connectionString = @"Data Source=13.72.79.75;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd";
            //string connectionString = @"Data Source=haproxy;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
            //string connectionString = @"Data Source=linuxubt-rodboza.eastus.cloudapp.azure.com;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
            string connectionString = @"Server=linuxubt-rodboza.eastus.cloudapp.azure.com;User Id=teste;Password=teste;Database=qadb;Port=33060";
            //string connectionString = @"Server=haproxy;User Id=teste;Password=teste;Database=qadb";
            var options = new DbContextOptionsBuilder<Contexto>();
            return options.UseMySql(connectionString).Options;
        }
        
        public Contexto()
		    :this(Init())
	    {		
        }

        public Contexto(DbContextOptions<Contexto> options)
            : base(options)
        {

        }
    }
}




