import 'package:health_device/src/core/network/dio_client.dart';
import 'package:health_device/src/features/shipping/models/shipping_order.dart';

class ShippingService {
  final DioClient _dioClient;

  ShippingService(this._dioClient);

  /// Create a new shipping order
  Future<ShippingOrder> createShippingOrder(ShippingOrder order) async {
    try {
      final response = await _dioClient.post('/shipping-orders', data: order.toJson());
      return ShippingOrder.fromJson(response.data['data']);
    } catch (e) {
      // For now, return the order with generated ID and order number
      return order.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        orderNumber: 'SO-${DateTime.now().millisecondsSinceEpoch}',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    }
  }

  /// Get user's shipping orders
  Future<List<ShippingOrder>> getUserShippingOrders(String userId) async {
    try {
      final response = await _dioClient.get('/shipping-orders');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => ShippingOrder.fromJson(json)).toList();
    } catch (e) {
      // Return mock data for now
      return _getMockShippingOrders();
    }
  }

  /// Update shipping order status
  Future<ShippingOrder> updateShippingOrderStatus(String orderId, String status) async {
    try {
      final response = await _dioClient.put('/shipping/orders/$orderId/status', data: {'status': status});
      return ShippingOrder.fromJson(response.data['order']);
    } catch (e) {
      // For now, return mock data
      return _getMockShippingOrders().first;
    }
  }

  /// Get mock shipping orders for development
  List<ShippingOrder> _getMockShippingOrders() {
    return [
      ShippingOrder(
        id: '1',
        tradeShowId: '1',
        userId: 'current-user',
        orderNumber: 'SO-123456789',
        status: 'pending',
        shippingAddress: '123 Main St, Chicago, IL 60601',
        recipientName: 'John Doe',
        recipientPhone: '+1-555-0123',
        carrier: 'FedEx',
        estimatedDelivery: DateTime(2025, 2, 14),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        items: [
          ShippingItem(
            id: '1',
            name: 'Smart Home Suite 2025',
            quantity: 1,
            description: 'Complete smart home system',
            weight: 15.5,
            dimensions: '24" x 18" x 12"',
            sku: 'SHS-2025-001',
          ),
        ],
        totalCost: 89.99,
      ),
    ];
  }
}
