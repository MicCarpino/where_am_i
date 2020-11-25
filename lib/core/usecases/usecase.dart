import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class PresenceNewParameters extends Equatable {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String idResource;
  final String freeName;

  PresenceNewParameters({
    @required this.date,
    @required this.startTime,
    @required this.endTime,
    this.idResource,
    this.freeName,
  });

  @override
  List<Object> get props => [date, startTime, endTime,idResource,freeName];
}
