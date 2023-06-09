import 'package:flutter/foundation.dart';
import 'package:legendary/legendary.dart';

class LegendaryChangeNotifierService extends ChangeNotifier {
  late final LegendaryBaseClient client;

  List<Game>? gamesList;
  List<InstalledGame>? installedGamesList;

  LegendaryChangeNotifierService({ required String legendaryPath }) {
    client = LegendaryProcessClient(legendaryPath: legendaryPath);
  }

  void refreshLibrary() async {
    gamesList = await client.list();
    installedGamesList = await client.listInstalled();

    notifyListeners();
  }
}
