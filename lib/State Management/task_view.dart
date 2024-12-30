import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'task_view_model.dart';

class TaskView extends StatelessWidget {
  final TaskViewModel viewModel = TaskViewModel();

  TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobx Calismasi'),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Container(
            height: 100,
            width: 100,
            color: viewModel.isLocked ? Colors.red : Colors.green,
            child: Center(
              child: Icon(
                viewModel.isLocked ? Icons.lock : Icons.lock_open,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.toggleLock();
        },
        child: Observer(
          builder: (_) =>
              Icon(viewModel.isLocked ? Icons.lock : Icons.lock_open),
        ),
      ),
    );
  }
}
