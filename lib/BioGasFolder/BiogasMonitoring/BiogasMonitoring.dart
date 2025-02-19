import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alliedagro/components/CustomAppBar.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class BiogasMonitoring extends StatefulWidget {
  const BiogasMonitoring({super.key});

  @override
  State<BiogasMonitoring> createState() => _BiogasMonitoringState();
}

class _BiogasMonitoringState extends State<BiogasMonitoring> {

  List data = [];

  void getData() async {
    final uri = Uri.parse('https://api.thingspeak.com/channels/2397663/feeds.json?api_key=8O9X7FAXYPRSIWE6');

    Response res = await get(uri);

    setState(() {
      data = jsonDecode(res.body)['feeds'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Biogas Monitoring',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [
                DataColumn(label: Text('Pressure')),
                DataColumn(label: Text('Temperature')),
                DataColumn(label: Text('Methene')),
                DataColumn(label: Text('Created At'))
              ], rows: [
                for(var i in data)
                  DataRow(cells: [
                    DataCell(Text('${i['field1']}')),
                    DataCell(Text('${i['field2']}')),
                    DataCell(Text('${i['field3']}')),
                    DataCell(Text('${DateFormat('dd/MM/yyyy').format(DateTime.parse(i['created_at']))}'))
                  ])

              ]),
            )
          ],
        ),
      ),
    );
  }
}
