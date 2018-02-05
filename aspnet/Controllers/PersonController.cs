using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using aspnet.Models;
using aspnet.Data;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace aspnet.Controllers
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

        // GET: Person/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Person/Create
        [HttpPost]
        public async Task<IActionResult> Create([Bind("Id,FirstName,MiddleName,LastName")] Person person)
        {
            if (ModelState.IsValid)
            {
                _dataService.AddPersons(person);
                //_context.Add(person);
                //await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(person);
        }



    }
}
