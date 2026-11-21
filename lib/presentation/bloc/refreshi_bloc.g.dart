// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refreshi_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshiState _$RefreshiStateFromJson(Map<String, dynamic> json) =>
    _RefreshiState(
      failure: json['failure'] == null
          ? null
          : RefreshiFailure.fromJson(json['failure'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      refreshiServices: (json['refreshiServices'] as List<dynamic>?)
          ?.map((e) => RefreshiServiceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedServices: (json['selectedServices'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      refreshiOrder: json['refreshiOrder'] == null
          ? null
          : RefreshiOrderDto.fromJson(
              json['refreshiOrder'] as Map<String, dynamic>,
            ),
      isEnabled: json['isEnabled'] ?? false,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RefreshiStateToJson(_RefreshiState instance) =>
    <String, dynamic>{
      'failure': instance.failure,
      'isLoading': instance.isLoading,
      'refreshiServices': instance.refreshiServices,
      'selectedServices': instance.selectedServices,
      'refreshiOrder': instance.refreshiOrder,
      'isEnabled': instance.isEnabled,
      'status': instance.status,
    };
