import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/components/CustomTextField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';


class LabourPayment extends StatefulWidget {
  const LabourPayment({super.key});

  @override
  State<LabourPayment> createState() => _LabourPaymentState();
}

class _LabourPaymentState extends State<LabourPayment> {

  DateTime selectedDate = DateTime.now();
  TextEditingController amount = TextEditingController();

  String? labour;

  TextEditingController editamount = TextEditingController();

  TextEditingController editid = TextEditingController();

  DateTime selectedEditDate = DateTime.now();

  String? editLabour;

  List<dynamic> labourList = [];

  List<dynamic> data = [];



  void getLabours() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/labour_list');

    Response res = await get(url);

    setState(() {
      labourList = jsonDecode(res.body);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void getData() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/labour_payment');

    Response res = await get(url);

    setState(() {
      data = jsonDecode(res.body);
    });
  }

  void addData() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/labour_payment/add');

    Map<String, dynamic> data = { 'labour_id': labour, 'amount': amount.text, 'date': selectedDate.toIso8601String()  };

    Response res = await post(url, body: data);

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

      setState(() {
        selectedDate = DateTime.now();
        labour = null;
        amount.text = '';
      });
    }


    getData();
  }

  void editData() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/labour_payment/edit?id=${editid.text}');

    Map<String, dynamic> data = { 'labour_id': editLabour, 'amount': editamount.text, 'date': selectedEditDate.toIso8601String() };

    Response res = await put(url, body: data);

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

      getData();
    }


    getData();
  }

  Future<void> _selectEditDate(BuildContext context, setStateSB) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEditDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEditDate) {
      setStateSB(() {
        selectedEditDate = picked;
      });
    }
  }

  void deleteData(id) async{
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/labour_payment/delete?id=${id}');
    Response res = await delete(url);

    if(res.statusCode == 201){
      Fluttertoast.showToast(
          msg: "Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
      getData();
    }

    getData();
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
    getLabours();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'শ্রমিকদের পেমেন্ট',),
      body: ListView(children: [

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('তারিখ সিলেক্ট করুন: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                Text("${selectedDate!.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 20),),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.calendar_month, color: Colors.white,),
                  ),
                )
              ],
            )
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
                    value: labour,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    hint: Text('শ্রমিক সিলেক্ট করুন'),
                    items: [
                      ...labourList.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(
                            child: Text(data['name']), value: data['id'].toString());
                      }).toList(),
                    ],

                    onChanged: (value) {
                      print("selected Value $value");

                      setState(() {
                        labour = value!;
                      });
                    }),
              )

            // CustomTextField()
          ),
        ),

        Container(
            margin: EdgeInsets.fromLTRB(2, 14, 2, 0),
            child: CustomTextField(controller: amount, hintText: "টাকার পরিমাণ", obscureText: false, textinputtypephone: true)),

        SizedBox(height: 02,),
        Container( padding: EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(36, 04, 36, 0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
                foregroundColor: Colors.black,
              ),
              onPressed: (){
            addData();
          }, child: const Text("জমা দিন", style: TextStyle(fontSize: 15.5),)),
        ),

        SizedBox(height: 20,),

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
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('Labour ID: ${i['labour_id']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('Payment: ${i['amount']} BDT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('${DateTime.parse(i['date']).toLocal()}'.split(' ')[0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),),
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
                                  editid.text = i['id'].toString();
                                  editamount.text = i['amount'].toString();
                                  editLabour = i['labour_id'].toString();
                                  selectedEditDate = DateTime.parse(i['date']);
                                });

                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {

                                    return StatefulBuilder(
                                        builder: (context, setStateSB) {
                                          return FractionallySizedBox(
                                            heightFactor: 0.7,
                                            // height: 200,
                                            // color: Colors.amber,
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text('Select Date: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                                        Text("${selectedEditDate!.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 20),),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _selectEditDate(context, setStateSB);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.all(6),
                                                            margin: EdgeInsets.symmetric(horizontal: 5),
                                                            decoration: BoxDecoration(
                                                                color: Colors.grey,
                                                                borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child: Icon(Icons.calendar_month, color: Colors.white,),
                                                          ),
                                                        )

                                                      ],
                                                    )
                                                ),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                    child: CustomTextField(controller: editamount, hintText: "Amount BDT", obscureText: false, textinputtypephone: false)), //Custom TextFeild

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
                                                            value: editLabour,
                                                            isExpanded: true,
                                                            menuMaxHeight: 350,
                                                            hint: Text('Select Seller'),
                                                            items: [
                                                              ...labourList.map<DropdownMenuItem<String>>((data) {
                                                                return DropdownMenuItem(
                                                                    child: Text(data['name']), value: data['id'].toString());
                                                              }).toList(),
                                                            ],

                                                            onChanged: (value) {
                                                              print("selected Value $value");

                                                              setStateSB(() {
                                                                editLabour = value;
                                                              });
                                                            }),


                                                      )

                                                    // CustomTextField()
                                                  ),
                                                ),
                                                Container( padding: EdgeInsets.symmetric(horizontal: 80, vertical: 08),
                                                  margin: EdgeInsets.all(04),
                                                  child: ElevatedButton(onPressed: (){
                                                    editData();
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

      ],),
    );
  }
}
