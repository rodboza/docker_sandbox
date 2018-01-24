using ShowAlwaysOn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShowAlwaysOn
{
    public interface IDataService
    {
        void InicializaDB();
        List<Person> GetPersons();
    }
}
