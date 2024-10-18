import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/album.dart';
import 'reading_list_provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

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
            const SizedBox(height: 16),
            // --- Section pour afficher la carte ---
            Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(album.gps.latitude, album.gps.longitude), // Centre la carte sur les coordonnées de l'album
                  initialZoom: 9.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // Source de la carte
                    userAgentPackageName: 'com.example.app',
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // Lien vers les droits d'attribution
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ReadingListProvider>().toggleAlbum(album);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: isInReadingList
                      ? const Color.fromARGB(255, 243, 61, 61)
                      : Colors.white,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 243, 61, 61), width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isInReadingList ? Icons.bookmark_remove : Icons.bookmark_add,
                      color: isInReadingList
                          ? Colors.white
                          : const Color.fromARGB(255, 243, 61, 61),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isInReadingList ? 'Retirer' : 'Ajouter',
                      style: TextStyle(
                        color: isInReadingList
                            ? Colors.white
                            : const Color.fromARGB(255, 243, 61, 61),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  launchUrl(Uri parse) {}
}
