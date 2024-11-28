// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'welcome.dart'; // Importa WelcomeScreen

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildTextField('Nombre', nameController),
            SizedBox(height: 16),
            _buildTextField('Apellidos', null),
            SizedBox(height: 16),
            _buildTextField('Número de teléfono', null),
            SizedBox(height: 16),
            _buildTextField('Contraseña', null),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Obtener el nombre del usuario para pasarlo a WelcomeScreen
                String name = nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(username: name),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Registrarse', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController? controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.green),
      ),
    );
  }
}
