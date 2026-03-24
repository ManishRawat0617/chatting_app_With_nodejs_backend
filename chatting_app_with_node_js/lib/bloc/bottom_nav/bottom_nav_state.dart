part of 'bottom_nav_bloc.dart';

class BottomNavState extends Equatable {
  final int selectIndex;

  BottomNavState([this.selectIndex = 0]);

  @override
  List<Object> get props => [selectIndex];
}
