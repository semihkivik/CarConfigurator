﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VehicleConfigurator
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VehicleConfiguratorEntities : DbContext
    {
        public VehicleConfiguratorEntities()
            : base("name=VehicleConfiguratorEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AdminUser> AdminUser { get; set; }
        public virtual DbSet<Cars> Cars { get; set; }
        public virtual DbSet<Dealer> Dealer { get; set; }
        public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<VehicleFeatures> VehicleFeatures { get; set; }
        public virtual DbSet<VehicleFeaturesType> VehicleFeaturesType { get; set; }
    }
}
