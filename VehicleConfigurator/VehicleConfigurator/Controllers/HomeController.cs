using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleConfigurator.Helper;
using System.Web.Mvc;
using VehicleConfigurator.Models;

namespace VehicleConfigurator.Controllers
{
    public class HomeController : Controller
    {
        GeneralOperations generalOperations;
        public HomeController()
        {
            generalOperations = new GeneralOperations();
        }
        // GET: Home
        public ActionResult Index()
        {
            return View(generalOperations.GetAllActiveCars());
        }
        public ActionResult Discovery(int id=0,int stPackage=1)
        {
            if (id == 0)
            {
                RedirectToAction("Index", "Home");
            }
            Cars cars = generalOperations.GetCarsByCarsId(id);
            List<VehicleFeatures> features = generalOperations.GetAllVehicleFeaturesByPackageType(stPackage);
            ViewBag.cars = cars;
            ViewBag.stPackage = stPackage;
            ViewBag.features = features;
            return View();
        }

        public ActionResult ChoosePacked(int carId=0)
        {
            if (carId == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.car = generalOperations.GetCarsByCarsId(carId);
            ViewBag.carId = carId;
            return View();
        }

        public ActionResult CreateCarChoose()
        {
            PackageListModel packageList = new PackageListModel();
            if (Request["packageType"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            int packageType = int.Parse(Request["packageType"]);
            packageList.BodyList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.BodyList);
            packageList.ColorList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.ColorList);
            packageList.EngineList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.EngineList);
            packageList.FloorList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.FloorList);
            packageList.GearboxList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.GearboxList);
            List<VehicleFeatures> optionList = generalOperations.GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(packageType, Helper.VehicleFeaturesTypeList.OptionList);
            packageList.CarId = int.Parse(Request["carsId"]);
            packageList.PackageTypeId = int.Parse(Request["packageType"]);
            List<CheckboxModel> optionSelectList = new List<CheckboxModel>();
            foreach (var item in optionList)
            {
                optionSelectList.Add(new CheckboxModel(){
                    IsChecked=false,
                    Text=item.FeaturesName,
                    Value=item.VehicleFeaturesId
                });
            }
            packageList.OptionCheckBoxList = optionSelectList;
            return View(packageList);
        }
        
        public ActionResult ViewPackage(PackageListModel packagelist)
        {
            ViewPackageModel viewpackage = new ViewPackageModel();
            if (packagelist.VehicleFeaturesBodyTypeId == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            viewpackage.SelectedBodyValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesBodyTypeId);
            viewpackage.SelectedColorValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesColorTypeId);
            viewpackage.SelectedEngineValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesEngineTypeId);
            viewpackage.SelectedFloorValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesFloorTypeId);
            viewpackage.SelectedGearboxValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesGearboxTypeId);
            viewpackage.Car = generalOperations.GetCarsByCarsId(packagelist.CarId);
            viewpackage.PackageTypeId = packagelist.PackageTypeId;
            viewpackage.SelectedOptionsList = new List<VehicleFeatures>();
            viewpackage.TotalPrice += viewpackage.Car.Price;
            viewpackage.TotalPrice += viewpackage.SelectedBodyValue.FeaturesPrice;
            viewpackage.TotalPrice += viewpackage.SelectedColorValue.FeaturesPrice;
            viewpackage.TotalPrice += viewpackage.SelectedEngineValue.FeaturesPrice;
            viewpackage.TotalPrice += viewpackage.SelectedGearboxValue.FeaturesPrice;
            foreach (var item in packagelist.OptionCheckBoxList)
            {
                if (item.IsChecked != false)
                {
                    VehicleFeatures features = generalOperations.GetVehicleFeaturesById(item.Value);
                    viewpackage.SelectedOptionsList.Add(features);
                    viewpackage.TotalPrice += features.FeaturesPrice;
                }
            }
            Session.Add("CarOrderDetail", packagelist);
            return View(viewpackage);
        }
        #region Pdf Denemeleri
        //public ActionResult GetSessionPdfCarDetails()
        //{
        //    if (Session["CarOrderDetail"] != null)
        //    {
        //        PackageListModel packagelist = (PackageListModel)Session["CarOrderDetail"];
        //        ViewPackageModel viewpackage = new ViewPackageModel();
        //        viewpackage.SelectedBodyValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesBodyTypeId);
        //        viewpackage.SelectedColorValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesColorTypeId);
        //        viewpackage.SelectedEngineValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesEngineTypeId);
        //        viewpackage.SelectedFloorValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesFloorTypeId);
        //        viewpackage.SelectedGearboxValue = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesGearboxTypeId);
        //        viewpackage.Car = generalOperations.GetCarsByCarsId(packagelist.CarId);
        //        viewpackage.PackageTypeId = packagelist.PackageTypeId;
        //        viewpackage.SelectedOptionsList = new List<VehicleFeatures>();
        //        viewpackage.TotalPrice += viewpackage.Car.Price;
        //        viewpackage.TotalPrice += viewpackage.SelectedBodyValue.FeaturesPrice;
        //        viewpackage.TotalPrice += viewpackage.SelectedColorValue.FeaturesPrice;
        //        viewpackage.TotalPrice += viewpackage.SelectedEngineValue.FeaturesPrice;
        //        viewpackage.TotalPrice += viewpackage.SelectedGearboxValue.FeaturesPrice;
        //        foreach (var item in packagelist.OptionCheckBoxList)
        //        {
        //            if (item.IsChecked != false)
        //            {
        //                VehicleFeatures features = generalOperations.GetVehicleFeaturesById(item.Value);
        //                viewpackage.SelectedOptionsList.Add(features);
        //                viewpackage.TotalPrice += features.FeaturesPrice;
        //            }
        //        }
        //        return View(viewpackage);
        //    }
        //    return RedirectToAction("Index","Home");
        //}
        //public ActionResult GetPdfSession()
        //{
        //    if (Session["CarOrderDetail"] != null)
        //    {
        //        var cookies = Request.Cookies.AllKeys.ToDictionary(k => k, k => Request.Cookies[k].Value);
        //        return new Rotativa.ActionAsPdf("GetSessionPdfCarDetails")
        //        {
        //            PageSize = Rotativa.Options.Size.A4,
        //            PageOrientation = Rotativa.Options.Orientation.Portrait,
        //            FormsAuthenticationCookieName = System.Web.Security.FormsAuthentication.FormsCookieName,
        //            Cookies = cookies,
        //            SaveOnServerPath = (Server.MapPath("~/Content/Pdf/" + Guid.NewGuid()+".pdf")),
        //        };
        //    }
        //    return RedirectToAction("Index", "Home");
        //}
        #endregion

        public ActionResult Order()
        {
            if (Session["CarOrderDetail"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.DealerList = generalOperations.GetAllDealer();
            return View();
        }
        [HttpPost]
        public ActionResult Order(int dealersId,string fullname,string email,string phone)
        {
            PackageListModel packagelist = (PackageListModel)Session["CarOrderDetail"];
            if (packagelist == null)
            {
                return RedirectToAction("Index", "Home");
            }
            bool type = false;
            string optionPackage = "";
            string typeName = "Special Paket";
            if (packagelist.PackageTypeId==1)
            {
                type = true;
                typeName = "Standart Paket";
            }
            Orders orders = new Orders()
            {
                ClientMail=email,
                CarsId=packagelist.CarId,
                DealerId=dealersId,
                IsActive=true,
                CreateDate=DateTime.Now,
                IsDeleted=false,
                IsStandartPackage=true,
            };
            orders.OrderDetails.Add(new OrderDetails
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                VehicleFeaturesId = packagelist.VehicleFeaturesBodyTypeId
            });
            orders.OrderDetails.Add(new OrderDetails
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                VehicleFeaturesId = packagelist.VehicleFeaturesColorTypeId
            });
            orders.OrderDetails.Add(new OrderDetails
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                VehicleFeaturesId = packagelist.VehicleFeaturesEngineTypeId
            });
            orders.OrderDetails.Add(new OrderDetails
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                VehicleFeaturesId = packagelist.VehicleFeaturesFloorTypeId
            });
            orders.OrderDetails.Add(new OrderDetails
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                VehicleFeaturesId = packagelist.VehicleFeaturesGearboxTypeId
            });
            foreach (var item in packagelist.OptionCheckBoxList)
            {
                if (item.IsChecked == true)
                {
                    orders.OrderDetails.Add(new OrderDetails
                    {
                        IsActive = true,
                        CreateDate = DateTime.Now,
                        IsDeleted = false,
                        VehicleFeaturesId = item.Value
                    });
                }
            }
            Dealer dealer = generalOperations.GetDealerById(dealersId);
            Cars car = generalOperations.GetCarsByCarsId(packagelist.CarId);
            VehicleFeatures selectedBody = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesBodyTypeId);
            VehicleFeatures selectedColor = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesColorTypeId);
            VehicleFeatures selectedEngine = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesEngineTypeId);
            VehicleFeatures selectedFloor= generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesFloorTypeId);
            VehicleFeatures selectedGearbox = generalOperations.GetVehicleFeaturesById(packagelist.VehicleFeaturesGearboxTypeId);
            foreach (var item in packagelist.OptionCheckBoxList)
            {
                if (item.IsChecked == true)
                {
                    VehicleFeatures selectedOption = generalOperations.GetVehicleFeaturesById(item.Value);
                    optionPackage += selectedOption.FeaturesName+ ",";
                }
            }
            generalOperations.InsertOrders(orders);
            EmailHelper.Mail(email, "Talebini Aldık", "Merhaba " + fullname + "<br>" + "Araç Sipariş Talebini Aldık Yakında Sana Geri Dönüş Yapacağız");

            EmailHelper.Mail(dealer.DealerEmail, "Yeni Sipariş Talebi", "Merhaba , <br>" +
                "Müşteri Adı:" + fullname + "<br>" +
                "Telefon Numarası:" + phone + "<br>" +
                "Email:" + email + "<br>" +
                "</hr>" +
                "<h1>Araç Bilgileri </h1>" +
                "<br>" +
                "Araç Modeli:" + car.CarName + "<br>" +
                "Araç Paketi:" + typeName + "<br>" +
                "Araç Gövde Seçimi:" + selectedBody.FeaturesName + "<br>" +
                "Araç Motor Seçimi:" + selectedEngine.FeaturesName + "<br>" +
                "Araç Şanzıman Seçimi:" + selectedGearbox.FeaturesName + "<br>" +
                "Araç Şanzıman Seçimi:" + selectedColor.FeaturesName + "<br>" +
                "Araç Döşeme Seçimi:" + selectedFloor.FeaturesName + "<br>" +
                "Araç Opsiyon Seçimleri:" + optionPackage + "<br>" +
                "İyi Çalışmalar Teklif Olarak Müşteriye Dönüş Yapınız");
            return RedirectToAction("ThankYou","Home");
        }
        public ActionResult ThankYou()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        
    }
}