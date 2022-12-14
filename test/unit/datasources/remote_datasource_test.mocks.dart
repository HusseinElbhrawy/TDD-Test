// Mocks generated by Mockito 5.3.0 from annotations
// in flutter_tdd_testing/test/datasources/remote_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:flutter_tdd_testing/core/services/network_services.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [NetworkServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkServices extends _i1.Mock implements _i3.NetworkServices {
  MockNetworkServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response<dynamic>> get(String? url) => (super.noSuchMethod(
          Invocation.method(#get, [url]),
          returnValue: _i4.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(this, Invocation.method(#get, [url]))))
      as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> post(String? url, dynamic body) =>
      (super.noSuchMethod(Invocation.method(#post, [url, body]),
              returnValue: _i4.Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_0<dynamic>(
                      this, Invocation.method(#post, [url, body]))))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> put(String? url, dynamic body) =>
      (super.noSuchMethod(Invocation.method(#put, [url, body]),
              returnValue: _i4.Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_0<dynamic>(
                      this, Invocation.method(#put, [url, body]))))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> delete(String? url) =>
      (super.noSuchMethod(Invocation.method(#delete, [url]),
              returnValue: _i4.Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_0<dynamic>(
                      this, Invocation.method(#delete, [url]))))
          as _i4.Future<_i2.Response<dynamic>>);
}
