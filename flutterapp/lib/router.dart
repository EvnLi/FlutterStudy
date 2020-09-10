import 'package:flutter/material.dart';
import 'package:flutterapp/util/router_util.dart';
import 'package:flutterapp/Interface/interface.dart';
import 'package:flutterapp/util/toast_util.dart';
import 'package:flutterapp/stream/stream_builder.dart';
import 'package:flutterapp/widget/text_field.dart';
import 'package:flutterapp/Interface/interface.dart';
import 'package:flutterapp/Animation/slide_transition.dart';
import 'package:flutterapp/Area/safe_area.dart';
import 'package:flutterapp/Notifier/ValueNotifier.dart';
import 'package:flutterapp/Animation/Animation.dart';
import 'package:flutterapp/Animation/SizeColor.dart';
import 'package:flutterapp/ScrollView/custom_sv.dart';
import 'package:flutterapp/bloc/counter_page.dart';
import 'package:flutterapp/bloc/counter_theme.dart';
import 'package:flutterapp/Collect/collect.dart';

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

  static Route<dynamic> generateRoute(RouteSettings settings) {
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
