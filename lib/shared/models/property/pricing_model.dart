class PropertyPricing {
  final double amount;
  final String currency;
  final String? period;
  final bool negotiable;

  const PropertyPricing({
    required this.amount,
    required this.currency,
    this.period,
    required this.negotiable,
  });

  factory PropertyPricing.fromJson(Map<String, dynamic> json) {
    return PropertyPricing(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      period: json['period'],
      negotiable: json['negotiable'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'period': period,
        'negotiable': negotiable,
      };
}
