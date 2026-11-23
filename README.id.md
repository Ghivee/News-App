# News App

Aplikasi Flutter yang menampilkan daftar berita dari NewsAPI.

[English](README.md)

## Teknologi

Flutter, `http`.

## Menjalankan

Ambil API key dari [newsapi.org](https://newsapi.org), lalu jalankan:

```bash
flutter pub get
flutter run --dart-define=NEWS_API_KEY=kunci_anda
```

## Struktur

```
lib/news_services.dart      memanggil endpoint NewsAPI /v2
lib/news_list_screen.dart   daftar judul berita
lib/news_model.dart         model artikel
```
