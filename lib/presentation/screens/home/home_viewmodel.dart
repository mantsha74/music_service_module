import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';

import '../../../data/repository/services_repository.dart';
import '../../../model/service_model.dart';
import '../../navigation/bottom_nav.dart';

class HomeViewModel extends ChangeNotifier {
  final ServicesRepository repository;
  List<ServiceModel> services = [];
  bool isLoading = true;

  HomeViewModel(
      this.repository
      );

  Future<void> loadServices() async {
    isLoading = true;
    notifyListeners();

    services = await repository.fetchServices();
    dev.log("MyTag ${services.length} services", name: "HomeViewModel");
    isLoading = false;
    notifyListeners();
  }
}