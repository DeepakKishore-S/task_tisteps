import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class UserListModel extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserData>? data;

  const UserListModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory UserListModel.fromMap(Map<String, dynamic> data) => UserListModel(
        page: data['page'] as int?,
        perPage: data['per_page'] as int?,
        total: data['total'] as int?,
        totalPages: data['total_pages'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => UserData.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserListModel].
  factory UserListModel.fromJson(String data) {
    return UserListModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserListModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      page,
      perPage,
      total,
      totalPages,
      data,
    ];
  }
}
