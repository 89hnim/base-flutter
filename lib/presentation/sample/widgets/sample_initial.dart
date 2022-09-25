import 'package:flutter/material.dart';

class SampleInitial extends StatelessWidget {
  const SampleInitial(
      {super.key, required this.onRefresh, required this.onForceFailure});

  final Function onRefresh;
  final Function onForceFailure;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Enjoy state management with BLoC',
          style: TextStyle(fontSize: 16),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
            onRefresh();
          },
          child: const Text('Fetch data'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          ),
          onPressed: () {
            onForceFailure();
          },
          child: const Text('Force fetch data failure'),
        ),
      ],
    );
  }
}
