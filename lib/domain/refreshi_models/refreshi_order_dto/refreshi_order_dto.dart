import 'package:equatable/equatable.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';

class RefreshiOrderDto extends Equatable {
  const RefreshiOrderDto({
    required this.id,
    required this.idempotencyKey,
    required this.scheduledTime,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.services,
    this.holdConfirmedAt,
  });

  factory RefreshiOrderDto.fromJson(Map<String, dynamic> json) =>
      RefreshiOrderDto(
        id: json['id'] as String,
        idempotencyKey: json['idempotencyKey'] as String,
        scheduledTime: json['scheduledTime'] as DateTime,
        totalPrice: json['totalPrice'] as double,
        status: json['status'] as String,
        createdAt: json['createdAt'] as DateTime,
        services: json['services'] as List<RefreshiServiceDto>,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'idempotencyKey': idempotencyKey,
    'scheduledTime': scheduledTime,
    'totalPrice': totalPrice,
    'status': status,
    'createdAt': createdAt,
    'services': services,
  };

  factory RefreshiOrderDto.empty() => RefreshiOrderDto(
    id: '',
    idempotencyKey: '',
    scheduledTime: DateTime.now(),
    totalPrice: 0,
    status: '',
    createdAt: DateTime.now(),
    services: [],
  );

  final String id;
  final String idempotencyKey;
  final DateTime scheduledTime;
  final double totalPrice;
  final String status;
  final DateTime createdAt;
  final List<RefreshiServiceDto> services;
  final DateTime? holdConfirmedAt;

  @override
  List<Object?> get props => [
    id,
    idempotencyKey,
    scheduledTime,
    totalPrice,
    status,
    createdAt,
    services,
    holdConfirmedAt,
  ];
}
