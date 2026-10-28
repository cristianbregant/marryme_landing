import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pagine/invito.dart';
import 'sezioni/chiusura.dart';
import 'sezioni/contenuti.dart';
import 'sezioni/testata.dart';

/// Il sito di MarryMe, generato in HTML statico: la landing e la pagina dei
/// link degli inviti per chi non ha ancora l'app.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(path: '/', builder: (_, _) => const _Landing()),
        // /i/<codice>: l'hosting deve servire /i/index.html per ogni codice
        Route(path: '/i', title: 'Il vostro invito · MarryMe', builder: (_, _) => const PaginaInvito()),
      ],
    );
  }
}

class _Landing extends StatelessComponent {
  const _Landing();

  @override
  Component build(BuildContext context) {
    return div(classes: 'pila', [
      const Barra(),
      main_([
        const Testata(),
        const ComeFunziona(),
        const Funzioni(),
        const PerGliSposi(),
        const Domande(),
        const Chiusura(),
      ]),
    ]);
  }
}
