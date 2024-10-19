import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/maps.dart';  // Asegúrate de tener este archivo creado para que funcione la navegación

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const TurismoPage(),
    );
  }
}

class TurismoPage extends StatelessWidget {
  const TurismoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relax'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE07C24), Color(0xFFE6B800)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (String result) {
            if (result == 'Senderismo') {
              // Acción para "Senderismo"
            } else if (result == 'QR Code') {
              // Acción para "QR Code"
            } else if (result == 'GPS') {
              // Acción para "GPS" (navegar a la pantalla de mapas)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapsPage()),
              );
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Senderismo',
              child: Text('Senderismo'),
            ),
            const PopupMenuItem<String>(
              value: 'QR Code',
              child: Text('QR Code'),
            ),
            const PopupMenuItem<String>(
              value: 'GPS',
              child: Text('GPS'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton<String>(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/usuario.png'),
              ),
              onSelected: (String result) {
                if (result == 'Mi perfil') {
                  // Acción para "Mi perfil"
                } else if (result == 'Cerrar sesión') {
                  // Navegar a la pantalla de login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Mi perfil',
                  child: Text('Mi perfil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Cerrar sesión',
                  child: Text('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD194), Color(0xFFFFA751)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSection(
                context,
                'Baños termales de Putina - Ticaco',
                'Explora los relajantes baños termales rodeados de naturaleza.',
                'assets/banos_termales.jpg',
                '''
                Se mantienen a más de 3200msnm.
                
                En este lugar se encuentra un ojo de aguas termales que alcanza la temperatura de 47 °C y puede llegar hasta los 75 °C. Hay nueve pozas individuales y una piscina. Para ingresar a las pozas personales, se paga S/10.00 para turistas extranjeros y S/7.00 para turistas nacionales, mientras que el acceso a la piscina cuesta S/5.00 para turistas extranjeros y nacionales.
                
                La piscina tiene una profundidad de casi 1.20 metros, y el lugar es ideal para niños, jóvenes, y adultos mayores con reumatismo. Se ubica a 13.5 km de la ciudad de Tarata, a 15 minutos en auto.
                ''',
              ),
              _buildSection(
                context,
                'Taller de cerámica',
                'Descubre la artesanía local y crea tus propias obras de arte.',
                'assets/taller_ceramica.jpg',
                '''
                En el taller de cerámica, tendrás la oportunidad de trabajar con arcilla y aprender las técnicas tradicionales de cerámica. Este taller es ideal para todas las edades, y se encuentra disponible todos los días de la semana.
                
                Aprende sobre la historia de la cerámica en la región y crea recuerdos únicos.
                ''',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String description, String imagePath, String details) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150.0,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Scrollbar(
                                thickness: 4.0,
                                thumbVisibility: true,
                                radius: const Radius.circular(10),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(16.0),
                                  physics: const ClampingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.arrow_back),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          Text(
                                            title,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.asset(
                                          imagePath,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        details,
                                        textAlign: TextAlign.justify,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Más información'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
