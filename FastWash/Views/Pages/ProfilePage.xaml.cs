using FastWash.AppData;
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
    /// Логика взаимодействия для ProfilePage.xaml
    /// </summary>
    public partial class ProfilePage : Page
    {
        private User selectedUser = AuthorisationHelper.selectedUser;
        private static FastWashdbEntities _context = App.GetContext();
        public ProfilePage()
        {
            InitializeComponent();
            ProfileGrid.DataContext = selectedUser;  
            RoleCmb.ItemsSource = _context.Role.ToList();
            RoleCmb.DisplayMemberPath = "Name";
            RoleCmb.SelectedItem = selectedUser.Role;
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            selectedUser.Name = NameTb.Text;
            selectedUser.Role = RoleCmb.SelectedItem as Role;
            selectedUser.Phone = PhoneTb.Text;
            selectedUser.Email = EmailTb.Text;
            selectedUser.Password = PasswordTb.Text;
            _context.SaveChanges();
            MessageBoxHelper.Information("Изменения профиля сохранены.");
        }
    }
}
