using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleConfigurator.Helper
{
  
    public enum PackageTypeList:int
    {
        Standart=0,
        Special=1
    }

    public enum VehicleFeaturesTypeList:int
    {
        BodyList=1,  
        EngineList=2,    
        GearboxList=3, 
        ColorList=4,
        FloorList=5,  
        OptionList=6 
    }
}