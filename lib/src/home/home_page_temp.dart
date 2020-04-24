import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _opciones = ["Uno", "Dos", "Tres", "Cuatro"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componenetes Temp"),
        ),
        body: ListView(children: _crearItemsCorto()));
  }

  List<Widget> _crearItems() {
    List<Widget> list = new List<Widget>();

    for (String op in _opciones) {
      final tempWitget = ListTile(
        title: Text(op),
      );

      list..add(tempWitget)..add(Divider());
    }

    return list;
  }

  List<Widget> _crearItemsCorto() {
    return _opciones
        .map((item) =>
        Column(
          children: <Widget>[
            ListTile(
              title: Text(item),
              subtitle: Text("subtitle"),
              leading: Icon(Icons.remove),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                print(item);
              },
            ),
            Divider()
          ],
        ))
        .toList();
  }
}
