import 'dart:async';
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ibsmanager/data/performance.dart';
import 'package:ibsmanager/page/detailpage.dart';
import 'package:ibsmanager/providers/performanceProvider.dart';
import 'package:ibsmanager/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../data/user.dart';

class homePage extends StatefulWidget {
  user? objUser;
  homePage({Key? key, this.objUser}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  DateTime now = new DateTime.now();
  DateTime date = new DateTime.now();
  Color c = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final performances = Provider.of<PerformanceProvider>(context, listen: false);
    performances.getData(context, widget.objUser!.szId);
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
  }

  Future dialog(context, title, onTap) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      title: "Confirmation",
      widget: Text(
        title
      ),
      onConfirmBtnTap: onTap
    );
  }

  String getStringList(data){
    List<String> list = data;
    String result0 = list[0].toString();
    String result1 = list[1].toString();
    String result2 = list[2].toString();
    String result3 = list[3].toString();
    String result4 = list[4].toString();
    String result5 = list[5].toString();

    String result = result0 + "\n"
        +result1 + "\n"
        +result2 + "\n"
        +result3 + "\n"
        +result4 + "\n"
        +result5 + "\n"
    ;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final performances = Provider.of<PerformanceProvider>(context);

    return Scaffold(
      backgroundColor: c,
      body: Container(
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(100),
        //       bottomLeft: Radius.circular(300)
        //     ),
        //     image: DecorationImage(
        //         alignment: Alignment.topLeft,
        //         image: AssetImage("images/header.png"),
        //         fit: BoxFit.fitWidth,
        //         opacity: 0.5
        //     )
        // ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: MediaQuery.of(context).size.width,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Halo, ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20),),
                  Text(widget.objUser!.szName.toString(), style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Cabang ", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text(widget.objUser!.szBranchNm.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: performances.loading ?
          loading() :
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Month To Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Divider(thickness: 2,),
                        Text(
                          getStringList(performances.model.monthToDatePerformance!.monthToDatePerformance),
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => detailpage(list: performances.model.monthToDatePerformance!.details!)),
                              );
                            },
                            color: c,
                            child: Text(
                              "View Detail",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today Performance",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Divider(thickness: 2,),
                          Text(
                            getStringList(performances.model.todayPerformance!.todayPerformance),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: MaterialButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => detailpage(list: performances.model.todayPerformance!.details!)),
                                );
                              },
                              color: Colors.blueAccent,
                              child: Text(
                                "View Detail",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

