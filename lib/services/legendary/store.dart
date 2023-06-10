class LegendaryStore {
  final String legendaryPath;

  Map<String, dynamic> toJson() {
    return {
      "legendaryPath": legendaryPath,
    };
  }

  factory LegendaryStore.fromJson(Map<String, dynamic> json) {
    final legendaryPath = json["legendaryPath"];

    return LegendaryStore(
      legendaryPath: legendaryPath
    );
  }

  LegendaryStore({
    required this.legendaryPath
  });
}
