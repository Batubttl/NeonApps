import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AstronautState {}

class AstronautsLoaded extends AstronautState {
  final List<String> astronauts;

  AstronautsLoaded(this.astronauts);
}

class AstronautRescued extends AstronautState {
  final String name;

  AstronautRescued(this.name);

  get rescuedAstronaut => null;
}

class AstronautCubit extends Cubit<AstronautState> {
  AstronautCubit() : super(AstronautsLoaded([]));

  void addAstronaut(String name) {
    if (state is AstronautsLoaded) {
      final updatedAstronauts =
          List<String>.from((state as AstronautsLoaded).astronauts)..add(name);
      emit(AstronautsLoaded(updatedAstronauts));
    }
  }

  void rescueAstronaut(String name) {
    emit(AstronautRescued(name));
  }
}
