import 'package:sms_advanced/sms_advanced.dart';

class SMSService {
  Future<List<String>> fetchMessages() async {
    SmsQuery query = SmsQuery();
    List<SmsMessage> messages = await query.getAllSms;
    return messages.map((msg) => msg.body ?? "").toList();
  }

  Map<String, int> parseEventData(List<String> messages) {
    Map<String, int> eventData = {'Incendios': 0, 'Animales': 0, 'Intrusos': 0};

    for (var message in messages) {
      if (message.contains("Incendio")) eventData['Incendios'] = (eventData['Incendios'] ?? 0) + 1;
      if (message.contains("Animal")) eventData['Animales'] = (eventData['Animales'] ?? 0) + 1;
      if (message.contains("Intruso")) eventData['Intrusos'] = (eventData['Intrusos'] ?? 0) + 1;
    }

    return eventData;
  }
}
