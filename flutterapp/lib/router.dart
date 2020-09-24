import 'package:flutter/material.dart';
import 'package:flutterapp/DB/db_list.dart';
import 'package:flutterapp/TestWidget/test_widget_page.dart';
import 'package:flutterapp/util/public_header.dart';

class FSRouter {
  static const String animationDemo = "animationDemo";
  static const String sizeColor = "sizeColor";
  static const String safeArea = "safeArea";
  static const String valueNotifierWidget = "valueNotifierWidget";
  static const String customSV = "customSV";
  static const String streamFile = "streamFile";
  static const String textFieldDemo = "textFieldDemo";
  static const String interface = "interface";
  static const String slideTransition = "slideTransition";
  static const String collect = "collect";
  static const String raisedButton = "raisedButton";
  static const String testWidgetPage = "testWidgetPage";
  static const String dbList = "dbList";
  static const String addUser = "addUser";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("***settings.arguments = ${settings.arguments}****");
    switch (settings.name) {
      case animationDemo:
        return Right2LeftRouter(child: AnimationDemo());
        break;
      case sizeColor:
        return Right2LeftRouter(child: SizeColor());
        break;
      case safeArea:
        return Right2LeftRouter(child: SafeAreaPage());
        break;
      case valueNotifierWidget:
        return Right2LeftRouter(child: ValueNotifierWidget());
        break;
      case customSV:
        return Right2LeftRouter(child: CustomSV());
        break;
      case streamFile:
        return Right2LeftRouter(child: StreamBuilderPage());
        break;
      case textFieldDemo:
        return Right2LeftRouter(child: TVDemoPage());
        break;
      case interface:
        return Right2LeftRouter(child: InterfacePage());
        break;
      case slideTransition:
        return Right2LeftRouter(child: SlideTransitionPage());
        break;
      case collect:
        return Right2LeftRouter(child: CollectPage());
        break;
      case raisedButton:
        return Right2LeftRouter(child: RaisedButtonPage());
        break;
      case testWidgetPage:
        return Right2LeftRouter(child: TestWidgetPage());
        break;
      case dbList:
        return Right2LeftRouter(child: DBList());
        break;
      case addUser:
        return Right2LeftRouter(
            child: AddUser(
          id: settings.arguments,
        ));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
