# Airgeddon Installer

## Instalasi

```bash
curl -fsSL https://raw.githubusercontent.com/fixploit03/wireless-tools/main/instal.sh | sudo bash
```

## Konfigurasi

### Konfigurasi untuk CLI (Non-GUI)

```bash
nano /usr/share/airgeddon/.airgeddonrc
```

Ubah:

```bash
AIRGEDDON_WINDOWS_HANDLING=xtem
```

Jadi:

```bash
AIRGEDDON_WINDOWS_HANDLING=tmux
```

### Mengaktifkan Plugin Multi Interface

```bash
cp multint.sh /usr/share/airgeddon/plugins/
```
