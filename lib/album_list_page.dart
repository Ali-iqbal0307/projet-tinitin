import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'album_detail_page.dart';
import 'models/album.dart';
import 'reading_list_provider.dart'; 
import 'theme_provider.dart';


class AlbumListPage extends StatelessWidget {
  final List<Album> albums;

  const AlbumListPage({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: Colors.redAccent,
       actions: [
          // Bouton pour basculer le thème
          IconButton(
            icon: Icon(context.watch<ThemeProvider>().isDarkMode
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme(); // Change le thème
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          
         
          final isInReadingList = context.watch<ReadingListProvider>().isInReadingList(album);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(
                album.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(album.title),
              subtitle: Text('Album n°${album.numero}'),
              
              // Bouton d'ajout
              trailing: ElevatedButton(
                onPressed: () {
                  context.read<ReadingListProvider>().toggleAlbum(album);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isInReadingList
                      ? const Color.fromARGB(255, 243, 61, 61) 
                      : Colors.white,  
                  side: const BorderSide(color: Color.fromARGB(255, 243, 61, 61), width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Icon(
                      isInReadingList
                          ? Icons.bookmark_remove  
                          : Icons.bookmark_add,   
                      color: isInReadingList ? Colors.white : const Color.fromARGB(255, 243, 61, 61),
                    ),
                    const SizedBox(width: 8), 
                    Text(
                      isInReadingList ? '' : '', 
                      style: TextStyle(
                        color: isInReadingList ? Colors.white : const Color.fromARGB(255, 243, 61, 61),
                      ), 
                    ),
                  ],
                ),
              ),

              // Naviguer
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumDetailPage(album: album),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
