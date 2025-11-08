import 'package:flutter/material.dart';

class TransportAssistanceViewModel extends ChangeNotifier {
  void callARide(BuildContext ctx) {
    // TODO: integrate deep link / dialer / ride service flow
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Call a Ride tapped')));
  }

  void publicTransport(BuildContext ctx) {
    // TODO: navigate to routes/schedules
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Public Transport tapped')));
  }
}
