//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace angularMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int Id { get; set; }
        public System.DateTime PlaceTime { get; set; }
        public bool Paid { get; set; }
        public string productList { get; set; }
        public double subTotal { get; set; }
        public string UserID { get; set; }
        public string ProductID { get; set; }
    
        public virtual User User { get; set; }
        public virtual Product Product { get; set; }
    }
}
