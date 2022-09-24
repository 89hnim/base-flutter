import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleFailure extends StatelessWidget {
  const SampleFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Fetch data fail', style: TextStyle(fontSize: 16)),
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
      ],
    );
  }
}
