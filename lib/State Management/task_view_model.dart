import 'package:mobx/mobx.dart';

part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModel with _$TaskViewModel;

abstract class _TaskViewModel with Store {
  @observable
  bool isLocked = true;

  @action
  void toggleLock() {
    isLocked = !isLocked;
  }
}
