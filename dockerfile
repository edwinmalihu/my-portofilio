# Tahap 1: Gunakan base image Nginx yang sangat ringan dari Alpine Linux.
# Ini memastikan image Docker yang dihasilkan kecil dan efisien.
FROM nginx:alpine

# Tentukan direktori kerja di dalam container, yaitu web root default Nginx.
WORKDIR /usr/share/nginx/html

# Salin file aplikasi utama Anda.
COPY index.html .

# (Opsional) Memberi tahu Docker bahwa container akan berjalan di port 80,
# yang merupakan port default untuk Nginx.
EXPOSE 80

# Perintah untuk menjalankan server Nginx saat container dimulai.
# Opsi '-g "daemon off;"' memastikan Nginx berjalan di foreground,
# yang merupakan praktik terbaik untuk container.
CMD ["nginx", "-g", "daemon off;"]
