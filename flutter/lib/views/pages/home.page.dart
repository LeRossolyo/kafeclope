import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/home.vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: ((context) => HomeVM.init(context)),
      builder: ((context, child) {
        final vm = Provider.of<HomeVM>(context, listen: false);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Kafeclope'),
            actions: [
              IconButton(
                  onPressed: () => vm.redirectTo('auth'),
                  icon: const Icon(Icons.coffee))
            ],
          ),
          body: Selector<HomeVM, List<int>>(
            selector: (context, vm) => vm.selected,
            builder: (context, selected, child) {
              return GridView.count(
                crossAxisCount: 2,
                children: [
                  FriendCardWidget(
                    name: 'Hugo',
                    coffee: 3,
                    id: 2,
                    selected: true,
                    action: vm.select,
                  ),
                  FriendCardWidget(
                    name: 'Hugo',
                    coffee: 3,
                    id: 2,
                    selected: true,
                    action: vm.select,
                  )
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Kafeclope ?'),
            icon: const Icon(Icons.coffee),
            onPressed: () {
              print('Kafe');
            },
          ),
        );
      }),
    );
  }
}

class FriendCardWidget extends StatelessWidget {
  const FriendCardWidget({
    Key? key,
    required this.name,
    required this.coffee,
    required this.id,
    required this.selected,
    required this.action,
  }) : super(key: key);
  final String name;
  final int coffee;
  final int id;
  final bool selected;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => action(id),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              opacity: 0.8,
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                selected.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.coffee_maker, color: Colors.white),
                  Text(coffee.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
