import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class UserDetailsModel extends Equatable {
  final UserDetailsData? data;

  const UserDetailsModel({this.data});

  factory UserDetailsModel.fromMap(Map<String, dynamic> data) {
    return UserDetailsModel(
      data: data['data'] == null
          ? null
          : UserDetailsData.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDetailsModel].
  factory UserDetailsModel.fromJson(String data) {
    return UserDetailsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDetailsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
