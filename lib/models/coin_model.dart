import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String name;
  final String fullname;
  final double price;

  const Coin({
    required this.name,
    required this.fullname,
    required this.price,
  });

  @override
  List<Object?> get props => [name, fullname, price];

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['CoinInfo']['Name'] as String,
      fullname: map['CoinInfo']['FullName'] as String,
      price: (map['RAW']['EUR']['PRICE'] as num).toDouble(),
    );
  }
}
