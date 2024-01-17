import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String cover;

  const ServiceEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.cover,
  });

  @override
  List<Object?> get props => [id, name, icon, cover];
}
