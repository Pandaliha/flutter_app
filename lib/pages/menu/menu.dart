import 'package:flutter/material.dart';

const title = 'Navigation';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5.fontSize,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, Icons.home, 'Home', onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            }),
          ),
          getLine(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, Icons.info, 'About', onTap: () {
              Navigator.pushReplacementNamed(context, '/about');
            }),
          ),
          getLine(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, Icons.settings, 'Settings', onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            }),
          ),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(context, icon, title, {Function onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      onTap: onTap,
    );
  }
}