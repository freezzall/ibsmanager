import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibsmanager/data/performance.dart';
import 'package:ibsmanager/widgets/dateformat.dart';

class detailpage extends StatefulWidget {
  List list;
  detailpage({Key? key, required this.list}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  List _foundEmployees = [];
  List _initEmp = [];

  List<Widget> listItem(items){
    List<Widget> result = [];
    for (var value in items) {
      result.add(
        Card(
          color: value.szStatus == "SUCCESS" ? Colors.greenAccent : Colors.redAccent,
          margin: EdgeInsets.only(left: 20, bottom: 10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value.customer!.szId.toString(),
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Text(
                  value.customer!.szName.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                Text(
                  value.customer!.szAddress.toString(),
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Divider(),
                Text(
                  "Jam : ${dateFormat.timeOnly(value.dtmFinish.toString())}",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Text(
                  "Status : ${
                      value.bVisited! ? value.szStatus!.isNotEmpty ? value.szStatus.toString() : "NOT YET" : "FAILED"
                  }",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Divider(),
                Text(
                  "Latitude : ${ value.szLatitude }",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Text(
                  "Longitude : ${ value.szLongitude }",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ],
            )
          )
        )
      );
    }
    return result;
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _initEmp;
    } else {
      results = _foundEmployees
          .where((cust) =>
              cust.employee.szName.toString().toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              cust.employee.szId.toString().toLowerCase().contains(enteredKeyword.toLowerCase())
      ).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundEmployees = results;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundEmployees = widget.list;
    _initEmp = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.only(left: 5),
          child : TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                hintText: 'Search', suffixIcon: Icon(Icons.search),
                border: InputBorder.none
            ),
          ),
        ),
      )),
      body: Container(
        child: _foundEmployees.isNotEmpty ?ListView.builder(
          itemCount: _foundEmployees.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateFormat.dateOnly(_foundEmployees[index].dtmDoc),
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    Text(
                      _foundEmployees[index].employee!.szId! + " - " +
                      _foundEmployees[index].employee!.szName!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
                subtitle: Text(_foundEmployees[index].szDocId,
                    style: TextStyle(
                    color: Colors.black),
                ),
                children: listItem(widget.list[index].items),
              );
            }
        ) :
        Center(
          child: Text(
            'No results found',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
