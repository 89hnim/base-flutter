import 'package:base_flutter/presentation/sample/models/sample_ui_data.dart';
import 'package:flutter/material.dart';

class SampleSuccess extends StatelessWidget {
  const SampleSuccess({
    super.key,
    required this.samples,
    required this.onRefresh,
    required this.onClear,
  });

  final List<SampleUiData> samples;
  final Function onRefresh;
  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.pinkAccent),
          ),
          onPressed: () {
            onClear();
          },
          child: const Text('Clear data'),
        ),
        Flexible(
          child: SampleList(samples: samples),
        )
      ],
    );
  }
}

class SampleList extends StatelessWidget {
  const SampleList({super.key, required this.samples});

  final List<SampleUiData> samples;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: samples.length,
      itemBuilder: (context, index) {
        return Image.network(samples[index].thumbnailUrl);
      },
    );
  }
}
