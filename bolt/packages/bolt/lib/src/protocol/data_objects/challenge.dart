import 'package:bolt/bolt.dart';

/// {@template challenge}
/// Sent by the server to the client after a connection request to verify the
/// client.
/// {@endtemplate}
class Challenge extends DataObject {
  /// {@macro challenge}
  const Challenge({
    required this.clientSalt,
    required this.serverSalt,
  });

  /// Random 64 bit number generated by the client.
  final int clientSalt;

  /// Random 64 bit number generated by the server.
  final int serverSalt;

  @override
  List<Object> get props => [serverSalt, clientSalt];
}
