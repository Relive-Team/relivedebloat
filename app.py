import os
import subprocess
import platform
import ctypes
import threading
import time
import tkinter as tk
from tkinter import ttk

SW_SHOWMINNOACTIVE = 7  # minimalizacja okna w pasku zadań

def get_windows_version():
    try:
        version = platform.version()
        build = int(version.split('.')[-1])
        return "Windows 11" if build >= 22000 else "Windows 10"
    except Exception:
        return "Nieznany"

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def run_as_admin():
    """Ponownie uruchamia program jako administrator"""
    params = " ".join([f'"{arg}"' for arg in os.sys.argv])
    ctypes.windll.shell32.ShellExecuteW(None, "runas", os.sys.executable, params, None, 1)
    os._exit(0)

def run_bat_minimized(bat_path, update_status):
    """Uruchamia BAT minimalizowany i czeka aż zakończy"""
    update_status("Usuwanie niepotrzebnych funkcji...")
    si = subprocess.STARTUPINFO()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    si.wShowWindow = SW_SHOWMINNOACTIVE
    proc = subprocess.Popen(
        ["cmd.exe", "/c", bat_path],
        cwd=os.path.dirname(bat_path),
        startupinfo=si
    )
    proc.wait()
    update_status("Proces usuwania niepotrzebnych funkcji zakończony.")

def run_ps1_minimized(ps1_path, update_status):
    """Uruchamia PS1 minimalizowany i czeka aż zakończy"""
    update_status("Jeszcze szlify...")
    si = subprocess.STARTUPINFO()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    si.wShowWindow = SW_SHOWMINNOACTIVE
    proc = subprocess.Popen(
        ["powershell", "-ExecutionPolicy", "Bypass", "-File", ps1_path],
        cwd=os.path.dirname(ps1_path),
        startupinfo=si
    )
    proc.wait()
    update_status("Proces dokończenia szlifów zakończony.")

def debloat_sequence(win_version, status_label):
    base_dir = os.path.dirname(os.path.abspath(__file__))

    if win_version == "Windows 10":
        bat_path = os.path.join(base_dir, "10", "debloat.bat")
        ps1_path = os.path.join(base_dir, "10", "Win11Debloat.ps1")
    else:
        bat_path = os.path.join(base_dir, "11", "debloat.bat")
        ps1_path = os.path.join(base_dir, "11", "Win11Debloat.ps1")

    def update_status(text):
        status_label.config(text=text)
        status_label.update_idletasks()

    if not os.path.exists(bat_path):
        update_status(f"Nie znaleziono BAT: {bat_path}")
        return

    run_bat_minimized(bat_path, update_status)
    time.sleep(1)

    if not os.path.exists(ps1_path):
        update_status(f"Nie znaleziono PS1: {ps1_path}")
        return

    run_ps1_minimized(ps1_path, update_status)
    time.sleep(1)

    update_status("Wszystkie procesy zostały zakończone. Restart systemu za 5 sekund...")
    time.sleep(5)
    subprocess.run(["shutdown", "/r", "/t", "0"])

def main():
    if not is_admin():
        run_as_admin()

    win_version = get_windows_version()


    root = tk.Tk()
    root.title("Relive Debloat")
    root.geometry("550x350")
    root.resizable(False, False)
    root.configure(bg="#F0F0F0")
    # Ustaw ikonę aplikacji (plik app.ico musi być w tym samym folderze co app.py)
    try:
        root.iconbitmap(os.path.join(os.path.dirname(os.path.abspath(__file__)), "app.ico"))
    except Exception as e:
        pass  # Jeśli nie znajdzie pliku, nie wyświetli błędu

    tk.Label(root, text="Wykryto system:", font=("Segoe UI", 14, "bold"), bg="#F0F0F0").pack(pady=(20,5))
    tk.Label(root, text=win_version, font=("Segoe UI", 14), fg="#0078D7", bg="#F0F0F0").pack(pady=(0,15))

    status_label = tk.Label(root, text="Kliknij przycisk, aby rozpocząć debloat.", font=("Segoe UI", 12), bg="#F0F0F0")
    status_label.pack(pady=(0,20))

    status_label = tk.Label(root, text="Zapoznaj się z README na naszej stronie zanim rozpoczniesz instalacje", font=("Segoe UI", 12), bg="#F0F0F0")
    status_label.pack(pady=(0,20))

    progress = ttk.Progressbar(root, orient="horizontal", length=400, mode="indeterminate")
    progress.pack(pady=(0,20))

    def start_debloat():
        progress.start()
        threading.Thread(target=lambda: [debloat_sequence(win_version, status_label), progress.stop()], daemon=True).start()

    tk.Button(root, text="Uruchom", font=("Segoe UI", 12, "bold"), bg="#0078D7", fg="white",
              activebackground="#005A9E", activeforeground="white", relief="flat",
              width=20, height=2, command=start_debloat).pack(pady=(0,10))

    root.mainloop()

if __name__ == "__main__":
    main()
