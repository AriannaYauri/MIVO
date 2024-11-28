import 'package:flutter/material.dart';
import 'register.dart';
import 'welcome.dart'; // Asegúrate de que este archivo exista y sea correcto.
import '../widgets/feature.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/farm.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'MIVO: Seguridad agrícola',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Reciba alertas sobre plagas, enfermedades e incendios que afecten a tus cultivos',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese su contraseña o número de teléfono',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.green[50],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(username: "Usuario"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text('Siguiente', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Crear cuenta', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Proteja sus cultivos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FeatureCard(
                    iconPath: 'assets/proteccion.jpg',
                    title: 'Protección de cultivos',
                    subtitle: 'Monitoreo 24/7',
                  ),
                  FeatureCard(
                    iconPath: 'assets/plaga1.jpg',
                    title: 'Alertas de amenazas',
                    subtitle: 'Actualizaciones en tiempo real',
                  ),
                  FeatureCard(
                    iconPath: 'assets/plaga2.jpg',
                    title: 'Diagnósticos',
                    subtitle: 'Información basada en datos',
                  ),
                  FeatureCard(
                    iconPath: 'assets/alerta.jpg',
                    title: 'Seguridad sobre el terreno',
                    subtitle: 'Asegure sus campos',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
