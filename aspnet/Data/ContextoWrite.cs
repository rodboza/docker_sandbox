using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace aspnet.Data
{
    public class ContextoWrite : DbContext
    {

        public DbSet<Person> Persons { get; set; }
	
        static DbContextOptions<ContextoWrite> Init ()
        {
            //string connectionString = @"Data Source=13.72.79.75;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd";
            //string connectionString = @"Data Source=haproxy;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
            //string connectionString = @"Data Source=linuxubt-rodboza.eastus.cloudapp.azure.com;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
            string connectionString = @"Data Source=sqlnode1;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
            var options = new DbContextOptionsBuilder<ContextoWrite>();
            return options.UseSqlServer(connectionString).Options;
        }
        
        public ContextoWrite()
		    :this(Init())
	    {		
        }

        public ContextoWrite(DbContextOptions<ContextoWrite> options)
            : base(options)
        {

        }
    }
}




