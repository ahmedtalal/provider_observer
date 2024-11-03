import 'change_notifier_observer.dart';

class AppObserver extends ChangeNotifierObserver {
  @override
  void onCreate(String providerName) {
    super.onCreate(providerName);
    print('$providerName: Created (from AppObserver)');
  }

  @override
  void onChange(String providerName, dynamic newState) {
    super.onChange(providerName, newState);
    print('$providerName: State Changed to $newState (from AppObserver)');
  }

  @override
  void onDispose(String providerName) {
    super.onDispose(providerName);
    print('$providerName: Disposed (from AppObserver)');
  }
}
