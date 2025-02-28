using FastWash.AppData;
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
    /// Логика взаимодействия для NewPasswordWindow.xaml
    /// </summary>
    public partial class NewPasswordWindow : Window
    {
        public NewPasswordWindow()
        {
            InitializeComponent();
        }

        private void EntryBTn_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxHelper.Information("Пароль успешно изменен");
            AuthorisationWindow authorisationWindow = new AuthorisationWindow();
            authorisationWindow.Show();
            Close();
        }
    }
}
