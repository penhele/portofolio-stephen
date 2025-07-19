import '../model/project_model.dart';
import '../utils/constants/image_strings.dart';

final List<ProjectModel> projectList = [
  ProjectModel(
    title: 'Palindrome App',
    description:
        'Aplikasi ini merupakan aplikasi Flutter yang memiliki fitur utama untuk mengecek apakah sebuah kata atau kalimat merupakan palindrom. Selain itu, aplikasi ini juga dilengkapi dengan fitur untuk mengambil nama dari API publik serta fitur penggantian bahasa (multi-language) yang memungkinkan pengguna memilih bahasa sesuai preferensi.',
    githubUrl: 'https://github.com/penhele/palindrome_app',
    thumbnail: SImages.palindromeApp,
    duration: 'Jul 2025',
  ),
  ProjectModel(
    title: 'Math App',
    description:
        'Math App adalah aplikasi pelatihan operasi matematika dasar (tambah, kurang, bagi, dan kali) yang diperuntukkan untuk anak tingkat Sekolah Dasar (SD). Aplikasi ini dibuat dalam rangka proyek Penulisan Ilmiah (PI).',
    githubUrl: 'https://github.com/penhele/math-application',
    thumbnail: SImages.mathApp,
    duration: 'Jun 2025 — Jul 2025',
  ),
  ProjectModel(
    title: 'Story App',
    description:
        'Story App adalah aplikasi mobile yang memungkinkan pengguna untuk mengunggah dan melihat foto melalui koneksi ke API publik. Aplikasi ini mengusung konsep mirip Instagram dengan penambahan beberapa fitur fungsional lainnya.',
    githubUrl: 'https://github.com/penhele/math-application',
    youtubeUrl: 'https://youtube.com/shorts/tYRpsubjlXc',
    thumbnail: SImages.storyApp,
    duration: 'Mar 2025',
  ),
  ProjectModel(
    title: 'Restaurant App',
    description:
        'Restaurant App adalah aplikasi mobile yang menampilkan data restoran yang diambil dari API publik. Aplikasi ini dirancang untuk memudahkan pengguna dalam menemukan informasi seputar restoran.',
    githubUrl: 'https://github.com/penhele/restaurant_app_favorite',
    thumbnail: SImages.restaurantApp,
    duration: 'Feb 2025',
  ),
  ProjectModel(
    title: 'Habit App',
    description:
        'Habit App adalah aplikasi mobile berbasis React Native yang dirancang untuk membantu pengguna membentuk dan mengorganisir kebiasaan (habit) sehari-hari secara lebih terstruktur. Tujuan utama aplikasi ini adalah untuk meningkatkan produktivitas pengguna melalui pengingat dan pencatatan progres kebiasaan.',
    githubUrl: 'https://github.com/penhele/habit-app',
    thumbnail: SImages.habitApp,
    duration: 'Jul 2025',
  ),
  ProjectModel(
    title: 'PocketWise',
    description:
        '𝗣𝗼𝗰𝗸𝗲𝘁𝗪𝗶𝘀𝗲 adalah aplikasi web prediktif dan rekomendatif yang memanfaatkan machine learning untuk membantu pengguna merencanakan keuangan secara lebih cerdas. Dengan menganalisis pola pemasukan dan pengeluaran, aplikasi ini memberikan wawasan berbasis data serta strategi pengelolaan keuangan yang bijak. Dirancang untuk meningkatkan literasi finansial, 𝗣𝗼𝗰𝗸𝗲𝘁𝗪𝗶𝘀𝗲 membantu generasi muda dan masyarakat umum mencapai kestabilan keuangan jangka panjang.',
    githubUrl: 'https://github.com/w-ptra/PocketWise/',
    documentUrl:
        'https://www.linkedin.com/posts/stephenhelenus_2ndccc-challenge-team-cc25-cf141-activity-7338104459023028225-GiMS',
    thumbnail: SImages.pocketwiseApp,
    duration: 'Mar 2025 — Jul 2025',
  ),
  ProjectModel(
    title: 'Analisis Sentimen Aplikasi Gojek',
    description:
        'Analisis Sentimen adalah salah satu implementasi dari NLP. Proyek ini bertujuan untuk mengidentifikasi dan mengevaluasi opini, sikap, atau emosi yang terkandung dalam teks. Proyek kali ini menlakukan analisis sentimen terhadap aplikasi Gojek. Model dibuat untuk mengidentifikasi review terhadap aplikasi Gojek apakah negatif, netral, atau positif.',
    githubUrl: 'https://github.com/penhele/proyek-analisis-sentimen/',
    thumbnail: SImages.analysisSentiment,
    duration: 'Apr 2025',
  ),
  ProjectModel(
    title: 'MoniClass',
    description:
        'MoniClass adalah kamera pendeteksi smartphone di ruang kelas berbasis IoT dan AI. MoniClass diharapkan menjadi solusi ampuh dalam perkembangan kelas di masa yang akan datang demi menciptakan ruang kelas yang kondusif dan siswa tidak gampang terdistraksi oleh smartphone.',
    thumbnail: SImages.moniClass,
    duration: 'Jan 2025 — May 2025',
  ),
  ProjectModel(
    title: 'Klasifikasi Gambar Sampah',
    description:
        'Proyek klasifikasi gambar ini dikembangkan untuk mengidentifikasi jenis sampah menggunakan model ResNet50 pralatih dari ImageNet yang dikombinasikan dengan lapisan tambahan. Dataset diambil dari Kaggle (12 kelas sampah). Model akhir diekspor dalam tiga format: SavedModel, TF-Lite, dan TensorFlow.js, sehingga dapat digunakan di web, mobile, dan sistem tertanam. Proyek ini mendukung solusi AI untuk pengelolaan sampah berbasis klasifikasi gambar.',
    thumbnail: SImages.klasifikasiSampah,
    duration: 'May 2025',
  ),
];
