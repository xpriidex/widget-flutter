import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _valueSlider = 150;
  bool _blockearCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _showValue(),
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      // divisions: 20,
      max: 400,
      min: 100,
      value: _valueSlider,
      onChanged: (_blockearCheck)
          ? null
          : (newValue) {
              setState(() {
                _valueSlider = newValue;
              });
            },
    );
  }

  Widget _showValue() {
    int value = _valueSlider.toInt();
    return Text("$value");
  }

  Widget _crearImagen() {
    return Expanded(
      child: Image(
          width: _valueSlider,
          fit: BoxFit.contain,
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgycrkXnPWZwKtu2G2t7piHT46NxWt-2QTiij8VOn3fFEb7N_d&usqp=CAU")),
    );
  }

  Widget _crearCheckBox() {
    //return Checkbox(
    //  value: _blockearCheck,
    //  onChanged: (value) {
    //    setState(() {
    //      _blockearCheck = value;
    //    });
    //  },
    //);
    return CheckboxListTile(
      title: Text("Bloquear slider"),
      subtitle: Text("holi"),
      value: _blockearCheck,
      onChanged: (value) {
        setState(() {
          _blockearCheck = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("SwitchListTile"),
      subtitle: Text("holi"),
      value: _blockearCheck,
      onChanged: (value) {
        setState(() {
          _blockearCheck = value;
        });
      },
    );
  }
}
