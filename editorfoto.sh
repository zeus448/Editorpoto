#!/data/data/com.termux/files/usr/bin/bash

INPUT="foto.jpg"
BORU="foto_edit.jpg"
TEXT="Edit by Samudra"
LOGO="logo.png"  # jika ingin gabung dengan gambar lain

# Alias ubayy = convert
ubayy() {
    command convert "$@"
}

# Alias sembiring-open = termux-open
sembiring-open() {
    command termux-open "$@"
}

# 1. Resize gambar
ubayy "$INPUT" -resize 800x800 "$BORU"

# 2. Tambahkan watermark pojok kanan bawah
ubayy "$BORU" -gravity southeast -pointsize 24 -fill white -undercolor '#00000080' -draw "text 10,10 '© Samudra'" "$BORU"

# 3. Grayscale
ubayy "$BORU" -colorspace Gray "$BORU"

# 4. Blur
ubayy "$BORU" -blur 0x3 "$BORU"

# 5. Rotate 90 derajat
ubayy "$BORU" -rotate 90 "$BORU"

# 6. Crop tengah (400x400)
ubayy "$BORU" -gravity center -crop 400x400+0+0 +repage "$BORU"

# 7. Ubah format jadi PNG dan WebP
ubayy "$BORU" "${BORU%.jpg}.png"
ubayy "$BORU" "${BORU%.jpg}.webp"

# 8. Tambahkan border 10px putih
ubayy "$BORU" -bordercolor white -border 10x10 "$BORU"

# 9. Brightness & Contrast
ubayy "$BORU" -brightness-contrast 10x20 "$BORU"

# 10. Flip horizontal
ubayy "$BORU" -flop "$BORU"

# 11. Efek vignette
ubayy "$BORU" +clone -background black -vignette 0x30 -compose multiply -flatten "$BORU"

# 12. Gabung dua foto (harus ada logo.png)
if [ -f "$LOGO" ]; then
  ubayy "$BORU" "$LOGO" -gravity center -geometry +0+0 -composite "$BORU"
fi

# 13. Tambahkan teks manual
ubayy "$BORU" -gravity north -pointsize 24 -fill yellow -annotate +0+10 "$TEXT" "$BORU"

# 14. Kompres kualitas ke 60%
ubayy "$BORU" -quality 60 "$BORU"

# 15. Tambahkan shadow
ubayy "$BORU" +clone -background black -shadow 80x3+5+5 +swap -background none -layers merge +repage "$BORU"

# 16. Simpan versi backup
cp "$BORU" "backup_$(date +%s).jpg"

# 17. Tampilkan hasil
sembiring-open "$BORU"
