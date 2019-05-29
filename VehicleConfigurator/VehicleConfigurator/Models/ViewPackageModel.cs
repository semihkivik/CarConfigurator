using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleConfigurator.Models
{
    public class ViewPackageModel
    {

        public List<int> VehicleFeaturesOptionTypeIdList { get; set; }

        public VehicleFeatures SelectedBodyValue { get; set; }

        public VehicleFeatures SelectedEngineValue { get; set; }

        public VehicleFeatures SelectedGearboxValue { get; set; }

        public VehicleFeatures SelectedColorValue { get; set; }

        public VehicleFeatures SelectedFloorValue { get; set; }

        public Cars Car { get; set; }

        public List<VehicleFeatures> SelectedOptionsList { get; set; }

        public int TotalPrice { get; set; }

        public int PackageTypeId { get; set; }
    }
}