import 'dart:convert';

import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/components/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class BiogasLabourPayment extends StatefulWidget {
  const BiogasLabourPayment({super.key});

  @override
  State<BiogasLabourPayment> createState() => _BiogasLabourPaymentState();
}

class _BiogasLabourPaymentState extends State<BiogasLabourPayment> {


  String? labour_id;

  TextEditingController payment = TextEditingController();


  String? edit_labour_id;

  TextEditingController editpayment = TextEditingController();

  List<dynamic> data = [];



  List<dynamic> labours = [];



  void getData() async {
    final url = Uri.parse('http://68.178.163.174:5008/biogas/labour_payment');

    Response res = await get(url);

    setState(() {
      data = jsonDecode(res.body);
    });
  }

  void getLabours() async {
    final url = Uri.parse('http://68.178.163.174:5008/biogas/labour');

    Response res = await get(url);

    setState(() {
      labours = jsonDecode(res.body);
    });
  }

  void addData() async {
    final url = Uri.parse('http://68.178.163.174:5008/biogas/labour_payment/add');
    Map body = {
      'labour_id': labour_id,
      'payment': payment.text,
    };

    Response res = await post(url, body: body);

    if(res.statusCode == 201){
      Fluttertoast.showToast(
          msg: "Submitted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }
    getData();

  }

  void editData(id) async {
    final url = Uri.parse('http://68.178.163.174:5008/biogas/labour_payment/edit?id=${id}');

    Map body = {
      'labour_id': edit_labour_id,
      'payment': editpayment.text,
    };

    Response res = await put(url, body: body);

    if(res.statusCode == 201){
      Fluttertoast.showToast(
          msg: "Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }
    getData();

  }

  void deleteData(id) async {
    final url = Uri.parse('http://68.178.163.174:5008/biogas/labour_payment/delete?id=${id}');

    Response res = await delete(url);

    if(res.statusCode == 201){
      Fluttertoast.showToast(
          msg: "Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }
    getData();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getLabours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'শ্রমিকদের বেতন',),
      body: ListView(
        children: [


          // Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
          //   child: InputDecorator(
          //       decoration: InputDecoration(
          //         border:
          //         OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(15.0)),
          //         contentPadding: const EdgeInsets.all(10),
          //       ),
          //       child: DropdownButtonHideUnderline(
          //         child: DropdownButton<String>(
          //             isDense: true,
          //             value: seat_id,
          //             isExpanded: true,
          //             menuMaxHeight: 350,
          //             hint: Text('Select Seat ID'),
          //             items: [
          //               ...seats.map<DropdownMenuItem<String>>((data) {
          //                 return DropdownMenuItem(
          //                     child: Text(data['name']), value: data['id'].toString());
          //               }).toList(),
          //             ],
          //
          //             onChanged: (value) {
          //               print("selected Value $value");
          //               getLabours(shed_id, value);
          //               setState(() {
          //                 seat_id = value!;
          //               });
          //             }),
          //
          //
          //       )
          //
          //     // CustomTextField()
          //   ),
          // ),



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
                      value: labour_id,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      hint: Text('শ্রমিক বাছাই করুন'),
                      items: [
                        ...labours.map<DropdownMenuItem<String>>((data) {
                          return DropdownMenuItem(
                              child: Text(data['name']), value: data['id'].toString());
                        }).toList(),
                      ],

                      onChanged: (value) {
                        print("selected Value $value");
                        setState(() {
                          labour_id = value!;
                        });
                      }),


                )

              // CustomTextField()
            ),
          ),

          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: payment, hintText: "বেতন", obscureText: false, textinputtypephone: true)),

          Container( padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(04),
            child: ElevatedButton(onPressed: (){
              addData();
            }, child: const Text("জমা দিন")),
          ),

          for(var i in data)
            Column(
              children: [

                Container(
                  height: 150,
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
                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                                child: Text('শ্রমিক নাম্বার: ${i['labour_id']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                              //   child: Text('Seat ID: ${i['seat_id']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                              // ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                                child: Text('বেতন: ${i['payment']} BDT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
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
                                  setState(() {
                                    // edit_seat_id = i['seat_id'].toString();
                                    edit_labour_id = i['labour_id'].toString();
                                    editpayment.text = i['payment'].toString();

                                  });

                                  // getSeats(i['shed_id']);
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


                                                  // Container( padding: EdgeInsets.symmetric(horizontal: 12, vertical: 04),
                                                  //   child: InputDecorator(
                                                  //       decoration: InputDecoration(
                                                  //         border:
                                                  //         OutlineInputBorder(
                                                  //             borderRadius: BorderRadius.circular(15.0)),
                                                  //         contentPadding: const EdgeInsets.all(10),
                                                  //       ),
                                                  //       child: DropdownButtonHideUnderline(
                                                  //         child: DropdownButton<String>(
                                                  //             isDense: true,
                                                  //             value: edit_seat_id,
                                                  //             isExpanded: true,
                                                  //             menuMaxHeight: 350,
                                                  //             hint: Text('Select Seat ID'),
                                                  //             items: [
                                                  //               ...seats.map<DropdownMenuItem<String>>((data) {
                                                  //                 return DropdownMenuItem(
                                                  //                     child: Text(data['name']), value: data['id'].toString());
                                                  //               }).toList(),
                                                  //             ],
                                                  //
                                                  //             onChanged: (value) {
                                                  //               print("selected Value $value");
                                                  //               getLabours(edit_shed_i);
                                                  //               setStateSB(() {
                                                  //                 edit_seat_id = value!;
                                                  //               });
                                                  //             }),
                                                  //
                                                  //
                                                  //       )
                                                  //
                                                  //     // CustomTextField()
                                                  //   ),
                                                  // ),

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
                                                              value: edit_labour_id,
                                                              isExpanded: true,
                                                              menuMaxHeight: 350,
                                                              hint: Text('Select Labour'),
                                                              items: [
                                                                ...labours.map<DropdownMenuItem<String>>((data) {
                                                                  return DropdownMenuItem(
                                                                      child: Text(data['name']), value: data['id'].toString());
                                                                }).toList(),
                                                              ],

                                                              onChanged: (value) {
                                                                print("selected Value $value");
                                                                setStateSB(() {
                                                                  edit_labour_id = value!;
                                                                });
                                                              }),


                                                        )

                                                      // CustomTextField()
                                                    ),
                                                  ),



                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                      child: CustomTextField(controller: editpayment, hintText: "Payment", obscureText: false, textinputtypephone: true)),





                                                  Container( padding: EdgeInsets.symmetric(horizontal: 80, vertical: 08),
                                                    margin: EdgeInsets.all(04),
                                                    child: ElevatedButton(onPressed: (){
                                                      editData(i['id']);
                                                      Navigator.pop(context);
                                                    }, child: const Text("Save")),
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
                                            deleteData(i['id']);
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
    );
  }
}
