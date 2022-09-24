import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleInitial extends StatelessWidget {
  const SampleInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Enjoy state management with BLoC', style: TextStyle(fontSize: 16)),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
            context.read<SampleBloc>().add(SampleRequestDataEvent());
          },
          child: const Text('Fetch data'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          ),
          onPressed: () {
            context.read<SampleBloc>().add(SampleForceRequestDataFailEvent());
          },
          child: const Text('Force fetch data false'),
        ),
      ],
    );
  }
}
