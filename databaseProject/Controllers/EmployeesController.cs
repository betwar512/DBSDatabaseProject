using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using databaseProject.Models;
using PagedList;

namespace databaseProject.Controllers
{
    public class EmployeesController : Controller
    {
        private M2DbEntities db = new M2DbEntities();


        public ActionResult search() {
            return View("Search");
        }

        // GET: Employees
        public ActionResult Index(int? page)
        {
            int pageSize = 20;
            var employees = db.Employees.Include(e => e.Contract_worker).Include(e => e.Office_worker).OrderBy(e=>e.Employee_Id);

           
            return View(employees.ToPagedList(pageNumber:page ?? 1,pageSize:pageSize));
        }
        //GET:Employees/findEmployee
        public PartialViewResult findEmployee(string passedString)
        {
            int int_id = Convert.ToInt32(passedString);
            string query = "SELECT * FROM Employee WHERE Employee_id = " + passedString;
            var employee = db.Employees.SqlQuery(query);
            return PartialView("Employee",employee);
        }

        //GET: EMployee Salary min and max ,Range Search 
        public PartialViewResult employeeSalarySearch(string min,string max)
        {
          
            var employee = db.Employees.SqlQuery("SELECT * FROM Employee where salary <" + max + " AND salary >" + min).ToList();

            return PartialView("Employee",employee);
        }

        //GET: Employees/SEx
        public PartialViewResult findSex(string sex)
        {

            string query = "select * from Employee where sex = " + sex;
            var employees = db.Employees.SqlQuery(query).ToList();

            return PartialView("Employee", employees);
        }

        //Get: ContractWorkers : Using View Created in Database 
        public ActionResult ContractWorkers(int? page) {

            int pageSize = 20;
      
            var contractView = db.ContractWorkerViews.OrderBy(e=>e.Id);

            return View(contractView.ToPagedList(pageNumber: page ?? 1, pageSize: pageSize));

        }


        //Get: OfficeWorkers : using view 
        public ActionResult OfficeWorkers(int? page) {

            var officeWorker = db.OfficeWorkerViews.OrderBy(e => e.Id);

            return View(officeWorker.ToPagedList(pageNumber:page??1,pageSize:20));
        
        }

        // GET: Employees/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = await db.Employees.FindAsync(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // GET: Employees/Create
        public ActionResult Create()
        {
            ViewBag.Employee_Id = new SelectList(db.Contract_worker, "Employee_id", "Specialization");
            ViewBag.Employee_Id = new SelectList(db.Office_worker, "Employee_Id", "Super_Id");
            return View();
        }

        // POST: Employees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Employee_Id,Name,Salary,Birthday,Address,Phone,Email,Sex")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Employees.Add(employee);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Employee_Id = new SelectList(db.Contract_worker, "Employee_id", "Specialization", employee.Employee_Id);
            ViewBag.Employee_Id = new SelectList(db.Office_worker, "Employee_Id", "Super_Id", employee.Employee_Id);
            return View(employee);
        }

        // GET: Employees/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = await db.Employees.FindAsync(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.Employee_Id = new SelectList(db.Contract_worker, "Employee_id", "Specialization", employee.Employee_Id);
            ViewBag.Employee_Id = new SelectList(db.Office_worker, "Employee_Id", "Super_Id", employee.Employee_Id);
            return View(employee);
        }

        // POST: Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Employee_Id,Name,Salary,Birthday,Address,Phone,Email,Sex")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Employee_Id = new SelectList(db.Contract_worker, "Employee_id", "Specialization", employee.Employee_Id);
            ViewBag.Employee_Id = new SelectList(db.Office_worker, "Employee_Id", "Super_Id", employee.Employee_Id);
            return View(employee);
        }

        // GET: Employees/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = await db.Employees.FindAsync(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Employee employee = await db.Employees.FindAsync(id);
            db.Employees.Remove(employee);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
