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
    
    public partial class Service
    {
        public Service()
        {
            this.OrderService = new HashSet<OrderService>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<int> TypeId { get; set; }
        public Nullable<int> Days { get; set; }
        public Nullable<int> Cost { get; set; }
    
        public virtual ICollection<OrderService> OrderService { get; set; }
    }
}
