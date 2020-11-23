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

class NewPresenceParams extends Equatable {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  NewPresenceParams({this.date, this.startTime, this.endTime});

  @override
  List<Object> get props => [date,startTime,endTime];
}