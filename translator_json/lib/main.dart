import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:translator_json/add_const.dart';
import 'package:translator_json/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final data = await loadFileAndTranslateText();
  // print(data);

  // final data = AddConst.convertConstToJson(MyConst.dataConst);
  // print(data);

  final data = AddConst.changeFileConst(MyConst.dataJson);
  print(data);

  Clipboard.setData(ClipboardData(text: "$data"));
}

Future<String> loadFileAndTranslateText() async {
  final translator = GoogleTranslator();
  String data = await rootBundle.loadString('assets/vi.json');
  List<String> keys = [];
  List<String> values = [];

  final jsonResult = json.decode(data);
  jsonResult.forEach((i, value) {
    keys.add('$i');
    values.add('$value');
  });

  String stringToSave = '{';
  for (var i = 0; i < keys.length; i++) {
    String key = keys[i];
    String value = values[i];
    var text = await translateText(translator, value);
    stringToSave =
        '$stringToSave\"$key\":\"$text\"${i == keys.length - 1 ? '' : ','}';
  }
  return '$stringToSave}';
}

Future<String> translateText(GoogleTranslator translator, String input) async {
  final data = await translator.translate(input, to: 'en');
  return data.text;
}
