#!/bin/bash
#
# Script Bash untuk menginstal airgeddon di Linux Ubuntu/Debian
# Dibuat oleh: Rofi (Fixploit03)

# cek root
cek_root(){
	if [[ $EUID -ne 0 ]]; then
		echo "ERROR: Script ini harus dijalankan sebagai root!"
		exit 1
	fi
}

# konfirmasi instalasi
konfirmasi_instalasi(){
	while true; do
		read -r -p "Apakah Anda ingin menginstal airgeddon? [Y/n] " konfirmasi
		case "${konfirmasi}" in
			""|[yY])
				break
				;;
			[nN])
				echo "Proses instalasi dibatalkan."
				exit 0
				;;
			*)
				echo "ERROR: Masukkan tidak valid. Harap masukkan 'Y/n'!"
				;;
		esac
	done
}

# cek koneksi 
cek_koneksi_internet(){
	if ! ping -c 1 -W 2 8.8.8.8 &>/dev/null; then
		echo "ERROR: Tidak ada koneksi internet!"
		exit 1
	fi
}

instal_airgeddon(){
	# update repositori
	apt update -y
	# instal tools yang ada di repositori
	apt install -y iw gawk aircrack-ng xterm tmux iproute2 pciutils procps bettercap ettercap-text-only dnsmasq hcxtools bully nftables pixiewps hashcat hashcat-data hostapd tcpdump ettercap-common tshark mdk4 reaver hcxdumptool crunch lighttpd openssl curl git

	# kloning repositori
	git clone https://github.com/fixploit03/Airgeddon-Installer
	cd Airgeddon-Installer

	# instal tools yang ga ada di repositori
	#
	# instal hostapd-mana
	dpkg -i hostapd-mana_2.6.5+git20200121-0parrot1_amd64.deb
	apt install -y -f

	# instal hostapd-wpe
	dpkg -i libunsafessl1.0.2_1.0.2u-0kali2_amd64.deb
	dpkg -i hostapd-wpe_2.10+git20220310-0parrot2_amd64.deb
	apt install -y -f

	# instal beef-xss
	dpkg -i beef-xss_0.6.0.0-0parrot2_amd64.deb
	apt install -y -f

	# instal isc-dhcp-server
	dpkg -i isc-dhcp-server_4.4.3-P1-8_amd64.deb
	apt install -y -f

	# instal asleap
	dpkg -i asleap_2.3~git20201128.254acab-0parrot1_amd64.deb
	apt install -y -f

	# instal john
	dpkg -i john-data_1.9.0-Jumbo-1+git20211102-0parrot1_all.deb
	dpkg -i john_1.9.0-Jumbo-1+git20211102-0parrot1_amd64.deb
	apt install -y -f

	# kloning airgeddon
	git clone https://github.com/v1s1t0r1sh3r3/airgeddon /usr/share/airgeddon

	# salin wrapper airgeddon
	cp airgeddon /usr/local/bin
	cd -

	echo "[+] airgeddon berhasil diinstal!"
	exit 0
}

cek_root
konfirmasi_instalasi
cek_koneksi_internet
instal_airgeddon
