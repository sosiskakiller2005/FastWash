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
    /// Логика взаимодействия для AuthorisationWindow.xaml
    /// </summary>
    public partial class AuthorisationWindow : Window
    {
        public AuthorisationWindow()
        {
            InitializeComponent();
        }

        private void EntryBTn_Click(object sender, RoutedEventArgs e)
        {
            if (AuthorisationHelper.Authorise(NameTb.Text, PasswordTb.Password))
            {
                MenuWindow menuWindow = new MenuWindow();
                menuWindow.Show();
                Close();
            }
        }

        private void ForgotPassHl_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
