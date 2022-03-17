part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class LoginEvent extends AppEvent {}

class LogoutEvent extends AppEvent {}

class NewDeepLinkEvent extends AppEvent {
  final String link;
  NewDeepLinkEvent(this.link);
}
