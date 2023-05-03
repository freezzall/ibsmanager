import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibsmanager/data/performance.dart';
import 'package:ibsmanager/providers/employeeProvider.dart';
import 'package:ibsmanager/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:ibsmanager/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../data/user.dart';

class messagepage extends StatefulWidget {
  user? objUser;
  messagepage({Key? key, this.objUser}) : super(key: key);

  @override
  State<messagepage> createState() => _messagepageState();
}

class _messagepageState extends State<messagepage> {
  TextEditingController pesanController = TextEditingController();
  TextEditingController filenameController = TextEditingController();
  List<String> selectedEmployee = [];
  Uint8List? stream;
  String? guid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    guid = Uuid().v1();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pesanController.dispose();
    filenameController.dispose();
  }

  List<Widget> checkList(){
    List<Widget> result = [];

    final employees = Provider.of<employeeProvider>(context,listen: false);
    employees.getData(context, widget.objUser!.szId);

    for (var v in employees.model) {
      result.add(
          Card(
            child: CheckboxListTile(
              title: Text(v.szEmployeeNm.toString()),
              value:  selectedEmployee.where((element) => element.contains(v.szEmployeeId.toString())).isEmpty ? false : true,
              onChanged: (bool? newValue) {

                setState(() {
                  if(newValue!){
                    selectedEmployee.add('{"szEmployeeId" : "' +v.szEmployeeId.toString() + '"}');
                  }else{
                    selectedEmployee.remove('{"szEmployeeId" : "' +v.szEmployeeId.toString() + '"}');
                  }
                });
                print(selectedEmployee.toString());
              },
            ),
          )
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final employees = Provider.of<employeeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: employees.loading ? loading() : Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                labelText: "Pesan",
                labelStyle: TextStyle(color: Colors.black),
              ),
              controller: pesanController,
              onChanged: (v){
                // setState(() {
                //   pesanController.text = v;
                // });
                // pesanController.selection = TextSelection.fromPosition(TextPosition(offset: pesanController.text.length));
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                labelText: "File name",
                labelStyle: TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  color: Colors.blue,
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      setState(() {
                        filenameController.text = result.files.single.name;
                        stream = file.readAsBytesSync();
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                  icon: Icon(Icons.file_open),
                ),
              ),
              controller: filenameController,
              onChanged: (v){
                setState(() {
                  filenameController.text = v;
                });
              },
            ),
            SizedBox(height: 10,),
            Text("Kirim Ke :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ...checkList(),
            Spacer(),
            MaterialButton(
              onPressed: () async{

                if(pesanController.text.isNotEmpty) {
                  String pass = '{"'
                      'szId" : "${widget.objUser!.szId}",'
                      '"szMessage" : "${pesanController.text}",'
                      '"items" : $selectedEmployee'
                      '}';

                  final response = await http.post(
                    Uri.parse(await constant.szAPI() + 'MgrSubmitMessage'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: pass,
                  );

                  if(response.statusCode == 200) {
                    Map<String, dynamic> json = jsonDecode(response.body);
                    String s = json["szMessage"];
                    int idx = s.indexOf(":");
                    guid = s.substring(idx + 1).trim();
                  }

                  print(guid);

                  final uri = Uri.parse(await constant.szAPI() + 'UploadFileMessage?szFileName=${filenameController.text}');
                  var request = new http.MultipartRequest('POST', uri);
                  final httpImage = http.MultipartFile.fromBytes('stream', stream!);
                  request.files.add(httpImage);
                  final response2 = await request.send();

                  final response3 = await http.post(
                    Uri.parse(await constant.szAPI() + 'UploadFileMessageDone?'
                        'szId=${guid}'
                        '&'
                        'szFileName=${filenameController.text}'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: null,
                  );

                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "Berhasil",
                      widget: Text("Pesan anda telah terkirim."),
                    onConfirmBtnTap: (){
                        Navigator.pop(context);
                        setState(() {
                          pesanController.text = "";
                          filenameController.text = "";
                          selectedEmployee.clear();
                        });

                    }
                  );

                  print(jsonDecode(response3.body)["szMessage"]);
                }else{
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      title: "Gagal",
                      widget: Text("Harap isikan pesan terlebih dulu.")
                  );
                }
              },
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text("SUBMIT", style: TextStyle(color: Colors.white),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
