library surrealdb_dart_annotations;

import 'package:surrealdb_dart/surrealdb_dart.dart';

export 'package:surrealdb_dart/surrealdb_dart.dart';

export 'src/surrealdb_model.dart';

/// An instance of SurrealDB connection, which shouldn't be used
/// or modified by anyone other than the part files generated
/// by `surrealdb_dart_orm` builder package.
///
/// This variable will be set only after calling [connect] function.
/// So without invoking [connect] accessing this variable via any
/// part file will throw runtimeException.
late final Surreal surrealdb;

/// Connects to SurrealDB
Future<void> connect({
  required String url,
  required String namespace,
  required String database,
  required SignInStrategy signInStrategy,
}) async {
  surrealdb = Surreal(url: url);
  surrealdb.connect();
  await surrealdb.wait();
  await surrealdb.use(ns: namespace, db: database);
  await surrealdb.signIn(signInStrategy);
}
