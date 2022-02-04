import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/enums.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

// this bloc handle the app navigation logic
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  //change section
  void changePage(Pages selectedPage) {
    emit(state.copyWith(
      currentPage: selectedPage,
      title: selectedPage.getPageTitle(),
    ));
  }

  //change the title displayed in the title bar, according to the current section
  void changeTitle(Rooms currentRoom) {
    emit(state.copyWith(title: currentRoom.title));
  }
}
