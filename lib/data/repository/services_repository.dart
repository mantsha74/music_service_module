import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_service_module/model/service_model.dart';

class ServicesRepository {
  final FirebaseFirestore firestore;

  ServicesRepository(this.firestore);

  Future<List<ServiceModel>> fetchServices() async {
    final snapshot = await firestore.collection('services').get();
    dev.log("MyTag ${snapshot.docs.length} services", name: "ServicesRepository");

    return snapshot.docs
        .map((doc) => ServiceModel.fromMap(doc.data()))
        .toList();
  }
}
