
# TodoList SQLite

![TodoList SQLite](https://img.shields.io/badge/Flutter-Framework-blue?style=flat-square&logo=flutter)
![SQLite](https://img.shields.io/badge/SQLite-Database-blue?style=flat-square&logo=sqlite)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

**TodoList SQLite** adalah aplikasi manajemen tugas berbasis Flutter yang memanfaatkan SQLite sebagai database lokal untuk penyimpanan data. Proyek ini merupakan bagian dari tugas akademik oleh **Fatwa Reksa Aji Pradana (NIM: A11202214393)**.

---

## 📜 Fitur Utama

- **Manajemen Tugas yang Mudah**: Tambahkan, edit, dan hapus tugas Anda dengan antarmuka yang intuitif.
- **Undo Penghapusan**: Batalkan penghapusan tugas secara langsung.
- **Dark Mode dengan Glassmorphism**: Antarmuka yang modern dengan tema gelap dan efek kaca.
- **Database Lokal dengan SQLite**: Penyimpanan data tugas di perangkat tanpa membutuhkan koneksi internet.
- **Desain Responsif**: Dapat digunakan di berbagai perangkat.

---

## 🛠️ Teknologi yang Digunakan

- **Flutter**: Framework utama untuk pengembangan antarmuka.
- **Dart**: Bahasa pemrograman yang digunakan dalam Flutter.
- **SQLite**: Database lokal untuk menyimpan data tugas.
- **Google Fonts**: Untuk penggunaan font yang estetis.

---

## 📂 Struktur Proyek

```plaintext
todolist_sqlite/
├── android/                # Konfigurasi proyek Android
├── ios/                    # Konfigurasi proyek iOS
├── lib/                    # Sumber kode aplikasi Flutter
│   ├── helpers/            # Logika database lokal (SQLite)
│   ├── models/             # Definisi model data (Todo)
│   ├── screens/            # Halaman utama aplikasi (LandingPage, TodoPage)
│   ├── widgets/            # Widget yang dapat digunakan ulang (TodoForm, TodoListItem)
│   └── main.dart           # Entry point aplikasi
├── pubspec.yaml            # Konfigurasi dependencies
└── README.md               # Dokumentasi proyek
```

---

## 🚀 Cara Menjalankan Proyek

### 1. Kloning Repositori
Kloning repositori ini ke komputer lokal Anda menggunakan perintah berikut:
```bash
git clone https://github.com/Hessaajipradana/todosqlite.git
cd todosqlite
```

### 2. Instal Dependencies
Pastikan Anda telah menginstal **Flutter SDK**. Kemudian jalankan perintah berikut untuk menginstal semua dependencies yang diperlukan:
```bash
flutter pub get
```

### 3. Konfigurasi SQLite
Tidak ada konfigurasi khusus yang diperlukan untuk SQLite karena menggunakan database lokal. Pastikan aplikasi dapat mengakses penyimpanan perangkat.

### 4. Jalankan Aplikasi
Jalankan aplikasi di emulator atau perangkat fisik dengan perintah:
```bash
flutter run
```

---

## 🎨 Tangkapan Layar

### Halaman Landing
![Landing Page](https://via.placeholder.com/800x400?text=Landing+Page)

### Halaman Todo
![Todo Page](https://via.placeholder.com/800x400?text=Todo+Page)

---

## 🧑‍💻 Pengembang

Proyek ini dikembangkan oleh:

- **Fatwa Reksa Aji Pradana**  
  - **NIM**: A11202214393  
  - **Email**: [ajipradana5256@gmail.com](mailto:ajipradana5256@gmail.com)  
  - **GitHub**: [Hessaajipradana](https://github.com/Hessaajipradana)

---

## 🌟 Kontribusi

Kontribusi sangat dihargai! Silakan buat pull request atau diskusikan di [issues](https://github.com/Hessaajipradana/todosqlite/issues).

---

## 🔗 Referensi

- [Flutter Documentation](https://docs.flutter.dev/)
- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [Google Fonts](https://fonts.google.com/)
