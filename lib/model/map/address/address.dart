import 'package:coffee_app_remastered/model/map/location.dart';

import 'address_state.dart';

class Address {
  final String title;
  final String subtitle;
  final Location location;
  double? distance;
  AddressState _state;
  DateTime _endStateTime;
  bool _isSelected;

  Address({
    required this.title,
    required this.subtitle,
    required this.location,
    required AddressState state,
    required DateTime endStateTime,
    required bool isSelected,
    this.distance,
  })  : _state = state,
        _endStateTime = endStateTime,
        _isSelected = isSelected;

  AddressState get state => _state;
  DateTime get endStateTime => _endStateTime;
  bool get isSelected => _isSelected;

  set isSelected(bool value) {
    _isSelected = value;
  }
}