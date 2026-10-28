import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Pulsante che apre l'invito nell'app: il codice è nell'indirizzo della
/// pagina (`/i/<codice>`), quindi si legge nel browser.
@client
class ApriInvito extends StatelessComponent {
  const ApriInvito({super.key});

  /// Codice dall'indirizzo, es. /i/Gz7QaK… → Gz7QaK…
  static String? codice(Uri indirizzo) {
    final segmenti = indirizzo.pathSegments.where((segmento) => segmento.isNotEmpty).toList();
    final i = segmenti.indexOf('i');
    if (i == -1 || i + 1 >= segmenti.length) return null;
    final codice = segmenti[i + 1];
    return RegExp(r'^[A-Za-z0-9!_\-]{4,64}$').hasMatch(codice) ? codice : null;
  }

  @override
  Component build(BuildContext context) {
    // in build statica non c'è ancora l'indirizzo: il pulsante si completa
    // appena la pagina si apre nel browser
    final codice = kIsWeb ? ApriInvito.codice(Uri.base) : null;
    if (kIsWeb && codice == null) {
      return p(classes: 'invito-errore', [
        .text('Questo link sembra incompleto: chiedete agli sposi di rimandarvelo.'),
      ]);
    }
    return a(
      href: codice == null ? '#' : 'marryme://invito/${Uri.encodeComponent(codice)}',
      classes: 'pulsante primario invito-apri',
      [.text('Apri l\'invito')],
    );
  }
}
