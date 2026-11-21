import 'package:equatable/equatable.dart';

class RefreshiServiceDto extends Equatable {
  const RefreshiServiceDto({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
  });

  factory RefreshiServiceDto.fromJson(Map<String, dynamic> json) =>
      RefreshiServiceDto(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        durationMinutes: json['durationMinutes'] as int,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'durationMinutes': durationMinutes,
  };

  final String id;
  final String name;
  final String description;
  final double price;
  final int durationMinutes;

  @override
  List<Object?> get props => [id, name, description, price, durationMinutes];
}
