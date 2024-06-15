import 'package:appsmartthings/models/equipment_details_screen.dart';
import 'package:appsmartthings/pages/adjust_light_screen.dart';
import 'package:flutter/material.dart';

class Equipment {
  final String label;
  final String manufacturer;
  final String model;
  final String mac;
  final IconData icon;

  Equipment({
    required this.label,
    required this.manufacturer,
    required this.model,
    required this.mac,
    required this.icon,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Equipment> equipmentList = [
    Equipment(
      label: 'Televisión',
      manufacturer: 'Sony',
      model: 'Bravia X90J',
      mac: '00:11:22:33:44:55',
      icon: Icons.tv,
    ),
    Equipment(
      label: 'Refrigeradora',
      manufacturer: 'LG',
      model: 'InstaView',
      mac: '66:77:88:99:AA:BB',
      icon: Icons.kitchen,
    ),
    Equipment(
      label: 'Puerta Sala',
      manufacturer: 'Yale',
      model: 'YRD256',
      mac: 'CC:DD:EE:FF:00:11',
      icon: Icons.door_front_door,
    ),
    Equipment(
      label: 'Coches',
      manufacturer: 'Tesla',
      model: 'Model S',
      mac: '22:33:44:55:66:77',
      icon: Icons.directions_car,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Espacios',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdjustLightScreen(
                                    space: 'Espacio ${String.fromCharCode(65 + index)}',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Espacio ${String.fromCharCode(65 + index)}'),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Equipos Conectados',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(equipmentList.length, (index) {
                          final equipment = equipmentList[index];
                          return _buildEquipmentButton(
                            context,
                            equipment,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipmentButton(BuildContext context, Equipment equipment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EquipmentDetailsScreen(
                label: equipment.label,
                manufacturer: equipment.manufacturer,
                model: equipment.model,
                mac: equipment.mac,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(equipment.icon, size: 48),
            SizedBox(height: 10),
            Text(equipment.label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}