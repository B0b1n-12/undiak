import subprocess
import os

# Cesta k tvému skriptu - uprav podle potřeby
bash_script_path = r"C:/Users/orsia/OneDrive/Documents/Programing/C++/Convert_to_cj/run.sh"

def run_with_wsl(script_path):
    # Převod Windows cesty na Linuxovou pro WSL
    wsl_path = "/mnt/" + script_path[0].lower() + script_path[2:].replace("\\", "/").replace("C:", "").replace("c:", "")
    wsl_path = wsl_path.replace(":", "")
    try:
        subprocess.run(["wsl", "bash", wsl_path], check=True)
        return True
    except FileNotFoundError:
        return False
    except subprocess.CalledProcessError as e:
        print(f"Chyba při spouštění skriptu ve WSL: {e}")
        return True

def run_with_git_bash(script_path):
    # Zkus spustit přes Git Bash - uprav cestu podle instalace Git Bashu
    git_bash_path = r"C:\Program Files\Git\bin\bash.exe"
    if not os.path.exists(git_bash_path):
        print("Git Bash nebyl nalezen na předpokládané cestě.")
        return False
    try:
        subprocess.run([git_bash_path, script_path], check=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Chyba při spouštění skriptu v Git Bash: {e}")
        return True

def main():
    print("Zkouším spustit skript přes WSL...")
    if run_with_wsl(bash_script_path):
        print("Skript byl spuštěn ve WSL.")
        return
    print("WSL není dostupný, zkouším Git Bash...")
    if run_with_git_bash(bash_script_path):
        print("Skript byl spuštěn v Git Bash.")
        return
    print("Nepodařilo se spustit Bash skript. Nainstaluj WSL nebo Git Bash.")

if __name__ == "__main__":
    main()
