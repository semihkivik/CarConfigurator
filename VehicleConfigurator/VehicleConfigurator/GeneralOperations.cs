using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleConfigurator.Helper;

namespace VehicleConfigurator
{
    public class GeneralOperations
    {
        VehicleConfiguratorEntities db;
        public GeneralOperations()
        {
            db = new VehicleConfiguratorEntities();
        }

        public List<Cars> GetAllActiveCars()
        {
            return db.Cars.Where(s => s.IsActive && !s.IsDeleted).ToList();
        }
        public List<Cars> GetAllCars()
        {
			return db.Cars.Where(s =>!s.IsDeleted).ToList();
			
        }
        public List<VehicleFeatures> GetAllVehicleFeaturesByPackageTypeAndVehicleFeaturesType(int packageType, VehicleFeaturesTypeList vehicleFeaturesType)
        {
            bool packageBoolType = false;
            if (packageType == 0)
            {
                packageBoolType = true;
            }
            return db.VehicleFeatures.Where(s => s.IsActive && !s.IsDeleted && s.IsStandartPackage == packageBoolType && s.VehicleFeaturesTypeId == (int)vehicleFeaturesType).ToList();
        }
        public List<VehicleFeatures> GetAllVehicleFeaturesByPackageType(int packageType)
        {
            bool packageBoolType = false;
            if (packageType == 0)
            {
                packageBoolType = true;
            }
            return db.VehicleFeatures.Where(s => s.IsActive && !s.IsDeleted && s.IsStandartPackage == packageBoolType).ToList();
        }
        public VehicleFeatures GetVehicleFeaturesById(int vehicleFeaturesId)
        {
            return db.VehicleFeatures.Where(s => s.VehicleFeaturesId == vehicleFeaturesId && s.IsActive && !s.IsDeleted).SingleOrDefault();
        }

        public List<Dealer> GetAllDealer()
        {
            return db.Dealer.Where(s => s.IsActive && !s.IsDeleted).ToList();
        }
        public Cars GetCarsByCarsId(int carsId)
        {
            return db.Cars.Where(s => s.CarsId == carsId && s.IsActive && !s.IsDeleted).SingleOrDefault();
        }
        public void InsertOrders(Orders insertOrder)
        {
            db.Orders.Add(insertOrder);
            db.SaveChanges();
        }
        public Dealer GetDealerById(int dealerId)
        {
            return db.Dealer.Where(s => s.DealerId == dealerId && s.IsActive && !s.IsDeleted).SingleOrDefault();
        }
        public AdminUser GetLoginUser(string username, string password)
        {
            return db.AdminUser.Where(s => s.Username == username && s.Password == password && s.IsActive && !s.IsDeleted).SingleOrDefault();
        }
        public void InsertCars(Cars insertCars)
        {
            db.Cars.Add(insertCars);
            db.SaveChanges();
        }
        public void UpdateCarIsActiveStatus(int carsId,bool status)
        {
            var cars= db.Cars.Where(s => s.CarsId == carsId).SingleOrDefault();
            cars.IsActive = status;
            db.SaveChanges();
        }
        public void RemoveCar(int carsId)
        {
            var cars = db.Cars.Where(s => s.CarsId == carsId).SingleOrDefault();
            cars.IsDeleted = true;
            db.SaveChanges();
        }
    }
}