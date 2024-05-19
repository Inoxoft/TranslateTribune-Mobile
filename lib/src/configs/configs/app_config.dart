abstract class AppConfig {
  String get name;

  Future<void> init() async {
    await initSystem();
  }

  Future<void> initSystem() async {}

  @override
  String toString() => '$runtimeType';
}
