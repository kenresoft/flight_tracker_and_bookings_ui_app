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
    return Scaffold(
      backgroundColor: Color(0xffd7e9f6), //Color(0xffebf2f7)
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final color = Theme.of(context).colorScheme;
          final width = MediaQuery.of(context).size.width;
          //final height = MediaQuery.of(context).size.height;
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 280,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Stack(alignment: AlignmentDirectional.center, children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    painter: ChatShapePainter(
                      context: context,
                      width: width,
                      height: 250,
                      color: Color(0xff1a1348),
                      applyTopRadius: false,
                      enableHandle: true,
                      handleHeight: 60,
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

            /// section 2
/*            Padding(
              padding: const EdgeInsets.all(15),
              child: Switch(
                value: ref.watch(switchProvider.select((value) => value)),
                onChanged: (value) => ref.watch(switchProvider.notifier).check(value),
                activeColor: Colors.redAccent,
                activeTrackColor: Colors.yellow,
                inactiveTrackColor: Colors.greenAccent,
                inactiveThumbColor: Colors.green,
              ),
            ),*/

            /// SWITCH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: 250,
                child: RiffSwitch(
                  //trackColor: color.secondaryContainer,
                  type: RiffSwitchType.text,
                  onChanged: (value) => ref.watch(switchProvider.notifier).check(value),
                  value: ref.watch(switchProvider.select((value) => value)),
                  activeTrackColor: color.secondaryContainer,
                  activeColor: color.inversePrimary,
                  inactiveTrackColor: color.secondaryContainer,
                  inactiveThumbColor: color.inversePrimary,
                  trackColor: MaterialStateProperty.resolveWith((Set states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.greenAccent.withOpacity(.48);
                    }
                    return Colors.pink;
                  }),
                ),
              ),
            ),

            10.spaceY(),

            /// FROM
            Expanded(
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text('From', style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: color.secondaryContainer,
                          prefixIcon: Icon(Icons.flight_takeoff_outlined, color: Color(0xff1a1348)),
                          label: Text('Paris', style: TextStyle(fontWeight: FontWeight.bold)),
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ]),
                  ),

                  10.spaceY(),

                  /// TO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text('To', style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: color.secondaryContainer,
                          prefixIcon: Icon(Icons.flight_land_outlined, color: Color(0xff1a1348)),
                          label: Text('Florence', style: TextStyle(fontWeight: FontWeight.bold)),
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ]),
                  ),

                  10.spaceY(),

                  /// ROW
                  ///
                  /// DEPART
                  /*SizedBox(
                    width: 200,
                    height: 80,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text('Depart', style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: color.secondaryContainer,
                            prefixIcon: Icon(Icons.flight_land_outlined, color: Color(0xff1a1348)),
                            label: Text('Florence', style: TextStyle(fontWeight: FontWeight.bold)),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ]),

                      5.spaceX(),

                      /// RETURN
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text('Return', style: TextStyle(color: Color(0xff1a1348), fontWeight: FontWeight.w600)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: color.secondaryContainer,
                            prefixIcon: Icon(Icons.flight_land_outlined, color: Color(0xff1a1348)),
                            label: Text('Florence', style: TextStyle(fontWeight: FontWeight.bold)),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ]),
                    ]),
                  ),*/

                  /// Button
                  MaterialButton(
                    onPressed: () => 'clicked'.toast,
                    color: color.inversePrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    minWidth: width - 30,
                    height: 50,
                    child: Text("Search Flights"),
                  ),
                ]),
              ),
            )
          ]);
        },
      ),
    );
  }
}
