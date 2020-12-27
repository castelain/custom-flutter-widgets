import 'package:add_functions/pages/home_page.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/style/global.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import './routers/application.dart';
import './routers/routes.dart';

void main() {
  var functionListProvide = FunctionListProvide();
  var providers = Providers();
  providers.provide(Provider.value(functionListProvide));

  runApp(
    ProviderNode(child: MyApp(), providers: providers),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        child: MaterialApp(
          title: 'Add Functions',
          theme: ThemeData(
            backgroundColor: FunctionSelectionStyle.backgroundColor,
            // platform: TargetPlatform.iOS,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Application.router.generator,
          home: HomePage(),
        ));
  }
}
