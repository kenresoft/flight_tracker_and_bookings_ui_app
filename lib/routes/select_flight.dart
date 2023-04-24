import 'package:chat_shape/chat_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lint/riverpod_lint.dart';
import '../data/constants/constants.dart';

class S extends ConsumerWidget {
  const S({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class SelectFlight extends StatefulWidget {
  const SelectFlight({Key? key}) : super(key: key);

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    @riverpod
    void e() {

    }
    return Material(
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          width: MediaQuery.of(context).size.width - 636,
          child: CustomPaint(
            painter: ChatShapePainter(
              context: context,
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Colors.indigo,
              applyTopRadius: false,
              enableHandle: true,
              handleHeight: 70,
              handleWidth: 180,
              radius: 30,
              enableHandleCap: false,
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
