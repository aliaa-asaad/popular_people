import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class NetworkFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmptyCachedFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
