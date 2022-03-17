part of 'app_bloc.dart';

class AppState {
  final bool authenticated;

  final bool loading;

  final String deepLink;

  AppState({
    this.authenticated = false,
    this.loading = false,
    this.deepLink = '',
  });

  AppState copyWith({
    bool? loading,
    bool? isLogged,
    String? deepLink,
  }) {
    return AppState(
      loading: loading ?? this.loading,
      authenticated: isLogged ?? this.authenticated,
      deepLink: deepLink ?? this.deepLink,
    );
  }
}
