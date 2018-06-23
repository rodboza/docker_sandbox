using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aspnet.Data
{
    public interface IDataService
    {
        void InicializaDB();
        List<Person> GetPersons();
        void AddPersons(Person person);
        List<Msg> GetMsgs();
    }
}
