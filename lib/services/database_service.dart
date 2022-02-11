import 'package:sistaz_share_web/exports.dart';

class DatabaseService {
  static const String _earlyAdopters = 'early_adopters';

  static final CollectionReference _adoptersCollection =
      FirebaseFirestore.instance.collection(_earlyAdopters);

  static Future<Map<String, dynamic>> addNewAdopter(
      EarlyAdopter earlyAdopter) async {
    try {
      await _adoptersCollection.add(earlyAdopter.toMap());
      return {'state': true};
    } catch (exception) {
      return {'state': false, 'error': exception.toString()};
    }
  }
}
