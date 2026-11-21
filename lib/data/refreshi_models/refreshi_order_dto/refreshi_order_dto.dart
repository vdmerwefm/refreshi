import 'package:equatable/equatable.dart';
import 'package:refreshi/data/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';

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
