import 'package:dartz/dartz.dart';

import 'package:flutter_pokedex_sample/core/error/failures.dart';

class InputConverter {
  Either<Failure, String> nonEmptyString(String str) {
    return str.isEmpty ? Left(InvalidInputFailure()) : Right(str);
  }

  String toSearchQuery(String str) {
    final queryComponent = str.toLowerCase().trim().split(' ').join('-');

    return Uri.encodeComponent(queryComponent);
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => [];
}
