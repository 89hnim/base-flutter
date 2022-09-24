import 'package:flutter/material.dart';

class SampleLoading extends StatelessWidget {
  const SampleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🔵🔵🔵', style: TextStyle(fontSize: 64)),
        Text(
          'Loading Sample',
          style: theme.textTheme.headline5,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}