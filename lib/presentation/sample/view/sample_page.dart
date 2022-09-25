import 'package:base_flutter/core/ui/snack_bar_ext.dart';
import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:base_flutter/presentation/sample/logic/sample_state.dart';
import 'package:base_flutter/presentation/sample/widgets/sample_empty.dart';
import 'package:base_flutter/presentation/sample/widgets/sample_failure.dart';
import 'package:base_flutter/presentation/sample/widgets/sample_initial.dart';
import 'package:base_flutter/presentation/sample/widgets/sample_loading.dart';
import 'package:base_flutter/presentation/sample/widgets/sample_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SampleView();
  }
}

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Base flutter"),
      ),
      body: Center(
        child: BlocConsumer<SampleBloc, SampleState>(
          listener: (context, state) {
            if (state.status == SampleStatus.failure) {
              context.showNormalSnackBar("Oops, ${state.errorMessage}");
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case SampleStatus.initial:
                return SampleInitial(
                  onRefresh: () {
                    context.read<SampleBloc>().add(SampleRequestDataEvent());
                  },
                  onForceFailure: () {
                    context
                        .read<SampleBloc>()
                        .add(SampleForceRequestDataFailEvent());
                  },
                );
              case SampleStatus.loading:
                return const SampleLoading();
              case SampleStatus.success:
                if (state.samples.isEmpty) {
                  return SampleEmpty(
                    onRefresh: () {
                      context.read<SampleBloc>().add(SampleRequestDataEvent());
                    },
                    onForceFailure: () {
                      context
                          .read<SampleBloc>()
                          .add(SampleForceRequestDataFailEvent());
                    },
                  );
                } else {
                  return SampleSuccess(
                      samples: state.samples,
                      onRefresh: () {
                        context
                            .read<SampleBloc>()
                            .add(SampleRequestDataEvent());
                      },
                      onClear: () {
                        context
                            .read<SampleBloc>()
                            .add(SampleClearRequestedDataEvent());
                      });
                }
              case SampleStatus.failure:
                return SampleFailure(
                  error: state.errorMessage,
                  onRefresh: () {
                    context.read<SampleBloc>().add(SampleRequestDataEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
