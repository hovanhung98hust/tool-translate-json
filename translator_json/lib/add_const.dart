import 'dart:convert';

import 'package:translator_json/const.dart';

class AddConst {
  static String convertConstToJson(String data) {
    String removeText = data.replaceAll('; static const String ', '');
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
          '$result ; static const String $shortKey= \'\${_path}$shortKey\';\n';
    });
    return result;
  }

  ///   ; static const String appName = 'G-CHAIN';
  ///   To  ; static const String appName = '{_path}appName';
  static String convertConstValueToConstKey(String value) {
  //   String value = '''; static const String appName = 'G-CHAIN';
  // ; static const String gStore = 'G-Chain';
  // ; static const String textCompany = 'Tech company';''';

    String result = '';
    List<String> subStrings = value.split(';');
    int i = 0;
    for (String obj in subStrings) {
      if(obj.length<10){
        continue;
      }
      String key = obj.replaceAll('\n  ', '').split(' ')[3];
      i++;
      if(result.isEmpty){
        result = '\'static const String $key\' = \'\${_path}$key\';';
      }else{
        result = '$result\n static const String $key = \'\${_path}$key\';';
      }

    }
    return result;
  }
}
