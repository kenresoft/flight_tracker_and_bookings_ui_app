import 'package:flight_tracker_and_bookings_ui_app/widgets/chat_shape_painter.dart';
import 'package:flutter/material.dart';

import '../data/constants/constants.dart';

class SelectFlight extends StatefulWidget {
  const SelectFlight({Key? key}) : super(key: key);

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        Positioned(
          top: 50,
          left: 20,
          width: MediaQuery.of(context).size.width - 636,
          child: CustomPaint(
            painter: ChatShapePainter(
              context: context,
              height: 200000,
              width: MediaQuery.of(context).size.width - 136,
              color: Colors.indigo,
              applyTopRadius: true,
              enableHandle: true,
              handleHeight: 8000000,
              handleWidth: 50,
              radius: 300000,
              enableHandleCap: true,
              handle: HandleType.curved,
            ),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Constants.map),
            ),
          ),
        ),
      ]),
    );
  }
}
