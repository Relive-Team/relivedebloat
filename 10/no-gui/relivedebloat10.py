import os
import subprocess
import requests

def main_menu():
    os.system("cls")
    print("=============================")
    print("   Wybierz przegladarke: (wpisz numer)")
    print("=============================")
    print("[0] Pomin przegladarke")
    print("[1] Firefox")
    print("[2] Google Chrome (wkrotce)")
    print("[3] Brave")
    print("[4] Opera GX (nie polecamy)")
    print("[5] Wyjscie")
    print("=============================")
    print("UWAGA! Beda wyskakiwac rozne programy i bedzie migac ekran")

    choice = input("Twoj wybor: ")

    if choice == "0":
        debloat()
    elif choice == "1":
        firefox()
    elif choice == "2":
        chrome()
    elif choice == "3":
        brave()
    elif choice == "4":
        operagx()
    elif choice == "5":
        exit()
    else:
        print("Nieprawidlowy wybor, sprobuj ponownie.")
        input("Press Enter to continue...")
        main_menu()

def firefox():
    print("Wybrales Firefox.")
    # Pobieranie instalatora Firefoksa
    firefox_url = "https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl"
    firefox_installer = os.path.join(os.getenv('TEMP'), "FirefoxInstaller.exe")
    download_file(firefox_url, firefox_installer)

    # Uruchamianie instalatora
    subprocess.run([firefox_installer], shell=True)
    
    debloat()

def chrome():
    print("Wybrales Google Chrome.")
    # Pobieranie instalatora Google Chrome
    chrome_url = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B58C50035-B170-9451-AB0A-4095A732D74F%7D%26lang%3Dpl%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"
    chrome_installer = os.path.join(os.getenv('TEMP'), "ChromeSetup.exe")
    download_file(chrome_url, chrome_installer)

    # Uruchamianie instalatora
    subprocess.run([chrome_installer], shell=True)
    
    debloat()

def brave():
    print("Wybrales Brave.")
    # Pobieranie instalatora Brave
    brave_url = "https://referrals.brave.com/latest/BraveBrowserSetup-BRV010.exe"
    brave_installer = os.path.join(os.getenv('TEMP'), "BraveInstaller.exe")
    download_file(brave_url, brave_installer)

    # Uruchamianie instalatora
    subprocess.run([brave_installer], shell=True)
    
    debloat()

def operagx():
    print("Wybrales Opera GX.")
    # Pobieranie instalatora Opera GX
    opera_gx_url = "https://net.geo.opera.com/opera_gx/stable/windows?utm_source=google&utm_medium=ose&utm_campaign=%28none%29&http_referrer=https%3A%2F%2Fwww.google.com%2F&utm_site=opera_com&utm_lastpage=opera.com%2Fgx&dl_token=96323432"
    opera_gx_installer = os.path.join(os.getenv('TEMP'), "GXSetup.exe")
    download_file(opera_gx_url, opera_gx_installer)

    # Uruchamianie instalatora
    subprocess.run([opera_gx_installer], shell=True)
    
    debloat()

def debloat():
    # Pobieranie debloatu
    debloat_url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/10/debloat.bat"
    debloat_script = os.path.join(os.getenv('TEMP'), "debloat.bat")
    download_file(debloat_url, debloat_script)

    # Uruchamianie debloatu
    subprocess.run([debloat_script], shell=True)

def download_file(url, file_path):
    response = requests.get(url)
    with open(file_path, "wb") as file:
        file.write(response.content)

if __name__ == "__main__":
    main_menu()
