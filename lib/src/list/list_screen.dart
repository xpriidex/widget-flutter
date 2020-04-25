import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumeros = new List();
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      print("_scrollController");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("_agregar10");
        setState(() {
          _agregar10();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: _crearListViewBuilder(),
    );
  }

  Widget _crearListViewBuilder() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _listNumeros.length,
        itemBuilder: (BuildContext, int index) {
          final image = _listNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage("https://picsum.photos/500/300/?image=$image"),
          );
        });
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listNumeros.add(_ultimoItem);
    }
  }
}
