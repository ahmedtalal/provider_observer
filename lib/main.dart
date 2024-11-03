import 'package:flutter/material.dart';
import 'package:testing_demo/app_observer.dart';
import 'package:testing_demo/change_notifier_observer.dart';
import 'package:provider/provider.dart';
import 'package:testing_demo/example_provider.dart';
final observer = AppObserver();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<ChangeNotifierObserver>.value(value: observer),
      ],
      child: const MaterialApp(
        home: ExampleScreen(),
      ),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => ExampleProvider(observer),
      child: Scaffold(
        appBar: AppBar(title: Text('Provider Observer Example')),
        body: Center(
          child: Consumer<ExampleProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Counter: ${provider.counter}'),
                  ElevatedButton(
                    onPressed: () => provider.increment(),
                    child: const Text('Increment Counter'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => provider.decrement(),
                    child: const Text('decrement Counter'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const NextScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text("Next"),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Next screen"),
      ),
    );
  }
}
