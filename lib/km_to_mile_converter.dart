import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calc_button.dart';

class KmToMileConverter extends StatefulWidget {
  @override
  _KmToMileConverterState createState() => _KmToMileConverterState();
}

class _KmToMileConverterState extends State<KmToMileConverter> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _convert() {
    final double km = double.tryParse(_controller.text) ?? 0;
    final double miles = km * 0.621371;
    setState(() {
      _result = '${km.toString()} km is equal to ${miles.toStringAsFixed(2)} miles';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('Km to Mile Converter', style: TextStyle(color: Colors.white38)),
           
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[            
            TextField(              
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.allow(RegExp(r'\d')),
],
              decoration: InputDecoration(
                labelText: 'Enter kilometers',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(_result),
            
          ],
        ),
      ),
    );
  }
}
