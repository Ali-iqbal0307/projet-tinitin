import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/album.dart';
import 'reading_list_provider.dart'; // Provider pour la liste de lecture

class AlbumDetailPage extends StatelessWidget {
  final Album album;

  const AlbumDetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final isInReadingList = context.watch<ReadingListProvider>().isInReadingList(album);

    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Album n°${album.numero}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Année de parution : ${album.year}',
              style: const TextStyle(fontSize: 18),
            ),
            if (album.yearInColor != null)
              Text(
                'Année en couleur : ${album.yearInColor}',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 16),
            Text(
              'Résumé : ${album.resume}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Location : ${album.location}',
              style: const TextStyle(fontSize: 16),
            ),
            Center(
              child: Image.asset(
                album.image,
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ReadingListProvider>().toggleAlbum(album);
              },
              child: Text(isInReadingList
                  ? 'Retirer de la liste de lecture'
                  : 'Ajouter à la liste de lecture'),
            ),
          ],
        ),
      ),
    );
  }
}
