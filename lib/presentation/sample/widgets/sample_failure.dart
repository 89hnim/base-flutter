import 'package:flutter/material.dart';

class SampleFailure extends StatelessWidget {
  const SampleFailure(
      {super.key, required this.error, required this.onRefresh});

  final String error;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Fetch data fail', style: TextStyle(fontSize: 16)),
        Text("Reason: $error",
            style: const TextStyle(fontSize: 18, color: Colors.red)),
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
      ],
    );
  }
}
