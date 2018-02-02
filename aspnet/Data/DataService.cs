using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using aspnet.Models;
using Microsoft.EntityFrameworkCore;


namespace aspnet.Data
{
    public class DataService : IDataService
    {
        private readonly Contexto _contexto;
        public DataService(Contexto contexto)
        {
            this._contexto = contexto;
        }

        public DataService()
{
}



        public List<Person> GetPersons()
        {
	   List<Person> lista = new List<Person>{};
	   //var lista = 0;
	   int erro = 1;
	   while ( erro > 0 && erro < 10)
           try
	   {
		//string connectionString = @"Data Source=13.72.79.75;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd";
		string connectionString = @"Data Source=haproxy;Initial Catalog=db1;Persist Security Info=True;User ID=sa;Password=P@ssw0rd;ApplicationIntent=ReadOnly";
		var options = new DbContextOptionsBuilder<Contexto>();
		options.UseSqlServer(connectionString);
		Contexto myCtxt = new Contexto(options.Options);
		lista =  myCtxt.Persons.ToList();
		erro = 0;
	   }
	   catch (Exception e)
	   {
		Console.WriteLine("---------------->>>>>>> erro " + erro.ToString());
		erro++;
	   }
	    Console.WriteLine("Passou");
	    return lista;
        }

        public void InicializaDB()
        {
            this._contexto.Database.EnsureCreated();
        }
    }
}
