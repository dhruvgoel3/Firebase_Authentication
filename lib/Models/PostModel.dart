import 'dart:convert';
import 'package:http/http.dart' as http;

class PostModel {
  late num _userId;
  late num _id;
  late String _title;
  late String _body;

  // Constructor with required parameters
  PostModel({
    required num userId,
    required num id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

  // Factory constructor to parse JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': _userId,
      'id': _id,
      'title': _title,
      'body': _body,
    };
  }

  // Getters
  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  String get body => _body;

  // Copy with method
  PostModel copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? _userId,
      id: id ?? _id,
      title: title ?? _title,
      body: body ?? _body,
    );
  }
}