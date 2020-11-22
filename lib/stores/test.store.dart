import "package:mobx/mobx.dart";

part "test.store.g.dart";

class TestStore = TestStoreBase with _$TestStore;

abstract class TestStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
