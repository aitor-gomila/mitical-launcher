import 'package:flutter/foundation.dart';
import 'package:legendary/legendary.dart';
import 'package:mitic_launcher/services/legendary/legendary.dart';
import 'package:mitic_launcher/services/store/store.dart';

class LegendaryService extends ChangeNotifier {
  LegendaryBaseClient? _client;

  Status? _status;

  Status? get status => _status;
  set status (Status? value) {
    _status = value;
    notifyListeners();
  }

  List<Game>? _games;

  List<Game>? get games => _games;
  set games (List<Game>? value) {
    _games = value;
    notifyListeners();
  }

  List<InstalledGame>? _gamesInstalled;

  List<InstalledGame>? get gamesInstalled => _gamesInstalled;

  set gamesInstalled (List<InstalledGame>? value) {
    _gamesInstalled = value;
    notifyListeners();
  }

  LegendaryService() {
    Store("legendary").read()
      .then((jsonLegendarySettings) {
        final legendarySettings = LegendaryStore.fromJson(jsonLegendarySettings);

        _client = LegendaryProcessClient(legendaryPath: legendarySettings.legendaryPath);

        refresh();
      });
  }

  Future<void> refresh() async {
    status = null;

    _client?.status().then(
      (value) => status = value
    );

    _client?.list().then(
      (value) => games = value
    );

    _client?.listInstalled().then(
      (value) => gamesInstalled = value
    );
  }
}
