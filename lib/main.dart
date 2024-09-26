import 'package:alliedagro/Beeffatteing/BeefFattening.dart';
import 'package:alliedagro/Beeffatteing/BeefFeeding/BeefFeeding.dart';
import 'package:alliedagro/Beeffatteing/CattlePurchase/BeefCattlePurchase.dart';
import 'package:alliedagro/Beeffatteing/Customers/BeefCustomer.dart';
import 'package:alliedagro/Beeffatteing/Customers/BeefCustomerInfo.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeefFatteningExpenses.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeefFatteningFeed.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeefFatteningLabour.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeefFatteningOthers.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeefFatteningOthersPayment.dart';
import 'package:alliedagro/Beeffatteing/Expenses/BeeffatteningLabourPayment.dart';
import 'package:alliedagro/Beeffatteing/Healthcare/BeefHealthcare.dart';
import 'package:alliedagro/Beeffatteing/Healthcare/BeefMedicines.dart';
import 'package:alliedagro/Beeffatteing/Healthcare/BeefVaccines.dart';
import 'package:alliedagro/Beeffatteing/Report/BeefFatteningreport.dart';
import 'package:alliedagro/Beeffatteing/Report/BeefReportExpenses.dart';
import 'package:alliedagro/Beeffatteing/Report/BeefReportIncome.dart';
import 'package:alliedagro/Beeffatteing/Report/BeefReportProduction.dart';
import 'package:alliedagro/Beeffatteing/Report/BeefReportProfit.dart';
import 'package:alliedagro/Beeffatteing/Slaughtering/BeefSlaughtering.dart';
import 'package:alliedagro/Beeffatteing/Treatment/BeefFatteningTreatmentDesc.dart';
import 'package:alliedagro/Beeffatteing/Treatment/BeefFatteningTreatmentDoctor.dart';
import 'package:alliedagro/Beeffatteing/Treatment/BeefTreatment.dart';
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
import 'package:alliedagro/Milk/Customers/DairyCustomer.dart';
import 'package:alliedagro/Milk/Customers/DairyCustomerInfo.dart';
import 'package:alliedagro/Milk/Expenses/Expenses.dart';
import 'package:alliedagro/Milk/Expenses/Feed.dart';
import 'package:alliedagro/Milk/Expenses/Labour.dart';
import 'package:alliedagro/Milk/Expenses/LabourPayment.dart';
import 'package:alliedagro/Milk/Expenses/Others.dart';
import 'package:alliedagro/Milk/Expenses/OthersPayment.dart';
import 'package:alliedagro/Milk/Feeding/Feeding.dart';
import 'package:alliedagro/Milk/Healthcare/DairyHealthcare.dart';
import 'package:alliedagro/Milk/Healthcare/DairyMedicines.dart';
import 'package:alliedagro/Milk/Healthcare/DairyVaccines.dart';
import 'package:alliedagro/Milk/MilkCustomer.dart';
import 'package:alliedagro/Milk/MilkDeshboard.dart';
import 'package:alliedagro/Milk/MilkLabour.dart';
import 'package:alliedagro/Milk/MilkLabourPayment.dart';
import 'package:alliedagro/Milk/MilkSelling.dart';
import 'package:alliedagro/Milk/Production/Production.dart';
import 'package:alliedagro/Milk/Purchase/Purchase.dart';
import 'package:alliedagro/Milk/Report/ExpensesReport.dart';
import 'package:alliedagro/Milk/Report/PurchaseReport.dart';
import 'package:alliedagro/Milk/Report/Report.dart';
import 'package:alliedagro/Milk/TotalMilkProd.dart';
import 'package:alliedagro/Milk/Treatment/DairyDoctors.dart';
import 'package:alliedagro/Milk/Treatment/DairyTreatment.dart';
import 'package:alliedagro/Milk/Treatment/DairyTreatmentList.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWorm.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWormEnvironment.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthWormExpenses.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormLabour.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormLabourPayment.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormOthers.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormOthersPayment.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormPurchase.dart';
import 'package:alliedagro/VermiCompost/Earthworm/EarthwormSellers.dart';
import 'package:alliedagro/VermiCompost/Earthworm/ProductionOfEartworm.dart';
import 'package:alliedagro/VermiCompost/Earthworm/SellsOfEarthWorm.dart';
import 'package:alliedagro/VermiCompost/Environment/VermiCompostEnvironment.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/CowdungPurchase.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/CowdungSellerList.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/LabourList.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/LabourPayment.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/MaterialsVermiCompost.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/OthersCostList.dart';
import 'package:alliedagro/VermiCompost/MaterialAndExpenses/OthersPayment.dart';
import 'package:alliedagro/VermiCompost/Production/VermiCompostProd.dart';
import 'package:alliedagro/VermiCompost/Production/vermicompost_shed.dard.dart';

import 'package:alliedagro/VermiCompost/Report/VermiCompostIncomeReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostProductionReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostProfitReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostReport.dart';
import 'package:alliedagro/VermiCompost/Report/VermiCompostReportExpenses.dart';
import 'package:alliedagro/VermiCompost/Sells/VermiCompostSells.dart';
import 'package:alliedagro/VermiCompost/Sells/VermiCompostSellsButton.dart';
import 'package:alliedagro/VermiCompost/Sells/VermiSellsBuyerList.dart';
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
        '/cowdungPurchase' : (context) => CowdungPurchase(),
        '/cowdungPurchase' : (context) => CowdungPurchase(),
        '/labourList' : (context) => LabourList(),
        '/cowdungsellerList' : (context) =>CowdungSellerList(),
        '/earthworm' : (context) =>EarthwormComponent(),
        '/productionEarthWorm' : (context) =>ProductionEarthWorm(),
        '/sellsofEarthWorm' :(context) =>EarthWormSells(),
        '/vermicompostprod': (context) => VermiCompostProd(),
        '/vermicompostshed': (context) => VermiCompostShed(),
        '/vermicompostsells': (context) => VermiCompostSells(),
        '/labourPayment' : (context) => LabourPayment(),
        '/othersPayment' : (context) => OthersPayment(),
        '/othersCostList' :(context) => OthersList(),
        '/cowpurchase': (context) => CowdungPurchase(),
        '/vermicompostreport' : (context) =>VermiCompostReport(),
        '/vermicompostExpensesReport' : (context) =>VermiCompostExpensesReport(),
        '/vermiCompostProductionReport' : (context) => VermiCompostProductionReport(),
        '/vermiCompostIncomeReport' : (context) => VermiCompostIncomeReport(),
        '/vermiCompostProfitReport' : (context) =>VermiCompostprofitReport(),
        '/vermicompostenvironment': (context) => VermiCompostEnvironment(),
        '/materialsVermiCompost':(context)=>MaterialsVermiCompost(),
        '/earthwormExpenses' : (context) =>EarthwormExpenses(),
        '/earthwormEnvironment' : (context) =>EarthWormEnvironment(),
        '/earthwormsellers': (context) => EarthwormSellers(),
        '/earthwormpurchase': (context) => EarthwormPurchase(),
        '/earthwormlabour': (context) => EarthwormLabour(),
        '/earthwormlabourpayment': (context) => EarthwormLabourPayment(),
        '/earthwormothers': (context) => EarthwormOthers(),
        '/earthwormotherspayment': (context) => EarthwormOthersPayment(),
        '/vermiCompostSellsButton' : (context) => VermiCompostSellsButton(),
        '/vermiCompostSellBuyers' : (context) =>VermiSellsBuyersList(),

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

        //beef
        '/beefCattlePurchase' : (context) => BeefCattlePurchase(),
        '/beefCustomer' : (context) => BeefCustomer(),
        '/beefCustomerInfo' : (context) =>BeefCustomerInfo(),
        '/beefSlaughtering' : (context) =>BeefSlaughtering(),
        '/beefFatteningExpenses' : (context) =>BeefFatteningExpenses(),
        '/beefTreatment' : (context) =>Beeftreatment(),
        '/beefFatteningDoctor': (context) => BeefFatteningTreatmentDoctor(),
        '/beefFatteningTreatmentDesc': (context) => BeefFatteningTreatmentDesc(),
        '/beefFatteningFeed': (context) => BeefFatteningFeed(),
        '/beefFatteningLabour': (context) => BeefFatteningLabour(),
        '/beefFatteningPayment' : (context) => BeefFatteningLabourPayment(),
        '/beefFatteningOthers' : (context) => BeefFatteningOthers(),
        '/beefFatteningOthersPayment': (context) =>BeefFatteningOtherspayment(),
        '/beeffatteningReport' : (context) =>BeefFatteningReport(),
        '/beefExpensesReport': (context) => BeefExpensesReport(),
        '/beefProfitReport': (context) => BeefProfitReport(),
        '/beefProductionReport': (context) =>BeefProductionReport(),
        '/beefIncomeReport' : (context) =>BeefIncomeReport(),
        '/beef_feeding': (context) => BeefFeeding(),
        '/beef_healthcare': (context) => BeefHealthcare(),
        '/beef_vaccines': (context) => BeefVaccines(),
        '/beef_medicines': (context) => BeefMedicines(),

        // Dairy Section Started
        '/dairy_production': (context) => DairyProduction(),
        '/dairy_purchase': (context) => DairyPurchase(),
        '/dairy_expenses': (context) => DairyExpenses(),
        '/dairyfeed': (context) => DairyFeed(),
        '/dairylabour': (context) => DairyLabour(),
        '/dairylabourpayment': (context) => DairyLabourPayment(),
        '/dairyothers': (context) => DairyOthers(),
        '/dairyotherspayment': (context) => DairyOthersPayment(),
        '/dairytreatmentlist': (context) => DairyTreatmentList(),
        '/dairy_doctors': (context) => DairyDoctors(),
        '/dairy_treatment': (context) => DairyTreatment(),
        '/dairy_customers': (context) => DairyCustomer(),
        '/dairy_customers_info': (context) => DairyCustomerInfo(),
        '/dairy_healthcare': (context) => DairyHealthcare(),
        '/dairy_medicines': (context) => DairyMedicines(),
        '/dairy_vaccines': (context) => DairyVaccines(),
        '/dairy_feeding': (context) => DairyFeeding(),
        '/dairy_reports': (context) => DairyReport(),
        '/dairy_expenses_report': (context) => DairyExpensesReport(),
        '/dairy_purchase_report': (context) => DairyPurchaseReport(),

      //   Calf Section

      },


    );
  }
}


