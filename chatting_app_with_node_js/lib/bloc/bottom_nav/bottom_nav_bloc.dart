import 'package:bloc/bloc.dart';
import 'package:chatting_app_with_node_js/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}
