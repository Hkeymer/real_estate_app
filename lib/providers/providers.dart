import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => AddPropertyProvider()),
];
