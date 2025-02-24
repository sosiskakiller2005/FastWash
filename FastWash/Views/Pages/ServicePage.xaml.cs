using FastWash.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FastWash.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServicePage.xaml
    /// </summary>
    public partial class ServicePage : Page
    {
        private static FastWashdbEntities _context = App.GetContext();
        List<CartItem> Cart = new List<CartItem>();
        public ServicePage()
        {
            InitializeComponent();
            ServiceLb.ItemsSource = _context.Service.ToList();
        }

        

        private void ServiceLb_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Service selectedService = ServiceLb.SelectedItem as Service;
            if (selectedService == null) return;

            CartItem selectedCartItem = Cart.FirstOrDefault(ci => ci.Service.Id == selectedService.Id);
            if (selectedCartItem != null)
            {
                selectedCartItem.Count++;
            }
            else
            {
                CartItem newCartItem = new CartItem()
                {
                    Service = selectedService,
                    Count = 1
                };
                Cart.Add(newCartItem);
            }
            OrderLb.ItemsSource = null;
            OrderLb.ItemsSource = Cart;

            ProcessAmount();
        }

        private void RemoveBtn_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null) return;

            CartItem cartItem = button.DataContext as CartItem;
            if (cartItem == null) return;

            if (cartItem.Count > 1)
            {
                cartItem.Count--;
            }
            else
            {
                Cart.Remove(cartItem);
            }

            OrderLb.ItemsSource = null;
            OrderLb.ItemsSource = Cart;
            ProcessAmount();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null) return;

            CartItem cartItem = button.DataContext as CartItem;
            if (cartItem == null) return;

            cartItem.Count++;
            OrderLb.ItemsSource = null;
            OrderLb.ItemsSource = Cart;

            ProcessAmount();
        }

        /// <summary>
        /// Метод вычисляет итоговую сумму заказа.
        /// </summary>
        private void ProcessAmount()
        {
            int Amount = 0;
            foreach (CartItem cartItem in Cart) 
            {
                Amount += (int)(cartItem.Service.Cost * cartItem.Count);
            }
            AmountTb.Text = "Итого: " + Amount.ToString() + " ₽";
        }

        /// <summary>
        /// Класс, описывающий элемент корзины.
        /// </summary>
        public class CartItem
        {
            public Service Service { get; set; }
            public int Count { get; set; }
        }
    }
}