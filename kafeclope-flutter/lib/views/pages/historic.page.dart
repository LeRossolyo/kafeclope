import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/tiles/historic.tile.dart';
import 'package:kafeclope/views/widgets/utils/drawer.widget.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text('Kaféclope',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Historique'),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return HistoricTile();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
