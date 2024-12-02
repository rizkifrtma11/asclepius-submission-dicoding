FROM node:18

# Menentukan direktori kerja dalam container
WORKDIR /app

# Menyalin seluruh file dari direktori lokal ke dalam container
COPY . .

# Menyalin file kredensial JSON ke dalam container
COPY bucket-mlgc.json .

# Mendefinisikan environment variables menggunakan format yang benar
ENV MODEL_URL="https://storage.googleapis.com/mlgc-submission/model.json"
ENV GOOGLE_APPLICATION_CREDENTIALS="bucket-mlgc.json"

# Instalasi dependensi aplikasi
RUN npm install

# Membuka port 8080 untuk aplikasi
EXPOSE 8080

# Menentukan perintah untuk menjalankan aplikasi
CMD ["npm", "run", "start"]