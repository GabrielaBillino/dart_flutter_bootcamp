import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/animal_repository.dart';

@injectable
class AnimalCubit extends Cubit<List<String>> {
  AnimalCubit(this._repo) : super([]);

  final AnimalRepository _repo;

  void cargarAnimales() {
    emit(_repo.getAnimales());
  }
}