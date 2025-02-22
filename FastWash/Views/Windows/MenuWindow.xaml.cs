using FastWash.AppData;
using FastWash.Views.Pages;
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
    /// Логика взаимодействия для MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
            FrameHelper.selectedFrame = MainFrame;
            MainFrame.Navigate(new ServicePage());
        }

        private void ServiceBtn_Click(object sender, RoutedEventArgs e)
        {
            FrameHelper.selectedFrame.Navigate(new ServicePage());
        }

        private void MyOrdersBTn_Click(object sender, RoutedEventArgs e)
        {
            FrameHelper.selectedFrame.Navigate(new MyOrdersPage());
        }

        private void ProfileBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
