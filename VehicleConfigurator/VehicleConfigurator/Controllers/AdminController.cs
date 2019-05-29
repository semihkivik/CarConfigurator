using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VehicleConfigurator.Controllers
{
    public class AdminController : Controller
    {
        GeneralOperations generalOperations;
        public AdminController()
        {
            generalOperations = new GeneralOperations();
        }
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["Login"] != null)
            {
                return  View(generalOperations.GetAllCars());
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
        public ActionResult Login()
        {
            if (Session["Login"] != null)
            {
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            AdminUser user = generalOperations.GetLoginUser(username, password);
            if (user != null)
            {
                Session.Add("Login", user);
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ViewBag.result = "Şifre Hatalı";
                return View();
            }
        }
        public ActionResult CreateCar()
        {
            if (Session["Login"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
        [HttpPost]
        public ActionResult CreateCar(string carName,string carModel,int carPrice,HttpPostedFileBase carFile)
        {
            if (Session["Login"] != null)
            {
                string fileName = "";
                if (carFile != null && carFile.FileName != null)
                {
                    fileName = carFile.FileName;
                    carFile.SaveAs(Server.MapPath("~/Content/Image/" + fileName));
                }
                Cars createCar = new Cars()
                {
                    CarName = carName,
                    CarModel = carModel,
                    Price = carPrice,
                    CarImagePath = fileName,
                    IsActive=true,
                    IsDeleted=false,
                    CreateDate=DateTime.Now
                    
                };
                generalOperations.InsertCars(createCar);
                return RedirectToAction("Index","Admin");
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
        public ActionResult ActiveCar(int id=0)
        {
            if (Session["Login"] != null)
            {
                if (id == 0)
                {
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    generalOperations.UpdateCarIsActiveStatus(id, true);
                    return RedirectToAction("Index", "Admin");
                }
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
        public ActionResult PassiveCar(int id = 0)
        {
            if (Session["Login"] != null)
            {
                if (id == 0)
                {
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    generalOperations.UpdateCarIsActiveStatus(id, false);
                    return RedirectToAction("Index", "Admin");
                }
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
        public ActionResult RemoveCar(int id = 0)
        {
            if (Session["Login"] != null)
            {
                if (id == 0)
                {
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    generalOperations.RemoveCar(id);
                    return RedirectToAction("Index", "Admin");
                }
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }
		public ActionResult Logout()
		{
			Session.Abandon();
			return RedirectToAction("Index", "Home");
		}
	}
}