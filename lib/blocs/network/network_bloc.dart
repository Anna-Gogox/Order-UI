import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_event.dart';
import 'package:order_ui/blocs/network/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  void _observe(NetworkObserve event, Emitter<NetworkState> emit) {
    Connectivity().onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        add(NetworkNotify(isConnected: false));
      } else {
        add(NetworkNotify(isConnected: true));
      }
    });
  }

  void _notifyStatus(NetworkNotify event, Emitter<NetworkState> emit) {
    emit(event.isConnected ? NetworkSuccess() : NetworkFailure());
  }
}
