import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:missfortune/maingame.dart';
import 'package:missfortune/minoblock.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  double _blocksize = 50.0;
  double _minimumblocksize = 15.0;
  Offset position;
  Offset mainPosition;
  var setReverse = true;
  List<MinoBlock> minoList;
  MinoBlock widgetMino;
  Widget widgetMino2;
  Widget widgetMino3;
  var widgetMain;
  var mainGamesetColor;
  var backGdClr;
  List<Widget> wList;
  var isOnAccept;

  List<Widget> blocks;
  @override
  void initState() {
    super.initState();
    minoList = List<MinoBlock>();
    wList = List<Widget>();
    blocks = List<Widget>();
    minoList.add(MinoBlock(_minimumblocksize, MinoType.BLOCK_Z_MINO));
    minoList.add(MinoBlock(_minimumblocksize, MinoType.BLOCK_T_MINO));
    minoList.add(MinoBlock(_minimumblocksize, MinoType.BLOCK_L_MINO));
    minoList.add(MinoBlock(_minimumblocksize, MinoType.BLOCK_I_MINO));
    minoList.add(MinoBlock(_minimumblocksize, MinoType.BLOCK_O_MINO));

    print("INTHE" + minoList.length.toString() + minoList.toString());
    // minoList.add(MinoBlock(
    //     _blocksize, MinoType.values[Random().nextInt(MinoType.values.length)]));
    // minoList.add(MinoBlock(
    //     _blocksize, MinoType.values[Random().nextInt(MinoType.values.length)]));
    // minoList.add(MinoBlock(
    //     _blocksize, MinoType.values[Random().nextInt(MinoType.values.length)]));
    // minoList.add(MinoBlock(
    //     _blocksize, MinoType.values[Random().nextInt(MinoType.values.length)]));
    // minoList.add(MinoBlock(
    //     _blocksize, MinoType.values[Random().nextInt(MinoType.values.length)]));

    // minoList.add(MinoBlock(_blocksize, MinoType.BLOCK_T_MINO,minoColor: Colors.black));

    widgetMino =
        MinoBlock(_blocksize, MinoType.BLOCK_T_MINO, minoColor: Colors.black);
    widgetMino2 =
        MinoBlock(_blocksize, MinoType.BLOCK_T_MINO, minoColor: Colors.black)
            .getBlock;
    widgetMino3 =
        MinoBlock(_blocksize, MinoType.BLOCK_T_MINO, minoColor: Colors.black26)
            .getBlock;
    widgetMain = MainGame(_blocksize);
    mainGamesetColor = Colors.black12;
    backGdClr = Colors.indigo.shade200;
    mainPosition = Offset(130.0, 215.0);
    position = Offset(0.0, 0.0);
    getMinos();
  }

  void resetMainGame() {
    widgetMain = MainGame(_blocksize);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      resetMainGame();
    });
  }

  void setWList(idx, Widget w) {
    wList[idx] = w;
  }

  List<Widget> getMinos() {
    if (minoList.isEmpty) {
      // wList.add(Container(
      //   width: 10,
      //   height: 10,
      //   color: Colors.blue,
      // ));
      return wList;
    }
    wList.clear();
    for (var i = 0; i < minoList.length; i++) {
      blocks.add(minoList[i].getBlock);
      wList.add(Container(
        width: (_minimumblocksize + 5) * 3,
        height: (_minimumblocksize + 5) * 3,
        // color: Colors.white38,
        decoration: new BoxDecoration(
            border: new Border.all(width: 2.0, color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            // alignment: Alignment.center,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(),
              Positioned(
                left: minoList[i].getPosition.dx,
                top: minoList[i].getPosition.dy,
                // child: GestureDetector(
                // onDoubleTap: () {
                //     minoList[i].rotatePoint();
                //     blocks[i] = minoList[i].getBlock;
                // },
                child: Draggable(
                  child: blocks[i], // minoList[i].getBlock,
                  feedback: //blocks[i],
                      MinoBlock(_blocksize, minoList[i].getType)
                          .getBlock, // 드래그 중 표시할 item
                  childWhenDragging: minoList[i].getBlock, // 드래그 중 기존 위치
                  data: minoList[i], // 드랍 시 제공할 데이터
                  onDragEnd: (details) async {
                    minoList[i].position =
                        Offset(details.offset.dx, details.offset.dy);
                    if (isOnAccept) {
                      if (minoList[i].getPosition.dx - mainPosition.dx > 40.0) {
                        minoList[i].movePoint(MinoDirection.RIGHT);
                      }
                      if (minoList[i].getPosition.dx - mainPosition.dx > 90.0) {
                        minoList[i].movePoint(MinoDirection.RIGHT);
                      }
                      if (minoList[i].getPosition.dy - mainPosition.dy > 40.0) {
                        minoList[i].movePoint(MinoDirection.BOTTOM);
                      }
                      if (minoList[i].getPosition.dy - mainPosition.dy > 90.0) {
                        minoList[i].movePoint(MinoDirection.BOTTOM);
                      }
                      var dataIdx = 0;
                      widgetMain.mainPoint.forEach((e) {
                        widgetMain.mainPoint[dataIdx] =
                            e + minoList[i].getPoint[dataIdx++];
                      });
                      dataIdx = 0;
                      widgetMain.mainPoint.forEach((e) {
                        widgetMain.initColor[dataIdx] = Color.fromRGBO(
                            mainGamesetColor.red,
                            mainGamesetColor.green,
                            mainGamesetColor.blue,
                            widgetMain.mainPoint[dataIdx++]);
                      });

                      minoList[i] = new MinoBlock(
                          _minimumblocksize,
                          MinoType.values[
                              Random().nextInt(MinoType.values.length)]);
                      blocks[i] = minoList[i].getBlock;
                      isOnAccept = false;
                      print('onDragEnd');
                    }
                  },

                  //(){
                  //   setState(() {
                  //     print('onDragCompleted');
                  //   });
                  // },
                  // ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    print(':::::::::::::::::::::::::::' + wList.toList().toString());
    return wList;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      backgroundColor: backGdClr,
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 500.0,
              color: Colors.white38,
              child: Row(
                children: <Widget>[
                  SizedBox(),
                  SizedBox(),
                  // Switch(
                  //     value: setReverse,
                  //     onChanged: (b) {
                  //       super.setState(() {
                  //         setReverse = b;
                  //       //   if (setReverse) {
                  //       //     mainGamesetColor = Colors.white;
                  //       //     backGdClr = Colors.black;
                  //       //     widgetMino.setBgColor = Colors.white;
                  //       //   } else {
                  //       //     mainGamesetColor = Colors.black12;
                  //       //     backGdClr = Colors.white;
                  //       //     widgetMino.setBgColor = Colors.black;
                  //       //   }
                  //       });
                  //     }),
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Stack(
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
              // mainAxisAlignment: MainAxisAlignment.center,
              alignment: Alignment.center,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DragTarget(
                        onAccept: (MinoBlock data) {
                          // setState(() {
                          isOnAccept = true;
                          print('offset' + position.toString());
                          print('main:' + widgetMain.mainPoint.toString());
                          wList = getMinos();
                          print('onAccept');
                          // widgetMain.initColor = [
                          //   Colors.red,Colors.red,Colors.red,
                          //   Colors.red,Colors.red,Colors.red,
                          //   Colors.red,Colors.red,Colors.red
                          //   ];
                          // List<Color>()..addAll(widgetMain.getInitColor.getRange(0,8))..add(Colors.red);
                          // });
                          print(data.getPoint.toString() +
                              ' ' +
                              widgetMain.initColor.toList().toString());
                        },
                        onWillAccept: (MinoBlock data) {
                          widgetMain.initColor = List<Color>()
                            ..addAll(widgetMain.initColor.getRange(0, 8))
                            ..add(Colors.black);
                          isOnAccept = false;
                          return true;
                        },
                        builder: (context, List<dynamic> cd, rd) {
                          return widgetMain.getBuild();
                        },
                      ),
                    ),
                    // Text(
                    //   'You have pushed the button this many timesdd5:',
                    // ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    //Draggable Widget  Target : DragTarget
                    // Positioned(
                    //   left: position.dx,
                    //   top: position.dy,
                    //   child: Draggable(
                    //     child: widgetMino.getBlock,
                    //     feedback: widgetMino2, // 드래그 중 표시할 item
                    //     childWhenDragging: widgetMino3, // 드래그 중 기존 위치
                    //     data: widgetMino, // 드랍 시 제공할 데이터
                    //     onDragEnd: (details) {
                    //       position =
                    //           Offset(details.offset.dx, details.offset.dy);
                    //       print('aaaaaaaaaaaaa : ' + widgetMain.toString());
                    //       print('??' + position.toString());
                    //       if (isOnAccept) {
                    //         print('position.dx -  mainPosition.dx = ' +
                    //             (position.dx - mainPosition.dx).toString());
                    //         if (position.dx - mainPosition.dx > 40.0) {
                    //           print('right!');
                    //           widgetMino.movePoint(MinoDirection.RIGHT);
                    //         }
                    //         if (position.dx - mainPosition.dx > 90.0) {
                    //           widgetMino.movePoint(MinoDirection.RIGHT);
                    //         }
                    //         if (position.dy - mainPosition.dy > 40.0) {
                    //           print('bottom!');
                    //           widgetMino.movePoint(MinoDirection.BOTTOM);
                    //         }
                    //         if (position.dy - mainPosition.dy > 90.0) {
                    //           widgetMino.movePoint(MinoDirection.BOTTOM);
                    //         }
                    //         print('toStr : ' + widgetMino.getPoint.toString());
                    //         var dataIdx = 0;
                    //         widgetMain.mainPoint.forEach((e) {
                    //           widgetMain.mainPoint[dataIdx] =
                    //               e + widgetMino.getPoint[dataIdx++];
                    //         });
                    //         dataIdx = 0;
                    //         widgetMain.mainPoint.forEach((e) {
                    //           widgetMain.initColor[dataIdx] = Color.fromRGBO(
                    //               mainGamesetColor.red,
                    //               mainGamesetColor.green,
                    //               mainGamesetColor.blue,
                    //               widgetMain.mainPoint[dataIdx++]);
                    //         });
                    //       }
                    //       // if applicable, don't forget offsets like app/status bar =>+ - appBarHeight - statusBarHeight;
                    //       // _yPos = ;
                    //       // });
                    //     },
                    //     // onDraggableCanceled: (Velocity velocity, Offset offset){
                    //     //   setState(() => position = offset);
                    //     // },
                    //     // dragStartBehavior: DragStartBehavior.start,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...wList,
                        // Container(
                        //   width: 5,
                        //   height: 5,
                        //   color: Colors.red,
                        // ),
                      ],
                      // mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
