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
using System.Windows.Shapes;

namespace FastWash.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для SignUpWindow.xaml
    /// </summary>
    public partial class SignUpWindow : Window
    {
        private static FastWashdbEntities _context = App.GetContext();
        public SignUpWindow()
        {
            InitializeComponent();
        }

        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(LastnameTb.Text) && !string.IsNullOrEmpty(NameTb.Text) && !string.IsNullOrEmpty(PhoneTb.Text) && !string.IsNullOrEmpty(EmailTb.Text) && 
                !string.IsNullOrEmpty(PasswordTb.Password) && !string.IsNullOrEmpty(RepeatPasswordTb.Password))
            {
                if (PasswordTb.Password != RepeatPasswordTb.Password)
                {
                    MessageBoxHelper.Error("Пароли не совпадают", "Ошибка регистрации");
                }
                else
                {
                    User newUser = new User()
                    {
                        Lastname = LastnameTb.Text,
                        Name = NameTb.Text,
                        Phone = PhoneTb.Text,
                        Email = EmailTb.Text,
                        RoleId = 1,
                        Password = PasswordTb.Password
                    };
                    try
                    {
                        _context.User.Add(newUser);
                        _context.SaveChanges();
                        MessageBoxHelper.Information("Регистрация прошла успешно", "Успех");
                        AuthorisationWindow authorisationWindow = new AuthorisationWindow();
                        authorisationWindow.Show();
                        Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBoxHelper.Error($"Произошла ошибка при регистрации: {ex.Message}", "Ошибка регистрации");
                    }
                }
            }
            else
            {
                MessageBoxHelper.Error("Не все поля для ввода заполнены.");
            }
        }

        private void AuthHl_Click(object sender, RoutedEventArgs e)
        {
            AuthorisationWindow authorisationWindow = new AuthorisationWindow();
            authorisationWindow.Show();
            Close();
        }
    }
}
