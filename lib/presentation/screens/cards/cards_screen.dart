import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _CardTypeOne(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) => _CardTypeSecond(
              label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) => _CardTypeThree(
              label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) =>
              _CardTypeFour(label: card['label'], elevation: card['elevation']))
        ],
      ),
    );
  }
}

class _CardTypeOne extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeOne({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class _CardTypeSecond extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeSecond({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - outline'),
          )
        ]),
      ),
    );
  }
}

class _CardTypeThree extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeThree({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - filled'),
          )
        ]),
      ),
    );
  }
}

class _CardTypeFour extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeFour({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Stack(children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.network(
            'https://hips.hearstapps.com/hmg-prod/images/ahsoka-anakin-hayden-christensen-6501d4f73c3a9.jpeg?crop=0.420xw:1.00xh;0.129xw,0&resize=1200:*',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ),
        )
      ]),
    );
  }
}
