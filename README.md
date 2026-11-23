# News App

A Flutter app that lists news headlines from NewsAPI.

[Bahasa Indonesia](README.id.md)

## Tech stack

Flutter, `http`.

## Getting started

Get an API key from [newsapi.org](https://newsapi.org), then run:

```bash
flutter pub get
flutter run --dart-define=NEWS_API_KEY=your_key
```

## Project structure

```
lib/news_services.dart      calls the NewsAPI /v2 endpoint
lib/news_list_screen.dart   headline list
lib/news_model.dart         article model
```
