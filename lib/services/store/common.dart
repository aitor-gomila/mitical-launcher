abstract class IStore {
  abstract final String identifier;

  Future<Map<String, Object?>> read();
  Future<void> write(Map<String, Object?> contents);
}
