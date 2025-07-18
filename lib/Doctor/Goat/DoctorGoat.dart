import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/Doctor/Goat/DoctorGoatTreatment.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorGoat extends StatefulWidget {
  const DoctorGoat({super.key});

  @override
  State<DoctorGoat> createState() => _DoctorGoatState();
}

class _DoctorGoatState extends State<DoctorGoat> {
  List<dynamic> data = [];

  List doctors = [];

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user_id = prefs.getString('user_id');

    final url = Uri.parse('http://68.178.163.174:5008/doctors/goat/doctor?user_id=${user_id}');

    Response res = await get(url);

    print(jsonDecode(res.body));

    var resbody = jsonDecode(res.body);

    List result = resbody
        .fold({}, (previousValue, element) {
      Map val = previousValue as Map;
      // print(val);
      var id = element['goat_id'];
      if (!val.containsKey(id)) {
        val[id] = [];
      }
      element.remove('goat_id');
      val[id]?.add(element);
      return val;
    })
        .entries
        .map((e) => {e.key: e.value})
        .toList();

    print(result);


    setState(() {
      data = result;
    });

  }



  @override void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Goat',),
      body: ListView(
        children: [
          for(var i in data)
            GestureDetector(
              onTap: () {
                // print(i.keys[0]);
                Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorGoatTreatment(goat_id: i.keys.toList()[0],)));
              },
              child: Card(
                elevation: 5,
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.green[300]
                  ),
                  child: Column(
                    children: [
                      Text('goat ID: ${i.keys.toList()[0]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('${i[i.keys.toList()[0]][0]['disease_desc']}', style: TextStyle(fontSize: 15),),

                      i[i.keys.toList()[0]][0]['image_url'] != null && i[i.keys.toList()[0]][0]['image_url'] != '' ?
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                          shrinkWrap: true,
                          itemCount: i[i.keys.toList()[0]]!.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: i[i.keys.toList()[0]]!.length > 3 ? 3 : i[i.keys.toList()[0]]!.length
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(margin:EdgeInsets.all(5),child: CachedNetworkImage(imageUrl: i[i.keys.toList()[0]][index]['image_url'], errorWidget: (context, url, error) => Icon(Icons.error),));
                          })
                          : Text(''),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
