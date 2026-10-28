import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' as icone;

import '../config.dart';
import '../sezioni/chiusura.dart';
import '../tema.dart';
import 'apri_invito.dart';

/// Pagina dei link degli inviti (`/i/<codice>`), per chi non ha ancora l'app:
/// con l'app installata il link apre direttamente MarryMe e questa pagina
/// non si vede.
class PaginaInvito extends StatelessComponent {
  const PaginaInvito({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'pagina-invito', [
      // i link degli inviti sono personali: fuori dai motori di ricerca
      Document.head(meta: {'robots': 'noindex'}),
      div(classes: 'invito-foglio entra', [
        a(href: '/', classes: 'logo script', [.text('MarryMe')]),
        span(classes: 'invito-busta', [icone.MailOpen(width: 34.px, height: 34.px)]),
        h1([.text('Avete ricevuto un invito')]),
        p(classes: 'tenue', [
          .text('Per aprirlo serve l\'app MarryMe: è gratuita e non chiede di registrarsi.'),
        ]),
        ol(classes: 'invito-passi', [
          li([
            span(classes: 'invito-numero corsivo', [.text('1')]),
            div([
              strong([.text('Scaricate l\'app')]),
              div(classes: 'invito-store', [
                badgeStore('App Store', 'Scarica su', linkAppStore),
                badgeStore('Google Play', 'Disponibile su', linkPlayStore),
              ]),
            ]),
          ]),
          li([
            span(classes: 'invito-numero corsivo', [.text('2')]),
            div([
              strong([.text('Tornate qui e aprite l\'invito')]),
              p(classes: 'tenue', [.text('Oppure inquadrate di nuovo il QR: si aprirà da solo nell\'app.')]),
              const ApriInvito(),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.pagina-invito', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'min-height': '100vh',
      'padding': '32px 16px',
      'background':
          "linear-gradient(180deg, rgba(251,247,243,.82), rgba(251,247,243,.95)), url('/immagini/fiori.jpg') center/cover",
    }),
    r('.invito-foglio', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'gap': '14px',
      'width': 'min(480px, 100%)',
      'padding': '36px 28px',
      'border-radius': '32px',
      'background': '#fff',
      'border': '1px solid rgba(231,220,214,.8)',
      'box-shadow': '0 30px 60px rgba(158,59,77,.14)',
      'text-align': 'center',
    }),
    r('.invito-foglio h1', {'font-size': '32px'}),
    r('.invito-busta', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '76px',
      'height': '76px',
      'border-radius': '50%',
      'background': 'linear-gradient(135deg, ${Colori.primarioChiaro}, #fff)',
      'border': '1px solid rgba(184,149,90,.45)',
      'color': Colori.primario,
    }),
    r('.invito-passi', {
      'display': 'flex',
      'flex-direction': 'column',
      'gap': '20px',
      'width': '100%',
      'margin': '10px 0 0',
      'padding': '0',
      'list-style': 'none',
      'text-align': 'left',
    }),
    r('.invito-passi li', {'display': 'flex', 'gap': '14px'}),
    r('.invito-passi li > div', {'display': 'flex', 'flex-direction': 'column', 'gap': '8px', 'flex': '1'}),
    r('.invito-numero', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '34px',
      'height': '34px',
      'flex': 'none',
      'border-radius': '50%',
      'border': '1px solid ${Colori.oro}',
      'color': Colori.oro,
      'font-size': '17px',
    }),
    r('.invito-store', {'display': 'flex', 'gap': '8px', 'flex-wrap': 'wrap'}),
    r('.invito-store .store', {'height': '52px', 'padding': '0 16px'}),
    r('.invito-store .store.presto', {
      'background': Colori.primarioChiaro,
      'border': 'none',
      'color': Colori.primario,
    }),
    r('.invito-apri', {'align-self': 'flex-start'}),
    r('.invito-errore', {'color': Colori.primario, 'font-weight': '700'}),
  ];
}
