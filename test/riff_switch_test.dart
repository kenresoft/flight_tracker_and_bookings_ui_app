import 'package:flight_tracker_and_bookings_ui_app/main.dart';
import 'package:flight_tracker_and_bookings_ui_app/routes/select_flight.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riff_switch/riff_switch.dart';

void main() {
  testWidgets('Widget test for the riff_switch custom widget', (widgetTester) async {
    //await widgetTester.pumpWidget(CustomSwitch(value: false, onChanged: (value) {}));
    await widgetTester.pumpWidget(MyApp());
    await widgetTester.pumpWidget(SelectFlight());

    final Finder finder = find.byWidgetPredicate((widget) => widget is RiffSwitch && widget.value == false);

    expect(finder, findsOneWidget);
  });
}
