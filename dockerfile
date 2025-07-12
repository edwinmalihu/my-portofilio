# Gunakan image Nginx resmi sebagai base image
FROM nginx:alpine

# Hapus file konfigurasi default Nginx
# Ini opsional, tapi baik untuk memastikan tidak ada konfigurasi yang tidak diinginkan
RUN rm /etc/nginx/conf.d/default.conf

# Salin file konfigurasi Nginx kustom Anda
# Ini akan mengarahkan Nginx untuk melayani file statis dari direktori yang benar
COPY nginx.conf /etc/nginx/conf.d/

# Salin semua file statis (HTML, CSS, JS) dari direktori lokal ke direktori web root Nginx
# Pastikan semua file portofolio Anda (index.html, style.css, script.js, dll.)
# berada di direktori yang sama dengan Dockerfile ini, atau sesuaikan path-nya.
COPY . /usr/share/nginx/html

# Ekspos port 80, yang merupakan port default Nginx
EXPOSE 80

# Perintah default untuk menjalankan Nginx saat container dimulai
CMD ["nginx", "-g", "daemon off;"]
