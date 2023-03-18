import 'package:fpdart/fpdart.dart';
import 'package:whitedove/core/core.dart';

typedef FutureEither<T> = Future<Either<Failure,T>>;
typedef FutureVoid = Future<void>;
typedef FutureEitherVoid = FutureEither<void>;