// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  isLoggedIn: json['isLoggedIn'] as bool? ?? false,
  username: json['username'] as String?,
  password: json['password'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
      'username': instance.username,
      'password': instance.password,
      'error': instance.error,
    };
