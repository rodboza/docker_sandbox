using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;




namespace dbmq.Models
{
    public class Msg
    {
        public int id { get; set; }
        public DateTime data { get; set; }
        public string msg { get; set; }

        public Msg (){}

        public Msg (string msg)
        {
            this.msg = msg;
        }
    }
}



