import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:legendary/legendary.dart';
import 'package:mitic_launcher/services/legendary/legendary.dart';
import 'package:mitic_launcher/services/store/store.dart';

class LegendaryService extends ChangeNotifier {
  ILegendaryBaseClient? _client;

  Status? _status;

  Status? get status => _status;
  set status(Status? value) {
    _status = value;
    notifyListeners();
  }

  List<Game>? _games;

  List<Game>? get games => _games;
  set games(List<Game>? value) {
    _games = value;
    notifyListeners();
  }

  List<InstalledGame>? _gamesInstalled;

  List<InstalledGame>? get gamesInstalled => _gamesInstalled;

  set gamesInstalled(List<InstalledGame>? value) {
    _gamesInstalled = value;
    notifyListeners();
  }

  LegendaryService() {
    Store("legendary").read().then((jsonLegendarySettings) {
      final legendarySettings = LegendaryStore.fromJson(jsonLegendarySettings);

      _client = LegendaryClient(legendaryPath: legendarySettings.legendaryPath);

      refresh();
    }).catchError((_) {
      final legendarySettings = LegendaryStore();

      _client = LegendaryClient(legendaryPath: legendarySettings.legendaryPath);

      refresh();
    }, test: (e) => e is PathNotFoundException);
  }

  void refresh() {
    status = null;
    games = null;
    gamesInstalled = null;

    _client?.status().then((value) async => status = await value.data);

    _client?.list().then((value) async => games = await value.data);

    _client
        ?.listInstalled()
        .then((value) async => gamesInstalled = await value.data);
  }
}
