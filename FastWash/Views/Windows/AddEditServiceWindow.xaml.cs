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
    /// Логика взаимодействия для AddEditServiceWindow.xaml
    /// </summary>
    public partial class AddEditServiceWindow : Window
    {
        private static FastWashdbEntities _context = App.GetContext();
        private Service _selectedService;
        public AddEditServiceWindow(Service selectedService)
        {
            InitializeComponent();
            _selectedService = selectedService;
            ServiceGrid.DataContext = selectedService;
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(NameTb.Text) && !string.IsNullOrEmpty(DaysTb.Text) && !string.IsNullOrEmpty(CostTb.Text))
            {
                _selectedService.Name = NameTb.Text;
                _selectedService.Days = int.Parse(DaysTb.Text);
                _selectedService.Cost = int.Parse(CostTb.Text);
                _context.SaveChanges();
                MessageBoxHelper.Information("Услуга успешно изменена.");
                DialogResult = true;
            }
            else
            {
                MessageBoxHelper.Error("Пожалуйста, заполните все поля.");
            }
        }
    }
}
