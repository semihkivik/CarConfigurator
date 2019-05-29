using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleConfigurator.Models
{
    public class PackageListModel
    {
        public List<VehicleFeatures> BodyList { get; set; }

        public List<VehicleFeatures> EngineList { get; set; }

        public List<VehicleFeatures> GearboxList { get; set; }

        public List<VehicleFeatures> ColorList { get; set; }

        public List<VehicleFeatures> FloorList { get; set; }

        public List<VehicleFeatures> OptionList { get; set; }

        public List<CheckboxModel> OptionCheckBoxList { get; set; }

        public int CarId { get; set; }

        public int PackageTypeId { get; set; }


        public int VehicleFeaturesBodyTypeId { get; set; }

        public int VehicleFeaturesEngineTypeId { get; set; }

        public int VehicleFeaturesGearboxTypeId { get; set; }

        public int VehicleFeaturesColorTypeId { get; set; }

        public int VehicleFeaturesFloorTypeId { get; set; }

        public List<int> VehicleFeaturesOptionTypeId { get; set; }
    }
}