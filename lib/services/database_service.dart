import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistaz_share_web/models/early_adopter.dart';

class DatabaseService {
  static const String _earlyAdopters = 'early_adopters';

  static final CollectionReference _adoptersCollection =
      FirebaseFirestore.instance.collection(_earlyAdopters);

  addNewAdopter(EarlyAdopter earlyAdopter) async {
    return await _adoptersCollection.add(earlyAdopter.toMap());
  }
}
