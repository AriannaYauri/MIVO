import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveEventData(Map<String, int> eventData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var key in eventData.keys) {
      await prefs.setInt(key, eventData[key]!);
    }
  }

  Future<Map<String, int>> getEventData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'Incendios': prefs.getInt('Incendios') ?? 0,
      'Animales': prefs.getInt('Animales') ?? 0,
      'Intrusos': prefs.getInt('Intrusos') ?? 0,
    };
  }
}
