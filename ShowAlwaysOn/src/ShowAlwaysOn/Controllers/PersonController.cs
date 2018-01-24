using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ShowAlwaysOn.Models;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace ShowAlwaysOn.Controllers
{
    public class PersonController : Controller
    {
        private readonly IDataService _dataService;
        public PersonController(IDataService dataService)
        {
            this._dataService = dataService;
        }
        
        // GET: /Person/
        public IActionResult Index()
        {
            List<Person> persons = _dataService.GetPersons();
            return View(persons);
        }

        
    }
}
