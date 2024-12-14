import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'nfc_event.dart';
import 'nfc_state.dart';

class NFCBloc extends Bloc<NFCEvent, NFCState> {
  NFCBloc() : super(NFCInitial()) {
    on<ReadTag>((event, emit) async {
      emit(NFCReading());
      try {
        NFCTag? tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 10));
        if (tag != null) {
          emit(NFCReadSuccess('NFC Tag ID: ${tag.id}'));
        } else {
          emit(NFCReadError('No NFC tag found'));
        }
      } catch (e) {
        emit(NFCReadError(e.toString()));
      }
    });
  }
}
