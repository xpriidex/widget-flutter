import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  InputScreen({Key key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  String _opcionSelecionada = "volar";
  List<String> _poderes = ["volar", "rayos", "pegar fuerte"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput1(),
          buildDivider(),
          _crearPersona(),
          buildDivider(),
          _crearEmail(),
          buildDivider(),
          _crearPassword(),
          buildDivider(),
          _creaFecha(context),
          buildDivider(),
          _crearDropDown(),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 10.0,
    );
  }

  Widget _createInput1() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Cantidad de letras: ${_nombre.length}"),
        hintText: "Tu nombre",
        labelText: "Nombre",
        helperText: "Pon tu nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (input) {
        setState(() {
          _nombre = input;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre: $_nombre,  Fecha: $_fecha"),
      subtitle: Text("Pass: $_password"),
      leading: Text("Poder: $_opcionSelecionada"),
      trailing: Text("Email: $_email,"),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "algo@algo.algo",
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (input) {
        setState(() {
          _email = input;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "pass",
        labelText: "PassWord",
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_outline),
      ),
      onChanged: (input) {
        setState(() {
          _password = input;
        });
      },
    );
  }

  _creaFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Fecha nacimiento",
        labelText: "fecha",
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2025));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getItems() {
    List<DropdownMenuItem<String>> list = new List();
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return list;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSelecionada,
            items: getItems(),
            onChanged: (opt) {
              setState(() {
                _opcionSelecionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }
}
