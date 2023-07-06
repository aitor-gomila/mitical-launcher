import 'dart:io';
import 'package:path/path.dart' as path;

enum LegendaryStoreValue<T> { none, loading, error<Error>(), value<T>() }

class LegendaryStore {
  // Default platform name e.g. windows, mac and linux
  static final String _platformName = Platform.isWindows
      ? "windows"
      : Platform.isMacOS
          ? "darwin"
          : Platform.isLinux
              ? "linux"
              : "";

  // default path to legendary, e.g. assets/legendary/linux/legendary or assets/legendary/windows/legendary.exe
  static final String _defaultLegendaryPath = path.join("assets", "legendary",
      _platformName, Platform.isWindows ? "legendary.exe" : "legendary");

  final String legendaryPath;

  Map<String, dynamic> toJson() {
    return {
      "legendaryPath": legendaryPath,
    };
  }

  factory LegendaryStore.fromJson(Map<String, dynamic> json) {
    final legendaryPath = json["legendaryPath"];

    return LegendaryStore(legendaryPath: legendaryPath);
  }

  LegendaryStore({String? legendaryPath})
      : legendaryPath = legendaryPath ?? _defaultLegendaryPath;
}
