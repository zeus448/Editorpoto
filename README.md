#JALANKAN PERITAH INI DI TERMUX
#KALAU UDAH DICOMOT JANGAN LUPA KASIH BINTANG
#HARGAI KARYA ORANG LAEN
#BY SAMUDRA (lombok nusa tenggara barat)
#🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩🇮🇩#

$ pkg update && pkg upgrade -y
$ pkg install imagemagick -y
$ which convert
$ ./editorfoto.sh

📌 Penting:

Pastikan juga file foto.jpg memang ada di folder tempat kamu menjalankan skrip itu. Kamu bisa pakai:

$ ls | grep foto.jpg

Kalau belum ada, upload gambar dulu ke Termux pakai perintah ini:

$ termux-setup-storage

Lalu pindahkan gambar dari storage/shared/Download ke direktori skrip kamu.
Coding by:SAMUDRA
