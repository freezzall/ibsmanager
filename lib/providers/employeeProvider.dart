import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../data/employee.dart';
import 'package:http/http.dart' as http;
import 'package:ibsmanager/constant/constant.dart';

class employeeProvider with ChangeNotifier {
  List<OResult> model = [];
  bool loading = false;

  getData(context, szId) async{
    loading = true;
    model = await getSingleData(context, szId);
    loading = false;

    notifyListeners();
  }
}

Future<List<OResult>> getSingleData(context, szId) async{
  List<OResult> result = [];
  try{
    final response = await http.get(
      Uri.parse(await constant.szAPI() + 'MgrGetSubEmployee'
          + '?'
          +'szId=' + szId.toString()
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      String msg = json['szMessage'];

      if (json['szStatus'] == "success") {
        List data = json['oResult'];
        for (var value in data) {
          result.add(OResult.fromJson(value));
        }
      }else{
        print(msg);
      }
    }
  }catch(e){
    print(e);
  }
  return result;
}