import 'dart:convert';

import 'package:translator_json/const.dart';

class AddConst {
  static String convertConstToJson(String data) {
    String removeText = data.replaceAll('static const String ', '');
    String removeNewLine = removeText.replaceAll('\n', '');
    String removeCharString = removeNewLine.replaceAll('\'', '');
    List<String> subStrings = removeCharString.split(';');
    String result = '{';
    for (var i = 0; i < subStrings.length; i++) {
      final obj = subStrings[i];
      if (obj.isEmpty) {
        continue;
      }
      List<String> subObj = obj.split(' = ');
      result =
          '$result\"${'${MyConst.path}${subObj[0].trim()}'}\":\"${subObj.length >= 2 ? subObj[1].trim() : ''}\"${i == subStrings.length - 1 ? '' : ','}';
    }
    return result;
  }

  static String changeFileConst(String data) {
    Map<String, dynamic> jsonData = json.decode(data);
    String result = '''''';

    jsonData.forEach((key, value) {
      String shortKey = key.replaceFirst('${MyConst.path}', '');
      result =
          '$result static const String $shortKey= \'\${_path}$shortKey\';\n';
    });
    return result;
  }
}
