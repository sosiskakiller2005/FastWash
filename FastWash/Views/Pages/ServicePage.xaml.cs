using FastWash.Model;
using FastWash.Services;
using FastWash.Views.Windows;
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
        private readonly CartService _cartService = new CartService();
        public ServicePage()
        {
            InitializeComponent();
            ServiceLb.ItemsSource = _context.Service.ToList();
        }

        

        private void ServiceLb_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Service selectedService = ServiceLb.SelectedItem as Service;
            if (selectedService == null) return;

            _cartService.AddService(selectedService);
            RefreshCart();
        }

        private void RemoveBtn_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null) return;

            var cartItem = button.DataContext as CartService.CartItem;
            if (cartItem == null) return;

            _cartService.DecreaseCount(cartItem.Service);
            RefreshCart();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null) return;

            var cartItem = button.DataContext as CartService.CartItem;
            if (cartItem == null) return;

            _cartService.IncreaseCount(cartItem.Service);
            RefreshCart();
        }

        /// <summary>
        /// Метод вычисляет итоговую сумму заказа.
        /// </summary>
        private void RefreshCart()
        {
            OrderLb.ItemsSource = null;
            OrderLb.ItemsSource = _cartService.Items;
            ProcessAmount();
            if (_cartService.Items.Count == 0)
            {
                OrderBtn.Visibility = Visibility.Hidden;
            }
            else
            {
                OrderBtn.Visibility = Visibility.Visible;
            }
        }

        private void ProcessAmount()
        {
            int amount = _cartService.GetTotalAmount();
            AmountTb.Text = "Итого: " + amount.ToString() + " ₽";
        }

        private void OrderBtn_Click(object sender, RoutedEventArgs e)
        {
            AddEditOrderWindow addEditOrderWindow = new AddEditOrderWindow(_cartService);
            addEditOrderWindow.ShowDialog();
        }
    }
}