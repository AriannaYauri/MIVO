class FrequencyData {
  final Map<String, int> dailyData;
  final Map<String, int> weeklyData;
  final Map<String, int> monthlyData;

  FrequencyData({
    required this.dailyData,
    required this.weeklyData,
    required this.monthlyData,
  });

  Map<String, int> getDataForFrequency(String frequency) {
    switch (frequency) {
      case 'Diario':
        return dailyData;
      case 'Semanal':
        return weeklyData;
      case 'Mensual':
        return monthlyData;
      default:
        return {};
    }
  }
}
