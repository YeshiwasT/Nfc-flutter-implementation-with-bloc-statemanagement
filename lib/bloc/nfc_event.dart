import 'package:equatable/equatable.dart';

abstract class NFCEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadTag extends NFCEvent {}
