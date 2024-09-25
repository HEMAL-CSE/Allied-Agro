import 'package:flutter/material.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:alliedagro/components/CustomTextField.dart';

class CalfLabour extends StatefulWidget {
  const CalfLabour({super.key});

  @override
  State<CalfLabour> createState() => _CalfLabourState();
}

class _CalfLabourState extends State<CalfLabour> {
  String? shed_id;

  String? seat_id;

  TextEditingController name = TextEditingController();

  String? edit_shed_id;

  String? edit_seat_id;

  TextEditingController editid = TextEditingController();

  TextEditingController editname = TextEditingController();

  List<dynamic> data = [];

  List<dynamic> sheds = [];

  List<dynamic> seats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'শ্রমিকদের তালিকা',),
      body: ListView(
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
                      hint: Text('শেড নাম্বার বাছাই করুন'),
                      items: [
                        ...sheds.map<DropdownMenuItem<String>>((data) {
                          return DropdownMenuItem(
                              child: Text(data['name']), value: data['id'].toString());
                        }).toList(),
                      ],

                      onChanged: (value) {
                        print("selected Value $value");
                        // getSeats(value);
                        setState(() {
                          shed_id = value!;
                        });
                      }),


                )

              // CustomTextField()
            ),
          ),



          Container(
              margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
              child: CustomTextField(controller: name, hintText: "নাম", obscureText: false, textinputtypephone: true)),

          Container( padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(04),
            child: ElevatedButton(onPressed: (){
              // addData();
            }, child: const Text("Submit")),
          ),

          // for(var i in data)
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
                                child: Text('শ্রমিক নাম: Rayat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                                child: Text('শেড নাম্বার: 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                              //   child: Text('Seat ID: ${i['seat_id']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                              // ),

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
                                  // setState(() {
                                  //   editid.text = i['id'].toString();
                                  //   edit_shed_id = i['shed_id'].toString();
                                  //   // edit_seat_id = i['seat_id'].toString();
                                  //   editname.text = i['name'];
                                  //
                                  // });

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
                                                                // getSeats(value);
                                                                setStateSB(() {
                                                                  edit_shed_id = value!;
                                                                });
                                                              }),


                                                        )

                                                      // CustomTextField()
                                                    ),
                                                  ),

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



                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(2, 16, 2, 0),
                                                      child: CustomTextField(controller: editname, hintText: "Name", obscureText: false, textinputtypephone: true)),





                                                  Container( padding: EdgeInsets.symmetric(horizontal: 80, vertical: 08),
                                                    margin: EdgeInsets.all(04),
                                                    child: ElevatedButton(onPressed: (){
                                                      // editData();
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
    );
  }
}
