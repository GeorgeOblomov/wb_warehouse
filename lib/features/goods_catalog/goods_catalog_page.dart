import 'package:flutter/material.dart';

class GoodsCatalogPage extends StatelessWidget {
  const GoodsCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _EmptyWidget()),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/empty_list_placeholder.png'),
        const SizedBox(height: 24),
        const Text(
          'Пусто',
          style: TextStyle(
            color: Color(0xFF7C7E92),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Добавляйте новые товары\nи они появятся здесь!',
          style: TextStyle(
            color: Color(0xFF7C7E92),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
