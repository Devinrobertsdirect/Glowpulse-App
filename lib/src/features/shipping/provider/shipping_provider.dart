import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:health_device/src/core/network/dio_client.dart';
import 'package:health_device/src/features/shipping/models/shipping_order.dart';
import 'package:health_device/src/features/shipping/services/shipping_service.dart';

final shippingServiceProvider = Provider<ShippingService>((ref) {
  return ShippingService(ref.read(dioClientProvider));
});

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(Dio());
});

final userShippingOrdersProvider = FutureProvider<List<ShippingOrder>>((ref) async {
  final service = ref.read(shippingServiceProvider);
  // TODO: Get actual user ID from auth
  return await service.getUserShippingOrders('current-user');
});

final shippingOrdersProvider = StateNotifierProvider<ShippingOrdersNotifier, AsyncValue<List<ShippingOrder>>>((ref) {
  return ShippingOrdersNotifier(ref.read(shippingServiceProvider));
});

class ShippingOrdersNotifier extends StateNotifier<AsyncValue<List<ShippingOrder>>> {
  final ShippingService _service;

  ShippingOrdersNotifier(this._service) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _service.getUserShippingOrders('current-user');
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> createShippingOrder(ShippingOrder order) async {
    try {
      final newOrder = await _service.createShippingOrder(order);
      final currentOrders = state.value ?? [];
      state = AsyncValue.data([...currentOrders, newOrder]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _service.updateShippingOrderStatus(orderId, status);
      await loadOrders(); // Reload to get updated data
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
