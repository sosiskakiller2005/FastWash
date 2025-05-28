// FastWash/Services/CartService.cs
using System.Collections.Generic;
using System.Linq;
using FastWash.Model;

namespace FastWash.Services
{
    public class CartService
    {
        public class CartItem
        {
            public Service Service { get; set; }
            public int Count { get; set; }
        }

        private readonly List<CartItem> _cart = new List<CartItem>();

        public IReadOnlyList<CartItem> Items => _cart.AsReadOnly();

        public void AddService(Service service)
        {
            var item = _cart.FirstOrDefault(ci => ci.Service.Id == service.Id);
            if (item != null)
                item.Count++;
            else
                _cart.Add(new CartItem { Service = service, Count = 1 });
        }

        public void RemoveService(Service service)
        {
            var item = _cart.FirstOrDefault(ci => ci.Service.Id == service.Id);
            if (item == null) return;
            if (item.Count > 1)
                item.Count--;
            else
                _cart.Remove(item);
        }

        public void IncreaseCount(Service service)
        {
            var item = _cart.FirstOrDefault(ci => ci.Service.Id == service.Id);
            if (item != null)
                item.Count++;
        }

        public void DecreaseCount(Service service)
        {
            RemoveService(service);
        }

        public int GetTotalAmount()
        {
            return _cart.Sum(ci => (ci.Service.Cost ?? 0) * ci.Count);
        }

        public void Clear()
        {
            _cart.Clear();
        }
    }
}
