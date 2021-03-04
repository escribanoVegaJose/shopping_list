import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/Utils/LoginGoogleUtils.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

_drawerHome(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        //Drawer
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: DesignWidgets.linearGradientMain(context),
          ),
          child: Text(
            'Nombre de usuario',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        //cerrar sesión
        ListTile(
          onTap: () => {
            LoginGoogleUtils().signOutGoogle(),
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            )
          },
          leading: Icon(Icons.logout),
          title: Text(
            TextApp.LOGOUT,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: Center(), drawer: _drawerHome(context));
  }
}
