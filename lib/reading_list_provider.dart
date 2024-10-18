import 'package:flutter/material.dart';
import 'models/album.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> _readingList = [];

  List<Album> get readingList => _readingList;

  bool isInReadingList(Album album) {
    return _readingList.contains(album);
  }

  void toggleAlbum(Album album) {
    if (isInReadingList(album)) {
      removeFromReadingList(album);
    } else {
      addToReadingList(album); 
    }
  }

  void removeFromReadingList(Album album) {
    _readingList.remove(album);
    notifyListeners();  
  }

  void addToReadingList(Album album) {
    _readingList.add(album);
    notifyListeners();  
  }
}

