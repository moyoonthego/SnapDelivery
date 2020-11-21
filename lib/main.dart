import 'dart:io';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'shared-assets/custom_widgets.dart';
import 'constants.dart' as Constants;
import 'dart:async';

void main() {
  runApp(MyApp());
}

// testing class for search
class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

// testing search for searchbar
Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 1, milliseconds: 500));
  return List.generate(search.length, (int index) {
    return Post(
      "Title : $search $index",
      "Description :$search $index",
    );
  });
}

// testing item found for search bar
Widget itemfound(dynamic post, int index) {
  return ListTile(
    title: Text(post.title),
    subtitle: Text(post.description),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: "Euclid Circular B"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  update() {}

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    PanelController pc = new PanelController();
    SearchBarController sb = new SearchBarController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: SlideUpView(
            controller: pc,
            title: "SORT & FILTER",
            popupchild: Column(children: [
              GoogleButton(onclick: () => {}),
            ]),
            child: ListView(children: <Widget>[
              Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Invoke "debug painting" (press "p" in the console, choose the
                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  // to see the wireframe for each widget.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ItemTile(
                      imagesrc: AssetImage('lib/assets/images/pinch.png'),
                      label: "McChicken Nuggets..",
                      price: 101.39,
                    ),
                    StyledTextField(
                      hint: 'First Name',
                      icon: Icon(Icons.person, color: Constants.DARKGRAY),
                    ),
                    FacebookButton(onclick: () => {}),
                    StoreTile(
                      imagesrc: AssetImage('lib/assets/images/pinch.png'),
                      storename: 'McDonalds',
                      address: '251 Gleave Terrace, Eglinton Rd. East',
                      rating: 3.7,
                      strdeliverytime: "25-35 min",
                      deliveryprice: 5.99,
                    ),
                    PinchButton(
                      buttonText: "Click for slide out menu",
                      onclick: () {
                        if (pc.isPanelClosed || !pc.isPanelShown) {
                          pc.show();
                          pc.open();
                        }
                      },
                    ),
                    ProfilePicture(
                        imagesrc: AssetImage('lib/assets/images/pinch.png')),
                    StyledMapView(
                      location: LatLng(44.161310, -77.484320),
                    ),
                    BannerPhoto(
                        imagesrc: AssetImage('lib/assets/images/pinch.png')),
                    PinchButton(buttonText: "Get Started", onclick: () => {}),
                    ProgressBar(value: 0.5),
                    PinchButtonWhite(buttonText: "Log In", onclick: () => {}),
                    DoubleSlideBar(start: 10, end: 150),
                    PinchButtonSwitch(
                        buttonText: "This is disabled",
                        icon: Icon(Icons.location_pin)),
                    MenuButton(buttonText: "Edit Account", onclick: () => {}),
                    RatingSlider(),
                    SlideOutDelete(
                        deleteActivity: () => {},
                        undoActivity: () => {},
                        listWidgets: [
                          PinchButtonSwitch(
                              buttonText: "Swipe me!!",
                              icon: Icon(Icons.location_pin))
                        ]),
                    DeliveryToggle(),
                    Container(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 180.0),
                        child: CounterToggle()),
                  ],
                ),
              )
            ] // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
