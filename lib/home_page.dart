import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_change_notifier/provider.dart';

class HomePage extends ConsumerWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed this button many times :',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  '${ref.watch(counterProvider).count}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }

  // Widget myFloatingActionButton(ref) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       FloatingActionButton(
  //         onPressed: () {
  //           ref.read(counterProvider).increment();
  //         },
  //         tooltip: 'Increment',
  //         child: const Icon(
  //           Icons.add,
  //           size: 32,
  //         ),
  //       ),
  //       const SizedBox(
  //         width: 10,
  //       ),
  //       FloatingActionButton(
  //         onPressed: () {
  //           ref.read(counterProvider).decrement();
  //         },
  //         tooltip: 'Increment',
  //         child: const Icon(
  //           Icons.remove,
  //           size: 32,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider).increment();
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider).decrement();
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.remove,
            size: 32,
          ),
        ),
      ],
    );
  }
}
