class RefreshiFailure {
  const RefreshiFailure(this.message);
  final String message;

  factory RefreshiFailure.serviceValidationException() =>
      ServiceValidationException();

  factory RefreshiFailure.invalidCardException() => InvalidCardException();

  factory RefreshiFailure.mapOrderException() => MapOrderException();

  factory RefreshiFailure.mapCreateOrderException() =>
      MapCreateOrderException();

  factory RefreshiFailure.mapServicesException() => MapServicesException();

  factory RefreshiFailure.fromJson(Map<String, dynamic> json) =>
      RefreshiFailure(json['message'] as String);

  Map<String, dynamic> toJson() => {'message': message};
}

class ServiceValidationException extends RefreshiFailure {
  const ServiceValidationException([super.message = 'select 1 or 2 services']);
}

class InvalidCardException extends RefreshiFailure {
  const InvalidCardException([super.message = 'a valid card token is needed']);
}

class MapOrderException extends RefreshiFailure {
  const MapOrderException([
    super.message = 'failed to map raw order data to OrderDTO',
  ]);
}

class MapCreateOrderException extends RefreshiFailure {
  const MapCreateOrderException([
    super.message = 'failed to map order creation to OrderDTO',
  ]);
}

class MapServicesException extends RefreshiFailure {
  const MapServicesException([
    super.message = 'failed to map local services to ServicesDTO',
  ]);
}

class InvalidLocalStorageException extends RefreshiFailure {
  const InvalidLocalStorageException(super.message);
}
