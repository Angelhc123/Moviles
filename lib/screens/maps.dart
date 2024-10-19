import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MapsPage());
}


class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  int _currentIndex = 0;

  // Localización inicial del mapa (puedes cambiar las coordenadas)
  final LatLng _center = const LatLng(-12.0464, -77.0428);

  // Listas de lugares guardados y favoritos
  List<String> savedPlaces = ['Lugar A', 'Lugar B'];
  List<String> favoritePlaces = ['Lugar C', 'Lugar D'];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Widget para mostrar la lista de lugares guardados
  Widget _buildSavedPlaces() {
    return ListView.builder(
      itemCount: savedPlaces.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(savedPlaces[index]),
        );
      },
    );
  }

  // Widget para mostrar la lista de lugares favoritos
  Widget _buildFavoritePlaces() {
    return ListView.builder(
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favoritePlaces[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Acción al presionar el botón de menú
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // Acción al presionar el botón de perfil
            },
          ),
        ],
      ),
      body: _currentIndex == 0
          ? Stack(
              children: [
                // Mapa
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 14.0,
                  ),
                  mapType: MapType.normal,
                ),
                // Barra de búsqueda en la parte superior
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu búsqueda',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : _currentIndex == 1
              ? _buildSavedPlaces() // Mostrar lugares guardados
              : _buildFavoritePlaces(), // Mostrar lugares favoritos
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin, color: Colors.red),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            label: 'Guardado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border, color: Colors.yellow),
            label: 'Favoritos',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
