//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RouteManagement.DB.Framework
{
    using System;
    using System.Collections.Generic;
    
    public partial class SiteOrderType : ISiteOrderType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SiteOrderType()
        {
            this.Days = new HashSet<Day>();
        }
    
        public int SiteOrderTypeID { get; set; }
        public int RouteSiteID { get; set; }
        public int OrderTypeID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Day> Days { get; set; }
        public virtual OrderType OrderType { get; set; }
        public virtual RouteSite RouteSite { get; set; }
    }
}
