import 'package:flutter/material.dart';
import 'models/album.dart';
import 'album_detail_page.dart'; 


class AlbumListPage extends StatelessWidget {
  final List<Album> albums;

  const AlbumListPage({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return ListTile(
            leading: Image.asset(album.image), 
            title: Text(album.title),
            subtitle: Text('Album n°${album.numero}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailPage(album: album),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
