import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';

@injectable
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.empty()) {
    on<MockLogin>((event, emit) {
      if (event.username == 'admin' && event.password == 'admin') {
        emit(state.copyWith(isLoggedIn: true));
      } else {
        emit(
          state.copyWith(
            isLoggedIn: false,
            error: 'invalid username or password',
          ),
        );
      }
    });
  }
  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
