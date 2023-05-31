import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        actions: [
          IconButton(
            icon: themeMode ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(themeProvider.notifier).state = !themeMode;
            }
            )
        ],
      ),
      
      body: Center(
        child: Text('valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state ++;
        },
      ),
    );
  }
}