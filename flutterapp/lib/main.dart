import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/Model/user_model.dart';
import 'package:flutterapp/util/toast_util.dart';
import 'package:flutterapp/DB/user_db_provider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutterapp/router.dart';
import 'package:flutterapp/Collect/collect.dart';

//bloc
import 'package:flutterapp/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      onGenerateRoute: FSRouter.generateRoute,
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

  @required
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _connectStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _streamSubscription;
  List<String> dataList = [
    "animationDemo",
    "sizeColor",
    "safeArea",
    "valueNotifierWidget",
    "customSV",
    "streamFile",
    "textFieldDemo",
    "interface",
    "slideTransition",
    "collect"
  ];

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectStatus);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e.toString());
    }
    return _updateConnectStatus(result);
  }

  Future<void> _updateConnectStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        String wifiName, wifiBSSID, wifiIP;

        try {
          if (!kIsWeb && Platform.isIOS) {
            LocationAuthorizationStatus status =
                await _connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status =
                  await _connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiName = await _connectivity.getWifiName();
            } else {
              wifiName = await _connectivity.getWifiName();
            }
          } else {
            wifiName = await _connectivity.getWifiName();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiName = "Failed to get Wifi Name";
        }

        try {
          if (!kIsWeb && Platform.isIOS) {
            LocationAuthorizationStatus status =
                await _connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status =
                  await _connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiBSSID = await _connectivity.getWifiBSSID();
            } else {
              wifiBSSID = await _connectivity.getWifiBSSID();
            }
          } else {
            wifiBSSID = await _connectivity.getWifiBSSID();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiBSSID = "Failed to get Wifi BSSID";
        }

        try {
          wifiIP = await _connectivity.getWifiIP();
        } on PlatformException catch (e) {
          print(e.toString());
          wifiIP = "Failed to get Wifi IP";
        }

        setState(() {
          _connectStatus = '$result\n'
              'Wifi Name: $wifiName\n'
              'Wifi BSSID: $wifiBSSID\n'
              'Wifi IP: $wifiIP\n';
        });
        break;
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectStatus = result.toString());
        ToastUtil.show(result.toString());
        break;
      default:
        setState(() => _connectStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("****debug11****");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: new ListView.builder(
        padding: new EdgeInsets.all(5.0),
        itemCount: dataList.length,
        itemExtent: 80,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                changePage(dataList[index], context);
              },
              child: new Container(
                child: new Text(
                  "${dataList[index]}",
                  style: TextStyle(fontSize: 18),
                ),
              ));
        },
      ),
    );
    // return BlocProvider(
    //   create: (_) => ThemeCubit(),
    //   child: BlocBuilder<ThemeCubit, ThemeData>(
    //     builder: (_, theme) {
    //       return MaterialApp(
    //         theme: theme,
    //         home: BlocProvider(
    //           create: (_) => CounterBloc(),
    //           child: CounterPage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
    // return Material(
    //   child: GestureDetector(
    //     onTap: () {
    //       // insert();
    //       Navigator.push(context, MaterialPageRoute(builder: (context) {
    // // return AnimationDemo();
    // // return SizeColor();
    // // return SafeArea();
    // // return ValueNotifierWidget();
    // return CustomSV();
    //         // queryDB();
    //       }));
    //       // ToastUtil.show('节日来啦');
    //     },
    //     child: Container(
    //       color: Colors.red,
    //     ),
    //   ),
    // );
  }

  void changePage(String title, BuildContext context) {
    Navigator.pushNamed(context, title, arguments: "");
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   if (title == "AnimationDemo") {
    //     return AnimationDemo();
    //   } else if (title == "SizeColor") {
    //     return SizeColor();
    //   } else if (title == "SafeArea") {
    //     return SafeAreaPage();
    //   } else if (title == "ValueNotifierWidget") {
    //     return ValueNotifierWidget();
    //   } else if (title == "CustomSV") {
    //     return CustomSV();
    //   } else if (title == "StreamFile") {
    //     return StreamBuilderPage();
    //   } else if (title == "TextFieldDemo") {
    //     print("****TVDemo***");
    //     return TVDemoPage();
    //   } else if (title == "Interface") {
    //     return InterfacePage();
    //   } else if (title == "SlideTransition") {
    //     return SlideTransitionPage();
    //   }
    // }));
  }

  static insert() async {
    print('*****1111111**');
    UserDBProvider dbP = new UserDBProvider();
    UserModel model = new UserModel();
    model.id = 123456;
    model.userName = "小王";
    model.nick = "忘老五";
    await dbP.insert(model);

    print('*****2222222**');
    UserModel model1 = await dbP.getUserInfo(123456);
    print('*****333333**');
    print('id=${model1.id},username =${model1.userName},nick=${model1.nick}');
  }

  queryDB() async {
    UserDBProvider dbP = new UserDBProvider();
    UserModel model = await dbP.getUserInfo(123456);
    print('id=${model.id},username =${model.userName},nick=${model.nick}');
  }
}
