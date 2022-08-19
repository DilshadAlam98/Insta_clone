import 'package:own_projeccts/base/base_bloc.dart';
import 'package:own_projeccts/helper/local_prefs.dart';
import 'package:own_projeccts/repo/firestore_repo.dart';
import 'package:own_projeccts/state/user_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  final firestoreRepo = FirestoreRepo();
  final prefs = LocalPrefs();
  final userState = BehaviorSubject<UserState>();

  void fetchUsers() {
    userState.add(UserState.loading());
    subscription.add(firestoreRepo
        .fetchUsers()
        .map((data) => UserState.completed(data))
        .onErrorReturnWith((error, stackTrace) => UserState.error(error))
        .startWith(UserState.loading())
        .listen((state) {
      userState.add(state);
      if (state.isCompleted()) {
        prefs.setUsers(state.data!).listen((event) { });
      }
      print(state.data);
    }));
  }
}
