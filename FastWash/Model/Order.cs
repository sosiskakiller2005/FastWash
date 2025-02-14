//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FastWash.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public Order()
        {
            this.OrderService = new HashSet<OrderService>();
        }
    
        public int Id { get; set; }
        public System.DateTime Date { get; set; }
        public int ClientId { get; set; }
        public int UserId { get; set; }
        public int Amount { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<OrderService> OrderService { get; set; }
    }
}
