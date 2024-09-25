import 'package:alliedagro/Beeffatteing/BeefFattening.dart';
import 'package:alliedagro/Cow/CowDashboard.dart';
import 'package:alliedagro/Cow/CowDelivary.dart';
import 'package:alliedagro/Cow/CowExpenses.dart';
import 'package:alliedagro/Cow/CowFeed.dart';
import 'package:alliedagro/Cow/CowLabour.dart';
import 'package:alliedagro/Cow/CowOthers.dart';
import 'package:alliedagro/Cow/CowOthersPayment.dart';
import 'package:alliedagro/Cow/CowPurchase.dart';
import 'package:alliedagro/Cow/CowSellingInfo.dart';
import 'package:alliedagro/Cow/CowlabourPayment.dart';
import 'package:alliedagro/Calf/CalfBirth.dart';
import 'package:alliedagro/Calf/CalfDashboard.dart';
import 'package:alliedagro/Calf/Customer/CalfCustomer.dart';
import 'package:alliedagro/Calf/Expenses/CalfExpenses.dart';
import 'package:alliedagro/Calf/Expenses/CalfFeed.dart';
import 'package:alliedagro/Calf/Expenses/CalfLabour.dart';
import 'package:alliedagro/Calf/Expenses/CalfLabourPayment.dart';
import 'package:alliedagro/Calf/Expenses/CalfOthers.dart';
import 'package:alliedagro/Calf/Expenses/CalfOthersPayment.dart';
import 'package:alliedagro/Calf/Selling/CalfSelling.dart';
import 'package:alliedagro/Calf/Treatment/CalfTreatment.dart';
import 'package:alliedagro/Calf/Treatment/CalfTreatmentDoctor.dart';
import 'package:alliedagro/Cow/CowDashboard.dart';
import 'package:alliedagro/Cow/CowDelivary.dart';
import 'package:alliedagro/Cow/CowExpenses.dart';
import 'package:alliedagro/Cow/CowFeed.dart';
import 'package:alliedagro/Cow/CowLabour.dart';
import 'package:alliedagro/Cow/CowPurchase.dart';
import 'package:alliedagro/Cow/CowlabourPayment.dart';
import 'package:alliedagro/Cow/Feeding/CowFeeding.dart';
import 'package:alliedagro/Cow/HealthCare/HealthcareDashBoard.dart';
import 'package:alliedagro/Cow/HealthCare/HealthcareMedicine.dart';
import 'package:alliedagro/Cow/HealthCare/HealthcareVexine.dart';
import 'package:alliedagro/Cow/Treatment/CowDoctor.dart';
import 'package:alliedagro/Cow/Treatment/CowTreatment.dart';
import 'package:alliedagro/Cow/Treatment/Treatment.dart';
import 'package:alliedagro/Home.dart';
import 'package:alliedagro/Milk/MilkCustomer.dart';
import 'package:alliedagro/Milk/MilkDeshboard.dart';
import 'package:alliedagro/Milk/MilkLabour.dart';
import 'package:alliedagro/Milk/MilkLabourPayment.dart';
import 'package:alliedagro/Milk/MilkSelling.dart';
import 'package:alliedagro/Milk/TotalMilkProd.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWorm.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWormEnvironment.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWormExpenses.dart';

import 'package:alliedagro/VermiCompost/Report/VermiCompostIncomeReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostProductionReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostProfitReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostReportExpenses.dart';
import 'package:alliedagro/VermiCompost/Sells/VermiCompostSellsButton.dart';
import 'package:alliedagro/VermiCompost/VermiCompostList.dart';
import 'package:flutter/material.dart';
import 'package:alliedagro/BioGasFolder/BioGas.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/vermicompostlist': (context) => VermiCompostList(),
        // '/cowdungPurchase' : (context) => CowdungPurchase(),
        // '/cowdungPurchase' : (context) => CowdungPurchase(),
        // '/labourList' : (context) => LabourList(),
        // '/cowdungsellerList' : (context) =>CowdungSellerList(),
        // '/earthworm' : (context) =>EarthwormComponent(),
        // '/productionEarthWorm' : (context) =>ProductionEarthWorm(),
        // '/sellsofEarthWorm' :(context) =>EarthWormSells(),
        // '/vermicompostprod': (context) => VermiCompostProd(),
        // '/vermicompostshed': (context) => VermiCompostShed(),
        // '/vermicompostsells': (context) => VermiCompostSells(),
        // '/labourPayment' : (context) => LabourPayment(),
        // '/othersPayment' : (context) => OthersPayment(),
        // '/othersCostList' :(context) => OthersList(),
        // '/cowpurchase': (context) => CowdungPurchase(),
        // '/vermicompostreport' : (context) =>VermiCompostReport(),
        // '/vermicompostExpensesReport' : (context) =>VermiCompostExpensesReport(),
        // '/vermiCompostProductionReport' : (context) => VermiCompostProductionReport(),
        // '/vermiCompostIncomeReport' : (context) => VermiCompostIncomeReport(),
        // '/vermiCompostProfitReport' : (context) =>VermiCompostprofitReport(),
        // '/vermicompostenvironment': (context) => VermiCompostEnvironment(),
        // '/materialsVermiCompost':(context)=>MaterialsVermiCompost(),
        // '/earthwormExpenses' : (context) =>EarthwormExpenses(),
        // '/earthwormEnvironment' : (context) =>EarthWormEnvironment(),
        // '/earthwormsellers': (context) => EarthwormSellers(),
        // '/earthwormpurchase': (context) => EarthwormPurchase(),
        // '/earthwormlabour': (context) => EarthwormLabour(),
        // '/earthwormlabourpayment': (context) => EarthwormLabourPayment(),
        // '/earthwormothers': (context) => EarthwormOthers(),
        // '/earthwormotherspayment': (context) => EarthwormOthersPayment(),
        // '/vermiCompostSellsButton' : (context) => VermiCompostSellsButton(),
        // '/vermiCompostSellBuyers' : (context) =>VermiSellsBuyersList(),

        //   Milk Section Start
        '/milkdashboard' : (context) => MilkDashboard(),



        //   Calf Section Start

        '/calfDashboard' : (context) => CalfDashboard(),




        '/calf_birth': (context) => CalfBirth(),
        '/calf_expenses': (context) => CalfExpenses(),
        '/calf_feed': (context) => CalfFeed(),
        '/calf_labour': (context) => CalfLabour(),
        '/calf_labour_payment': (context) => CalfLabourPayment(),
        '/calf_others': (context) => CalfOthers(),
        '/calf_others_payment': (context) => CalfOthersPayment(),
        '/calf_treatment': (context) => CalfTreatment(),
        '/calf_treatment_doctor': (context) => CalfTreatmentDoctor(),
        '/calf_selling': (context) => CalfSelling(),
        '/calf_customer': (context) => CalfCustomer(),
        '/total_milk_prod': (context) => TotalMilkProd(),
        '/milk_selling': (context) => MilkSelling(),
        '/milk_customer': (context) => MilkCustomer(),
        '/milk_labour': (context) => MilkLabour(),
        '/milk_labour_payment': (context) => MilkLabourPayment(),

      // Biogas Section
        '/biogasdashboard': (context) => BioGases(),

        '/beeffattening' : (context) => BeefFattening(),


        // Cow/ Breeding:
        '/cowdashboard' : (context) => CowDashboard(),
        '/cowpurchase': (context) => CowPurchase(),
        '/cowdelivary': (context) => DelivaryReport(),
        '/cowexpenses': (context) => BreedingExpenses(),
        '/cowfeed' : (context) => BreedingFeed(),
        '/cowlabour' : (context) => BreedingLabour(),
        '/cowlabourpayment': (context) => BreedingLabourPayment(),
        '/cowOthers': (context) => BreedingOthers(),
        '/cowOtherPayment' : (context) => BreedingOthersPayment(),

      //   Treatment Section
        '/treatmantdashboard' : (context) => TreatmentDashboard(),
        '/CowDoctor' : (context) => CowDoctor(),
        '/cowtreatment' : (context) => BreedingTreatment(),
        '/cowSelling': (context) => SellingInfo(),

      //   Cow HealthCare Section
        '/cowheathcare': (context) => CowHealthcare(),
        '/cowVaccines': (context) => BreedingVaccines(),
        '/cowMedicine': (context) => BreedingMedicines(),
        '/cowFeeding': (context) => BreedingFeeding(),

      //   Milk Section
        '/totalmilkproduction': (context) => TotalMilkProd(),
        '/milkselling': (context) => MilkSelling(),
        '/milklabour': (context) => MilkLabour(),
        '/milklaboursalary': (context) => MilkLabourPayment(),

      },


    );
  }
}


