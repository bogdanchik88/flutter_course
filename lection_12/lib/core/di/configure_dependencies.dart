import 'package:lection_12/feature/color/data/datasource/file_local_data_source.dart';
import 'package:lection_12/feature/color/data/datasource/local_color_data_source.dart';
import 'package:lection_12/feature/color/data/repository/color_repository_impl.dart';
import 'package:lection_12/feature/color/domain/repository/color_repository.dart';
import 'package:lection_12/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:lection_12/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:lection_12/feature/color/presentation/cubit/color_cubit.dart';
import 'package:get_it/get_it.dart';

void configureDependencies() {
  GetIt.I.registerFactory<LocalColorDataSource>(() => FileLocalDataSource());

  GetIt.I.registerFactory<ColorRepository>(
    () => ColorRepositoryImpl(localColorDataSource: GetIt.I()),
  );

  GetIt.I.registerFactory(() => GetColorUseCase(colorRepository: GetIt.I()));
  GetIt.I.registerFactory(() => SelectColorUseCase(colorRepository: GetIt.I()));

  GetIt.I.registerLazySingleton<ColorCubit>(
    () => ColorCubit(GetIt.I(), GetIt.I()),
  );
}
