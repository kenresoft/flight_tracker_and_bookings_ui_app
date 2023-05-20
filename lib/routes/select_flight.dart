import 'package:chat_shape/chat_shape.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flight_tracker_and_bookings_ui_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riff_switch/riff_switch.dart';

import '../data/constants/constants.dart';
import '../providers/switch_provider.dart';

class SelectFlight extends StatefulWidget {
  const SelectFlight({Key? key}) : super(key: key);

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
/*
    var list = ['a', 'b', 'c', 'd', 'e'];
    var m = list.indexed.map((e) => {e.$1: e.$2});

    var map = <int, String>{};
    for((int,String) v in m){
      map = g;
    }
    for (var (a, b) = (0, 0); a < list.length; ++a) {

    }

    for (var (MapEntry(:key, :value)) in map.entries) {
      log(value);
    }
*/

    return Scaffold(
      backgroundColor: Color(0xffd7e9f6), //Color(0xffebf2f7)
      //backgroundColor: Colors.transparent,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final color = Theme.of(context).colorScheme;
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: height,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Stack(alignment: AlignmentDirectional.center, children: [
                Positioned(
                  top: 275,
                  left: 0,
                  child: Container(
                    height: height,
                    width: width,
                    //color: Colors.deepPurpleAccent,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          /// Flight Type Switch
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              width: double.infinity,
                              child: RiffSwitch(
                                type: RiffSwitchType.simple,
                                inactiveText: const Text('Round Trip'),
                                activeText: const Text('Oneway'),
                                onChanged: (value) => ref.watch(switchProvider.notifier).check(value),
                                value: ref.watch(switchProvider.select((value) => value)),
                                activeTrackColor: color.secondaryContainer,
                                activeColor: color.inversePrimary,
                                inactiveTrackColor: color.secondaryContainer,
                                inactiveThumbColor: color.inversePrimary,
                              ),
                            ),
                          ),

                          /// 'From' TextField
                          buildTextField('From', 'Paris', color, Icons.flight_takeoff_outlined),

                          10.spaceY(),

                          /// 'To' TextField
                          buildTextField('To', 'Florence', color, Icons.flight_land_outlined),

                          10.spaceY(),

                          /// Depart & Return
                          Container(
                            width: width,
                            height: 80,
                            margin: EdgeInsets.symmetric(horizontal: 15),

                            /// Row A
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              /// Column A1
                              buildTextFieldColumn('Depart', '24 January', width, color, Icons.calendar_today_outlined),

                              /// Column A2
                              buildTextFieldColumn('Return', '31 January', width, color, Icons.calendar_today_outlined),
                            ]),
                          ),

                          /// Passenger & Class
                          Container(
                            width: width,
                            height: 80,
                            margin: EdgeInsets.symmetric(horizontal: 15),

                            /// Row B
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              /// Column B1
                              buildTextFieldColumn('Passenger', '2', width, color, null),

                              /// Column B2
                              buildTextFieldColumn('Class', 'First', width, color, null),
                            ]),
                          ),

                          /// Button
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: MaterialButton(
                              onPressed: () => 'clicked'.toast,
                              color: color.inversePrimary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              minWidth: width - 30,
                              height: 50,
                              child: Text("Search Flights"),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),

                ///  CustomPaint
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    painter: ChatShape(
                      context: context,
                      width: width,
                      height: 250,
                      color: Color(0xff1a1348),
                      applyTopRadius: false,
                      enableHandle: true,
                      handleHeight: 100,
                      handleWidth: 180,
                      radius: 30,
                      enableHandleCap: false,
                      handle: HandleType.curved,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: -30,
                  height: 300,
                  width: 450,
                  child: Container(
                    //height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(image: ExactAssetImage(Constants.map)),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 150,
                  width: 150,
                  child: Text("Book Your Flight", maxLines: 2, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                ),
              ]),
            ),

            /*/// Flight Type Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: RiffSwitch(
                  type: RiffSwitchType.simple,
                  inactiveText: const Text('Round Trip'),
                  activeText: const Text('Oneway'),
                  onChanged: (value) => ref.watch(switchProvider.notifier).check(value),
                  value: ref.watch(switchProvider.select((value) => value)),
                  activeTrackColor: color.secondaryContainer,
                  activeColor: color.inversePrimary,
                  inactiveTrackColor: color.secondaryContainer,
                  inactiveThumbColor: color.inversePrimary,
                ),
              ),
            ),*/

            //30.spaceY(),
          ]);
        },
      ),
    );
  }

  Widget buildTextFieldColumn(String heading, String title, double width, ColorScheme color, IconData? icon) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(heading, style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
      ),
      SizedBox(
        width: (width - 45) / 2,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: color.secondaryContainer,prefixIconConstraints: BoxConstraints(minWidth: 40),
            prefixIcon: icon != null ? Icon(icon, color: color.inversePrimary, size: 20) : null,
            label: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ),
    ]);
  }

  Widget buildTextField(String direction, String location, ColorScheme color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(direction, style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: color.secondaryContainer,
            prefixIcon: Icon(icon, color: Color(0xff1a1348)),
            label: Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ]),
    );
  }
}
