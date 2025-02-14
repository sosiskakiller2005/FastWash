using FastWash.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace FastWash
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private static FastWashdbEntities _context;
        public static FastWashdbEntities GetContext()
        {
            if (_context == null)
            {
                _context = new FastWashdbEntities();
            }
            return _context;
        }
    }
}
