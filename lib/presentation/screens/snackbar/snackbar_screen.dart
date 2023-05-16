import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snakbak = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snakbak);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Sunt elit laborum eu eu labore excepteur exercitation qui nulla eiusmod officia. Ea proident ex et irure et. Nostrud quis qui et reprehenderit eiusmod nostrud consectetur do proident velit excepteur ut. Officia laboris officia mollit nisi nulla commodo in commodo pariatur occaecat est nulla eu ipsum. Tempor culpa ut commodo laborum labore ex do exercitation amet sint ullamco nostrud. Ipsum veniam reprehenderit non tempor dolor minim aliquip reprehenderit ipsum minim.'),
        actions: [
          TextButton(onPressed: ()=> Navigator.of(context).pop() , child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> Navigator.of(context).pop(), child: const Text('Aceptar')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Eiusmod dolore enim id cillum minim fugiat nulla occaecat veniam Lorem.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () => openDialog(context), child: const Text('Mostrar Dialogos')),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
