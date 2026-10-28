/// Punto d'ingresso per la generazione della pagina: viene eseguito solo in
/// build, per produrre l'HTML statico.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';
import 'tema.dart';

const _titolo = 'MarryMe · L\'invito digitale del vostro matrimonio';
const _descrizione =
    'Luoghi e orari, conferma della presenza, lista nozze, foto e video: '
    'con MarryMe gli ospiti hanno tutto il vostro matrimonio in tasca, inquadrando il QR sulla partecipazione.';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: _titolo,
      lang: 'it',
      meta: {'description': _descrizione, 'theme-color': '#FBF7F3'},
      head: [
        // anteprima quando il link viene condiviso
        for (final (proprieta, valore) in const [
          ('og:type', 'website'),
          ('og:title', _titolo),
          ('og:description', _descrizione),
          ('og:image', 'immagini/fiori.jpg'),
          ('og:locale', 'it_IT'),
        ])
          meta(attributes: {'property': proprieta, 'content': valore}),
        link(rel: 'icon', type: 'image/png', href: 'favicon.png'),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Great+Vibes&family=Lato:wght@400;700&family=Playfair+Display:ital,wght@0,400;0,600;1,400&display=swap',
        ),
      ],
      styles: stiliGlobali,
      body: const App(),
    ),
  );
}
