import 'package:flutter/material.dart';
import 'package:legendary/legendary.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final List keyImages = game.metadata["keyImages"];

    Map<String, dynamic>? image =
        keyImages.firstWhere((image) => image["type"] == "DieselGameBox");

    return Container(
      decoration: image != null
          ? BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image["url"]), fit: BoxFit.cover))
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back arrow
          IconButton(
              padding: const EdgeInsets.all(20),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white))),
        ],
      ),
    );
  }
}
