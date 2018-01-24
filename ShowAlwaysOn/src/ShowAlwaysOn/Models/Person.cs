using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShowAlwaysOn.Models
{
    public class Person
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }

        public Person()
        {
        }

        public Person(int id, string firstName, string middleName, string lastName)
            :this(firstName,middleName,lastName)
        {
            this.Id = id;
        }
        public Person(string firstName, string middleName, string lastName)
        {
            this.FirstName = firstName;
            this.MiddleName = middleName;
            this.LastName = lastName;
        }
    }
}
