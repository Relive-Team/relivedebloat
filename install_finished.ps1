Add-Type -AssemblyName PresentationFramework

# Tworzenie okna
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Instalacja" Height="150" Width="300" WindowStartupLocation="CenterScreen" ResizeMode="NoResize" WindowStyle="None" Topmost="True">
    <Grid Background="#FFFAFAFA">
        <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
            <TextBlock Name="MainText" Text="Instalacja zakończona" FontSize="18" FontWeight="Bold" HorizontalAlignment="Center" Margin="0,10,0,5"/>
            <TextBlock Name="CountdownText" Text="Ta wiadomość zniknie za 10 sekund" FontSize="12" HorizontalAlignment="Center"/>
        </StackPanel>
    </Grid>
</Window>
"@

# Ładowanie XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Pobranie referencji do kontrolek
$CountdownText = $window.FindName("CountdownText")

# Timer do odliczania
$timer = New-Object System.Windows.Threading.DispatcherTimer
$timer.Interval = [TimeSpan]::FromSeconds(1)
$secondsLeft = 10

$timer.Add_Tick({
    $secondsLeft--
    $CountdownText.Text = "Ta wiadomość zniknie za $secondsLeft sekund"
    if ($secondsLeft -le 0) {
        $timer.Stop()
        $window.Close()
    }
})

$timer.Start()
$window.ShowDialog()
