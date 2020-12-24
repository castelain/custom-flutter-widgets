import 'package:add_functions/pages/list_function_page.dart';
import 'package:add_functions/pages/not_found_page.dart';
import 'package:add_functions/pages/select_function_page.dart';
import 'package:add_functions/pages/warehouse_query_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler selectFunctionPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SelectFunctionPage();
});

Handler listFunctionPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListFunctionPage();
});

Handler warehouseQueryPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WarehouseQuery();
});

Handler notFoundPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NotFoundPage();
});
