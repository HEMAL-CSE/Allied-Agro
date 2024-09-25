import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/components/CustomTextField.dart';

class CalfBirth extends StatefulWidget {
  const CalfBirth({super.key});

  @override
  State<CalfBirth> createState() => _CalfBirthState();
}

class _CalfBirthState extends State<CalfBirth> {

  String? shed_id;
  String? seat_id;
  String? calf_id;

  String? edit_shed_id;
  String? edit_seat_id;
  String? edit_calf_id;

  List sheds = [];
  List seats = [];

  void getSheds() async {
    final url = Uri.parse('http://68.178.163.174:5007/breeding/sheds');

    Response res = await get(url);

    setState(() {
      sheds = jsonDecode(res.body);
    });
  }

  void getSeats(id) async {
    final url = Uri.parse('http://68.178.163.174:5007/breeding/seats?shed_id=${id}');

    Response res = await get(url);

    setState(() {
      seats = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSheds();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'জন্ম তথ্য',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
              child: InputDecorator(
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value: shed_id,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        hint: Text('শেড নাম্বার সিলেক্ট করুন'),
                        items: [
                          ...sheds.map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                child: Text(data['name']), value: data['id'].toString());
                          }).toList(),
                        ],

                        onChanged: (value) {
                          print("selected Value $value");
                          getSeats(value);
                          setState(() {
                            shed_id = value!;
                          });
                        }),


                  )

                // CustomTextField()
              ),
            ),

            Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
              child: InputDecorator(
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value: seat_id,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        hint: Text('সিট নাম্বার সিলেক্ট করুন'),
                        items: [
                          ...seats.map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                child: Text(data['name']), value: data['id'].toString());
                          }).toList(),
                        ],

                        onChanged: (value) {
                          print("selected Value $value");

                          setState(() {
                            seat_id = value!;
                          });
                        }),


                  )

                // CustomTextField()
              ),
            ),

            Container(
                margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                child: CustomTextField(controller: calf_id, hintText: "বাছুর নাম্বার দিন", obscureText: false, textinputtypephone: true)),

            Container( padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(04),
              child: ElevatedButton(onPressed: (){
                // addData();
              }, child: const Text("জমা দিন", style: TextStyle(fontSize: 15),)),
            ),

            SizedBox(height: 20,),

            Column(
              children: [
                Container(
                  height: 200,
                  child: Card(
                    elevation: 5,

                    color: Colors.green[50],
                    child: Row(

                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                                child: Text('বাছুর নাম্বার: 11', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                                child: Text('শেড নাম্বার: 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                                child: Text('সিট নাম্বার: 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                              ),


                            ]
                        ),
                        Spacer(),

                        Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {


                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {

                                      return StatefulBuilder(
                                          builder: (context, setStateSB) {
                                            return FractionallySizedBox(
                                              heightFactor: 0.9,
                                              // height: 200,
                                              // color: Colors.amber,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
                                                    child: InputDecorator(
                                                        decoration: InputDecoration(
                                                          border:
                                                          OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(15.0)),
                                                          contentPadding: const EdgeInsets.all(10),
                                                        ),
                                                        child: DropdownButtonHideUnderline(
                                                          child: DropdownButton<String>(
                                                              isDense: true,
                                                              value: edit_shed_id,
                                                              isExpanded: true,
                                                              menuMaxHeight: 350,
                                                              hint: Text('Select Shed ID'),
                                                              items: [
                                                                ...sheds.map<DropdownMenuItem<String>>((data) {
                                                                  return DropdownMenuItem(
                                                                      child: Text(data['name']), value: data['id'].toString());
                                                                }).toList(),
                                                              ],

                                                              onChanged: (value) {
                                                                print("selected Value $value");
                                                                getSeats(value);
                                                                setStateSB(() {
                                                                  edit_shed_id = value!;
                                                                });
                                                              }),


                                                        )

                                                      // CustomTextField()
                                                    ),
                                                  ),

                                                  Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
                                                    child: InputDecorator(
                                                        decoration: InputDecoration(
                                                          border:
                                                          OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(15.0)),
                                                          contentPadding: const EdgeInsets.all(10),
                                                        ),
                                                        child: DropdownButtonHideUnderline(
                                                          child: DropdownButton<String>(
                                                              isDense: true,
                                                              value: edit_seat_id,
                                                              isExpanded: true,
                                                              menuMaxHeight: 350,
                                                              hint: Text('Select Seat ID'),
                                                              items: [
                                                                ...seats.map<DropdownMenuItem<String>>((data) {
                                                                  return DropdownMenuItem(
                                                                      child: Text(data['name']), value: data['id'].toString());
                                                                }).toList(),
                                                              ],

                                                              onChanged: (value) {
                                                                print("selected Value $value");

                                                                setStateSB(() {
                                                                  edit_seat_id = value!;
                                                                });
                                                              }),


                                                        )

                                                      // CustomTextField()
                                                    ),
                                                  ),

                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                      child: CustomTextField(controller: edit_calf_id, hintText: "বাছুর নাম্বার দিন", obscureText: false, textinputtypephone: true)),


                                                  Container( padding: EdgeInsets.symmetric(horizontal: 80, vertical: 08),
                                                    margin: EdgeInsets.all(04),
                                                    child: ElevatedButton(onPressed: (){
                                                      // editData();
                                                      Navigator.pop(context);
                                                    }, child: const Text("জমা দিন")),
                                                  ),

                                                  // SizedBox(height: MediaQuery.of(context).viewInsets.bottom+20,)

                                                ],
                                              ),
                                            );
                                          }
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.edit, color: Colors.green[500],),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Do you want to delete this?'),
                                      // content: const Text('AlertDialog description'),
                                      actions: <Widget>[

                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: ()
                                          {
                                            // deleteData(i['id']);
                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Icon(Icons.delete, color: Colors.red[300],),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            )

          ],
        ),
      ),
    );
  }
}
