import 'package:flutter/material.dart';
import 'package:flutterapp/Animation/Animation.dart';
import 'package:flutterapp/Animation/SizeColor.dart';
import 'package:flutterapp/Model/user_model.dart';
import 'package:flutterapp/Test/SafeArea.dart';
import 'package:flutterapp/Notifier/ValueNotifier.dart';
import 'package:flutterapp/util/toast_util.dart';
import 'package:flutterapp/ScrollView/custom_sv.dart';
import 'package:flutterapp/DB/user_db_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // TODO: add some code
    print("****debug11****");
    return Material(
      child: GestureDetector(
        onTap: () {
          insert();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            // return AnimationDemo();
            // return SizeColor();
            // return SafeArea();
            // return ValueNotifierWidget();
            // return CustomSV();
            // queryDB();
          }));
          // ToastUtil.show('节日来啦');
        },
        child: Container(
          color: Colors.red,
        ),
      ),
    );
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
