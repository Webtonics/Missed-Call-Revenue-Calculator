import 'package:flutter/material.dart';
import 'package:missed_call_roi_calculator/features/RoICalc/constants/spacings.dart';
import 'package:missed_call_roi_calculator/features/RoICalc/widgets/mybutton.dart';
import 'package:missed_call_roi_calculator/features/RoICalc/widgets/mytextfield.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double result = 0;
  late double roi;

  TextEditingController _avgController = TextEditingController();
  TextEditingController _miscontroller= TextEditingController();
  TextEditingController _closeratecontroller= TextEditingController();

  @override
  void initState() {
    roi = 0;
    _avgController = TextEditingController(); 
    _miscontroller = TextEditingController(); 
    _closeratecontroller = TextEditingController(); 

    super.initState();
  }
  @override
  void dispose() {
    _avgController.dispose();
    _miscontroller.dispose();
    _closeratecontroller.dispose();
    super.dispose();
  }

  void calculateRoi(){
    setState(() {
      result = double.parse(_avgController.text) * double.parse(_miscontroller.text) *double.parse(_closeratecontroller.text)/100;
      roi = result - 100;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 232, 241, 1),
      // appBar: AppBar(
      //   centerTitle: true,
      //   // title:  const Text("ROI CALCULATOR", style: TextStyle(
      //   //     fontSize: 30, fontWeight: FontWeight.w600, wordSpacing: 1, color: Colors.black, decoration: TextDecoration.none ),),
      // ),
      body:SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).size.width <= 540 ? const EdgeInsets.all(10)
            :const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple, width: 3),
                borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  bigspacing,
                  const Center(
                    child: 
                     Text("Missed Call Revenue Calculator", 
                     textAlign: TextAlign.center,
                     style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600, wordSpacing: 1, color: Colors.black, decoration: TextDecoration.none ),),
                  ),
                  bigspacing,
                  // TextBoxes:
                  //  Average Client Value
                  MyTextField(title: "Average Client Value", controller: _avgController, message: 'Enter the average lifetime value of a customer',),
                  smallspacing,
                  // Missed Calls per Month
                  MyTextField(title: "Missed Calls per Month", controller: _miscontroller, message: 'Enter an Estimate of how many calls you miss per month',),
                  smallspacing,
                  // Average Close Rate (%)
                  MyTextField(title: "Average Close Rate (%)", controller: _closeratecontroller, message: 'Enter the rate at which you close new sales',),
                  bigspacing,
                  // Button
                  MyButton(onPressed: (){
                  calculateRoi();
                  }, text: "Calculate ROI"),
                  // Result
                  Text("Results: $result", style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w600, wordSpacing: 1, color: Colors.black, decoration: TextDecoration.none ),),
                  bigspacing,            
                  const Text("Monthly \$\$\$ Left on the Table"),
                  bigspacing,
                  const Text(
                    "We Charge \$100/month"
                  ),
                  Text("You make Extra $roi"),
                  bigspacing,
                  const Text("Built by digitalwebtonics Soln", style: TextStyle(fontWeight: FontWeight.w800),)
                  ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}