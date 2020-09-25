// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://opentdb.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getQuiz(amount, category, difficulty) async {
    ArgumentError.checkNotNull(amount, 'amount');
    ArgumentError.checkNotNull(category, 'category');
    ArgumentError.checkNotNull(difficulty, 'difficulty');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'api.php?amount=$amount&category=$category&difficulty=$difficulty&type=multiple&encode=base64',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = QuizResponse.fromJson(_result.data);
    return value;
  }

  @override
  getNumberQuestionOfCategory(category) async {
    ArgumentError.checkNotNull(category, 'category');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'api_count.php?category=$category',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryResponse.fromJson(_result.data);
    return value;
  }
}
