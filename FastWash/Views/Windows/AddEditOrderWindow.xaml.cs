using FastWash.AppData;
using FastWash.Model;
using FastWash.Services;
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
using System.Windows.Shapes;

namespace FastWash.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditOrderWindow.xaml
    /// </summary>
    public partial class AddEditOrderWindow : Window
    {
        private static FastWashdbEntities _context = App.GetContext();
        private bool isNewClient = true;
        private CartService _cartService = new CartService();
        private Client _selectedClient;
        public AddEditOrderWindow(CartService cartService)
        {
            InitializeComponent();
            _cartService = cartService;
            OrderDateTbl.Text = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
            UserTbl.Text = AuthorisationHelper.selectedUser.Name;
            AmountTbl.Text = cartService.GetTotalAmount().ToString("C2");
        }

        private void AddClientBtn_Click(object sender, RoutedEventArgs e)
        {
            ChooseClientWindow chooseClientWindow = new ChooseClientWindow();
            chooseClientWindow.ShowDialog();
            if (chooseClientWindow.DialogResult == true)
            {
                ClientGrid.DataContext = chooseClientWindow.SelectedClient;
                _selectedClient = chooseClientWindow.SelectedClient;
                //NameTb.Text = chooseClientWindow.SelectedClient.Name;
                NameTb.IsReadOnly = true;
                PhoneTb.IsReadOnly = true;
                EmailTb.IsReadOnly = true;
                isNewClient = false;
            }
            else
            {
                isNewClient = true;
            }
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            if (isNewClient)
            {
                Client newClient = new Client()
                {
                    Name = NameTb.Text,
                    Phone = PhoneTb.Text,
                    Email = EmailTb.Text
                };
                _context.Client.Add(newClient);
                _context.SaveChanges();

                Order newOrder = new Order()
                {
                    Client = newClient,
                    User = AuthorisationHelper.selectedUser,
                    Date = DateTime.Now,
                    Adress = AdressTb.Text,
                    Amount = _cartService.GetTotalAmount(),
                };
                _context.Order.Add(newOrder);
                _context.SaveChanges();

                foreach (var cartItem in _cartService.Items)
                {
                    OrderService orderService = new OrderService()
                    {
                        Order = newOrder,
                        Service = cartItem.Service,
                        Quantity = cartItem.Count
                    };
                    _context.OrderService.Add(orderService);
                }
                _context.SaveChanges();

                MessageBoxHelper.Information("Заказ успешно добавлен!");
                DialogResult = true;
            }
            else
            {
                Order newOrder = new Order()
                {
                    Client = _selectedClient,
                    User = AuthorisationHelper.selectedUser,
                    Date = DateTime.Now,
                    Adress = AdressTb.Text,
                    Amount = _cartService.GetTotalAmount(),
                };
                _context.Order.Add(newOrder);
                _context.SaveChanges();

                foreach (var cartItem in _cartService.Items)
                {
                    OrderService orderService = new OrderService()
                    {
                        Order = newOrder,
                        Service = cartItem.Service,
                        Quantity  = cartItem.Count
                    };
                    _context.OrderService.Add(orderService);
                }
                _context.SaveChanges();

                MessageBoxHelper.Information("Заказ успешно добавлен!");
                DialogResult = true;
            }
            //else
            //{
            //    Order newOrder = new Order()
            //    {
            //        Client = _selectedClient,
            //        User = AuthorisationHelper.selectedUser,
            //        Date = DateTime.Now,
            //        Amount = _cartService.GetTotalAmount(),
            //    };
            //    _context.Order.Add(newOrder);
            //    _context.SaveChanges();
            //    MessageBoxHelper.Information("Заказ успешно добавлен!");
            //    DialogResult = true;
            //}
        }
    }
}
