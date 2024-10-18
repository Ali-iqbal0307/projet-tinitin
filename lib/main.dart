import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titin/theme_provider.dart';
import 'album_list_page.dart';
import 'models/album.dart';
import 'models/gps.dart';
import 'reading_list_provider.dart'; 
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
       Album(
    title: 'Tintin au Congo',
    numero: 2,
    year: 1931,
    image: 'images/tintin-au-congo.jpg',
    resume: "Les Aventures de Tintin, reporter du Petit Vingtième au Congo (1931) est le reflet d'une époque coloniale et paternaliste. Pour ces nouvelles aventures, Hergé improvise encore le récit, mais plus pour longtemps. À peine revient-il d'URSS que Tintin se rend en Afrique. Devenu sorcier au royaume de Babaoro'm, Tintin déjouera les pièges d'une bande de gangsters qui souhaitaient contrôler la production de diamant au Congo. L'Afrique, représentée de manière naïve, reflète l'esprit paternaliste d'une Belgique colonialiste au début des années 1930.",
    gps: GPS(latitude: -4.0383, longitude: 21.7587),
    location: 'Congo',
  ),
  Album(
    title: 'Tintin en Amérique',
    numero: 3,
    year: 1932,
    image: 'images/tintin-en-amerique.jpg',
    resume: "Dans Tintin en Amérique (1932), le héros confirme sa vocation de redresseur de torts, en s'opposant au mafioso Al Capone, aux gangsters de Chicago et aux fripouilles de tout acabit. Déjà, Hergé témoigne d'une vision généreuse du monde, stigmatisant par exemple des Blancs pour leurs comportements envers les Indiens Peaux-Rouges. La renommée de Tintin s'étend au-delà de l'Atlantique. Si bien que lorsqu'il arrive à Chicago, en pleine prohibition, tous les bandits et malfaiteurs associés lui préparent une réception des moins confortables. Tintin devra user de tout son courage et de toute son intelligence pour survivre !",
    gps: GPS(latitude: 40.7128, longitude: -74.0060),
    location: 'New York', 
  ),
  Album(
    title: 'Les Cigares du pharaon',
    numero: 4,
    year: 1934,
    image: 'images/les-cigares-du-pharaon.jpg',
    resume: "Ce quatrième épisode de la série, premier album paru exclusivement chez Casterman (les précédents étaient estampillés Éditions du Petit Vingtième) sous le titre Les aventures de Tintin reporter en Orient, Les Cigares du Pharaon, est sorti à l'automne 1934. Tintin part sur les traces de trafiquants d'opium à travers l'Égypte et l'Inde. Port-Saïd, Le Caire, les pyramides, les tombeaux des pharaons, la mer Rouge, la jungle et ses éléphants... Tintin va vivre des aventures peu banales : il tente d'échapper au poison qui rend fou, rencontre un archéologue extravagant, un Maharadja en danger de mort...",
    gps: GPS(latitude: 26.8206, longitude: 30.8025),
    location: 'Égypte',
  ),
  Album(
    title: 'Le Lotus bleu',
    numero: 5,
    year: 1936,
    image: 'images/le-lotus-bleu.jpg',
    resume: "Dans Le Lotus bleu (1936) Tintin s'engage à démanteler le trafic d'opium international qui sévit dans un lieu mythique certes, mais dont il ignore tout, la Chine. À l'aube de ce récit, la généreuse ambition de Tintin semble démesurée. Aidé par la seule société secrète, Les Fils du Dragon, et par son ami Tchang, rencontré tardivement, il parvient à surmonter tous les obstacles et ruiner les perfides machinations de ses nombreux ennemis.",
    gps: GPS(latitude: 31.2304, longitude: 121.4737),
    location: 'Shanghai', 
  ),
  Album(
    title: 'L\'Oreille cassée',
    numero: 6,
    year: 1937,
    image: 'images/l-oreile-cassee.jpg',
    resume: "L'Oreille Cassée (1937) est une course poursuite palpitante. Tintin s'embarque pour l'Amérique du Sud afin de récupérer un fétiche volé. Là-bas s'opposent toutes sortes d'intérêts : militaires, économiques, la guerre du Gran Chaco venant d'opposer, trois ans durant, la Bolivie et le Paraguay. Une statuette Arumbaya est volée... puis restituée à son musée. Mais un détail révèle à Tintin que ce n'est pas l'original qui a été rendu, mais une simple réplique. Quel mystère cache donc cette statuette pour que l'on veuille en maquiller le vol ? Tintin s'embarque pour l'Amérique du Sud où, croit-il, se trouve la clef de cette énigme.",
    gps: GPS(latitude: -34.6118, longitude: -58.4173),
    location: 'Amérique du Sud', 
  ),
  Album(
    title: 'L\'Île Noire',
    numero: 7,
    year: 1938,
    image: 'images/l-ile-noire.jpg',
    resume: "De retour d'Amérique du Sud, Tintin s'embarque dans une aventure britannique palpitante, rythmée par d'incessants rebondissements. Pour la première fois et non la dernière, Tintin s'oppose au fourbe Docteur Müller. Ce dernier a organisé, à l'échelle européenne, un vaste trafic de fausse monnaie. Après bien des péripéties, Tintin réussira-t-il à le démanteler ?",
    gps: GPS(latitude: 57.4764, longitude: -4.2247),
    location: 'Écosse',
  ),
  Album(
    title: 'Le Sceptre d\'Ottokar',
    numero: 8,
    year: 1939,
    image: 'images/le-sceptre-d-ottokar.jpg',
    resume: "Le Sceptre d'Ottokar (1939) est un coup de force d'Hergé qui vise l'Allemagne dans cette aventure. La découverte d'une serviette oubliée sur un banc conduit Tintin à Prague, puis en Syldavie. Tintin va sauver la Syldavie et son Royaume d'un coup d'État fasciste.",
    gps: GPS(latitude: 47.1625, longitude: 19.5033),
    location: 'Syldavie',
  ),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReadingListProvider()), 
      ],
      child: MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: themeProvider.getTheme(),  
  home: AlbumListPage(albums: albums),
)

    );
  }
}
