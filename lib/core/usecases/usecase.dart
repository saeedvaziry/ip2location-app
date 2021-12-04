import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ip2location/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type?>> call(Param params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
