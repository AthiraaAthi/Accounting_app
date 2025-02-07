// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lender_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LenderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function(String code) joinGetData,
    required TResult Function(String id) history,
    required TResult Function(String query) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function(String code)? joinGetData,
    TResult? Function(String id)? history,
    TResult? Function(String query)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function(String code)? joinGetData,
    TResult Function(String id)? history,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(JoinGetData value) joinGetData,
    required TResult Function(History value) history,
    required TResult Function(Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(JoinGetData value)? joinGetData,
    TResult? Function(History value)? history,
    TResult? Function(Search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(JoinGetData value)? joinGetData,
    TResult Function(History value)? history,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LenderEventCopyWith<$Res> {
  factory $LenderEventCopyWith(
          LenderEvent value, $Res Function(LenderEvent) then) =
      _$LenderEventCopyWithImpl<$Res, LenderEvent>;
}

/// @nodoc
class _$LenderEventCopyWithImpl<$Res, $Val extends LenderEvent>
    implements $LenderEventCopyWith<$Res> {
  _$LenderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetDataImplCopyWith<$Res> {
  factory _$$GetDataImplCopyWith(
          _$GetDataImpl value, $Res Function(_$GetDataImpl) then) =
      __$$GetDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDataImplCopyWithImpl<$Res>
    extends _$LenderEventCopyWithImpl<$Res, _$GetDataImpl>
    implements _$$GetDataImplCopyWith<$Res> {
  __$$GetDataImplCopyWithImpl(
      _$GetDataImpl _value, $Res Function(_$GetDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDataImpl implements GetData {
  const _$GetDataImpl();

  @override
  String toString() {
    return 'LenderEvent.getData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function(String code) joinGetData,
    required TResult Function(String id) history,
    required TResult Function(String query) search,
  }) {
    return getData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function(String code)? joinGetData,
    TResult? Function(String id)? history,
    TResult? Function(String query)? search,
  }) {
    return getData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function(String code)? joinGetData,
    TResult Function(String id)? history,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(JoinGetData value) joinGetData,
    required TResult Function(History value) history,
    required TResult Function(Search value) search,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(JoinGetData value)? joinGetData,
    TResult? Function(History value)? history,
    TResult? Function(Search value)? search,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(JoinGetData value)? joinGetData,
    TResult Function(History value)? history,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class GetData implements LenderEvent {
  const factory GetData() = _$GetDataImpl;
}

/// @nodoc
abstract class _$$JoinGetDataImplCopyWith<$Res> {
  factory _$$JoinGetDataImplCopyWith(
          _$JoinGetDataImpl value, $Res Function(_$JoinGetDataImpl) then) =
      __$$JoinGetDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$JoinGetDataImplCopyWithImpl<$Res>
    extends _$LenderEventCopyWithImpl<$Res, _$JoinGetDataImpl>
    implements _$$JoinGetDataImplCopyWith<$Res> {
  __$$JoinGetDataImplCopyWithImpl(
      _$JoinGetDataImpl _value, $Res Function(_$JoinGetDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$JoinGetDataImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinGetDataImpl implements JoinGetData {
  const _$JoinGetDataImpl({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'LenderEvent.joinGetData(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinGetDataImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinGetDataImplCopyWith<_$JoinGetDataImpl> get copyWith =>
      __$$JoinGetDataImplCopyWithImpl<_$JoinGetDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function(String code) joinGetData,
    required TResult Function(String id) history,
    required TResult Function(String query) search,
  }) {
    return joinGetData(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function(String code)? joinGetData,
    TResult? Function(String id)? history,
    TResult? Function(String query)? search,
  }) {
    return joinGetData?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function(String code)? joinGetData,
    TResult Function(String id)? history,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (joinGetData != null) {
      return joinGetData(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(JoinGetData value) joinGetData,
    required TResult Function(History value) history,
    required TResult Function(Search value) search,
  }) {
    return joinGetData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(JoinGetData value)? joinGetData,
    TResult? Function(History value)? history,
    TResult? Function(Search value)? search,
  }) {
    return joinGetData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(JoinGetData value)? joinGetData,
    TResult Function(History value)? history,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (joinGetData != null) {
      return joinGetData(this);
    }
    return orElse();
  }
}

abstract class JoinGetData implements LenderEvent {
  const factory JoinGetData({required final String code}) = _$JoinGetDataImpl;

  String get code;

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinGetDataImplCopyWith<_$JoinGetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryImplCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$LenderEventCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$HistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HistoryImpl implements History {
  const _$HistoryImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'LenderEvent.history(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function(String code) joinGetData,
    required TResult Function(String id) history,
    required TResult Function(String query) search,
  }) {
    return history(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function(String code)? joinGetData,
    TResult? Function(String id)? history,
    TResult? Function(String query)? search,
  }) {
    return history?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function(String code)? joinGetData,
    TResult Function(String id)? history,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(JoinGetData value) joinGetData,
    required TResult Function(History value) history,
    required TResult Function(Search value) search,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(JoinGetData value)? joinGetData,
    TResult? Function(History value)? history,
    TResult? Function(Search value)? search,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(JoinGetData value)? joinGetData,
    TResult Function(History value)? history,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class History implements LenderEvent {
  const factory History({required final String id}) = _$HistoryImpl;

  String get id;

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$LenderEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements Search {
  const _$SearchImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'LenderEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function(String code) joinGetData,
    required TResult Function(String id) history,
    required TResult Function(String query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function(String code)? joinGetData,
    TResult? Function(String id)? history,
    TResult? Function(String query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function(String code)? joinGetData,
    TResult Function(String id)? history,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(JoinGetData value) joinGetData,
    required TResult Function(History value) history,
    required TResult Function(Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(JoinGetData value)? joinGetData,
    TResult? Function(History value)? history,
    TResult? Function(Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(JoinGetData value)? joinGetData,
    TResult Function(History value)? history,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements LenderEvent {
  const factory Search({required final String query}) = _$SearchImpl;

  String get query;

  /// Create a copy of LenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LenderState {
  List<LendingModel> get data => throw _privateConstructorUsedError;
  List<LendingModel> get joinData => throw _privateConstructorUsedError;
  List<LendingModel> get searchData => throw _privateConstructorUsedError;
  List<HistoryModel> get historyData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  Option<dynamic> get getFailureOrSuccess => throw _privateConstructorUsedError;

  /// Create a copy of LenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LenderStateCopyWith<LenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LenderStateCopyWith<$Res> {
  factory $LenderStateCopyWith(
          LenderState value, $Res Function(LenderState) then) =
      _$LenderStateCopyWithImpl<$Res, LenderState>;
  @useResult
  $Res call(
      {List<LendingModel> data,
      List<LendingModel> joinData,
      List<LendingModel> searchData,
      List<HistoryModel> historyData,
      bool isLoading,
      bool isError,
      Option<dynamic> getFailureOrSuccess});
}

/// @nodoc
class _$LenderStateCopyWithImpl<$Res, $Val extends LenderState>
    implements $LenderStateCopyWith<$Res> {
  _$LenderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? joinData = null,
    Object? searchData = null,
    Object? historyData = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? getFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      joinData: null == joinData
          ? _value.joinData
          : joinData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      searchData: null == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      historyData: null == historyData
          ? _value.historyData
          : historyData // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      getFailureOrSuccess: null == getFailureOrSuccess
          ? _value.getFailureOrSuccess
          : getFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LenderStateImplCopyWith<$Res>
    implements $LenderStateCopyWith<$Res> {
  factory _$$LenderStateImplCopyWith(
          _$LenderStateImpl value, $Res Function(_$LenderStateImpl) then) =
      __$$LenderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LendingModel> data,
      List<LendingModel> joinData,
      List<LendingModel> searchData,
      List<HistoryModel> historyData,
      bool isLoading,
      bool isError,
      Option<dynamic> getFailureOrSuccess});
}

/// @nodoc
class __$$LenderStateImplCopyWithImpl<$Res>
    extends _$LenderStateCopyWithImpl<$Res, _$LenderStateImpl>
    implements _$$LenderStateImplCopyWith<$Res> {
  __$$LenderStateImplCopyWithImpl(
      _$LenderStateImpl _value, $Res Function(_$LenderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? joinData = null,
    Object? searchData = null,
    Object? historyData = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? getFailureOrSuccess = null,
  }) {
    return _then(_$LenderStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      joinData: null == joinData
          ? _value._joinData
          : joinData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      searchData: null == searchData
          ? _value._searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      historyData: null == historyData
          ? _value._historyData
          : historyData // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      getFailureOrSuccess: null == getFailureOrSuccess
          ? _value.getFailureOrSuccess
          : getFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ));
  }
}

/// @nodoc

class _$LenderStateImpl implements _LenderState {
  const _$LenderStateImpl(
      {required final List<LendingModel> data,
      required final List<LendingModel> joinData,
      required final List<LendingModel> searchData,
      required final List<HistoryModel> historyData,
      required this.isLoading,
      required this.isError,
      required this.getFailureOrSuccess})
      : _data = data,
        _joinData = joinData,
        _searchData = searchData,
        _historyData = historyData;

  final List<LendingModel> _data;
  @override
  List<LendingModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<LendingModel> _joinData;
  @override
  List<LendingModel> get joinData {
    if (_joinData is EqualUnmodifiableListView) return _joinData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinData);
  }

  final List<LendingModel> _searchData;
  @override
  List<LendingModel> get searchData {
    if (_searchData is EqualUnmodifiableListView) return _searchData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchData);
  }

  final List<HistoryModel> _historyData;
  @override
  List<HistoryModel> get historyData {
    if (_historyData is EqualUnmodifiableListView) return _historyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyData);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final Option<dynamic> getFailureOrSuccess;

  @override
  String toString() {
    return 'LenderState(data: $data, joinData: $joinData, searchData: $searchData, historyData: $historyData, isLoading: $isLoading, isError: $isError, getFailureOrSuccess: $getFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LenderStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._joinData, _joinData) &&
            const DeepCollectionEquality()
                .equals(other._searchData, _searchData) &&
            const DeepCollectionEquality()
                .equals(other._historyData, _historyData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.getFailureOrSuccess, getFailureOrSuccess) ||
                other.getFailureOrSuccess == getFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_joinData),
      const DeepCollectionEquality().hash(_searchData),
      const DeepCollectionEquality().hash(_historyData),
      isLoading,
      isError,
      getFailureOrSuccess);

  /// Create a copy of LenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LenderStateImplCopyWith<_$LenderStateImpl> get copyWith =>
      __$$LenderStateImplCopyWithImpl<_$LenderStateImpl>(this, _$identity);
}

abstract class _LenderState implements LenderState {
  const factory _LenderState(
      {required final List<LendingModel> data,
      required final List<LendingModel> joinData,
      required final List<LendingModel> searchData,
      required final List<HistoryModel> historyData,
      required final bool isLoading,
      required final bool isError,
      required final Option<dynamic> getFailureOrSuccess}) = _$LenderStateImpl;

  @override
  List<LendingModel> get data;
  @override
  List<LendingModel> get joinData;
  @override
  List<LendingModel> get searchData;
  @override
  List<HistoryModel> get historyData;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  Option<dynamic> get getFailureOrSuccess;

  /// Create a copy of LenderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LenderStateImplCopyWith<_$LenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
