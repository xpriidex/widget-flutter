import 'package:flutter/material.dart';
import 'package:witgetapp/src/alert/alert_page.dart';
import 'package:witgetapp/src/animated/animated_container_screen.dart';
import 'package:witgetapp/src/avatar/avatar_page.dart';
import 'package:witgetapp/src/card/card_screen.dart';
import 'package:witgetapp/src/home/home_page.dart';
import 'package:witgetapp/src/input/input_screen.dart';
import 'package:witgetapp/src/list/list_screen.dart';
import 'package:witgetapp/src/slider/slider_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardScreen(),
    'animated': (BuildContext context) => AnimatedContainerScreen(),
    'inputs': (BuildContext context) => InputScreen(),
    'slider': (BuildContext context) => SliderScreen(),
    'list': (BuildContext context) => ListScreen(),
  };
}
