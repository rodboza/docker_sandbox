using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShowAlwaysOn.Models;

namespace ShowAlwaysOn
{
    public class DataService : IDataService
    {
        private readonly Contexto _contexto;
        public DataService(Contexto contexto)
        {
            this._contexto = contexto;
        }


        public List<Person> GetPersons()
        {
            return this._contexto.Persons.ToList();
        }

        public void InicializaDB()
        {
            this._contexto.Database.EnsureCreated();
        }
    }
}
