import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleEmpty extends StatelessWidget {
  const SampleEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('There is no data at all', style: TextStyle(fontSize: 16)),
        Builder(builder: (context) {
          final error =
              context.select((SampleBloc bloc) => bloc.state.errorMessage);
          return Text(error);
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
