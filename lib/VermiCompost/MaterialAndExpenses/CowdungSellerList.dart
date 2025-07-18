import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/components/CustomTextField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';


class CowdungSellerList extends StatefulWidget {
  const CowdungSellerList({Key? key}) : super(key: key);

  @override
  State<CowdungSellerList> createState() => _CowdungSellerListState();
}

class _CowdungSellerListState extends State<CowdungSellerList> {

  String defaultValue ="";
  TextEditingController id = TextEditingController(); //id
  TextEditingController name = TextEditingController(); // C.name
  TextEditingController address = TextEditingController();// C.ADDRESS
  TextEditingController mobile_no = TextEditingController();
  TextEditingController editid = TextEditingController();
  TextEditingController editname = TextEditingController();
  TextEditingController editaddress = TextEditingController();
  TextEditingController editmobile_no = TextEditingController();
  TextEditingController monthly_selling_capacity = TextEditingController();
  TextEditingController edit_monthly_selling_capacity = TextEditingController();



  List<dynamic> data = [

  ];
  
  void getData() async{
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/cowdung_seller');

    Response res = await get(url);

    setState(() {
      data = jsonDecode(res.body);
      id.text = '';
      name.text = '';
      address.text = '';
      mobile_no.text = '';
    });

    FocusManager.instance.primaryFocus?.unfocus();
  }

  void addData() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/cowdung_seller/add');

    Map<String, dynamic> data = { 'seller_id': id.text, 'name': name.text, 'address': address.text, 'mobile_no': mobile_no.text, 'monthly_selling_capacity': monthly_selling_capacity.text };

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
        id.text = '';
        name.text = '';
        address.text = '';
        mobile_no.text = '';
        monthly_selling_capacity.text = '';
      });
    }


    getData();
  }

  void editData() async {
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/cowdung_seller/edit?seller_id=${editid.text}');

    Map<String, dynamic> data = { 'name': editname.text, 'address': editaddress.text, 'mobile_no': editmobile_no.text, 'monthly_selling_capacity': edit_monthly_selling_capacity.text };

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

  void deleteData(id) async{
    final url = Uri.parse('http://68.178.163.174:5008/vermi_compost/cowdung_seller/delete?seller_id=${id}');
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'গোবর বিক্রেতা',), //Appbar
        body: ListView(children:[
          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: id, hintText: "আইডি", obscureText: false, textinputtypephone: true)), //Custom TextFeild

          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: name, hintText: "নাম", obscureText: false, textinputtypephone: false)), //Custom TextFeild

          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: address, hintText: "ঠিকানা", obscureText: false, textinputtypephone: false)),

          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: mobile_no, hintText: "মোবাইল নাম্বার", obscureText: false, textinputtypephone: true)), ///Custom TextFeild

           Container(
               margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
               child: CustomTextField(controller: monthly_selling_capacity, hintText: "মাসিক বিক্রয়ের পরিমাণ (কেজি)", obscureText: false, textinputtypephone: true)),

          SizedBox(height: 02,),
          Container( padding: EdgeInsets.symmetric(horizontal: 80, vertical: 08),
            margin: EdgeInsets.all(04),
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
                              child: Text('${i['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('আইডি: ${i['seller_id']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('মাসিক বিক্রয়ের পরিমাণ (কেজি): ${i['monthly_selling_capacity']} kg', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('মোবাইল নাম্বার: ${i['mobile_no']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                              child: Text('ঠিকানা: ${i['address']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),),
                            ),
                          ],
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
                                    editid.text = i['seller_id'].toString();
                                    editname.text = i['name'];
                                    editaddress.text = i['address'];
                                    editmobile_no.text = i['mobile_no'] != null ? i['mobile_no'] : '';
                                    edit_monthly_selling_capacity.text = i['monthly_selling_capacity'] != null ? i['monthly_selling_capacity'] : '';
                                  });

                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {

                                      return FractionallySizedBox(
                                        heightFactor: 0.7,
                                        // height: 200,
                                        // color: Colors.amber,
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                child: CustomTextField(controller: editname, hintText: "নাম", obscureText: false, textinputtypephone: false)), //Custom TextFeild

                                            Container(
                                                margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                child: CustomTextField(controller: editaddress, hintText: "ঠিকানা", obscureText: false, textinputtypephone: false)),

                                            Container(
                                                margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                child: CustomTextField(controller: editmobile_no, hintText: "মোবাইল নাম্বার", obscureText: false, textinputtypephone: true)), ///Custom TextFeild

                                            Container(
                                                margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                child: CustomTextField(controller: edit_monthly_selling_capacity, hintText: "মাসিক বিক্রয়ের পরিমাণ (কেজি)", obscureText: false, textinputtypephone: true)),


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
                                            deleteData(i['seller_id']);
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


        ],)

    );
  }
}
