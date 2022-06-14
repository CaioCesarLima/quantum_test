
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/home_event.dart';
import '../states/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc(initialState) : super(EmptyState()){
    on<FetchMusics>((event, emit) {
      
    },);
  }
  
}