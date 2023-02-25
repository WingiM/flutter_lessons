import 'package:flutter/material.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({super.key});

  Widget generateListTile(BuildContext context, int index) {
    var deal = deals[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.blueGrey[100],
        title: Text(deal.title),
        subtitle: Text(deal.description),
        leading: Text(deal.id.toString()),
        onTap: () {},
        trailing: const Icon(
          Icons.arrow_right,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => generateListTile(context, index),
      itemCount: deals.length,
    );
  }
}

class Deal {
  final int id;
  final String title;
  final String description;

  Deal(this.id, this.title, this.description);
}

List<Deal> deals = [
  Deal(1, 'Сходить в магазин', 'Купить молоко, хлеб и сыр'),
  Deal(2, 'Flutter', 'Прописать flutter upgrade'),
  Deal(3, 'Поиграть в Dota 2', 'Выиграть инт'),
];
