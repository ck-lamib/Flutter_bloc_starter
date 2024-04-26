import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_folder_str/utils/helpers/connectivitybloc/connectivity_event.dart';
import 'package:clean_folder_str/utils/helpers/connectivitybloc/connectivity_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityState()) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> result) async {
        add(ConnectivityChanged(result));
      },
    );
    on<ConnectivityChanged>(_onConnectivityChanged);
  }

  void _onConnectivityChanged(ConnectivityChanged event, emit) async {
    final connectivity = event.connectivity;

    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      emit(
        state.copyWith(
          connectivityStatus: ConnectivityStatus.connected,
        ),
      );
    } else {
      emit(
        state.copyWith(
          connectivityStatus: ConnectivityStatus.disConnected,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
