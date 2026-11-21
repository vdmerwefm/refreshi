import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Query$GetServices {
  Query$GetServices({this.services, this.$__typename = 'Query'});

  factory Query$GetServices.fromJson(Map<String, dynamic> json) {
    final l$services = json['services'];
    final l$$__typename = json['__typename'];
    return Query$GetServices(
      services: (l$services as List<dynamic>?)
          ?.map(
            (e) => Query$GetServices$services.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetServices$services>? services;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$services = services;
    _resultData['services'] = l$services?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$services = services;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$services == null ? null : Object.hashAll(l$services.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetServices || runtimeType != other.runtimeType) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetServices on Query$GetServices {
  CopyWith$Query$GetServices<Query$GetServices> get copyWith =>
      CopyWith$Query$GetServices(this, (i) => i);
}

abstract class CopyWith$Query$GetServices<TRes> {
  factory CopyWith$Query$GetServices(
    Query$GetServices instance,
    TRes Function(Query$GetServices) then,
  ) = _CopyWithImpl$Query$GetServices;

  factory CopyWith$Query$GetServices.stub(TRes res) =
      _CopyWithStubImpl$Query$GetServices;

  TRes call({List<Query$GetServices$services>? services, String? $__typename});
  TRes services(
    Iterable<Query$GetServices$services>? Function(
      Iterable<
        CopyWith$Query$GetServices$services<Query$GetServices$services>
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetServices<TRes>
    implements CopyWith$Query$GetServices<TRes> {
  _CopyWithImpl$Query$GetServices(this._instance, this._then);

  final Query$GetServices _instance;

  final TRes Function(Query$GetServices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? services = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetServices(
      services: services == _undefined
          ? _instance.services
          : (services as List<Query$GetServices$services>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes services(
    Iterable<Query$GetServices$services>? Function(
      Iterable<
        CopyWith$Query$GetServices$services<Query$GetServices$services>
      >?,
    )
    _fn,
  ) => call(
    services: _fn(
      _instance.services?.map(
        (e) => CopyWith$Query$GetServices$services(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetServices<TRes>
    implements CopyWith$Query$GetServices<TRes> {
  _CopyWithStubImpl$Query$GetServices(this._res);

  TRes _res;

  call({List<Query$GetServices$services>? services, String? $__typename}) =>
      _res;

  services(_fn) => _res;
}

const documentNodeQueryGetServices = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetServices'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'services'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'durationMinutes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetServices _parserFn$Query$GetServices(Map<String, dynamic> data) =>
    Query$GetServices.fromJson(data);
typedef OnQueryComplete$Query$GetServices =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetServices?);

class Options$Query$GetServices
    extends graphql.QueryOptions<Query$GetServices> {
  Options$Query$GetServices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetServices? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetServices? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetServices(data),
               ),
         onError: onError,
         document: documentNodeQueryGetServices,
         parserFn: _parserFn$Query$GetServices,
       );

  final OnQueryComplete$Query$GetServices? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetServices
    extends graphql.WatchQueryOptions<Query$GetServices> {
  WatchOptions$Query$GetServices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetServices? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetServices,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetServices,
       );
}

class FetchMoreOptions$Query$GetServices extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetServices({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryGetServices);
}

extension ClientExtension$Query$GetServices on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetServices>> query$GetServices([
    Options$Query$GetServices? options,
  ]) async => await this.query(options ?? Options$Query$GetServices());

  graphql.ObservableQuery<Query$GetServices> watchQuery$GetServices([
    WatchOptions$Query$GetServices? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetServices());

  void writeQuery$GetServices({
    required Query$GetServices data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetServices),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetServices? readQuery$GetServices({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetServices),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetServices.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetServices> useQuery$GetServices([
  Options$Query$GetServices? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetServices());
graphql.ObservableQuery<Query$GetServices> useWatchQuery$GetServices([
  WatchOptions$Query$GetServices? options,
]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetServices());

class Query$GetServices$Widget
    extends graphql_flutter.Query<Query$GetServices> {
  Query$GetServices$Widget({
    widgets.Key? key,
    Options$Query$GetServices? options,
    required graphql_flutter.QueryBuilder<Query$GetServices> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetServices(),
         builder: builder,
       );
}

class Query$GetServices$services {
  Query$GetServices$services({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    this.$__typename = 'ServiceItem',
  });

  factory Query$GetServices$services.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$durationMinutes = json['durationMinutes'];
    final l$$__typename = json['__typename'];
    return Query$GetServices$services(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String),
      price: (l$price as num).toDouble(),
      durationMinutes: (l$durationMinutes as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String description;

  final double price;

  final int durationMinutes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$durationMinutes = durationMinutes;
    _resultData['durationMinutes'] = l$durationMinutes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$durationMinutes = durationMinutes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$durationMinutes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetServices$services ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$durationMinutes = durationMinutes;
    final lOther$durationMinutes = other.durationMinutes;
    if (l$durationMinutes != lOther$durationMinutes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetServices$services
    on Query$GetServices$services {
  CopyWith$Query$GetServices$services<Query$GetServices$services>
  get copyWith => CopyWith$Query$GetServices$services(this, (i) => i);
}

abstract class CopyWith$Query$GetServices$services<TRes> {
  factory CopyWith$Query$GetServices$services(
    Query$GetServices$services instance,
    TRes Function(Query$GetServices$services) then,
  ) = _CopyWithImpl$Query$GetServices$services;

  factory CopyWith$Query$GetServices$services.stub(TRes res) =
      _CopyWithStubImpl$Query$GetServices$services;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetServices$services<TRes>
    implements CopyWith$Query$GetServices$services<TRes> {
  _CopyWithImpl$Query$GetServices$services(this._instance, this._then);

  final Query$GetServices$services _instance;

  final TRes Function(Query$GetServices$services) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? durationMinutes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetServices$services(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      durationMinutes: durationMinutes == _undefined || durationMinutes == null
          ? _instance.durationMinutes
          : (durationMinutes as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetServices$services<TRes>
    implements CopyWith$Query$GetServices$services<TRes> {
  _CopyWithStubImpl$Query$GetServices$services(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  }) => _res;
}

class Variables$Query$GetOrder {
  factory Variables$Query$GetOrder({required String id}) =>
      Variables$Query$GetOrder._({r'id': id});

  Variables$Query$GetOrder._(this._$data);

  factory Variables$Query$GetOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetOrder<Variables$Query$GetOrder> get copyWith =>
      CopyWith$Variables$Query$GetOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetOrder<TRes> {
  factory CopyWith$Variables$Query$GetOrder(
    Variables$Query$GetOrder instance,
    TRes Function(Variables$Query$GetOrder) then,
  ) = _CopyWithImpl$Variables$Query$GetOrder;

  factory CopyWith$Variables$Query$GetOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetOrder;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetOrder<TRes>
    implements CopyWith$Variables$Query$GetOrder<TRes> {
  _CopyWithImpl$Variables$Query$GetOrder(this._instance, this._then);

  final Variables$Query$GetOrder _instance;

  final TRes Function(Variables$Query$GetOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetOrder._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetOrder<TRes>
    implements CopyWith$Variables$Query$GetOrder<TRes> {
  _CopyWithStubImpl$Variables$Query$GetOrder(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetOrder {
  Query$GetOrder({this.order, this.$__typename = 'Query'});

  factory Query$GetOrder.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder(
      order: l$order == null
          ? null
          : Query$GetOrder$order.fromJson((l$order as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrder$order? order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetOrder on Query$GetOrder {
  CopyWith$Query$GetOrder<Query$GetOrder> get copyWith =>
      CopyWith$Query$GetOrder(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder<TRes> {
  factory CopyWith$Query$GetOrder(
    Query$GetOrder instance,
    TRes Function(Query$GetOrder) then,
  ) = _CopyWithImpl$Query$GetOrder;

  factory CopyWith$Query$GetOrder.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder;

  TRes call({Query$GetOrder$order? order, String? $__typename});
  CopyWith$Query$GetOrder$order<TRes> get order;
}

class _CopyWithImpl$Query$GetOrder<TRes>
    implements CopyWith$Query$GetOrder<TRes> {
  _CopyWithImpl$Query$GetOrder(this._instance, this._then);

  final Query$GetOrder _instance;

  final TRes Function(Query$GetOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder(
          order: order == _undefined
              ? _instance.order
              : (order as Query$GetOrder$order?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrder$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Query$GetOrder$order.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order(local$order, (e) => call(order: e));
  }
}

class _CopyWithStubImpl$Query$GetOrder<TRes>
    implements CopyWith$Query$GetOrder<TRes> {
  _CopyWithStubImpl$Query$GetOrder(this._res);

  TRes _res;

  call({Query$GetOrder$order? order, String? $__typename}) => _res;

  CopyWith$Query$GetOrder$order<TRes> get order =>
      CopyWith$Query$GetOrder$order.stub(_res);
}

const documentNodeQueryGetOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'order'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'idempotencyKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'scheduledTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'totalPrice'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'holdConfirmedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'services'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'price'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'durationMinutes'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetOrder _parserFn$Query$GetOrder(Map<String, dynamic> data) =>
    Query$GetOrder.fromJson(data);
typedef OnQueryComplete$Query$GetOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetOrder?);

class Options$Query$GetOrder extends graphql.QueryOptions<Query$GetOrder> {
  Options$Query$GetOrder({
    String? operationName,
    required Variables$Query$GetOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrder? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetOrder? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetOrder(data),
               ),
         onError: onError,
         document: documentNodeQueryGetOrder,
         parserFn: _parserFn$Query$GetOrder,
       );

  final OnQueryComplete$Query$GetOrder? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetOrder
    extends graphql.WatchQueryOptions<Query$GetOrder> {
  WatchOptions$Query$GetOrder({
    String? operationName,
    required Variables$Query$GetOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrder? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetOrder,
       );
}

class FetchMoreOptions$Query$GetOrder extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetOrder({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetOrder variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetOrder,
       );
}

extension ClientExtension$Query$GetOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetOrder>> query$GetOrder(
    Options$Query$GetOrder options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetOrder> watchQuery$GetOrder(
    WatchOptions$Query$GetOrder options,
  ) => this.watchQuery(options);

  void writeQuery$GetOrder({
    required Query$GetOrder data,
    required Variables$Query$GetOrder variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetOrder),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetOrder? readQuery$GetOrder({
    required Variables$Query$GetOrder variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetOrder),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetOrder.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetOrder> useQuery$GetOrder(
  Options$Query$GetOrder options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetOrder> useWatchQuery$GetOrder(
  WatchOptions$Query$GetOrder options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetOrder$Widget extends graphql_flutter.Query<Query$GetOrder> {
  Query$GetOrder$Widget({
    widgets.Key? key,
    required Options$Query$GetOrder options,
    required graphql_flutter.QueryBuilder<Query$GetOrder> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetOrder$order {
  Query$GetOrder$order({
    required this.id,
    required this.idempotencyKey,
    required this.scheduledTime,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.holdConfirmedAt,
    this.services,
    this.$__typename = 'Order',
  });

  factory Query$GetOrder$order.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$idempotencyKey = json['idempotencyKey'];
    final l$scheduledTime = json['scheduledTime'];
    final l$totalPrice = json['totalPrice'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$holdConfirmedAt = json['holdConfirmedAt'];
    final l$services = json['services'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order(
      id: (l$id as String),
      idempotencyKey: (l$idempotencyKey as String),
      scheduledTime: (l$scheduledTime as String),
      totalPrice: (l$totalPrice as num).toDouble(),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      createdAt: (l$createdAt as String),
      holdConfirmedAt: (l$holdConfirmedAt as String),
      services: (l$services as List<dynamic>?)
          ?.map(
            (e) => Query$GetOrder$order$services.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String idempotencyKey;

  final String scheduledTime;

  final double totalPrice;

  final Enum$OrderStatus status;

  final String createdAt;

  final String holdConfirmedAt;

  final List<Query$GetOrder$order$services>? services;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$idempotencyKey = idempotencyKey;
    _resultData['idempotencyKey'] = l$idempotencyKey;
    final l$scheduledTime = scheduledTime;
    _resultData['scheduledTime'] = l$scheduledTime;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$holdConfirmedAt = holdConfirmedAt;
    _resultData['holdConfirmedAt'] = l$holdConfirmedAt;
    final l$services = services;
    _resultData['services'] = l$services?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$idempotencyKey = idempotencyKey;
    final l$scheduledTime = scheduledTime;
    final l$totalPrice = totalPrice;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$holdConfirmedAt = holdConfirmedAt;
    final l$services = services;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$idempotencyKey,
      l$scheduledTime,
      l$totalPrice,
      l$status,
      l$createdAt,
      l$holdConfirmedAt,
      l$services == null ? null : Object.hashAll(l$services.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder$order || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$idempotencyKey = idempotencyKey;
    final lOther$idempotencyKey = other.idempotencyKey;
    if (l$idempotencyKey != lOther$idempotencyKey) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$holdConfirmedAt = holdConfirmedAt;
    final lOther$holdConfirmedAt = other.holdConfirmedAt;
    if (l$holdConfirmedAt != lOther$holdConfirmedAt) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetOrder$order on Query$GetOrder$order {
  CopyWith$Query$GetOrder$order<Query$GetOrder$order> get copyWith =>
      CopyWith$Query$GetOrder$order(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order<TRes> {
  factory CopyWith$Query$GetOrder$order(
    Query$GetOrder$order instance,
    TRes Function(Query$GetOrder$order) then,
  ) = _CopyWithImpl$Query$GetOrder$order;

  factory CopyWith$Query$GetOrder$order.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order;

  TRes call({
    String? id,
    String? idempotencyKey,
    String? scheduledTime,
    double? totalPrice,
    Enum$OrderStatus? status,
    String? createdAt,
    String? holdConfirmedAt,
    List<Query$GetOrder$order$services>? services,
    String? $__typename,
  });
  TRes services(
    Iterable<Query$GetOrder$order$services>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$services<Query$GetOrder$order$services>
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetOrder$order<TRes>
    implements CopyWith$Query$GetOrder$order<TRes> {
  _CopyWithImpl$Query$GetOrder$order(this._instance, this._then);

  final Query$GetOrder$order _instance;

  final TRes Function(Query$GetOrder$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? idempotencyKey = _undefined,
    Object? scheduledTime = _undefined,
    Object? totalPrice = _undefined,
    Object? status = _undefined,
    Object? createdAt = _undefined,
    Object? holdConfirmedAt = _undefined,
    Object? services = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      idempotencyKey: idempotencyKey == _undefined || idempotencyKey == null
          ? _instance.idempotencyKey
          : (idempotencyKey as String),
      scheduledTime: scheduledTime == _undefined || scheduledTime == null
          ? _instance.scheduledTime
          : (scheduledTime as String),
      totalPrice: totalPrice == _undefined || totalPrice == null
          ? _instance.totalPrice
          : (totalPrice as double),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      holdConfirmedAt: holdConfirmedAt == _undefined || holdConfirmedAt == null
          ? _instance.holdConfirmedAt
          : (holdConfirmedAt as String),
      services: services == _undefined
          ? _instance.services
          : (services as List<Query$GetOrder$order$services>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes services(
    Iterable<Query$GetOrder$order$services>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$services<Query$GetOrder$order$services>
      >?,
    )
    _fn,
  ) => call(
    services: _fn(
      _instance.services?.map(
        (e) => CopyWith$Query$GetOrder$order$services(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetOrder$order<TRes>
    implements CopyWith$Query$GetOrder$order<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order(this._res);

  TRes _res;

  call({
    String? id,
    String? idempotencyKey,
    String? scheduledTime,
    double? totalPrice,
    Enum$OrderStatus? status,
    String? createdAt,
    String? holdConfirmedAt,
    List<Query$GetOrder$order$services>? services,
    String? $__typename,
  }) => _res;

  services(_fn) => _res;
}

class Query$GetOrder$order$services {
  Query$GetOrder$order$services({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    this.$__typename = 'ServiceItem',
  });

  factory Query$GetOrder$order$services.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$durationMinutes = json['durationMinutes'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$services(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String),
      price: (l$price as num).toDouble(),
      durationMinutes: (l$durationMinutes as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String description;

  final double price;

  final int durationMinutes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$durationMinutes = durationMinutes;
    _resultData['durationMinutes'] = l$durationMinutes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$durationMinutes = durationMinutes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$durationMinutes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder$order$services ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$durationMinutes = durationMinutes;
    final lOther$durationMinutes = other.durationMinutes;
    if (l$durationMinutes != lOther$durationMinutes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetOrder$order$services
    on Query$GetOrder$order$services {
  CopyWith$Query$GetOrder$order$services<Query$GetOrder$order$services>
  get copyWith => CopyWith$Query$GetOrder$order$services(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$services<TRes> {
  factory CopyWith$Query$GetOrder$order$services(
    Query$GetOrder$order$services instance,
    TRes Function(Query$GetOrder$order$services) then,
  ) = _CopyWithImpl$Query$GetOrder$order$services;

  factory CopyWith$Query$GetOrder$order$services.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$services;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetOrder$order$services<TRes>
    implements CopyWith$Query$GetOrder$order$services<TRes> {
  _CopyWithImpl$Query$GetOrder$order$services(this._instance, this._then);

  final Query$GetOrder$order$services _instance;

  final TRes Function(Query$GetOrder$order$services) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? durationMinutes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$services(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      durationMinutes: durationMinutes == _undefined || durationMinutes == null
          ? _instance.durationMinutes
          : (durationMinutes as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetOrder$order$services<TRes>
    implements CopyWith$Query$GetOrder$order$services<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$services(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreateOrder {
  factory Variables$Mutation$CreateOrder({Input$CreateOrderInput? input}) =>
      Variables$Mutation$CreateOrder._({if (input != null) r'input': input});

  Variables$Mutation$CreateOrder._(this._$data);

  factory Variables$Mutation$CreateOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('input')) {
      final l$input = data['input'];
      result$data['input'] = l$input == null
          ? null
          : Input$CreateOrderInput.fromJson((l$input as Map<String, dynamic>));
    }
    return Variables$Mutation$CreateOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateOrderInput? get input =>
      (_$data['input'] as Input$CreateOrderInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('input')) {
      final l$input = input;
      result$data['input'] = l$input?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateOrder<Variables$Mutation$CreateOrder>
  get copyWith => CopyWith$Variables$Mutation$CreateOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (_$data.containsKey('input') != other._$data.containsKey('input')) {
      return false;
    }
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([_$data.containsKey('input') ? l$input : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateOrder<TRes> {
  factory CopyWith$Variables$Mutation$CreateOrder(
    Variables$Mutation$CreateOrder instance,
    TRes Function(Variables$Mutation$CreateOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateOrder;

  factory CopyWith$Variables$Mutation$CreateOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateOrder;

  TRes call({Input$CreateOrderInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateOrder<TRes>
    implements CopyWith$Variables$Mutation$CreateOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateOrder(this._instance, this._then);

  final Variables$Mutation$CreateOrder _instance;

  final TRes Function(Variables$Mutation$CreateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateOrder._({
      ..._instance._$data,
      if (input != _undefined) 'input': (input as Input$CreateOrderInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateOrder<TRes>
    implements CopyWith$Variables$Mutation$CreateOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateOrder(this._res);

  TRes _res;

  call({Input$CreateOrderInput? input}) => _res;
}

class Mutation$CreateOrder {
  Mutation$CreateOrder({
    required this.createOrder,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateOrder.fromJson(Map<String, dynamic> json) {
    final l$createOrder = json['createOrder'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder(
      createOrder: Mutation$CreateOrder$createOrder.fromJson(
        (l$createOrder as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateOrder$createOrder createOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createOrder = createOrder;
    _resultData['createOrder'] = l$createOrder.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createOrder = createOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createOrder = createOrder;
    final lOther$createOrder = other.createOrder;
    if (l$createOrder != lOther$createOrder) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateOrder on Mutation$CreateOrder {
  CopyWith$Mutation$CreateOrder<Mutation$CreateOrder> get copyWith =>
      CopyWith$Mutation$CreateOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder<TRes> {
  factory CopyWith$Mutation$CreateOrder(
    Mutation$CreateOrder instance,
    TRes Function(Mutation$CreateOrder) then,
  ) = _CopyWithImpl$Mutation$CreateOrder;

  factory CopyWith$Mutation$CreateOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder;

  TRes call({
    Mutation$CreateOrder$createOrder? createOrder,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder;
}

class _CopyWithImpl$Mutation$CreateOrder<TRes>
    implements CopyWith$Mutation$CreateOrder<TRes> {
  _CopyWithImpl$Mutation$CreateOrder(this._instance, this._then);

  final Mutation$CreateOrder _instance;

  final TRes Function(Mutation$CreateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder(
      createOrder: createOrder == _undefined || createOrder == null
          ? _instance.createOrder
          : (createOrder as Mutation$CreateOrder$createOrder),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder {
    final local$createOrder = _instance.createOrder;
    return CopyWith$Mutation$CreateOrder$createOrder(
      local$createOrder,
      (e) => call(createOrder: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder<TRes>
    implements CopyWith$Mutation$CreateOrder<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder(this._res);

  TRes _res;

  call({Mutation$CreateOrder$createOrder? createOrder, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder =>
      CopyWith$Mutation$CreateOrder$createOrder.stub(_res);
}

const documentNodeMutationCreateOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateOrderInput'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'idempotencyKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'scheduledTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'totalPrice'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'holdConfirmedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'services'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'price'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'durationMinutes'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Mutation$CreateOrder _parserFn$Mutation$CreateOrder(
  Map<String, dynamic> data,
) => Mutation$CreateOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateOrder?);

class Options$Mutation$CreateOrder
    extends graphql.MutationOptions<Mutation$CreateOrder> {
  Options$Mutation$CreateOrder({
    String? operationName,
    Variables$Mutation$CreateOrder? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateOrder>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$CreateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateOrder,
         parserFn: _parserFn$Mutation$CreateOrder,
       );

  final OnMutationCompleted$Mutation$CreateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateOrder
    extends graphql.WatchQueryOptions<Mutation$CreateOrder> {
  WatchOptions$Mutation$CreateOrder({
    String? operationName,
    Variables$Mutation$CreateOrder? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationCreateOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateOrder,
       );
}

extension ClientExtension$Mutation$CreateOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateOrder>> mutate$CreateOrder([
    Options$Mutation$CreateOrder? options,
  ]) async => await this.mutate(options ?? Options$Mutation$CreateOrder());

  graphql.ObservableQuery<Mutation$CreateOrder> watchMutation$CreateOrder([
    WatchOptions$Mutation$CreateOrder? options,
  ]) => this.watchMutation(options ?? WatchOptions$Mutation$CreateOrder());
}

class Mutation$CreateOrder$HookResult {
  Mutation$CreateOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateOrder runMutation;

  final graphql.QueryResult<Mutation$CreateOrder> result;
}

Mutation$CreateOrder$HookResult useMutation$CreateOrder([
  WidgetOptions$Mutation$CreateOrder? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateOrder(),
  );
  return Mutation$CreateOrder$HookResult(
    ({variables, optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables?.toJson() ?? const {},
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateOrder> useWatchMutation$CreateOrder([
  WatchOptions$Mutation$CreateOrder? options,
]) => graphql_flutter.useWatchMutation(
  options ?? WatchOptions$Mutation$CreateOrder(),
);

class WidgetOptions$Mutation$CreateOrder
    extends graphql.MutationOptions<Mutation$CreateOrder> {
  WidgetOptions$Mutation$CreateOrder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateOrder>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$CreateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateOrder,
         parserFn: _parserFn$Mutation$CreateOrder,
       );

  final OnMutationCompleted$Mutation$CreateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateOrder =
    graphql.MultiSourceResult<Mutation$CreateOrder> Function({
      Variables$Mutation$CreateOrder? variables,
      Object? optimisticResult,
      Mutation$CreateOrder? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateOrder =
    widgets.Widget Function(
      RunMutation$Mutation$CreateOrder,
      graphql.QueryResult<Mutation$CreateOrder>?,
    );

class Mutation$CreateOrder$Widget
    extends graphql_flutter.Mutation<Mutation$CreateOrder> {
  Mutation$CreateOrder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateOrder? options,
    required Builder$Mutation$CreateOrder builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateOrder(),
         builder: (run, result) => builder(
           ({variables, optimisticResult, typedOptimisticResult}) => run(
             variables?.toJson() ?? const {},
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$CreateOrder$createOrder {
  Mutation$CreateOrder$createOrder({
    required this.id,
    required this.idempotencyKey,
    required this.scheduledTime,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.holdConfirmedAt,
    this.services,
    this.$__typename = 'Order',
  });

  factory Mutation$CreateOrder$createOrder.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$idempotencyKey = json['idempotencyKey'];
    final l$scheduledTime = json['scheduledTime'];
    final l$totalPrice = json['totalPrice'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$holdConfirmedAt = json['holdConfirmedAt'];
    final l$services = json['services'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder(
      id: (l$id as String),
      idempotencyKey: (l$idempotencyKey as String),
      scheduledTime: (l$scheduledTime as String),
      totalPrice: (l$totalPrice as num).toDouble(),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      createdAt: (l$createdAt as String),
      holdConfirmedAt: (l$holdConfirmedAt as String),
      services: (l$services as List<dynamic>?)
          ?.map(
            (e) => Mutation$CreateOrder$createOrder$services.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String idempotencyKey;

  final String scheduledTime;

  final double totalPrice;

  final Enum$OrderStatus status;

  final String createdAt;

  final String holdConfirmedAt;

  final List<Mutation$CreateOrder$createOrder$services>? services;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$idempotencyKey = idempotencyKey;
    _resultData['idempotencyKey'] = l$idempotencyKey;
    final l$scheduledTime = scheduledTime;
    _resultData['scheduledTime'] = l$scheduledTime;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$holdConfirmedAt = holdConfirmedAt;
    _resultData['holdConfirmedAt'] = l$holdConfirmedAt;
    final l$services = services;
    _resultData['services'] = l$services?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$idempotencyKey = idempotencyKey;
    final l$scheduledTime = scheduledTime;
    final l$totalPrice = totalPrice;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$holdConfirmedAt = holdConfirmedAt;
    final l$services = services;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$idempotencyKey,
      l$scheduledTime,
      l$totalPrice,
      l$status,
      l$createdAt,
      l$holdConfirmedAt,
      l$services == null ? null : Object.hashAll(l$services.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder$createOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$idempotencyKey = idempotencyKey;
    final lOther$idempotencyKey = other.idempotencyKey;
    if (l$idempotencyKey != lOther$idempotencyKey) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$holdConfirmedAt = holdConfirmedAt;
    final lOther$holdConfirmedAt = other.holdConfirmedAt;
    if (l$holdConfirmedAt != lOther$holdConfirmedAt) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateOrder$createOrder
    on Mutation$CreateOrder$createOrder {
  CopyWith$Mutation$CreateOrder$createOrder<Mutation$CreateOrder$createOrder>
  get copyWith => CopyWith$Mutation$CreateOrder$createOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  factory CopyWith$Mutation$CreateOrder$createOrder(
    Mutation$CreateOrder$createOrder instance,
    TRes Function(Mutation$CreateOrder$createOrder) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder;

  factory CopyWith$Mutation$CreateOrder$createOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder$createOrder;

  TRes call({
    String? id,
    String? idempotencyKey,
    String? scheduledTime,
    double? totalPrice,
    Enum$OrderStatus? status,
    String? createdAt,
    String? holdConfirmedAt,
    List<Mutation$CreateOrder$createOrder$services>? services,
    String? $__typename,
  });
  TRes services(
    Iterable<Mutation$CreateOrder$createOrder$services>? Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$services<
          Mutation$CreateOrder$createOrder$services
        >
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder(this._instance, this._then);

  final Mutation$CreateOrder$createOrder _instance;

  final TRes Function(Mutation$CreateOrder$createOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? idempotencyKey = _undefined,
    Object? scheduledTime = _undefined,
    Object? totalPrice = _undefined,
    Object? status = _undefined,
    Object? createdAt = _undefined,
    Object? holdConfirmedAt = _undefined,
    Object? services = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      idempotencyKey: idempotencyKey == _undefined || idempotencyKey == null
          ? _instance.idempotencyKey
          : (idempotencyKey as String),
      scheduledTime: scheduledTime == _undefined || scheduledTime == null
          ? _instance.scheduledTime
          : (scheduledTime as String),
      totalPrice: totalPrice == _undefined || totalPrice == null
          ? _instance.totalPrice
          : (totalPrice as double),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      holdConfirmedAt: holdConfirmedAt == _undefined || holdConfirmedAt == null
          ? _instance.holdConfirmedAt
          : (holdConfirmedAt as String),
      services: services == _undefined
          ? _instance.services
          : (services as List<Mutation$CreateOrder$createOrder$services>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes services(
    Iterable<Mutation$CreateOrder$createOrder$services>? Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$services<
          Mutation$CreateOrder$createOrder$services
        >
      >?,
    )
    _fn,
  ) => call(
    services: _fn(
      _instance.services?.map(
        (e) => CopyWith$Mutation$CreateOrder$createOrder$services(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder(this._res);

  TRes _res;

  call({
    String? id,
    String? idempotencyKey,
    String? scheduledTime,
    double? totalPrice,
    Enum$OrderStatus? status,
    String? createdAt,
    String? holdConfirmedAt,
    List<Mutation$CreateOrder$createOrder$services>? services,
    String? $__typename,
  }) => _res;

  services(_fn) => _res;
}

class Mutation$CreateOrder$createOrder$services {
  Mutation$CreateOrder$createOrder$services({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    this.$__typename = 'ServiceItem',
  });

  factory Mutation$CreateOrder$createOrder$services.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$durationMinutes = json['durationMinutes'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$services(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String),
      price: (l$price as num).toDouble(),
      durationMinutes: (l$durationMinutes as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String description;

  final double price;

  final int durationMinutes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$durationMinutes = durationMinutes;
    _resultData['durationMinutes'] = l$durationMinutes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$durationMinutes = durationMinutes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$durationMinutes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder$createOrder$services ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$durationMinutes = durationMinutes;
    final lOther$durationMinutes = other.durationMinutes;
    if (l$durationMinutes != lOther$durationMinutes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateOrder$createOrder$services
    on Mutation$CreateOrder$createOrder$services {
  CopyWith$Mutation$CreateOrder$createOrder$services<
    Mutation$CreateOrder$createOrder$services
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$services(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$services<TRes> {
  factory CopyWith$Mutation$CreateOrder$createOrder$services(
    Mutation$CreateOrder$createOrder$services instance,
    TRes Function(Mutation$CreateOrder$createOrder$services) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$services;

  factory CopyWith$Mutation$CreateOrder$createOrder$services.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder$createOrder$services;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$services<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$services<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$services(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$services _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$services) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? durationMinutes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$services(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      durationMinutes: durationMinutes == _undefined || durationMinutes == null
          ? _instance.durationMinutes
          : (durationMinutes as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$services<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$services<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$services(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? durationMinutes,
    String? $__typename,
  }) => _res;
}
