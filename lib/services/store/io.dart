import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mitic_launcher/services/store/common.dart';

class Store implements IStore {
  Store(this.identifier);

  @override
  final String identifier;
  
  Future<File> _getSettingsFile() async {
    final Directory rootDirectory = await getApplicationSupportDirectory();
    final String path = join(rootDirectory.path, "$identifier.json");

    return File(path);
  }

  @override
  Future<Map<String, Object?>> read() async {
    final File file = await _getSettingsFile();
    final String contents = await file.readAsString();

    return jsonDecode(contents);
  }
  
  @override
  Future<void> write(Map<String, Object?> contents) async {
    final File file = await _getSettingsFile();
    final String jsonString = jsonEncode(contents);

    await file.writeAsString(jsonString);
  }
}
