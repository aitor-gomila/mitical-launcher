import 'package:flutter/material.dart';
import 'package:mitic_launcher/frontend/legendary/library.dart';
import 'package:provider/provider.dart';

import 'package:mitic_launcher/services/legendary/notifier.dart';
import 'package:mitic_launcher/frontend/legendary/account.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LegendaryService()),
    ],
    child: const Application(),
  ));
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _StateApplication();
}

class _StateApplication extends State<Application> {
  int _selectedIndex = 0;

  final List<Widget> _widgetList = [
    Consumer<LegendaryService>(
      builder: (context, service, child) {
        if (service.games == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return LibraryPage(games: service.games!);
      },
    ),
    Consumer<LegendaryService>(
        builder: (context, service, child) {
          if (service.status == null) {
            return const Center(
              child: CircularProgressIndicator()
            );
          }

          return AccountPage(account: service.status!.account);
        }),
  ];

  final List<String> _namesList = [
    "Library",
    "Settings"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: _widgetList[_selectedIndex],
        appBar: AppBar(
          title: Text(_namesList[_selectedIndex]),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<LegendaryService>().refresh(),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.book), label: "Library"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
