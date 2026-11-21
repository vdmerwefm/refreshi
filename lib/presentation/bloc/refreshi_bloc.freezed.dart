// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refreshi_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RefreshiEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshiEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RefreshiEvent()';
}


}

/// @nodoc
class $RefreshiEventCopyWith<$Res>  {
$RefreshiEventCopyWith(RefreshiEvent _, $Res Function(RefreshiEvent) __);
}


/// Adds pattern-matching-related methods to [RefreshiEvent].
extension RefreshiEventPatterns on RefreshiEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetRefreshiServices value)?  getRefreshiServices,TResult Function( GetRefreshiOrder value)?  getRefreshiOrder,TResult Function( AddServiceToOrderList value)?  addServiceToOrderList,TResult Function( CreateRefreshiOrder value)?  createRefreshiOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetRefreshiServices() when getRefreshiServices != null:
return getRefreshiServices(_that);case GetRefreshiOrder() when getRefreshiOrder != null:
return getRefreshiOrder(_that);case AddServiceToOrderList() when addServiceToOrderList != null:
return addServiceToOrderList(_that);case CreateRefreshiOrder() when createRefreshiOrder != null:
return createRefreshiOrder(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetRefreshiServices value)  getRefreshiServices,required TResult Function( GetRefreshiOrder value)  getRefreshiOrder,required TResult Function( AddServiceToOrderList value)  addServiceToOrderList,required TResult Function( CreateRefreshiOrder value)  createRefreshiOrder,}){
final _that = this;
switch (_that) {
case GetRefreshiServices():
return getRefreshiServices(_that);case GetRefreshiOrder():
return getRefreshiOrder(_that);case AddServiceToOrderList():
return addServiceToOrderList(_that);case CreateRefreshiOrder():
return createRefreshiOrder(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetRefreshiServices value)?  getRefreshiServices,TResult? Function( GetRefreshiOrder value)?  getRefreshiOrder,TResult? Function( AddServiceToOrderList value)?  addServiceToOrderList,TResult? Function( CreateRefreshiOrder value)?  createRefreshiOrder,}){
final _that = this;
switch (_that) {
case GetRefreshiServices() when getRefreshiServices != null:
return getRefreshiServices(_that);case GetRefreshiOrder() when getRefreshiOrder != null:
return getRefreshiOrder(_that);case AddServiceToOrderList() when addServiceToOrderList != null:
return addServiceToOrderList(_that);case CreateRefreshiOrder() when createRefreshiOrder != null:
return createRefreshiOrder(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getRefreshiServices,TResult Function( String id)?  getRefreshiOrder,TResult Function( String id)?  addServiceToOrderList,TResult Function( String idempotencyKey,  List<String> serviceIds,  String cardToken,  String scheduledTime)?  createRefreshiOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetRefreshiServices() when getRefreshiServices != null:
return getRefreshiServices();case GetRefreshiOrder() when getRefreshiOrder != null:
return getRefreshiOrder(_that.id);case AddServiceToOrderList() when addServiceToOrderList != null:
return addServiceToOrderList(_that.id);case CreateRefreshiOrder() when createRefreshiOrder != null:
return createRefreshiOrder(_that.idempotencyKey,_that.serviceIds,_that.cardToken,_that.scheduledTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getRefreshiServices,required TResult Function( String id)  getRefreshiOrder,required TResult Function( String id)  addServiceToOrderList,required TResult Function( String idempotencyKey,  List<String> serviceIds,  String cardToken,  String scheduledTime)  createRefreshiOrder,}) {final _that = this;
switch (_that) {
case GetRefreshiServices():
return getRefreshiServices();case GetRefreshiOrder():
return getRefreshiOrder(_that.id);case AddServiceToOrderList():
return addServiceToOrderList(_that.id);case CreateRefreshiOrder():
return createRefreshiOrder(_that.idempotencyKey,_that.serviceIds,_that.cardToken,_that.scheduledTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getRefreshiServices,TResult? Function( String id)?  getRefreshiOrder,TResult? Function( String id)?  addServiceToOrderList,TResult? Function( String idempotencyKey,  List<String> serviceIds,  String cardToken,  String scheduledTime)?  createRefreshiOrder,}) {final _that = this;
switch (_that) {
case GetRefreshiServices() when getRefreshiServices != null:
return getRefreshiServices();case GetRefreshiOrder() when getRefreshiOrder != null:
return getRefreshiOrder(_that.id);case AddServiceToOrderList() when addServiceToOrderList != null:
return addServiceToOrderList(_that.id);case CreateRefreshiOrder() when createRefreshiOrder != null:
return createRefreshiOrder(_that.idempotencyKey,_that.serviceIds,_that.cardToken,_that.scheduledTime);case _:
  return null;

}
}

}

/// @nodoc


class GetRefreshiServices implements RefreshiEvent {
  const GetRefreshiServices();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRefreshiServices);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RefreshiEvent.getRefreshiServices()';
}


}




/// @nodoc


class GetRefreshiOrder implements RefreshiEvent {
  const GetRefreshiOrder(this.id);
  

 final  String id;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRefreshiOrderCopyWith<GetRefreshiOrder> get copyWith => _$GetRefreshiOrderCopyWithImpl<GetRefreshiOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRefreshiOrder&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RefreshiEvent.getRefreshiOrder(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetRefreshiOrderCopyWith<$Res> implements $RefreshiEventCopyWith<$Res> {
  factory $GetRefreshiOrderCopyWith(GetRefreshiOrder value, $Res Function(GetRefreshiOrder) _then) = _$GetRefreshiOrderCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$GetRefreshiOrderCopyWithImpl<$Res>
    implements $GetRefreshiOrderCopyWith<$Res> {
  _$GetRefreshiOrderCopyWithImpl(this._self, this._then);

  final GetRefreshiOrder _self;
  final $Res Function(GetRefreshiOrder) _then;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetRefreshiOrder(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddServiceToOrderList implements RefreshiEvent {
  const AddServiceToOrderList(this.id);
  

 final  String id;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddServiceToOrderListCopyWith<AddServiceToOrderList> get copyWith => _$AddServiceToOrderListCopyWithImpl<AddServiceToOrderList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddServiceToOrderList&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RefreshiEvent.addServiceToOrderList(id: $id)';
}


}

/// @nodoc
abstract mixin class $AddServiceToOrderListCopyWith<$Res> implements $RefreshiEventCopyWith<$Res> {
  factory $AddServiceToOrderListCopyWith(AddServiceToOrderList value, $Res Function(AddServiceToOrderList) _then) = _$AddServiceToOrderListCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$AddServiceToOrderListCopyWithImpl<$Res>
    implements $AddServiceToOrderListCopyWith<$Res> {
  _$AddServiceToOrderListCopyWithImpl(this._self, this._then);

  final AddServiceToOrderList _self;
  final $Res Function(AddServiceToOrderList) _then;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AddServiceToOrderList(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateRefreshiOrder implements RefreshiEvent {
  const CreateRefreshiOrder(this.idempotencyKey, final  List<String> serviceIds, this.cardToken, this.scheduledTime): _serviceIds = serviceIds;
  

 final  String idempotencyKey;
 final  List<String> _serviceIds;
 List<String> get serviceIds {
  if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceIds);
}

 final  String cardToken;
 final  String scheduledTime;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRefreshiOrderCopyWith<CreateRefreshiOrder> get copyWith => _$CreateRefreshiOrderCopyWithImpl<CreateRefreshiOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRefreshiOrder&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&const DeepCollectionEquality().equals(other._serviceIds, _serviceIds)&&(identical(other.cardToken, cardToken) || other.cardToken == cardToken)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime));
}


@override
int get hashCode => Object.hash(runtimeType,idempotencyKey,const DeepCollectionEquality().hash(_serviceIds),cardToken,scheduledTime);

@override
String toString() {
  return 'RefreshiEvent.createRefreshiOrder(idempotencyKey: $idempotencyKey, serviceIds: $serviceIds, cardToken: $cardToken, scheduledTime: $scheduledTime)';
}


}

/// @nodoc
abstract mixin class $CreateRefreshiOrderCopyWith<$Res> implements $RefreshiEventCopyWith<$Res> {
  factory $CreateRefreshiOrderCopyWith(CreateRefreshiOrder value, $Res Function(CreateRefreshiOrder) _then) = _$CreateRefreshiOrderCopyWithImpl;
@useResult
$Res call({
 String idempotencyKey, List<String> serviceIds, String cardToken, String scheduledTime
});




}
/// @nodoc
class _$CreateRefreshiOrderCopyWithImpl<$Res>
    implements $CreateRefreshiOrderCopyWith<$Res> {
  _$CreateRefreshiOrderCopyWithImpl(this._self, this._then);

  final CreateRefreshiOrder _self;
  final $Res Function(CreateRefreshiOrder) _then;

/// Create a copy of RefreshiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? idempotencyKey = null,Object? serviceIds = null,Object? cardToken = null,Object? scheduledTime = null,}) {
  return _then(CreateRefreshiOrder(
null == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String,null == serviceIds ? _self._serviceIds : serviceIds // ignore: cast_nullable_to_non_nullable
as List<String>,null == cardToken ? _self.cardToken : cardToken // ignore: cast_nullable_to_non_nullable
as String,null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RefreshiState {

 RefreshiFailure? get failure; bool get isLoading; List<RefreshiServiceDto>? get refreshiServices; List<String>? get selectedServices; RefreshiOrderDto? get refreshiOrder; dynamic get isEnabled; String? get status;
/// Create a copy of RefreshiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshiStateCopyWith<RefreshiState> get copyWith => _$RefreshiStateCopyWithImpl<RefreshiState>(this as RefreshiState, _$identity);

  /// Serializes this RefreshiState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshiState&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.refreshiServices, refreshiServices)&&const DeepCollectionEquality().equals(other.selectedServices, selectedServices)&&(identical(other.refreshiOrder, refreshiOrder) || other.refreshiOrder == refreshiOrder)&&const DeepCollectionEquality().equals(other.isEnabled, isEnabled)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,failure,isLoading,const DeepCollectionEquality().hash(refreshiServices),const DeepCollectionEquality().hash(selectedServices),refreshiOrder,const DeepCollectionEquality().hash(isEnabled),status);

@override
String toString() {
  return 'RefreshiState(failure: $failure, isLoading: $isLoading, refreshiServices: $refreshiServices, selectedServices: $selectedServices, refreshiOrder: $refreshiOrder, isEnabled: $isEnabled, status: $status)';
}


}

/// @nodoc
abstract mixin class $RefreshiStateCopyWith<$Res>  {
  factory $RefreshiStateCopyWith(RefreshiState value, $Res Function(RefreshiState) _then) = _$RefreshiStateCopyWithImpl;
@useResult
$Res call({
 RefreshiFailure? failure, bool isLoading, List<RefreshiServiceDto>? refreshiServices, List<String>? selectedServices, RefreshiOrderDto? refreshiOrder, dynamic isEnabled, String? status
});




}
/// @nodoc
class _$RefreshiStateCopyWithImpl<$Res>
    implements $RefreshiStateCopyWith<$Res> {
  _$RefreshiStateCopyWithImpl(this._self, this._then);

  final RefreshiState _self;
  final $Res Function(RefreshiState) _then;

/// Create a copy of RefreshiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? failure = freezed,Object? isLoading = null,Object? refreshiServices = freezed,Object? selectedServices = freezed,Object? refreshiOrder = freezed,Object? isEnabled = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as RefreshiFailure?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,refreshiServices: freezed == refreshiServices ? _self.refreshiServices : refreshiServices // ignore: cast_nullable_to_non_nullable
as List<RefreshiServiceDto>?,selectedServices: freezed == selectedServices ? _self.selectedServices : selectedServices // ignore: cast_nullable_to_non_nullable
as List<String>?,refreshiOrder: freezed == refreshiOrder ? _self.refreshiOrder : refreshiOrder // ignore: cast_nullable_to_non_nullable
as RefreshiOrderDto?,isEnabled: freezed == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as dynamic,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshiState].
extension RefreshiStatePatterns on RefreshiState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshiState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshiState value)  $default,){
final _that = this;
switch (_that) {
case _RefreshiState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshiState value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshiState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RefreshiFailure? failure,  bool isLoading,  List<RefreshiServiceDto>? refreshiServices,  List<String>? selectedServices,  RefreshiOrderDto? refreshiOrder,  dynamic isEnabled,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshiState() when $default != null:
return $default(_that.failure,_that.isLoading,_that.refreshiServices,_that.selectedServices,_that.refreshiOrder,_that.isEnabled,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RefreshiFailure? failure,  bool isLoading,  List<RefreshiServiceDto>? refreshiServices,  List<String>? selectedServices,  RefreshiOrderDto? refreshiOrder,  dynamic isEnabled,  String? status)  $default,) {final _that = this;
switch (_that) {
case _RefreshiState():
return $default(_that.failure,_that.isLoading,_that.refreshiServices,_that.selectedServices,_that.refreshiOrder,_that.isEnabled,_that.status);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RefreshiFailure? failure,  bool isLoading,  List<RefreshiServiceDto>? refreshiServices,  List<String>? selectedServices,  RefreshiOrderDto? refreshiOrder,  dynamic isEnabled,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _RefreshiState() when $default != null:
return $default(_that.failure,_that.isLoading,_that.refreshiServices,_that.selectedServices,_that.refreshiOrder,_that.isEnabled,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshiState implements RefreshiState {
  const _RefreshiState({this.failure, this.isLoading = false, final  List<RefreshiServiceDto>? refreshiServices, final  List<String>? selectedServices, this.refreshiOrder, this.isEnabled = false, this.status}): _refreshiServices = refreshiServices,_selectedServices = selectedServices;
  factory _RefreshiState.fromJson(Map<String, dynamic> json) => _$RefreshiStateFromJson(json);

@override final  RefreshiFailure? failure;
@override@JsonKey() final  bool isLoading;
 final  List<RefreshiServiceDto>? _refreshiServices;
@override List<RefreshiServiceDto>? get refreshiServices {
  final value = _refreshiServices;
  if (value == null) return null;
  if (_refreshiServices is EqualUnmodifiableListView) return _refreshiServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _selectedServices;
@override List<String>? get selectedServices {
  final value = _selectedServices;
  if (value == null) return null;
  if (_selectedServices is EqualUnmodifiableListView) return _selectedServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  RefreshiOrderDto? refreshiOrder;
@override@JsonKey() final  dynamic isEnabled;
@override final  String? status;

/// Create a copy of RefreshiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshiStateCopyWith<_RefreshiState> get copyWith => __$RefreshiStateCopyWithImpl<_RefreshiState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshiStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshiState&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._refreshiServices, _refreshiServices)&&const DeepCollectionEquality().equals(other._selectedServices, _selectedServices)&&(identical(other.refreshiOrder, refreshiOrder) || other.refreshiOrder == refreshiOrder)&&const DeepCollectionEquality().equals(other.isEnabled, isEnabled)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,failure,isLoading,const DeepCollectionEquality().hash(_refreshiServices),const DeepCollectionEquality().hash(_selectedServices),refreshiOrder,const DeepCollectionEquality().hash(isEnabled),status);

@override
String toString() {
  return 'RefreshiState(failure: $failure, isLoading: $isLoading, refreshiServices: $refreshiServices, selectedServices: $selectedServices, refreshiOrder: $refreshiOrder, isEnabled: $isEnabled, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RefreshiStateCopyWith<$Res> implements $RefreshiStateCopyWith<$Res> {
  factory _$RefreshiStateCopyWith(_RefreshiState value, $Res Function(_RefreshiState) _then) = __$RefreshiStateCopyWithImpl;
@override @useResult
$Res call({
 RefreshiFailure? failure, bool isLoading, List<RefreshiServiceDto>? refreshiServices, List<String>? selectedServices, RefreshiOrderDto? refreshiOrder, dynamic isEnabled, String? status
});




}
/// @nodoc
class __$RefreshiStateCopyWithImpl<$Res>
    implements _$RefreshiStateCopyWith<$Res> {
  __$RefreshiStateCopyWithImpl(this._self, this._then);

  final _RefreshiState _self;
  final $Res Function(_RefreshiState) _then;

/// Create a copy of RefreshiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failure = freezed,Object? isLoading = null,Object? refreshiServices = freezed,Object? selectedServices = freezed,Object? refreshiOrder = freezed,Object? isEnabled = freezed,Object? status = freezed,}) {
  return _then(_RefreshiState(
failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as RefreshiFailure?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,refreshiServices: freezed == refreshiServices ? _self._refreshiServices : refreshiServices // ignore: cast_nullable_to_non_nullable
as List<RefreshiServiceDto>?,selectedServices: freezed == selectedServices ? _self._selectedServices : selectedServices // ignore: cast_nullable_to_non_nullable
as List<String>?,refreshiOrder: freezed == refreshiOrder ? _self.refreshiOrder : refreshiOrder // ignore: cast_nullable_to_non_nullable
as RefreshiOrderDto?,isEnabled: freezed == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as dynamic,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
