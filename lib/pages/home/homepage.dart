import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/pages/weather/weather_api.dart';
import 'package:flutter_app/pages/weather/util.dart' as util;

const pageTitle = 'Home';

class HomePage extends StatefulWidget {
  final String latitude,longitude;

  const HomePage({Key key, this.latitude, this.longitude}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String chosenCity;
  TextEditingController textController = TextEditingController();
  var formatData = DateFormat('EEEE, dd MMMM', 'en_EN');
  DateTime currentDateTime = DateTime.now();
  bool valueSwitch = false;
  bool visibleCity;
  String weatherState;
  String imageFilePath;

  @override
  void initState() {
    super.initState();
    visibleCity = true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle,
          style: TextStyle(
            fontSize: width * 0.065,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: width * 0.04),
                child: FutureBuilder(
                    future: getWeather(
                        util.appKey,
                        chosenCity == null
                            ? util.defaultCity
                            : chosenCity),
                    builder: (context, snapshot) {
                      Map jsonData = snapshot.data;
                      if (snapshot.hasData) {
                        weatherState = jsonData['weather'][0]['main'].toString();

                        switch(weatherState) {
                          case "Clear": {
                            imageFilePath = 'assets/images/clear.jpg';
                          }
                          break;
                          case "Clouds": {
                            imageFilePath = 'assets/images/clouds.jpg';
                          }
                          break;
                          case "Drizzle":
                          case "Rain": {
                            imageFilePath = 'assets/images/rain.jpg';
                          }
                          break;
                          case "Haze":
                          case "Fog":
                          case "Mist": {
                            imageFilePath = 'assets/images/fog.jpg';
                          }
                          break;
                          case "Snow": {
                            imageFilePath = 'assets/images/snow.jpg';
                          }
                          break;
                          case "Thunderstorm":
                          case "Tornado":  {
                            imageFilePath = 'assets/images/storm.jpg';
                          }
                          break;
                          default: {
                            imageFilePath = 'assets/images/default.jpg';
                          }
                          break;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visibleCity = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.location_on,
                                    size: width * 0.08,
                                  ),
                                ),
                                Visibility(
                                    visible: visibleCity,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          visibleCity = false;
                                        });
                                      },
                                      child: Text(
                                        '${jsonData['name']}',
                                        style: TextStyle(
                                            fontSize: width * 0.09, //40,
                                            fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    )),
                                Visibility(
                                    visible: !visibleCity,
                                    child: Expanded(
                                        child: TextField(
                                          autofocus: true,
                                          style: TextStyle(color: Theme.of(context).accentColor,),
                                          controller: textController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15)
                                              )
                                          ),
                                          onSubmitted: (_) {
                                            setState(() {
                                              if (textController.text == null ||
                                                  textController.text.isEmpty) {
                                              } else {
                                                chosenCity =
                                                    textController.text;
                                              }
                                              visibleCity = true;
                                            });
                                          },
                                        )
                                    )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.009,
                            ),
                            Text(
                              '${formatData.format(currentDateTime)}',
                              style: TextStyle(
                                  fontSize: width * 0.05,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Container(
                                  height: height * 0.25,
                                  width: width,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Positioned(
                                        //top: 10,
                                        child: Text(
                                          '${jsonData['main']['temp'].toString()[0]}' +
                                              '${jsonData['main']['temp'].toString()[1].replaceAll(".", "")}°',
                                          style: TextStyle(
                                              fontSize: width * 0.29,
                                              fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: width * 0.36,
                                        child: Row(
                                          children: <Widget>[
                                            Text('Min: ${jsonData['main']['temp_min']}°',
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text('/ Max: ${jsonData['main']['temp_max']}°',
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w300,
                                            ),
                                            )],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: width * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imageFilePath),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  weatherState,
                                  style: TextStyle(
                                    fontSize: width * 0.08,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Text(
                                'Choose a new city by pressing on the current city and typing in a new name.',
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visibleCity = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.location_on,
                                    size: width * 0.08,
                                  ),
                                ),
                                Visibility(
                                    visible: visibleCity,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          visibleCity = false;
                                        });
                                      },
                                      child: Text(
                                        'Not found.',
                                        style: TextStyle(
                                          fontSize: width * 0.08, //40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                                Visibility(
                                    visible: !visibleCity,
                                    child: Expanded(
                                        child: TextField(
                                          autofocus: true,
                                          style: TextStyle(color: Colors.black),
                                          controller: textController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15)
                                              )
                                          ),
                                          onSubmitted: (_) {
                                            setState(() {
                                              if (textController.text == null ||
                                                  textController.text.isEmpty) {
                                              } else {
                                                chosenCity =
                                                    textController.text;
                                              }
                                              visibleCity = true;
                                            });
                                          },
                                        )
                                    )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.009,
                            ),
                            Text(
                              '${formatData.format(currentDateTime)}',
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.1,
                            ),
                              Text('No data could be fetched. Please try a different city.',
                                  style: TextStyle(
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            SizedBox(
                              height: width * 0.17,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
