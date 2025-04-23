import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_event.dart';
import 'package:order_ui/blocs/network/network_state.dart';
import 'package:order_ui/utils/network_helper.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    Networkhelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? emit(NetworkSuccess())
        : emit(NetworkFailure());
  }
}