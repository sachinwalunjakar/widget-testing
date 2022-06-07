
// update & get counter value from server
class CounterRepository {
  int counter = 0;

  Future<int> getCounterValue() async {
    await Future.delayed(const Duration(seconds: 1));
    return counter;
  }

  Future<int> increaseCounterValue() async {
    await Future.delayed(const Duration(seconds: 2));
    return ++counter;
  }

  Future<int> decreaseCounterValue() async {
    await Future.delayed(const Duration(seconds: 2));
    return --counter;
  }
}
