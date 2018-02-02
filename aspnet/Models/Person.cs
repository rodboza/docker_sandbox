using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aspnet.Models
{
    public class Person
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
	public string ServerName { get; set; }

        public Person()
        {
        }

        public Person(int id, string firstName, string middleName, string lastName, string serverName)
            :this(firstName,middleName,lastName, serverName)
        {
            this.Id = id;
        }
        public Person(string firstName, string middleName, string lastName, string serverName)
        {
            this.FirstName = firstName;
            this.MiddleName = middleName;
            this.LastName = lastName;
	    this.ServerName = serverName;
        }
    }
}
