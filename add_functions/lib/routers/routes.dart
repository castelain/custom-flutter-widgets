import 'package:add_functions/routers/router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String selectFunctionPage = '/select-function';
  static String listFunctionPage = '/list-function';
  static String warehouseQueryPage = '/warehouse-query';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundPageHandler;

    router.define(selectFunctionPage, handler: selectFunctionPageHandler);
    router.define(listFunctionPage, handler: listFunctionPageHandler);
    router.define(warehouseQueryPage, handler: warehouseQueryPageHandler);
  }
}
