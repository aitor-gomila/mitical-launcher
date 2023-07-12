import 'package:flutter/material.dart';
import 'package:legendary/legendary.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key, required this.games});

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
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

    for (final image in keyImages) {
      if (image["type"] != "DieselGameBoxTall") continue;

      return Container(
        height: 512,
        width: 680,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image["url"]), fit: BoxFit.fitHeight),
        ),
        child: InkWell(onTap: () {}),
      );
    }

    return Container();
  }
}
