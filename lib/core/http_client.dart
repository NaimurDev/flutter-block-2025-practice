import 'dart:convert';
import 'package:http/http.dart' as http;

/// A standalone HTTP client for making API requests.
class HttpClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  HttpClient({required this.baseUrl, this.defaultHeaders = const {}});

  /// GET request
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);
    return _sendRequest(() => http.get(uri, headers: _mergeHeaders(headers)));
  }

  /// POST request
  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return _sendRequest(() => http.post(
          uri,
          headers: _mergeHeaders(headers),
          body: _encodeBody(body),
        ));
  }

  /// PUT request
  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return _sendRequest(() => http.put(
          uri,
          headers: _mergeHeaders(headers),
          body: _encodeBody(body),
        ));
  }

  /// DELETE request
  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return _sendRequest(() => http.delete(
          uri,
          headers: _mergeHeaders(headers),
          body: _encodeBody(body),
        ));
  }

  /// Utility to merge default and additional headers.
  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {...defaultHeaders, if (headers != null) ...headers};
  }

  /// Utility to encode the body to JSON if it is not null.
  String? _encodeBody(dynamic body) {
    return body != null ? jsonEncode(body) : null;
  }

  /// Helper to handle requests and add error handling.
  Future<http.Response> _sendRequest(Future<http.Response> Function() request) async {
    try {
      final response = await request();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw HttpException(response.statusCode, response.body);
      }
    } catch (e) {
      throw HttpException(-1, e.toString());
    }
  }
}

/// Custom exception for HTTP errors.
class HttpException implements Exception {
  final int statusCode;
  final String message;

  HttpException(this.statusCode, this.message);

  @override
  String toString() => 'HttpException: $statusCode $message';
}
