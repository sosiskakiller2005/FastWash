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
using System.Windows.Shapes;

namespace FastWash.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для ChooseClientWindow.xaml
    /// </summary>
    public partial class ChooseClientWindow : Window
    {
        private static FastWashdbEntities _context = App.GetContext();
        public Client SelectedClient { get; set; }
        public ChooseClientWindow()
        {
            InitializeComponent();
            ClientsLv.ItemsSource = _context.Client.ToList();
        }

        private void ClientsLv_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            SelectedClient = ClientsLv.SelectedItem as Client;
            DialogResult = true;
        }
    }
}
