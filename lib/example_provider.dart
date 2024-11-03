import 'package:testing_demo/base_notifier.dart';
import 'package:testing_demo/change_notifier_observer.dart';

class ExampleProvider extends BaseNotifier {
  int _counter = 0;

  ExampleProvider(ChangeNotifierObserver observer)
      : super(observer, 'ExampleProvider');

  int get counter => _counter;

  void increment() {
    _counter++;
    updateState(_counter); // call updateState when the state is changed
  }

  void decrement() {
    _counter--;
    updateState(_counter); // call updateState when the state is changed
  }
}
