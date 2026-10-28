// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:marryme_landing/pagine/apri_invito.dart' as _apri_invito;
import 'package:marryme_landing/pagine/invito.dart' as _invito;
import 'package:marryme_landing/sezioni/chiusura.dart' as _chiusura;
import 'package:marryme_landing/sezioni/contenuti.dart' as _contenuti;
import 'package:marryme_landing/sezioni/testata.dart' as _testata;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _apri_invito.ApriInvito: ClientTarget<_apri_invito.ApriInvito>(
      'apri_invito',
    ),
  },
  styles: () => [
    ..._invito.PaginaInvito.stili,
    ..._chiusura.Chiusura.stili,
    ..._chiusura.Domande.stili,
    ..._contenuti.ComeFunziona.stili,
    ..._contenuti.Funzioni.stili,
    ..._contenuti.PerGliSposi.stili,
    ..._testata.Barra.stili,
    ..._testata.TelefonoApp.stili,
    ..._testata.Testata.stili,
  ],
);
