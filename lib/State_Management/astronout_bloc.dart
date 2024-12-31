import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class MissionApp extends StatelessWidget {
  const MissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AstronautCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Astronaut Mission Control'),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<AstronautCubit, AstronautState>(
                builder: (context, state) {
                  if (state is AstronautsLoaded) {
                    return ListView.builder(
                      itemCount: state.astronauts.length,
                      itemBuilder: (context, index) {
                        final astronaut = state.astronauts[index];
                        return ListTile(
                          title: Text(astronaut),
                          trailing: IconButton(
                            icon: const Icon(Icons.save),
                            onPressed: () {
                              context
                                  .read<AstronautCubit>()
                                  .rescueAstronaut(astronaut);
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is AstronautRescued) {
                    return Center(
                      child: Text(
                        'Astronaut Rescued: ${state.rescuedAstronaut}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    );
                  }
                  return const Center(child: Text('No astronauts yet.'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AstronautCubit>().addAstronaut(
                      'Astronaut ${DateTime.now().millisecondsSinceEpoch}');
                },
                child: const Text('Add Astronaut'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
