import 'package:flutter/material.dart';

Map<String, bool> deviceStates = {};

class EquipmentDetailsScreen extends StatefulWidget {
  final String label;
  final String manufacturer;
  final String model;
  final String mac;

  EquipmentDetailsScreen({
    required this.label,
    required this.manufacturer,
    required this.model,
    required this.mac,
  });

  @override
  _EquipmentDetailsScreenState createState() => _EquipmentDetailsScreenState();
}

class _EquipmentDetailsScreenState extends State<EquipmentDetailsScreen> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  void _loadState() {
    setState(() {
      isOn = deviceStates[widget.mac] ?? false;
    });
  }

  void _saveState() {
    deviceStates[widget.mac] = isOn;
  }

  void togglePower() {
    setState(() {
      isOn = !isOn;
      _saveState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de ${widget.label}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Especificaciones',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSpecification('Fabricante', widget.manufacturer),
            SizedBox(height: 10),
            _buildSpecification('Modelo', widget.model),
            SizedBox(height: 10),
            _buildSpecification('MAC', widget.mac),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: togglePower,
                child: Text(isOn ? 'Apagar' : 'Encender'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecification(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
