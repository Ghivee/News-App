// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

import 'news_model.dart';
import 'news_services.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewsService _newsService = NewsService();

  // Future yang menyimpan hasil pemanggilan API
  late Future<List<NewsModel>> _newsFuture;

  //fungsi load akan dieksekusi saat halaman ini dibuka
  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  // Memanggil API dan menyimpan hasilnya ke _articlesFuture
  void _loadNews() {
    setState(() {
      _newsFuture = _newsService.fetchSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '📰 Flutter News',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<NewsModel>>(
            future: _newsFuture,
            builder: (context, snapshot) {
              // 1. Sedang loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text('Memuat berita...'),
                    ],
                  ),
                );
              }

              // 2. Terjadi error
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return const Center(
                  child: Text('Gagal memuat berita'),
                );
              }

              // 3. Data kosong
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Tidak ada berita tersedia.'),
                );
              }

              // 4. Data berhasil dimuat
              final news = snapshot.data!;
              return RefreshIndicator(
                  onRefresh: () async {
                    _loadNews();
                  },
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          height: 90,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 15,
                          ),
                          child: Text(news[index].name ?? 'No Name'),
                        );
                      }));
            }));
  }
}
