import 'package:chat_shape/chat_shape.dart';
import 'package:flight_tracker_and_bookings_ui_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/constants/constants.dart';

class SelectFlight extends StatefulWidget {
  const SelectFlight({Key? key}) : super(key: key);

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final color = Theme.of(context).colorScheme;
        final width = MediaQuery.of(context).size.width;
        return Material(
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
            Container(
              height: 300,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text("data", style: TextStyle(color: Color(0xff1a1348))),
                //20.spaceY(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () => 'clicked'.toast,
                  color: Colors.cyan,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  minWidth: width - 30,
                  height: 50,
                  child: Text("Search Flights"),
                ),
              ]),
            )
          ]),
        );
      },
    );
  }
}
