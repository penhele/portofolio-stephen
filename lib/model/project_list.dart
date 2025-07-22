import 'package:flutter/material.dart';

import '../model/project_model.dart';
import '../utils/constants/image_strings.dart';

final List<ProjectModel> projectList = [
  ProjectModel(
    title: 'Palindrome App',
    description:
        'Aplikasi ini merupakan aplikasi Flutter yang memiliki fitur utama untuk mengecek apakah sebuah kata atau kalimat merupakan palindrom. Selain itu, aplikasi ini juga dilengkapi dengan fitur untuk mengambil nama dari API publik serta fitur penggantian bahasa (multi-language) yang memungkinkan pengguna memilih bahasa sesuai preferensi. Untuk mendukung fungsionalitas dan tampilan aplikasi, digunakan beberapa library populer Flutter seperti get (versi 4.7.2) untuk manajemen state dan navigasi, provider (versi 6.1.5) untuk pengelolaan state berbasis data, serta shared_preferences (versi 2.5.3) untuk menyimpan preferensi pengguna secara lokal, seperti status bahasa. Aplikasi ini juga menggunakan flutter_switch (versi 0.3.2) sebagai switch kustom, iconsax (versi 0.0.8) untuk ikon-ikon modern, lottie (versi 3.3.1) untuk menampilkan animasi menarik, dan awesome_dialog (versi 3.2.1) untuk menampilkan dialog interaktif yang user-friendly. Dengan kombinasi fitur dan library tersebut, aplikasi ini dirancang agar interaktif, informatif, dan mudah digunakan.',
    githubUrl: 'https://github.com/penhele/palindrome_app',
    thumbnail: SImages.palindromeApp,
    duration: 'Jul 2025',
    language: [
      Image.asset(SImages.dart, height: 20),
      Image.asset(SImages.flutter, height: 20),
    ],
  ),
  ProjectModel(
    title: 'Math App',
    description:
        'Math App adalah aplikasi pelatihan operasi matematika dasar (tambah, kurang, bagi, dan kali) yang diperuntukkan untuk anak tingkat Sekolah Dasar (SD). Aplikasi ini dibuat dalam rangka proyek Penulisan Ilmiah (PI).',
    githubUrl: 'https://github.com/penhele/math-application',
    thumbnail: SImages.mathApp,
    duration: 'Jun 2025 — Jul 2025',
    language: [
      Image.asset(SImages.dart, height: 20),
      Image.asset(SImages.flutter, height: 20),
    ],
  ),
  ProjectModel(
    title: 'Story App',
    description:
        'Story App adalah aplikasi mobile yang memungkinkan pengguna untuk mengunggah dan melihat foto melalui koneksi ke API publik. Aplikasi ini mengusung konsep mirip Instagram dengan penambahan beberapa fitur fungsional lainnya.\n\nFitur Utama:\n• Unggah foto dengan informasi lokasi menggunakan integrasi peta (maps).\n• Autentikasi pengguna (login) untuk mengelola akun dan menjaga keamanan data.\n• Pengalih bahasa (language switching) untuk mendukung antarmuka multi-bahasa sesuai preferensi pengguna.',
    githubUrl: 'https://github.com/penhele/math-application',
    thumbnail: SImages.storyApp,
    duration: 'Mar 2025',
    language: [
      Image.asset(SImages.dart, height: 20),
      Image.asset(SImages.flutter, height: 20),
    ],
  ),
  ProjectModel(
    title: 'Restaurant App',
    description:
        'Restaurant App adalah aplikasi mobile yang menampilkan data restoran yang diambil dari API publik. Aplikasi ini dirancang untuk memudahkan pengguna dalam menemukan informasi seputar restoran.\n\nFitur Utama:\n• Mengambil dan menampilkan data restoran secara real-time dari API publik.\n• Shared Preferences untuk menyimpan pengaturan pengguna seperti mode notifikasi atau tema aplikasi.\n• Database lokal SQLite untuk menyimpan data secara offline.\n• Sistem pengingat harian (Daily Reminder) melalui notifikasi untuk meningkatkan keterlibatan pengguna.',
    githubUrl: 'https://github.com/penhele/restaurant_app_favorite',
    thumbnail: SImages.restaurantApp,
    duration: 'Feb 2025',
    language: [
      Image.asset(SImages.dart, height: 20),
      Image.asset(SImages.flutter, height: 20),
    ],
  ),
  ProjectModel(
    title: 'Habit App',
    description:
        'Habit App adalah aplikasi mobile berbasis React Native yang dirancang untuk membantu pengguna membentuk dan mengorganisir kebiasaan (habit) sehari-hari secara lebih terstruktur. Tujuan utama aplikasi ini adalah untuk meningkatkan produktivitas pengguna melalui pengingat dan pencatatan progres kebiasaan.\n\nFitur Utama:\n• Autentikasi pengguna untuk keamanan dan personalisasi data.\n• Menambahkan dan menghapus habit sesuai kebutuhan pengguna.\n• Penyimpanan dan manajemen data menggunakan AppWrite sebagai backend service.\n\nAplikasi ini dikembangkan dengan fokus pada kemudahan penggunaan dan efisiensi dalam membangun kebiasaan positif.',
    githubUrl: 'https://github.com/penhele/habit-app',
    thumbnail: SImages.habitApp,
    duration: 'Jul 2025',
    language: [
      Image.asset(SImages.react, height: 20),
      Image.asset(SImages.expo, height: 20),
    ],
  ),
  ProjectModel(
    title: 'PocketWise',
    description:
        '𝗣𝗼𝗰𝗸𝗲𝘁𝗪𝗶𝘀𝗲 adalah sebuah inovasi berbentuk aplikasi web yang bersifat prediktif dan rekomendatif, dikembangkan dengan teknologi machine learning untuk membantu pengguna dalam mengoptimalkan perencanaan keuangan mereka. Aplikasi ini menganalisis pola pemasukan dan pengeluaran pengguna secara cerdas, memberikan wawasan yang berbasis data, serta merekomendasikan strategi pengelolaan keuangan yang lebih bijak. Dengan pendekatan berbasis kecerdasan buatan, 𝗣𝗼𝗰𝗸𝗲𝘁𝗪𝗶𝘀𝗲 dirancang untuk meningkatkan literasi finansial dan mendorong pengambilan keputusan keuangan yang lebih terarah, terutama bagi generasi muda dan masyarakat umum yang ingin mencapai kestabilan finansial jangka panjang.\n\nAplikasi 𝗣𝗼𝗰𝗸𝗲𝘁𝗪𝗶𝘀𝗲 dilengkapi dengan tiga fitur utama yang dirancang untuk memberikan pengalaman pengelolaan keuangan yang cerdas dan menyeluruh. Pertama, fitur 𝗗𝗮𝘀𝗵𝗯𝗼𝗮𝗿𝗱 memungkinkan pengguna untuk melihat kondisi keuangan mereka secara jelas melalui interactive line chart yang membandingkan pemasukan dan pengeluaran, tampilan saldo real-time, serta donut chart yang menyajikan rasio keuangan secara ringkas. Kedua, fitur 𝗧𝗿𝗮𝗻𝘀𝗮𝗰𝘁𝗶𝗼𝗻 memastikan setiap pengeluaran tercatat dengan mudah dan akurat melalui riwayat transaksi lengkap yang mendukung unggahan struk menggunakan teknologi OCR serta dokumen PDF, sehingga tidak ada detail yang terlewat. Ketiga, fitur 𝗔𝗻𝗮𝗹𝘆𝘀𝗶𝘀 memberikan wawasan cerdas untuk pengeluaran yang lebih bijak dengan memanfaatkan deep learning untuk memprediksi rasio keuangan, meramalkan pengeluaran di masa depan, dan mengklasifikasikan pengguna berdasarkan pola finansial mereka. Fitur ini juga didukung oleh LLM (Large Language Model) yang memberikan insight personal yang relevan dan kontekstual.',
    githubUrl: 'https://github.com/w-ptra/PocketWise/',
    documentUrl:
        'https://www.linkedin.com/posts/stephenhelenus_2ndccc-challenge-team-cc25-cf141-activity-7338104459023028225-GiMS',
    thumbnail: SImages.pocketwiseApp,
    duration: 'Mar 2025 — Jul 2025',
  ),
  ProjectModel(
    title: 'Analisis Sentimen Aplikasi Gojek',
    description:
        'Analisis Sentimen adalah salah satu implementasi dari NLP. Proyek ini bertujuan untuk mengidentifikasi dan mengevaluasi opini, sikap, atau emosi yang terkandung dalam teks. Proyek kali ini menlakukan analisis sentimen terhadap aplikasi Gojek. Model dibuat untuk mengidentifikasi review terhadap aplikasi Gojek apakah negatif, netral, atau positif.\n\nSaya menganalisis sentimen dari ulasan pengguna terhadap aplikasi Gojek menggunakan pendekatan machine learning dan deep learning. Analisis ini membantu memahami persepsi publik terhadap layanan Gojek, yang berguna untuk pengambilan keputusan berbasis data.\n\nSaya menggunakan tiga pendekatan berbeda untuk membandingkan performa model berdasarkan akurasi dan F1-Score. Dataset terdiri dari lebih dari 22.000 data ulasan pengguna yang telah melalui proses praproses dan pelabelan',
    githubUrl: 'https://github.com/penhele/proyek-analisis-sentimen/',
    thumbnail: SImages.analysisSentiment,
    duration: 'Apr 2025',
    language: [
      Image.asset(SImages.python, height: 20),
      Image.asset(SImages.tensorflow, height: 20),
      Image.asset(SImages.sklearn, height: 20),
      Image.asset(SImages.colab, height: 20),
    ],
  ),
  ProjectModel(
    title: 'MoniClass',
    description:
        'MoniClass adalah kamera pendeteksi smartphone di ruang kelas berbasis IoT dan AI. MoniClass diharapkan menjadi solusi ampuh dalam perkembangan kelas di masa yang akan datang demi menciptakan ruang kelas yang kondusif dan siswa tidak gampang terdistraksi oleh smartphone.',
    thumbnail: SImages.moniClass,
    duration: 'Jan 2025 — May 2025',
    githubUrl: 'https://github.com/reyhkm/DETEKSI_HP_KELAS',
    language: [Image.asset(SImages.python, height: 20)],
  ),
  ProjectModel(
    title: 'Klasifikasi Gambar Sampah',
    description:
        'Proyek klasifikasi gambar telah dikembangkan untuk mengidentifikasi jenis sampah menggunakan pendekatan deep learning. Model yang digunakan berbasis ResNet50 dengan bobot pralatih dari ImageNet dan dikombinasikan dengan beberapa lapisan konvolusi tambahan, batch normalization, dan dense layer untuk meningkatkan performa klasifikasi. Dataset yang digunakan berasal dari Kaggle: https://www.kaggle.com/datasets/mostafaabla/garbage-classification, yang terdiri dari 12 kelas kategori sampah.\n\nSetelah proses pelatihan selesai, model disimpan dalam tiga format: SavedModel, TF-Lite, dan TensorFlow.js (TFJS), agar dapat digunakan pada berbagai platform seperti web, mobile, dan embedded system. Proyek ini bertujuan untuk mendukung solusi pengelolaan sampah berbasis kecerdasan buatan melalui teknologi klasifikasi gambar.',
    thumbnail: SImages.klasifikasiSampah,
    duration: 'May 2025',
    githubUrl:
        'https://drive.google.com/drive/u/0/folders/11VgccUCyv9dL4Oa6VW_FYqXJrEqdmbLl',
    language: [
      Image.asset(SImages.python, height: 20),
      Image.asset(SImages.tensorflow, height: 20),
      Image.asset(SImages.sklearn, height: 20),
      Image.asset(SImages.colab, height: 20),
    ],
  ),
  ProjectModel(
    title: 'T Store',
    description:
        'A dummy e-commerce application with Firebase Authentication, real-time database integration, and dynamic product management UI using Provider state management.',
    thumbnail: SImages.tsoreApp,
    duration: 'Apr 2025 — Present',
    githubUrl: 'https://github.com/penhele/t_store',
    language: [
      Image.asset(SImages.dart, height: 20),
      Image.asset(SImages.flutter, height: 20),
    ],
  ),
];
