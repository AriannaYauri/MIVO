import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedFrequency = 'Diario'; // Inicialización con 'Diario'

  // Función para manejar el cambio de frecuencia
  void onFrequencyChanged(String frequency) {
    setState(() {
      selectedFrequency = frequency;
    });
  }

  // Método para obtener los datos según la frecuencia seleccionada
  Widget getDataForSelectedFrequency() {
    if (selectedFrequency == 'Diario') {
      return Column(
        children: [
          Text('Datos Diario', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Aquí puedes añadir la lógica o los widgets que muestren los datos diarios
          Text('Información diaria del dashboard aquí.'),
        ],
      );
    } else if (selectedFrequency == 'Semanal') {
      return Column(
        children: [
          Text('Datos Semanal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Aquí puedes añadir la lógica o los widgets que muestren los datos semanales
          Text('Información semanal del dashboard aquí.'),
        ],
      );
    } else if (selectedFrequency == 'Mensual') {
      return Column(
        children: [
          Text('Datos Mensual', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Aquí puedes añadir la lógica o los widgets que muestren los datos mensuales
          Text('Información mensual del dashboard aquí.'),
        ],
      );
    } else {
      return Center(child: Text('Seleccione una frecuencia.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FrequencySelector(
              selectedFrequency: selectedFrequency,
              onFrequencyChanged: onFrequencyChanged,
            ),
            SizedBox(height: 20),
            getDataForSelectedFrequency(), // Muestra los datos según la frecuencia seleccionada
          ],
        ),
      ),
    );
  }
}

class FrequencySelector extends StatelessWidget {
  final String selectedFrequency;
  final Function(String) onFrequencyChanged;

  const FrequencySelector({
    required this.selectedFrequency,
    required this.onFrequencyChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['Diario', 'Semanal', 'Mensual'].map((frequency) {
        return GestureDetector(
          onTap: () => onFrequencyChanged(frequency),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: selectedFrequency == frequency ? Colors.green : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              frequency,
              style: TextStyle(
                color: selectedFrequency == frequency ? Colors.white : Colors.black,
                fontWeight: selectedFrequency == frequency ? FontWeight.bold : FontWeight.normal, // Aquí se asegura de que el texto sea negrita si está seleccionado
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}


