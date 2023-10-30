import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  var requestList = ObservableList<CustomResponse>.of([]);

  @observable
  IHomeState state = HomeReady();

  @action
  Future<void> submit(String sid, String usr) async {
    final url =
        'https://viewerstorm.com/obsdock_h.php?sid=$sid&usr=$usr&mode=stormpass';

    state = HomeLoading();

    while (state is HomeLoading) {
      try {
        final result = await Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          validateStatus: (status) => status! < 505,
        )).get(url);

        requestList.add(CustomResponse.fromResponse(result, DateTime.now()));
      } catch (e) {
        requestList.add(
          CustomResponse(
              requestOptions: RequestOptions(baseUrl: url),
              createdAt: DateTime.now(),
              statusCode: 500,
              data: 'Exception: $e'),
        );
      } finally {
        requestList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    }

    state = HomeSuccess();
  }

  @action
  void cancel() {
    state = HomeStop();
  }
}

abstract class IHomeState {}

class HomeReady extends IHomeState {}

class HomeLoading extends IHomeState {}

class HomeStop extends IHomeState {}

class HomeSuccess extends IHomeState {}

class HomeError extends IHomeState {
  final Exception exception;

  HomeError(this.exception);
}

class CustomResponse extends Response {
  final DateTime createdAt;

  CustomResponse({
    super.data,
    required super.requestOptions,
    super.statusCode,
    super.statusMessage,
    super.isRedirect,
    super.redirects,
    super.extra,
    super.headers,
    required this.createdAt,
  });

  factory CustomResponse.fromResponse(Response response, DateTime createdAt) {
    return CustomResponse(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      extra: response.extra,
      headers: response.headers,
      createdAt: createdAt,
    );
  }
}
