import 'package:flutter/material.dart';

class AdjustLightScreen extends StatefulWidget {
  final String space;

  AdjustLightScreen({required this.space});

  @override
  _AdjustLightScreenState createState() => _AdjustLightScreenState();
}

class _AdjustLightScreenState extends State<AdjustLightScreen> {
  double _sliderValue1 = 50;
  double _sliderValue2 = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustar ${widget.space}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ajustar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSlider('Luz', _sliderValue1, (value) {
              setState(() {
                _sliderValue1 = value;
              });
            }),
            SizedBox(height: 20),
            _buildSlider('Luz', _sliderValue2, (value) {
              setState(() {
                _sliderValue2 = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
      String subtitle, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          subtitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '0',
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
              child: Slider(
                value: value,
                min: 0,
                max: 100,
                divisions: 100,
                label: value.round().toString(),
                onChanged: onChanged,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
            ),
            Text(
              '100',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
