import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/service_model.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final servicesStreamProvider = StreamProvider<List<ServiceModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('services')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => ServiceModel.fromDoc(doc))
      .toList());
});