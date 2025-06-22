import 'package:injectable/injectable.dart';
import '../../domain/repositories/animal_repository.dart';

@LazySingleton(as: AnimalRepository)
class AnimalRepositoryImpl implements AnimalRepository {
  @override
  List<String> getAnimales() => ['Perro', 'Gato', 'Loro'];
}

