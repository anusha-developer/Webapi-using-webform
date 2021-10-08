using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebapiInsertFromWebform.Controllers
{
    public class EmpinsertController : ApiController
    {
        [HttpPost]
        public IHttpActionResult  insertemp(Tbl_Employee tblemp)
        {
            DBEmployeeEntities dBEmployee = new DBEmployeeEntities();
            dBEmployee.Tbl_Employee.Add(tblemp);
            dBEmployee.SaveChanges();
            return Ok();
            
        }
    }
}
