import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' as icone;

import '../config.dart';
import '../tema.dart';

/// Pulsante per uno store; senza link mostra "Presto disponibile".
Component badgeStore(String nome, String sopra, String link) {
  final contenuto = [
    icone.Smartphone(width: 22.px, height: 22.px),
    span(classes: 'store-testi', [
      span(classes: 'store-sopra', [.text(link.isEmpty ? 'Presto disponibile' : sopra)]),
      span(classes: 'store-nome', [.text(nome)]),
    ]),
  ];
  return link.isEmpty
      ? span(classes: 'store presto', attributes: {'aria-disabled': 'true'}, contenuto)
      : a(href: link, classes: 'store', attributes: {'rel': 'noopener'}, contenuto);
}

/// Domande frequenti, a fisarmonica (solo HTML, senza JavaScript).
class Domande extends StatelessComponent {
  const Domande({super.key});

  static const _domande = [
    (
      'Gli ospiti devono creare un account?',
      'No. Inquadrano il QR sulla partecipazione con la fotocamera, o toccano il link che gli mandate su WhatsApp, '
          'e il vostro matrimonio si apre nell\'app. Niente da scrivere, nessuna email, nessuna password.',
    ),
    (
      'In che lingue è disponibile l\'app?',
      'In italiano, inglese, francese e tedesco: l\'app usa la lingua del telefono dell\'ospite. '
          'I testi che scrivete voi restano come li avete scritti.',
    ),
    (
      'Possiamo cambiare qualcosa dopo aver consegnato le partecipazioni?',
      'Sì, in qualsiasi momento dal pannello: il QR stampato non cambia e gli ospiti trovano le informazioni aggiornate '
          'la prossima volta che aprono l\'invito.',
    ),
    (
      'Ogni ospite vede tutto?',
      'Vede quello che lo riguarda: con gli inviti per cerimonia, pranzo o taglio della torta ognuno trova '
          'solo i momenti a cui è invitato. E le sezioni che spegnete non le vede nessuno.',
    ),
    (
      'E dopo il matrimonio?',
      'L\'invito resta: le foto, il video e la data del vostro sì diventano un ricordo da riaprire quando volete.',
    ),
    ('Su quali telefoni funziona?', 'Su iPhone e su Android.'),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'domande', classes: 'sezione', [
      div(classes: 'contenitore domande', [
        div(classes: 'intestazione-sezione rivela', [
          span(classes: 'etichetta', [.text('Domande')]),
          h2([.text('Le risposte, prima del sì')]),
        ]),
        div(classes: 'elenco-domande', [
          for (final (domanda, risposta) in _domande)
            details(classes: 'domanda rivela', [
              summary([
                span([.text(domanda)]),
                icone.ChevronDown(width: 20.px, height: 20.px),
              ]),
              p(classes: 'tenue', [.text(risposta)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.elenco-domande', {
      'display': 'flex',
      'flex-direction': 'column',
      'gap': '12px',
      'max-width': '780px',
      'margin': '0 auto',
    }),
    r('.domanda', {
      'border-radius': '20px',
      'background': '#fff',
      'border': '1px solid rgba(231,220,214,.7)',
      'transition': 'border-color .25s ease, box-shadow .25s ease',
    }),
    r('.domanda[open]', {'border-color': 'rgba(184,149,90,.6)', 'box-shadow': '0 14px 30px rgba(158,59,77,.08)'}),
    r('.domanda summary', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'space-between',
      'gap': '16px',
      'padding': '20px 24px',
      'font-family': display,
      'font-size': '19px',
      'cursor': 'pointer',
      'list-style': 'none',
    }),
    r('.domanda summary::-webkit-details-marker', {'display': 'none'}),
    r('.domanda summary svg', {
      'flex': 'none',
      'color': Colori.oro,
      'transition': 'transform .3s cubic-bezier(.22,1,.36,1)',
    }),
    r('.domanda[open] summary svg', {'transform': 'rotate(180deg)'}),
    r('.domanda p', {'padding': '0 24px 22px'}),
  ];
}

/// Invito finale a scaricare l'app e piè di pagina.
class Chiusura extends StatelessComponent {
  const Chiusura({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      section(id: 'scarica', classes: 'sezione', [
        div(classes: 'contenitore', [
          div(classes: 'scarica rivela', [
            div(classes: 'scarica-fiori', []),
            div(classes: 'scarica-testi', [
              span(classes: 'script scarica-logo', [.text('MarryMe')]),
              h2([.text('Il vostro sì merita un invito che non si dimentica')]),
              p([.text('Scaricate l\'app e provatela: poi preparate l\'invito per i vostri ospiti.')]),
              div(classes: 'scarica-store', [
                badgeStore('App Store', 'Scarica su', linkAppStore),
                badgeStore('Google Play', 'Disponibile su', linkPlayStore),
              ]),
            ]),
          ]),
        ]),
      ]),
      footer(classes: 'piede', [
        div(classes: 'contenitore piede-contenuto', [
          span(classes: 'script logo', [.text('MarryMe')]),
          span(classes: 'ornamento', [
            icone.Heart(width: 12.px, height: 12.px, attributes: {'fill': 'currentColor'}),
          ]),
          p(classes: 'tenue corsivo', [.text('Con amore, per il vostro grande giorno')]),
          p(classes: 'tenue piede-copy', [.text('© ${DateTime.now().year} MarryMe')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.scarica', {
      'position': 'relative',
      'overflow': 'hidden',
      'padding': '80px 64px',
      'border-radius': '36px',
      'background': 'linear-gradient(135deg, ${Colori.primario}, ${Colori.primarioScuro})',
      'color': '#fff',
      'box-shadow': '0 40px 80px rgba(158,59,77,.3)',
    }),
    r('.scarica-fiori', {
      'position': 'absolute',
      'inset': '0',
      'background': "url('immagini/fiori.jpg') right center/cover no-repeat",
      'opacity': '.22',
      'mix-blend-mode': 'luminosity',
    }),
    r('.scarica-testi', {
      'position': 'relative',
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'flex-start',
      'gap': '18px',
      'max-width': '620px',
    }),
    r('.scarica-logo', {'font-size': '52px', 'line-height': '1', 'color': '#E6CC94'}),
    r('.scarica p', {'font-size': '19px', 'opacity': '.85'}),
    r('.scarica-store', {'display': 'flex', 'gap': '14px', 'flex-wrap': 'wrap', 'margin-top': '10px'}),
    r('.store', {
      'display': 'inline-flex',
      'align-items': 'center',
      'gap': '12px',
      'height': '60px',
      'padding': '0 22px',
      'border-radius': '16px',
      'background': '#1E1416',
      'color': '#fff',
      'text-decoration': 'none',
      'transition': 'transform .2s ease, box-shadow .25s ease',
    }),
    r('a.store:hover', {'transform': 'translateY(-3px)', 'box-shadow': '0 14px 28px rgba(0,0,0,.3)'}),
    r('.store.presto', {
      'background': 'rgba(255,255,255,.12)',
      'border': '1px solid rgba(255,255,255,.3)',
      'cursor': 'default',
    }),
    r('.store-testi', {'display': 'flex', 'flex-direction': 'column', 'line-height': '1.15'}),
    r('.store-sopra', {'font-size': '12px', 'opacity': '.8'}),
    r('.store-nome', {'font-size': '19px', 'font-weight': '700'}),

    r('.piede', {'padding': '24px 0 56px'}),
    r('.piede-contenuto', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'gap': '10px',
      'text-align': 'center',
    }),
    r('.piede-copy', {'font-size': '14px'}),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(720)), [
      r('.scarica', {'padding': '56px 28px', 'border-radius': '28px'}),
    ]),
  ];
}
