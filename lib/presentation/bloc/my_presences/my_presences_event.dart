part of 'my_presences_bloc.dart';

@immutable
abstract class MyPresencesEvent {}

class FetchCurrentUserPresences extends MyPresencesEvent {}


class OnCurrentUserPresencesUpdate extends MyPresencesEvent {
  final List<DateTime> updatedPresences;

  OnCurrentUserPresencesUpdate(this.updatedPresences);
}
