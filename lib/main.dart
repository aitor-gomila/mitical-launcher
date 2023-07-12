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

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetList = [
    // Library
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
    // Settings
    Consumer<LegendaryService>(builder: (context, service, child) {
      if (service.status == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return AccountPage(account: service.status!.account);
    }),
  ];

  final List<String> _namesList = ["Library", "Settings"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Row(
            children: [
              SizedBox(
                  width: 150,
                  child: ListView(children: [
                    ListTile(
                        title: const Text("Library"),
                        leading: const Icon(Icons.book),
                        onTap: () => setSelectedIndex(0)),
                    ListTile(
                        title: const Text("Settings"),
                        leading: const Icon(Icons.settings),
                        onTap: () => setSelectedIndex(1))
                  ])),
              Expanded(child: _widgetList[_selectedIndex])
            ],
          ),
        ));
  }
}
