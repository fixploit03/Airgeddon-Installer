# Airgeddon Installer

![](https://github.com/fixploit03/Airgeddon-Installer/blob/main/airgeddon.png)

## Instalasi

```bash
git clone https://github.com/fixploit03/Airgeddon-Installer.git
cd Airgeddon-Installer
./instal.sh
```

## Konfigurasi

### Konfigurasi untuk CLI (Non-GUI)

```bash
sudo nano /usr/share/airgeddon/.airgeddonrc
```

Ubah:

```bash
AIRGEDDON_WINDOWS_HANDLING=xterm
```

Jadi:

```bash
AIRGEDDON_WINDOWS_HANDLING=tmux
```

### Mengaktifkan Plugin Multi Interface

```bash
sudo cp multint.sh /usr/share/airgeddon/plugins/
```
