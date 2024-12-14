import 'package:equatable/equatable.dart';

abstract class NFCState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NFCInitial extends NFCState {}

class NFCReading extends NFCState {}

class NFCReadSuccess extends NFCState {
  final String message;

  NFCReadSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class NFCReadError extends NFCState {
  final String error;

  NFCReadError(this.error);

  @override
  List<Object?> get props => [error];
}
