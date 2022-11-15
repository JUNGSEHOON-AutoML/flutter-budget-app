// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PaymentDao? _paymentDaoInstance;

  CategoryDao? _categoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CategoryEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `type` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PaymentEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PaymentDao get paymentDao {
    return _paymentDaoInstance ??= _$PaymentDao(database, changeListener);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }
}

class _$PaymentDao extends PaymentDao {
  _$PaymentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _paymentEntityInsertionAdapter = InsertionAdapter(
            database,
            'PaymentEntity',
            (PaymentEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _paymentEntityUpdateAdapter = UpdateAdapter(
            database,
            'PaymentEntity',
            ['id'],
            (PaymentEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PaymentEntity> _paymentEntityInsertionAdapter;

  final UpdateAdapter<PaymentEntity> _paymentEntityUpdateAdapter;

  @override
  Stream<Payment?> getPayments() {
    await _queryAdapter.queryNoReturn('SELECT * FROM Payment');
  }

  @override
  Future<void> deletePayment(int paymentId) async {
    await _queryAdapter.queryNoReturn('DELETE FROM Payment WHERE id = ?1',
        arguments: [paymentId]);
  }

  @override
  Future<void> insertPayment(PaymentEntity paymentEntity) async {
    await _paymentEntityInsertionAdapter.insert(
        paymentEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePayment(PaymentEntity paymentEntity) async {
    await _paymentEntityUpdateAdapter.update(
        paymentEntity, OnConflictStrategy.abort);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'CategoryEntity',
            (CategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': item.type
                }),
        _categoryEntityUpdateAdapter = UpdateAdapter(
            database,
            'CategoryEntity',
            ['id'],
            (CategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': item.type
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CategoryEntity> _categoryEntityInsertionAdapter;

  final UpdateAdapter<CategoryEntity> _categoryEntityUpdateAdapter;

  @override
  Stream<Payment?> getPayments() {
    await _queryAdapter.queryNoReturn('SELECT * FROM Category');
  }

  @override
  Future<void> deletePayment(int categoryId) async {
    await _queryAdapter.queryNoReturn('DELETE FROM Category WHERE id = ?1',
        arguments: [categoryId]);
  }

  @override
  Future<void> insertPayment(CategoryEntity categoryEntity) async {
    await _categoryEntityInsertionAdapter.insert(
        categoryEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePayment(CategoryEntity categoryEntity) async {
    await _categoryEntityUpdateAdapter.update(
        categoryEntity, OnConflictStrategy.abort);
  }
}
