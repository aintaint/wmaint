using Microsoft.UI.Xaml;
using MUXC = Microsoft.UI.Xaml.Controls;
//using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Microsoft.UI.Xaml.Controls;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace wmaint
{
    /// <summary>
    /// An empty window that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainWindow : Window
    {
        public MainWindow()
        {
            this.InitializeComponent();
            // https://learn.microsoft.com/en-us/windows/apps/develop/title-bar?tabs=winui3#color-and-transparency-in-caption-buttons
            //ExtendsContentIntoTitleBar = true;
        }

        private void fileExp_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Exit();
        }

        private void about_Click(object sender, RoutedEventArgs e)
        {
            DisplayAboutDialog();
        }

        private async void DisplayAboutDialog()
        {
            ContentDialog noWifiDialog = new ContentDialog()
            {
                XamlRoot = rootPanel.XamlRoot,
                Title = "wmaint",
                Content = "wmaint by aintaint v0",
                CloseButtonText = "Ok"
            };

            await noWifiDialog.ShowAsync();
        }
    }
}
