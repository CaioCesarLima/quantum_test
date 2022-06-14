import 'package:quantum_app/src/home/controllers/models/music_model.dart';

abstract class HomeState{}

class EmptyState implements HomeState{}

class LoadingState implements HomeState{}

class LoadedState implements HomeState {
  List<MusicModel> allmusics;
  LoadedState({
    required this.allmusics,
  });
}

class ErrorState implements HomeState{
  final String message;

  ErrorState(this.message);
}
