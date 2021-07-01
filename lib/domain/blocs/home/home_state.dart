part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @required Pages currentPage,
    @required String title,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
    currentPage: Pages.workplaces_page,
    title: Pages.workplaces_page.getPageTitle(),
  );
}
