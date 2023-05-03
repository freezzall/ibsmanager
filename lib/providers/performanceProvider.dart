import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../data/performance.dart';
import 'package:http/http.dart' as http;
import 'package:ibsmanager/constant/constant.dart';

class PerformanceProvider with ChangeNotifier {
  OResult model = OResult();
  bool loading = false;

  getData(context, szId) async{
    loading = true;
    model = await getSingleData(context, szId);
    loading = false;

    notifyListeners();
  }
}

Future<OResult> getSingleData(context, szId) async{
  OResult result = OResult();
  try{
    final response = await http.get(
      Uri.parse(await constant.szAPI() + 'mgrPerformance'
          + '?'
          +'szId=' + szId.toString()
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      String msg = json['szMessage'];

      if (json['szStatus'] == "success") {
        var data = json['oResult'];
        result = OResult.fromJson(data);
      }else{
        print(msg);
      }
    }
  }catch(e){
    print(e);
  }
  return result;
}