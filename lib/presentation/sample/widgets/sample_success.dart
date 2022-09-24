import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSuccess extends StatelessWidget {
  const SampleSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Fetch data success', style: TextStyle(fontSize: 16)),
        Builder(builder: (context) {
          final samples =
              context.select((SampleBloc bloc) => bloc.state.samples);
          return Text(samples.toString());
        }),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          ),
          onPressed: () {
            context.read<SampleBloc>().add(SampleRequestDataEvent());
          },
          child: const Text('Refresh data'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
          ),
          onPressed: () {
            context.read<SampleBloc>().add(SampleClearRequestedDataEvent());
          },
          child: const Text('Clear data'),
        ),
      ],
    );
  }
}
