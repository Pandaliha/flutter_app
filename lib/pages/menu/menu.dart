import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            /*image: DecorationImage(
            image: AssetImage(""),
            fit: BoxFit.cover
            ),*/
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, MdiIcons.weatherPartlyCloudy, 'Weather', onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            }),
          ),
          getLine(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, MdiIcons.bookOpenPageVariant, 'Books', onTap: () {
              Navigator.pushReplacementNamed(context, '/books');
            }),
          ),
          getLine(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getListTile(context, MdiIcons.cog, 'Settings', onTap: () {
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
      leading: Icon(icon, size: 28.0,),
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      onTap: onTap,
    );
  }
}