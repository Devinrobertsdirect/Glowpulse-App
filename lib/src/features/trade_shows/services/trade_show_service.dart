import 'package:health_device/src/core/network/dio_client.dart';
import 'package:health_device/src/features/trade_shows/models/trade_show.dart';

class TradeShowService {
  final DioClient _dioClient;

  TradeShowService(this._dioClient);

  /// Get all available trade shows
  Future<List<TradeShow>> getAvailableTradeShows() async {
    try {
      final response = await _dioClient.get('/trade-shows');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => TradeShow.fromJson(json)).toList();
    } catch (e) {
      // Return mock data for now - replace with real API call
      return _getMockTradeShows();
    }
  }

  /// Book a trade show
  Future<TradeShowBooking> bookTradeShow(TradeShowBooking booking) async {
    try {
      final response = await _dioClient.post('/trade-shows/book', data: booking.toJson());
      return TradeShowBooking.fromJson(response.data['booking']);
    } catch (e) {
      // For now, return the booking with generated ID
      return booking.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    }
  }

  /// Get user's trade show bookings
  Future<List<TradeShowBooking>> getUserBookings(String userId) async {
    try {
      final response = await _dioClient.get('/trade-show-bookings');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => TradeShowBooking.fromJson(json)).toList();
    } catch (e) {
      // Return mock data for now
      return _getMockBookings();
    }
  }

  /// Get mock trade shows for development
  List<TradeShow> _getMockTradeShows() {
    return [
      TradeShow(
        id: '1',
        name: 'Tech Expo 2025',
        location: 'Chicago Convention Center',
        boothNumber: '2034',
        hall: 'Hall B',
        startDate: DateTime(2025, 2, 15),
        endDate: DateTime(2025, 2, 18),
        product: 'Smart Home Suite 2025',
        status: 'upcoming',
        description: 'Annual technology showcase featuring the latest innovations',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TradeShow(
        id: '2',
        name: 'Smart Home Summit',
        location: 'Boston Convention Center',
        boothNumber: '1542',
        hall: 'Hall A',
        startDate: DateTime(2025, 2, 25),
        endDate: DateTime(2025, 2, 27),
        product: 'Smart Home Suite 2025',
        status: 'upcoming',
        description: 'Focused on smart home technology and IoT solutions',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TradeShow(
        id: '3',
        name: 'IoT World Conference',
        location: 'San Francisco Convention Center',
        boothNumber: '892',
        hall: 'Hall C',
        startDate: DateTime(2025, 3, 5),
        endDate: DateTime(2025, 3, 8),
        product: 'Smart Home Suite 2025',
        status: 'upcoming',
        description: 'International IoT and connected device conference',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  /// Get mock bookings for development
  List<TradeShowBooking> _getMockBookings() {
    return [
      TradeShowBooking(
        id: '1',
        tradeShowId: '1',
        userId: 'current-user',
        boothNumber: '2034',
        hall: 'Hall B',
        startDate: DateTime(2025, 2, 15),
        endDate: DateTime(2025, 2, 18),
        product: 'Smart Home Suite 2025',
        status: 'confirmed',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
