import 'package:flutter/material.dart';

class ItemListWeather extends StatelessWidget {

  final String temp;
  final String hour;
  final bool day;

  const ItemListWeather({Key key, this.temp, this.hour, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        width: 70,
        decoration: BoxDecoration(
          color: day == true ? Theme.of(context).accentColor :Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(17)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Text(hour,style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold
            ),),
            Padding(padding: EdgeInsets.only(top: 5),
            child: Text(temp[0]+temp[1].replaceAll(".", "") +'°C',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            )
          ],
        ),
      ),
    );
  }
}