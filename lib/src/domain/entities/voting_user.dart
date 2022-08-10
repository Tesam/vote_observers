import 'package:equatable/equatable.dart';

class VotingUser extends Equatable {
  final Map<String, dynamic> group;
  final Map<String, dynamic> state;
  final Map<String, dynamic> city;
  final Map<String, dynamic> place;
  final Map<String, dynamic> table;
  final String? role;
  final String uid;

  const VotingUser({
    required this.group,
    required this.state,
    required this.city,
    required this.place,
    required this.table,
    required this.role,
    required this.uid,
  });

  @override
  List<Object?> get props {
    return [
      group,
      state,
      city,
      place,
      table,
      role,
      uid,
    ];
  }

  @override
  bool get stringify => false;

  @override
  String toString() {
    return "${group['id']}${state['id']}${city['id']}${place['id']}${table['id']}";
  }
}
