# News App

A Flutter app that fetches and lists current news headlines from NewsAPI, built as an exercise in calling a REST API from Flutter and rendering the response as a scrollable list.

[Baca dalam Bahasa Indonesia di bawah](#bahasa-indonesia)

## Tech stack

Flutter, `http` for the network calls.

## Getting started

Get a free API key from [newsapi.org](https://newsapi.org), then run the app with it passed in at build time rather than hard-coded in source:

```bash
flutter pub get
flutter run --dart-define=NEWS_API_KEY=your_key
```

## Project structure

```
lib/news_services.dart      calls the NewsAPI /v2 endpoint, reading the key from --dart-define
lib/news_list_screen.dart   the scrollable headline list
lib/news_model.dart         the article data model
```

---

## Bahasa Indonesia

Aplikasi Flutter yang mengambil dan menampilkan daftar judul berita terkini dari NewsAPI, dibuat sebagai latihan memanggil REST API dari Flutter dan menampilkan hasilnya sebagai daftar yang bisa digulir.

### Teknologi

Flutter, `http` untuk panggilan jaringan.

### Menjalankan

Ambil API key gratis dari [newsapi.org](https://newsapi.org), lalu jalankan aplikasi dengan kunci itu disisipkan saat build, bukan ditulis langsung di source:

```bash
flutter pub get
flutter run --dart-define=NEWS_API_KEY=kunci_anda
```

### Struktur

```
lib/news_services.dart      memanggil endpoint NewsAPI /v2, membaca kunci dari --dart-define
lib/news_list_screen.dart   daftar judul berita yang bisa digulir
lib/news_model.dart         model data artikel
```
