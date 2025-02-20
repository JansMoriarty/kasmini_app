import 'package:get_it/get_it.dart';
import 'package:kasmini_app/common/services/kasir_preferences_service.dart';
import 'package:kasmini_app/core/database_manager.dart';
import 'package:kasmini_app/data/datasources/kasir_local_data_source.dart';
import 'package:kasmini_app/data/repositories/kasir_repo_impl.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';
import 'package:kasmini_app/presentation/bloc/kasir/current_kasir_cubit.dart';
import 'package:kasmini_app/presentation/bloc/kasir/kasir_bloc.dart';
import 'package:kasmini_app/presentation/bloc/navbar_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final Database database = await DatabaseManager().database;
  sl.registerSingleton<Database>(database);

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // datasources
  sl.registerLazySingleton<KasirLocalDataSource>(
    () => KasirLocalDataSource(
      sl.get<Database>(),
    ),
  );

  // repositories
  sl.registerLazySingleton<KasirRepo>(
    () => KasirRepoImpl(
      sl.get<KasirLocalDataSource>(),
    ),
  );

  // services
  sl.registerLazySingleton<KasirPreferencesService>(
    () => KasirPreferencesService(
      sl.get<SharedPreferences>(),
    ),
  );

  // bloc
  sl.registerLazySingleton<NavbarCubit>(() => NavbarCubit());

  sl.registerLazySingleton<CurrentKasirCubit>(
    () => CurrentKasirCubit(
      sl.get<KasirPreferencesService>(),
      sl.get<KasirRepo>(),
    ),
  );

  sl.registerLazySingleton<KasirBloc>(
    () => KasirBloc(
      sl.get<KasirRepo>(),
    ),
  );
}
