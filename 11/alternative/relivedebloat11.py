import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import requests, tempfile, subprocess, os, threading
from io import BytesIO

# ====== Linki ======
BROWSERS = {
    "Firefox": {
        "url": "https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl",
        "icon": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/250px-Firefox_logo%2C_2019.svg.png"
    },
    "Chrome": {
        "url": "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B58C50035-B170-9451-AB0A-4095A732D74F%7D%26lang%3Dpl%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe",
        "icon": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/1200px-Google_Chrome_icon_%28February_2022%29.svg.png"
    },
    "Brave": {
        "url": "https://referrals.brave.com/latest/BraveBrowserSetup-BRV010.exe",
        "icon": "https://dl.flathub.org/media/com/brave/Browser/f0f6ccb7c5dc55669c3a15c106814781/icons/128x128@2/com.brave.Browser.png"
    },
    "Opera GX": {
        "url": "https://net.geo.opera.com/opera_gx/stable/windows?utm_source=google",
        "icon": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Opera_GX_Icon.svg/250px-Opera_GX_Icon.svg.png"
    }
}

# ====== Pobieranie pliku ======
def download_file(url, filename):
    try:
        path = os.path.join(tempfile.gettempdir(), filename)
        r = requests.get(url, stream=True)
        with open(path, "wb") as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)
        return path
    except Exception as e:
        messagebox.showerror("Błąd", f"Nie udało się pobrać: {e}")
        return None

# ====== Ikony z przezroczystością ======
def get_image_from_url(url, size=(100, 100)):
    response = requests.get(url)
    img = Image.open(BytesIO(response.content)).convert("RGBA")
    return ImageTk.PhotoImage(img.resize(size, Image.Resampling.LANCZOS))

# ====== Ekran instalacji ======
def show_installation_screen():
    installation_win = tk.Toplevel()
    installation_win.attributes('-fullscreen', True)
    installation_win.configure(bg="black")
    msg = "Trwa instalacja Relive Debloat.\n\nNic nie rób dopóki nie pojawi się komunikat\npytający o restart."
    lbl = tk.Label(installation_win, text=msg, font=("Arial", 36, "bold"), fg="white", bg="black", wraplength=1200, justify="center")
    lbl.pack(expand=True)

    def run_batch():
        debloat_url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat"
        path = download_file(debloat_url, "debloat.bat")
        if path:
            subprocess.run(['cmd.exe', '/c', path])
            installation_win.destroy()

    threading.Thread(target=run_batch).start()

# ====== Instalacja przeglądarki ======
def install_browser_and_debloat(name):
    root.iconify()
    info = BROWSERS[name]
    path = download_file(info["url"], f"{name}_installer.exe")
    if path:
        subprocess.Popen([path], shell=True)
    show_installation_screen()

# ====== Pominięcie instalacji przeglądarki ======
def skip_browser_install():
    root.iconify()
    show_installation_screen()

# ====== GUI główne ======
root = tk.Tk()
root.title("Relive Debloat 10")
root.configure(bg="black")
root.geometry("800x600")
root.resizable(False, False)

title = tk.Label(root, text="Wybierz przeglądarkę", font=("Arial", 28, "bold"), fg="white", bg="black")
title.pack(pady=30)

frame = tk.Frame(root, bg="black")
frame.pack()

def on_enter(e): e.widget.configure(bg="#222222")
def on_leave(e): e.widget.configure(bg="black")

def create_icon_button(parent, name, icon_url):
    tk_img = get_image_from_url(icon_url)
    btn = tk.Button(parent, image=tk_img, bg="black", bd=0, command=lambda: install_browser_and_debloat(name), activebackground="#222222")
    btn.image = tk_img
    btn.grid(row=0, column=len(icon_buttons), padx=10, pady=10)
    btn.bind("<Enter>", on_enter)
    btn.bind("<Leave>", on_leave)
    lbl = tk.Label(parent, text=name, fg="white", bg="black", font=("Arial", 14))
    lbl.grid(row=1, column=len(icon_buttons))
    icon_buttons.append(btn)

icon_buttons = []
for browser_name, data in BROWSERS.items():
    create_icon_button(frame, browser_name, data["icon"])

# ====== Przycisk "Pomiń" ======
skip_btn = tk.Button(root, text="Pomiń", font=("Arial", 18), command=skip_browser_install, fg="white", bg="black", bd=0, padx=20, pady=10, activebackground="#cccccc")
skip_btn.bind("<Enter>", on_enter)
skip_btn.bind("<Leave>", on_leave)
skip_btn.pack(pady=40)

root.mainloop()
