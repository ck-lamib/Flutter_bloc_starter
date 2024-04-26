import 'package:equatable/equatable.dart';

enum ConnectivityStatus { connected, disConnected }

class ConnectivityState extends Equatable {
  const ConnectivityState({
    this.connectivityStatus = ConnectivityStatus.disConnected,
  });
  final ConnectivityStatus connectivityStatus;

  ConnectivityState copyWith({
    ConnectivityStatus? connectivityStatus,
  }) {
    return ConnectivityState(
      connectivityStatus: connectivityStatus ?? this.connectivityStatus,
    );
  }

  @override
  List<Object> get props => [connectivityStatus];
}
