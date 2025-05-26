import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:music_service_module/data/repository/services_repository.dart';
import 'package:music_service_module/presentation/screens/home/home_viewmodel.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {

  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Repository layer
  getIt.registerLazySingleton<ServicesRepository>(
        () => ServicesRepository(getIt<FirebaseFirestore>()),
  );

  // ViewModel layer
  getIt.registerLazySingleton<HomeViewModel>(
        () => HomeViewModel(getIt<ServicesRepository>()),
  );
}
