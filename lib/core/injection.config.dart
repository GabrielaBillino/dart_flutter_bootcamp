// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/desafio_integrador/features/notas_rapidas/application/cubit/notas_cubit.dart'
    as _i756;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/desafio_integrador/features/notas_rapidas/domain/repositories/nota_repository.dart'
    as _i112;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/desafio_integrador/features/notas_rapidas/domain/services/gestor_notas.dart'
    as _i309;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/desafio_integrador/features/notas_rapidas/infrastructure/repositories/nota_repository_impl.dart'
    as _i173;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/features/animales/application/cubit/animal_cubit.dart'
    as _i931;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/features/animales/domain/repositories/animal_repository.dart'
    as _i175;
import 'package:dart_flutter_bootcamp/features/integrador_fase3/03_dependency_injection/features/animales/infrastructure/repositories/animal_repository_impl.dart'
    as _i1045;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i175.AnimalRepository>(
      () => _i1045.AnimalRepositoryImpl(),
    );
    gh.lazySingleton<_i112.NotaRepository>(() => _i173.NotaRepositoryImpl());
    gh.factory<_i931.AnimalCubit>(
      () => _i931.AnimalCubit(gh<_i175.AnimalRepository>()),
    );
    gh.factory<_i309.GestorNotas>(
      () => _i309.GestorNotas(gh<_i112.NotaRepository>()),
    );
    gh.factory<_i756.NotasCubit>(
      () => _i756.NotasCubit(gh<_i309.GestorNotas>()),
    );
    return this;
  }
}
