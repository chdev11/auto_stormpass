// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$requestListAtom =
      Atom(name: 'HomeStoreBase.requestList', context: context);

  @override
  ObservableList<CustomResponse> get requestList {
    _$requestListAtom.reportRead();
    return super.requestList;
  }

  @override
  set requestList(ObservableList<CustomResponse> value) {
    _$requestListAtom.reportWrite(value, super.requestList, () {
      super.requestList = value;
    });
  }

  late final _$stateAtom = Atom(name: 'HomeStoreBase.state', context: context);

  @override
  IHomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IHomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$submitAsyncAction =
      AsyncAction('HomeStoreBase.submit', context: context);

  @override
  Future<void> submit(String sid, String usr) {
    return _$submitAsyncAction.run(() => super.submit(sid, usr));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void cancel() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.cancel');
    try {
      return super.cancel();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestList: ${requestList},
state: ${state}
    ''';
  }
}
