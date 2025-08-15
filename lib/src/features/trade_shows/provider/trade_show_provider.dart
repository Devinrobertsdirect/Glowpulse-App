import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:health_device/src/core/network/dio_client.dart';
import 'package:health_device/src/features/trade_shows/models/trade_show.dart';
import 'package:health_device/src/features/trade_shows/services/trade_show_service.dart';

final tradeShowServiceProvider = Provider<TradeShowService>((ref) {
  return TradeShowService(ref.read(dioClientProvider));
});

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(Dio());
});

final availableTradeShowsProvider = FutureProvider<List<TradeShow>>((ref) async {
  final service = ref.read(tradeShowServiceProvider);
  return await service.getAvailableTradeShows();
});

final userBookingsProvider = FutureProvider<List<TradeShowBooking>>((ref) async {
  final service = ref.read(tradeShowServiceProvider);
  // TODO: Get actual user ID from auth
  return await service.getUserBookings('current-user');
});

final tradeShowBookingsProvider = StateNotifierProvider<TradeShowBookingsNotifier, AsyncValue<List<TradeShowBooking>>>((ref) {
  return TradeShowBookingsNotifier(ref.read(tradeShowServiceProvider));
});

class TradeShowBookingsNotifier extends StateNotifier<AsyncValue<List<TradeShowBooking>>> {
  final TradeShowService _service;

  TradeShowBookingsNotifier(this._service) : super(const AsyncValue.loading()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    state = const AsyncValue.loading();
    try {
      final bookings = await _service.getUserBookings('current-user');
      state = AsyncValue.data(bookings);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> bookTradeShow(TradeShowBooking booking) async {
    try {
      final newBooking = await _service.bookTradeShow(booking);
      final currentBookings = state.value ?? [];
      state = AsyncValue.data([...currentBookings, newBooking]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
