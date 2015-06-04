using databaseProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace databaseProject.Controllers
{
    public class SelectController : Controller
    {
        private  M2DbEntities db=new M2DbEntities();


        public ActionResult Index()
        {
            return View();
        }
      
        //GET: project_status_report by hours 
        public PartialViewResult projectStatusReport_hours(string hours)
        {

            string query = "SELECT * FROM project_status_report WHERE work_hours > " + hours;
            var psrh = db.Project_status_report.SqlQuery(query);
            return PartialView("projectStatusReport",psrh);
        }

        //GET: Retrive Employees with there projects 
        public PartialViewResult employeeDepartment()
        {
    
            var ep = db.Employee_project();
            return PartialView("Employee_department",ep);
        }

        //GET: Project Contracts 
        public PartialViewResult contractProject(string projectId)
        {
            if(projectId!=null){
            int pId = Convert.ToInt32(projectId);
            //SELECT * FROM CONTRACT WHERE PROJECT_ID = Passed_ID;
            var contract = db.Contracts.Where(e => e.Project_id == pId);

            return PartialView(contract);
            }

            return null;
        }

        //GET: Select/ContractTask
        public PartialViewResult contractTasks(string contractId) {

            if (contractId!=null)
            {
                int cId = Convert.ToInt32(contractId);
                var contractTask = db.Contract_task.Where(e => e.Contract_id == cId);
                return PartialView(contractTask);
            }
            return null;
        }


    }
}