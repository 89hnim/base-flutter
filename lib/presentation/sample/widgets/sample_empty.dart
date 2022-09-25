import 'package:flutter/material.dart';

class SampleEmpty extends StatelessWidget {
  const SampleEmpty(
      {super.key, required this.onRefresh, required this.onForceFailure});

  final Function onRefresh;
  final Function onForceFailure;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('There is no data at all', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 16),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
          ),
          onPressed: () {
            onRefresh();
          },
          child: const Text('Refresh data'),
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
