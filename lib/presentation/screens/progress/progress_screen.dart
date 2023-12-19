import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_scren';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text('Progress Indicators'),
          SizedBox(height: 30,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),
          SizedBox(height: 20,),
          LinearProgressIndicator(),

          SizedBox(height: 20,),
          Text('Progress Indicator Controlled'),
          SizedBox(height: 10,),
          _ControlledProgresIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 1),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12, value: progressValue,), 
              const SizedBox(width: 20,),
              Expanded(
                child: LinearProgressIndicator(value: progressValue,),
              )
            ],
          ),
        );
      }
    );
  }
}