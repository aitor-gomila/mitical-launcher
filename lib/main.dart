import 'package:flutter/material.dart';
import 'package:flutter_epic_games_launcher/services/legendary/notifier.dart';
import 'package:flutter_epic_games_launcher/services/legendary/store.dart';
import 'package:provider/provider.dart';

import 'package:flutter_epic_games_launcher/services/store/store.dart';
import 'package:flutter_epic_games_launcher/frontend/about.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) async {
          final store = Store("legendary");
          return LegendaryStore.fromJson(
            await store.read()
          );
        }),
        ChangeNotifierProvider(create: (context) {
          final legendaryStore = context.read<LegendaryStore>();
          return LegendaryChangeNotifierService(
            legendaryPath: legendaryStore.legendaryPath
          );
        }),
      ],
      child: const Application(),
    )
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _StateApplication();
}

class _StateApplication extends State<Application> {
  int _selectedIndex = 0;

  final List<Widget> _widgetList = [
    Container(),
    Container(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgetList[_selectedIndex],

        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.book),
              label: "Library"
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings"
            ),
            NavigationDestination(
              icon: Icon(Icons.info),
              label: "About"
            )
          ],
        ),
      ),
    );
  }
}