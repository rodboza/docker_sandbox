using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

using aspnet.Models;
using aspnet.Data;

namespace aspnet.Controllers
{
    public class MsgController : Controller
    {
        private readonly IDataService _dataService;

        public MsgController(IDataService dataService)
        {
            this._dataService = dataService;
        }


        public IActionResult Index()
        {
            List<Msg> msgs = _dataService.GetMsgs();
            return View(msgs);
        }
    }
}