import 'package:flutter/material.dart';
import 'package:legendary/legendary.dart';

import 'package:mitic_launcher/frontend/legendary/game_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key, required this.games});

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 261),
      itemBuilder: (context, index) => LibraryPageItem(game: games[index]),
      itemCount: games.length,
      padding: const EdgeInsets.all(10),
    );
  }
}

class LibraryPageItem extends StatelessWidget {
  const LibraryPageItem({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final keyImages = game.metadata["keyImages"];

    Map<String, dynamic> image =
        keyImages.firstWhere((image) => image["type"] == "DieselGameBoxTall");

    return Container(
      height: 697,
      width: 522,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(image["url"]),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color)),
      ),
      child: InkWell(onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => GamePage(game: game)));
      }),
    );
  }
}
