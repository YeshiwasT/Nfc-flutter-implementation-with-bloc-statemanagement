import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_bloc/bloc/nfc_bloc.dart';
import 'package:nfc_bloc/bloc/nfc_event.dart';
import 'package:nfc_bloc/bloc/nfc_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => NFCBloc(),
        child: NFCHomePage(),
      ),
    );
  }
}

class NFCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NFC Reader")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<NFCBloc, NFCState>(
              builder: (context, state) {
                if (state is NFCReading) {
                  return CircularProgressIndicator();
                } else if (state is NFCReadSuccess) {
                  return Text('Data: ${state.message}');
                } else if (state is NFCReadError) {
                  return Text('Error: ${state.error}');
                }
                return ElevatedButton(
                  onPressed: () => context.read<NFCBloc>().add(ReadTag()),
                  child: Text('Read NFC Tag'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
