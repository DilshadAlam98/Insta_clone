import 'package:own_projeccts/mapper/user_mapper.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/source/firestore_fetch_ds.dart';

class FirestoreRepo {
  final _firestoreDs = FirestoreFetch();
  final _userMapper = UserMapper();

  Stream<Users> fetchUsers() {
    return _firestoreDs.fetchUsers().map((value) => _userMapper.convert(value));
  }
}
