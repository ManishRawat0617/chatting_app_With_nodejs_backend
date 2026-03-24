import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends BottomNavEvent {
  final int index;
  ChangeTabEvent({required this.index});

  @override
  List<Object> get props => [index];
}
