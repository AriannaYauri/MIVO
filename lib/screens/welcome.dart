import 'package:flutter/material.dart';
import '../widgets/bar_chart_widget.dart';
import '../widgets/frequency_selector.dart';
import '../services/sms_service.dart';
import '../services/local_storage_service.dart';

class WelcomeScreen extends StatefulWidget {

  
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String selectedFrequency = 'Diario';
  Map<String, int> eventData = {};
  final SMSService smsService = SMSService();
  final LocalStorageService storageService = LocalStorageService();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    List<String> messages = await smsService.fetchMessages();
    Map<String, int> parsedData = smsService.parseEventData(messages);
    await storageService.saveEventData(parsedData);

    setState(() {
      eventData = parsedData;
    });
  }

  void _onFrequencyChanged(String frequency) {
    setState(() {
      selectedFrequency = frequency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboards'),
      ),
      body: Column(
        children: [
          FrequencySelector(
            selectedFrequency: selectedFrequency,
            onFrequencyChanged: _onFrequencyChanged,
          ),
          Expanded(
            child: BarChartWidget(
              data: eventData,
              title: 'Frecuencia de Eventos ($selectedFrequency)',
            ),
          ),
        ],
      ),
    );
  }
}
