import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RelevantURL {
  static const String gitHubRepository =
      "https://github.com/aitor-gomila/flutter-epic-games-launcher";
  static const String governanceUrl =
      "https://github.com/aitor-gomila/flutter-epic-games-launcher/discussions";
  static const String discordInvite = "https://discord.gg/e2wmBteX9j";
  static const String legendaryRepository =
      "https://github.com/derrod/legendary";
}

final class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(50), children: [
      const Text(
          "Flutter Epic Games Launcher is a cross-platform Epic Games Launcher. It is open source and with democratic governance. You may check the LICENSE, Governance, and references below."),
      OutlinedButton(
          onPressed: () => launchUrlString(RelevantURL.gitHubRepository),
          child: const Text("Source code")),
      OutlinedButton(
          onPressed: () => launchUrlString(RelevantURL.governanceUrl),
          child: const Text("Open governance")),
      OutlinedButton(
          onPressed: () => launchUrlString(RelevantURL.discordInvite),
          child: const Text("Discord server")),
      OutlinedButton(
          onPressed: () => launchUrlString(RelevantURL.legendaryRepository),
          child: const Text("Legendary")),
    ]);
  }
}
