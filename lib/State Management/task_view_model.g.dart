// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskViewModel on _TaskViewModel, Store {
  late final _$isLockedAtom =
      Atom(name: '_TaskViewModel.isLocked', context: context);

  @override
  bool get isLocked {
    _$isLockedAtom.reportRead();
    return super.isLocked;
  }

  @override
  set isLocked(bool value) {
    _$isLockedAtom.reportWrite(value, super.isLocked, () {
      super.isLocked = value;
    });
  }

  late final _$_TaskViewModelActionController =
      ActionController(name: '_TaskViewModel', context: context);

  @override
  void toggleLock() {
    final _$actionInfo = _$_TaskViewModelActionController.startAction(
        name: '_TaskViewModel.toggleLock');
    try {
      return super.toggleLock();
    } finally {
      _$_TaskViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLocked: ${isLocked}
    ''';
  }
}
