import 'dart:async';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      print("_scrollController");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("_agregar10");
        //  _agregar10();

        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Stack(
        children: <Widget>[_crearListViewBuilder(), _crearLoading()],
      ),
    );
  }

  Widget _crearListViewBuilder() {
    return RefreshIndicator(
      onRefresh: obtenerPage1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _listNumeros[index];
            return FadeInImage(
              placeholder: AssetImage('assets/original.gif'),
              image:
                  NetworkImage("https://picsum.photos/500/300/?image=$image"),
            );
          }),
    );
  }

  Future<Null> obtenerPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    } else
      return Container();
  }
}
