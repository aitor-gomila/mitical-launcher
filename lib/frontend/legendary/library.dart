import 'package:flutter/material.dart';
import 'package:legendary/legendary.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key, required this.games});

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: LibraryPageItem(game: games[index]),
      ),
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
    return Text(game.appTitle);
  }
}
