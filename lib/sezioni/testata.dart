import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' as icone;

import '../config.dart';
import '../tema.dart';

/// Barra in alto: logo, ancore alle sezioni e accesso al pannello.
class Barra extends StatelessComponent {
  const Barra({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'barra', [
      div(classes: 'contenitore barra-contenuto', [
        a(href: '#', classes: 'logo script', [.text('MarryMe')]),
        nav(
          classes: 'barra-link',
          attributes: {'aria-label': 'Sezioni della pagina'},
          [
            a(href: '#come-funziona', [.text('Come funziona')]),
            a(href: '#funzioni', [.text('Funzioni')]),
            a(href: '#sposi', [.text('Per gli sposi')]),
            a(href: '#domande', [.text('Domande')]),
          ],
        ),
        // il pannello è un altro progetto, sul suo sottodominio
        a(href: linkPannello, classes: 'pulsante secondario barra-pannello', [.text('Area sposi')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.barra', {
      'position': 'sticky',
      'top': '0',
      'z-index': '50',
      'background': 'rgba(251,247,243,.78)',
      'backdrop-filter': 'blur(16px) saturate(1.4)',
      'border-bottom': '1px solid rgba(231,220,214,.6)',
    }),
    r('.barra-contenuto', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'space-between',
      'gap': '24px',
      'height': '72px',
    }),
    r('.logo', {'font-size': '36px', 'color': Colori.primario, 'text-decoration': 'none'}),
    r('.barra-link', {'display': 'flex', 'gap': '28px'}),
    r('.barra-link a', {
      'position': 'relative',
      'color': Colori.testoTenue,
      'text-decoration': 'none',
      'font-weight': '700',
      'font-size': '15px',
      'transition': 'color .2s ease',
    }),
    r('.barra-link a::after', {
      'content': "''",
      'position': 'absolute',
      'left': '0',
      'right': '0',
      'bottom': '-6px',
      'height': '1.5px',
      'background': Colori.oro,
      'transform': 'scaleX(0)',
      'transition': 'transform .3s cubic-bezier(.22,1,.36,1)',
    }),
    r('.barra-link a:hover', {'color': Colori.primario}),
    r('.barra-link a:hover::after', {'transform': 'scaleX(1)'}),
    r('.barra-pannello', {'height': '44px', 'padding': '0 20px', 'font-size': '15px'}),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(860)), [
      r('.barra-link', {'display': 'none'}),
    ]),
  ];
}

/// Apertura della pagina: promessa, pulsanti e il telefono con l'app.
class Testata extends StatelessComponent {
  const Testata({super.key});

  @override
  Component build(BuildContext context) {
    Component entra(int ritardo, Component child) =>
        div(classes: 'entra', styles: Styles(raw: {'animation-delay': '${ritardo}ms'}), [child]);

    return section(classes: 'testata', [
      div(classes: 'contenitore testata-griglia', [
        div(classes: 'testata-testi', [
          entra(0, span(classes: 'etichetta', [.text('L\'invito digitale del vostro matrimonio')])),
          entra(
            100,
            h1([
              .text('Tutto il vostro '),
              span(classes: 'script evidenza', [.text('grande giorno')]),
              .text(', in tasca ai vostri ospiti'),
            ]),
          ),
          entra(
            200,
            p(classes: 'testata-sottotitolo tenue', [
              .text(
                'Luoghi e orari, conferma della presenza, lista nozze, foto e video: '
                'gli ospiti inquadrano il QR sulla partecipazione, o toccano il link che gli mandate, e hanno tutto a portata di mano.',
              ),
            ]),
          ),
          entra(
            300,
            div(classes: 'testata-azioni', [
              a(href: '#scarica', classes: 'pulsante primario', [
                .text('Scarica l\'app'),
                icone.ArrowDown(width: 18.px, height: 18.px),
              ]),
              a(href: '#come-funziona', classes: 'pulsante secondario', [.text('Come funziona')]),
            ]),
          ),
          entra(
            400,
            ul(classes: 'testata-punti', [
              for (final punto in const [
                'Nessuna registrazione per gli ospiti',
                'In italiano, inglese, francese e tedesco',
              ])
                li([
                  icone.Check(width: 16.px, height: 16.px),
                  .text(punto),
                ]),
            ]),
          ),
        ]),
        div(classes: 'testata-telefono entra', styles: const Styles(raw: {'animation-delay': '250ms'}), [
          div(classes: 'alone', []),
          const TelefonoApp(),
          div(classes: 'fluttuante notifica', [
            div(classes: 'icona-notifica', [icone.BellRing(width: 18.px, height: 18.px)]),
            div([
              strong([.text('Giulia & Marco')]),
              span([.text('Il ricevimento inizia alle 13:30')]),
            ]),
          ]),
          div(classes: 'fluttuante rsvp', [
            span(classes: 'cuore', [
              icone.Heart(width: 16.px, height: 16.px, attributes: {'fill': 'currentColor'}),
            ]),
            span([.text('Ci saremo! · 2 persone')]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.testata', {'position': 'relative', 'padding': '72px 0 120px', 'overflow': 'hidden'}),
    r('.testata::before', {
      'content': "''",
      'position': 'absolute',
      'top': '-20%',
      'right': '-10%',
      'width': '60%',
      'height': '120%',
      'background': 'radial-gradient(closest-side, rgba(246,227,230,.9), rgba(246,227,230,0))',
      'z-index': '-1',
    }),
    r('.testata-griglia', {
      'display': 'grid',
      'grid-template-columns': 'minmax(0, 1.1fr) minmax(0, .9fr)',
      'align-items': 'center',
      'gap': '64px',
    }),
    r('.testata-testi', {'display': 'flex', 'flex-direction': 'column', 'gap': '24px'}),
    r('.testata h1', {'font-size': 'clamp(40px, 5.6vw, 68px)', 'line-height': '1.08'}),
    r('.evidenza', {'color': Colori.primario, 'font-size': '1.2em', 'line-height': '.9'}),
    r('.testata-sottotitolo', {'font-size': '20px', 'max-width': '540px'}),
    r('.testata-azioni', {'display': 'flex', 'gap': '14px', 'flex-wrap': 'wrap'}),
    r('.testata-punti', {
      'display': 'flex',
      'flex-wrap': 'wrap',
      'gap': '8px 24px',
      'margin': '0',
      'padding': '0',
      'list-style': 'none',
      'font-size': '15px',
      'color': Colori.testoTenue,
    }),
    r('.testata-punti li', {'display': 'flex', 'align-items': 'center', 'gap': '8px'}),
    r('.testata-punti svg', {'color': Colori.oro}),

    r('.testata-telefono', {'position': 'relative', 'display': 'flex', 'justify-content': 'center'}),
    r('.alone', {
      'position': 'absolute',
      'inset': '10% 5%',
      'border-radius': '50%',
      'background': 'radial-gradient(closest-side, rgba(184,149,90,.28), rgba(184,149,90,0))',
      'filter': 'blur(10px)',
    }),
    r('.fluttuante', {
      'position': 'absolute',
      'display': 'flex',
      'align-items': 'center',
      'gap': '12px',
      'padding': '12px 16px',
      'border-radius': '18px',
      'background': 'rgba(255,255,255,.88)',
      'backdrop-filter': 'blur(12px)',
      'border': '1px solid rgba(231,220,214,.8)',
      'box-shadow': '0 18px 40px rgba(42,34,36,.14)',
      'font-size': '14px',
      'animation': 'fluttua 6s ease-in-out infinite',
    }),
    r('.notifica', {'top': '47%', 'left': '-12%', 'max-width': '300px'}),
    r('.notifica div:last-child', {'display': 'flex', 'flex-direction': 'column', 'line-height': '1.35'}),
    r('.notifica span', {'color': Colori.testoTenue}),
    r('.icona-notifica', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '38px',
      'height': '38px',
      'flex': 'none',
      'border-radius': '12px',
      'background': 'linear-gradient(135deg, ${Colori.primario}, ${Colori.primarioScuro})',
      'color': '#fff',
    }),
    r('.rsvp', {
      'bottom': '14%',
      'right': '-4%',
      'font-weight': '700',
      'color': Colori.primario,
      'animation-delay': '-3s',
    }),
    r('.rsvp .cuore', {'display': 'flex', 'animation': 'batte 2.4s ease-in-out infinite'}),

    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(960)), [
      r('.testata-griglia', {'grid-template-columns': 'minmax(0, 1fr)', 'gap': '56px'}),
      r('.testata', {'padding-top': '48px'}),
    ]),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(520)), [
      r('.notifica', {'left': '0', 'top': '3%', 'max-width': '240px'}),
      r('.rsvp', {'right': '0'}),
    ]),
  ];
}

/// Il telefono con la schermata di un matrimonio, come nell'app.
class TelefonoApp extends StatelessComponent {
  const TelefonoApp({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'telefono',
      attributes: {'role': 'img', 'aria-label': 'L\'app MarryMe con il matrimonio di Giulia e Marco'},
      [
        div(classes: 'schermo', [
          div(classes: 'app-copertina', [
            span(classes: 'app-data', [.text('12 GIUGNO 2027')]),
            span(classes: 'script app-nome', [.text('Giulia')]),
            span(classes: 'script app-e', [.text('&')]),
            span(classes: 'script app-nome', [.text('Marco')]),
          ]),
          div(classes: 'app-foglio', [
            div(classes: 'app-conto', [
              span(classes: 'app-etichetta', [.text('Al nostro sì mancano')]),
              span(classes: 'app-numero', [.text('227')]),
              span(classes: 'corsivo tenue', [.text('giorni')]),
              div(classes: 'app-linea', [div(classes: 'app-linea-piena', [])]),
            ]),
            span(classes: 'app-etichetta', [.text('Per gli ospiti')]),
            for (final (n, titolo, sottotitolo) in const [
              ('01', 'Partecipazione', 'Luoghi e orari'),
              ('02', 'RSVP', 'Conferma la presenza'),
              ('03', 'Un pensiero per noi', 'Lista nozze'),
            ])
              div(classes: 'app-voce', [
                div(classes: 'app-bolla', []),
                div([
                  span(classes: 'app-n', [.text(n)]),
                  span(classes: 'app-titolo', [.text(titolo)]),
                  span(classes: 'app-sotto', [.text(sottotitolo)]),
                ]),
              ]),
          ]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get stili => [
    r('.telefono', {
      'position': 'relative',
      'width': '300px',
      'height': '620px',
      'padding': '12px',
      'border-radius': '48px',
      'background': '#1E1416',
      'box-shadow': '0 40px 80px rgba(42,34,36,.28), inset 0 0 0 2px #3a2c2f',
      'animation': 'fluttua 7s ease-in-out infinite',
    }),
    r('.telefono::before', {
      'content': "''",
      'position': 'absolute',
      'top': '22px',
      'left': '50%',
      'z-index': '2',
      'width': '90px',
      'height': '26px',
      'border-radius': '14px',
      'background': '#1E1416',
      'transform': 'translateX(-50%)',
    }),
    r('.schermo', {
      'position': 'relative',
      'height': '100%',
      'border-radius': '38px',
      'overflow': 'hidden',
      'background': Colori.sfondo,
    }),
    r('.app-copertina', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'justify-content': 'flex-end',
      'height': '300px',
      'padding': '0 16px 44px',
      'color': '#fff',
      'background':
          "linear-gradient(180deg, rgba(30,20,22,.1) 0%, rgba(30,20,22,.25) 40%, rgba(30,20,22,.88) 100%), "
          "linear-gradient(rgba(122,42,58,.35), rgba(122,42,58,.35)), "
          "url('immagini/fiori.jpg') 18% 30%/260% auto no-repeat",
    }),
    r('.app-data', {
      'margin-bottom': '8px',
      'padding': '4px 12px',
      'border-radius': '20px',
      'background': 'rgba(255,255,255,.18)',
      'border': '1px solid rgba(255,255,255,.35)',
      'backdrop-filter': 'blur(10px)',
      'font-size': '9px',
      'font-weight': '700',
      'letter-spacing': '2px',
    }),
    r('.app-nome', {'font-size': '44px', 'line-height': '1', 'text-shadow': '0 2px 14px rgba(0,0,0,.3)'}),
    r('.app-e', {'font-size': '28px', 'line-height': '1', 'color': '#E6CC94'}),
    r('.app-foglio', {
      'position': 'relative',
      'display': 'flex',
      'flex-direction': 'column',
      'gap': '8px',
      'margin-top': '-26px',
      'padding': '16px 14px',
      'border-radius': '26px 26px 0 0',
      'background': Colori.sfondo,
    }),
    r('.app-conto', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'padding': '12px 14px 14px',
      'border-radius': '20px',
      'background': 'linear-gradient(135deg, #fff, rgba(246,227,230,.6))',
      'border': '1px solid rgba(231,220,214,.7)',
      'box-shadow': '0 8px 18px rgba(158,59,77,.08)',
      'font-size': '12px',
    }),
    r('.app-etichetta', {
      'font-size': '8px',
      'font-weight': '700',
      'letter-spacing': '1.2px',
      'text-transform': 'uppercase',
      'color': Colori.testoTenue,
    }),
    r('.app-numero', {'font-family': display, 'font-size': '44px', 'line-height': '1', 'color': Colori.primario}),
    r('.app-linea', {
      'width': '100%',
      'height': '3px',
      'margin-top': '10px',
      'border-radius': '2px',
      'background': Colori.bordo,
      'overflow': 'hidden',
    }),
    r('.app-linea-piena', {
      'width': '62%',
      'height': '100%',
      'background': 'linear-gradient(90deg, ${Colori.oro}, ${Colori.primario})',
      'transform-origin': 'left',
      'animation': 'riempie 2s 1s cubic-bezier(.22,1,.36,1) both',
    }),
    r('.app-voce', {
      'display': 'flex',
      'align-items': 'center',
      'gap': '10px',
      'padding': '9px 10px',
      'border-radius': '16px',
      'background': '#fff',
      'border': '1px solid rgba(231,220,214,.7)',
      'box-shadow': '0 6px 14px rgba(158,59,77,.06)',
    }),
    r('.app-voce > div:last-child', {'display': 'flex', 'flex-direction': 'column', 'line-height': '1.2'}),
    r('.app-bolla', {
      'width': '30px',
      'height': '30px',
      'flex': 'none',
      'border-radius': '50%',
      'background': 'linear-gradient(135deg, ${Colori.primarioChiaro}, ${Colori.sfondo})',
      'border': '1px solid rgba(184,149,90,.4)',
    }),
    r('.app-n', {'font-family': display, 'font-style': 'italic', 'font-size': '9px', 'color': Colori.oro}),
    r('.app-titolo', {'font-family': display, 'font-weight': '600', 'font-size': '13px'}),
    r('.app-sotto', {'font-size': '10px', 'color': Colori.testoTenue}),
  ];
}
