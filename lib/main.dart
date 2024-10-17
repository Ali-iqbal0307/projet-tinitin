import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'album_list_page.dart';
import 'models/album.dart';
import 'models/gps.dart';
import 'reading_list_provider.dart'; // Ajouter le Provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Album> albums = [
      Album(
        title: 'Tintin au pays des Soviets',
        numero: 1,
        year: 1930,
        image: 'images/tintin-au-pays-des-soviets.jpg',
        resume:
            "Nous sommes le 10 janvier 1929, à Bruxelles. Accompagné de son chien Milou...",
        gps: GPS(latitude: 50.8503, longitude: 4.3517),
        location: 'Bruxelles',
      ),
      // Autres albums...
    ];

    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => ReadingListProvider()), // Le provider pour la liste de lecture
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: AlbumListPage(albums: albums),
      ),
    );
  }
}
