import 'package:flutter/material.dart';
import '../main.dart'; // Importa main.dart para acceder a TurismoPage

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/tarata_fondo.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Oscurece el fondo
          ),
          // Contenido de la pantalla
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logotipo en la parte superior
              Image.asset(
                'assets/tarata_logo.png',
                height: 150,
              ),
              const SizedBox(height: 40),
              // Botón de inicio de sesión con Google
              ElevatedButton(
                onPressed: () {
                  // Acción del botón de Google
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Ingreso con cuenta Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // Botón de inicio de sesión con correo electrónico
              ElevatedButton(
                onPressed: () {
                  // Acción del botón de correo electrónico
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Ingreso con Correo Electrónico',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // Botón de inicio de sesión (corregido a "Sign In")
              ElevatedButton(
                onPressed: () {
                  // Navegar a TurismoPage (pantalla principal)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TurismoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
