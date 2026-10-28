import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' as icone;

import '../config.dart';
import '../tema.dart';

/// I tre passi, dagli sposi agli ospiti.
class ComeFunziona extends StatelessComponent {
  const ComeFunziona({super.key});

  @override
  Component build(BuildContext context) {
    final passi = [
      (
        icone.LayoutDashboard(width: 26.px, height: 26.px),
        'Create il vostro matrimonio',
        'Dal pannello web scegliete la foto, le date e le sezioni da mostrare: luoghi, RSVP, lista nozze e tutto il resto.',
      ),
      (
        icone.Printer(width: 26.px, height: 26.px),
        'Stampate il QR',
        'Ogni invito ha un QR da mettere sulla partecipazione e un link da mandare su WhatsApp. Cerimonia, pranzo o taglio della torta: ognuno vede ciò che lo riguarda.',
      ),
      (
        icone.Smartphone(width: 26.px, height: 26.px),
        'Gli ospiti aprono l\'invito',
        'Inquadrano il QR con la fotocamera, o toccano il link, e il vostro matrimonio si apre nell\'app. Niente da scrivere, nessun account.',
      ),
    ];

    return section(id: 'come-funziona', classes: 'sezione', [
      div(classes: 'contenitore', [
        div(classes: 'intestazione-sezione rivela', [
          span(classes: 'etichetta', [.text('Come funziona')]),
          h2([.text('Dalla partecipazione allo smartphone')]),
          p(classes: 'tenue', [
            .text('Restate fedeli alla carta che avete scelto: un piccolo QR stampato apre tutto il resto.'),
          ]),
        ]),
        ol(classes: 'passi', [
          for (final (n, (icona, titolo, testo)) in passi.indexed)
            li(classes: 'passo rivela', [
              span(classes: 'passo-numero corsivo', [.text('0${n + 1}')]),
              div(classes: 'passo-icona', [icona]),
              h3([.text(titolo)]),
              p(classes: 'tenue', [.text(testo)]),
            ]),
        ]),
        div(classes: 'codice-esempio rivela', [
          span(classes: 'tenue corsivo', [.text('Sulla vostra partecipazione:')]),
          div(classes: 'partecipazione-esempio', [
            span(classes: 'script', [.text('Giulia & Marco')]),
            span(classes: 'etichetta', [.text('12 giugno 2027')]),
            div(classes: 'qr-esempio', [
              icone.QrCode(width: 64.px, height: 64.px, attributes: {'stroke-width': '1.4'}),
            ]),
            span(classes: 'tenue', [.text('Inquadratemi con il telefono')]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.passi', {
      'position': 'relative',
      'display': 'grid',
      'grid-template-columns': 'repeat(3, minmax(0, 1fr))',
      'gap': '28px',
      'margin': '0',
      'padding': '0',
      'list-style': 'none',
    }),
    // filo dorato che unisce i passi
    r('.passi::before', {
      'content': "''",
      'position': 'absolute',
      'top': '74px',
      'left': '16%',
      'right': '16%',
      'height': '1px',
      'background': 'linear-gradient(90deg, rgba(184,149,90,0), ${Colori.oro}, rgba(184,149,90,0))',
    }),
    r('.passo', {
      'position': 'relative',
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'gap': '14px',
      'text-align': 'center',
    }),
    r('.passo-numero', {'font-size': '18px', 'color': Colori.oro}),
    r('.passo-icona', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '76px',
      'height': '76px',
      'border-radius': '50%',
      'background': 'linear-gradient(135deg, ${Colori.primarioChiaro}, #fff)',
      'border': '1px solid rgba(184,149,90,.45)',
      'box-shadow': '0 14px 30px rgba(158,59,77,.12)',
      'color': Colori.primario,
      'transition': 'transform .4s cubic-bezier(.34,1.56,.64,1)',
    }),
    r('.passo:hover .passo-icona', {'transform': 'translateY(-6px) rotate(-6deg)'}),
    r('.passo p', {'max-width': '320px'}),
    r('.codice-esempio', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'gap': '14px',
      'margin-top': '64px',
    }),
    // una partecipazione di carta con il QR
    r('.partecipazione-esempio', {
      'display': 'flex',
      'flex-direction': 'column',
      'align-items': 'center',
      'gap': '6px',
      'width': '240px',
      'padding': '26px 20px 22px',
      'border-radius': '6px',
      'background': '#fff',
      'border': '1px solid ${Colori.bordo}',
      'box-shadow': '0 18px 36px rgba(42,34,36,.1)',
      'transform': 'rotate(-2deg)',
      'transition': 'transform .4s cubic-bezier(.34,1.56,.64,1)',
    }),
    r('.partecipazione-esempio:hover', {'transform': 'rotate(0deg) scale(1.03)'}),
    r('.partecipazione-esempio .script', {'font-size': '30px', 'color': Colori.primario, 'line-height': '1.1'}),
    r('.partecipazione-esempio .etichetta::before', {'display': 'none'}),
    r('.qr-esempio', {
      'margin': '10px 0 4px',
      'padding': '8px',
      'border-radius': '10px',
      'border': '1px solid ${Colori.bordo}',
      'color': Colori.testo,
    }),
    r('.partecipazione-esempio .tenue', {'font-size': '13px'}),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(820)), [
      r('.passi', {'grid-template-columns': 'minmax(0, 1fr)', 'gap': '48px'}),
      r('.passi::before', {'display': 'none'}),
    ]),
  ];
}

/// Cosa trovano gli ospiti nell'app.
class Funzioni extends StatelessComponent {
  const Funzioni({super.key});

  @override
  Component build(BuildContext context) {
    final funzioni = [
      (
        icone.MapPin(width: 22.px, height: 22.px),
        'Partecipazione',
        'Luoghi e orari della giornata, con la navigazione verso la chiesa e il ricevimento a un tocco.',
      ),
      (
        icone.Mail(width: 22.px, height: 22.px),
        'RSVP',
        'Gli ospiti confermano la presenza dall\'app, dicono in quanti saranno e possono cambiare idea.',
      ),
      (
        icone.Gift(width: 22.px, height: 22.px),
        'Un pensiero per noi',
        'Lista nozze, IBAN da copiare con un tocco o il link al vostro sito preferito.',
      ),
      (
        icone.PenLine(width: 22.px, height: 22.px),
        'Messaggio agli sposi',
        'Il libro degli ospiti in tasca: dediche, ricordi e auguri arrivano direttamente a voi.',
      ),
      (
        icone.CirclePlay(width: 22.px, height: 22.px),
        'Video',
        'Raccontate la vostra storia: il video può partire da solo la prima volta che si apre l\'invito.',
      ),
      (
        icone.Images(width: 22.px, height: 22.px),
        'Momenti',
        'Una galleria di foto da sfogliare prima del grande giorno e da riguardare dopo.',
      ),
      (
        icone.Hourglass(width: 22.px, height: 22.px),
        'Conto alla rovescia',
        'Dalla proposta al sì, giorno dopo giorno. E il giorno del matrimonio, una pioggia di coriandoli.',
      ),
      (
        icone.BellRing(width: 22.px, height: 22.px),
        'Notifiche',
        'Gli ospiti che le attivano ricevono le novità sul vostro matrimonio, senza dover chiedere.',
      ),
    ];

    return section(id: 'funzioni', classes: 'sezione funzioni', [
      div(classes: 'contenitore', [
        div(classes: 'intestazione-sezione rivela', [
          span(classes: 'etichetta', [.text('Per gli ospiti')]),
          h2([.text('Ogni dettaglio, nel posto giusto')]),
          p(classes: 'tenue', [.text('Scegliete voi quali sezioni mostrare: gli ospiti vedono solo quelle accese.')]),
        ]),
        div(classes: 'griglia-funzioni', [
          for (final (icona, titolo, testo) in funzioni)
            article(classes: 'funzione rivela', [
              div(classes: 'funzione-icona', [icona]),
              h3([.text(titolo)]),
              p(classes: 'tenue', [.text(testo)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.funzioni', {'background': 'linear-gradient(180deg, ${Colori.sfondo}, #fff 30%, #fff 70%, ${Colori.sfondo})'}),
    r('.griglia-funzioni', {
      'display': 'grid',
      'grid-template-columns': 'repeat(auto-fill, minmax(250px, 1fr))',
      'gap': '20px',
    }),
    r('.funzione', {
      'display': 'flex',
      'flex-direction': 'column',
      'gap': '10px',
      'padding': '28px 24px',
      'border-radius': '24px',
      'background': '#fff',
      'border': '1px solid rgba(231,220,214,.7)',
      'box-shadow': '0 10px 24px rgba(158,59,77,.06)',
      'transition': 'transform .35s cubic-bezier(.22,1,.36,1), box-shadow .35s ease, border-color .35s ease',
    }),
    r('.funzione:hover', {
      'transform': 'translateY(-6px)',
      'border-color': 'rgba(184,149,90,.6)',
      'box-shadow': '0 22px 40px rgba(158,59,77,.12)',
    }),
    r('.funzione p', {'font-size': '15px'}),
    r('.funzione-icona', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '52px',
      'height': '52px',
      'margin-bottom': '6px',
      'border-radius': '50%',
      'background': 'linear-gradient(135deg, ${Colori.primarioChiaro}, ${Colori.sfondo})',
      'border': '1px solid rgba(184,149,90,.4)',
      'color': Colori.primario,
      'transition': 'background .3s ease, color .3s ease',
    }),
    r('.funzione:hover .funzione-icona', {
      'background': 'linear-gradient(135deg, ${Colori.primario}, ${Colori.primarioScuro})',
      'color': '#fff',
    }),
  ];
}

/// Il pannello web per gli sposi.
class PerGliSposi extends StatelessComponent {
  const PerGliSposi({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'sposi', classes: 'sezione', [
      div(classes: 'contenitore sposi-griglia', [
        div(classes: 'sposi-testi rivela', [
          span(classes: 'etichetta', [.text('Per gli sposi')]),
          h2([.text('Un pannello pensato per voi due')]),
          p(classes: 'tenue', [
            .text(
              'Preparate l\'invito dal computer, con calma, e cambiatelo quando volete: '
              'gli ospiti vedono le novità la prossima volta che lo aprono.',
            ),
          ]),
          ul(classes: 'sposi-punti', [
            for (final (icona, testo) in [
              (icone.Eye(width: 18.px, height: 18.px), 'Anteprima dal vivo di come gli ospiti leggeranno ogni testo'),
              (icone.QrCode(width: 18.px, height: 18.px), 'QR e link per cerimonia, pranzo o taglio della torta'),
              (icone.Check(width: 18.px, height: 18.px), 'Sapete chi ha già aperto l\'invito'),
              (icone.Sparkles(width: 18.px, height: 18.px), 'Sezioni da accendere e spegnere con un tocco'),
            ])
              li([
                span(classes: 'sposi-punto-icona', [icona]),
                .text(testo),
              ]),
          ]),
          // le coppie nuove partono dalla registrazione; "Area sposi" in
          // alto resta il login
          a(href: '$linkPannello/registrazione', classes: 'pulsante primario', [
            .text('Create il vostro account'),
            icone.ArrowRight(width: 18.px, height: 18.px),
          ]),
        ]),
        div(
          classes: 'pannello rivela',
          attributes: {'role': 'img', 'aria-label': 'Il pannello degli sposi con la lista degli inviti'},
          [
            div(classes: 'pannello-barra', [
              span([]),
              span([]),
              span([]),
              div(classes: 'pannello-indirizzo', [.text('marryme · Invitati')]),
            ]),
            div(classes: 'pannello-corpo', [
              div(classes: 'pannello-testa', [
                div([
                  strong(classes: 'pannello-titolo', [.text('4 inviti')]),
                  span(classes: 'tenue', [.text('2 già aperti dagli ospiti')]),
                ]),
                span(classes: 'pannello-pulsante', [.text('+ Nuovo invito')]),
              ]),
              for (final (nome, tipo, aperto) in const [
                ('Partecipazioni della cerimonia', 'Cerimonia', true),
                ('Famiglia Rossi', 'Pranzo', true),
                ('Zii di Marco', 'Pranzo', false),
                ('Amici del calcetto', 'Taglio della torta', false),
              ])
                div(classes: 'pannello-riga', [
                  div(classes: 'pannello-bolla', []),
                  div(classes: 'pannello-testi', [
                    span(classes: 'pannello-codice', [.text(nome)]),
                    span(classes: 'tenue', [.text(tipo)]),
                  ]),
                  span(classes: aperto ? 'pannello-stato aperto' : 'pannello-stato', [
                    .text(aperto ? 'Aperto' : 'Non ancora aperto'),
                  ]),
                ]),
            ]),
          ],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get stili => [
    r('.sposi-griglia', {
      'display': 'grid',
      'grid-template-columns': 'minmax(0, .9fr) minmax(0, 1.1fr)',
      'align-items': 'center',
      'gap': '64px',
    }),
    r('.sposi-testi', {'display': 'flex', 'flex-direction': 'column', 'align-items': 'flex-start', 'gap': '20px'}),
    r('.sposi-punti', {
      'display': 'flex',
      'flex-direction': 'column',
      'gap': '14px',
      'margin': '8px 0',
      'padding': '0',
      'list-style': 'none',
    }),
    r('.sposi-punti li', {'display': 'flex', 'align-items': 'center', 'gap': '14px'}),
    r('.sposi-punto-icona', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'center',
      'width': '36px',
      'height': '36px',
      'flex': 'none',
      'border-radius': '50%',
      'background': Colori.primarioChiaro,
      'color': Colori.primario,
    }),

    // finestra del browser con il pannello
    r('.pannello', {
      'border-radius': '20px',
      'overflow': 'hidden',
      'background': Colori.sfondo,
      'border': '1px solid ${Colori.bordo}',
      'box-shadow': '0 40px 80px rgba(42,34,36,.16)',
      'transform': 'perspective(1400px) rotateY(-6deg) rotateX(3deg)',
      'transition': 'transform .6s cubic-bezier(.22,1,.36,1)',
    }),
    r('.pannello:hover', {'transform': 'none'}),
    r('.pannello-barra', {
      'display': 'flex',
      'align-items': 'center',
      'gap': '7px',
      'padding': '12px 16px',
      'background': '#fff',
      'border-bottom': '1px solid ${Colori.bordo}',
    }),
    r('.pannello-barra > span', {
      'width': '11px',
      'height': '11px',
      'border-radius': '50%',
      'background': Colori.bordo,
    }),
    r('.pannello-indirizzo', {
      'flex': '1',
      'margin-left': '12px',
      'padding': '4px 12px',
      'border-radius': '8px',
      'background': Colori.sfondo,
      'font-size': '12px',
      'color': Colori.testoTenue,
    }),
    r('.pannello-corpo', {'display': 'flex', 'flex-direction': 'column', 'gap': '10px', 'padding': '22px'}),
    r('.pannello-testa', {
      'display': 'flex',
      'align-items': 'center',
      'justify-content': 'space-between',
      'gap': '12px',
      'margin-bottom': '6px',
    }),
    r('.pannello-testa > div', {'display': 'flex', 'flex-direction': 'column', 'font-size': '13px'}),
    r('.pannello-titolo', {'font-family': display, 'font-weight': '400', 'font-size': '24px'}),
    r('.pannello-pulsante', {
      'padding': '10px 16px',
      'border-radius': '14px',
      'background': 'linear-gradient(135deg, ${Colori.primario}, ${Colori.primarioScuro})',
      'color': '#fff',
      'font-weight': '700',
      'font-size': '13px',
      'white-space': 'nowrap',
    }),
    r('.pannello-riga', {
      'display': 'flex',
      'align-items': 'center',
      'gap': '12px',
      'padding': '12px 14px',
      'border-radius': '16px',
      'background': '#fff',
      'border': '1px solid rgba(231,220,214,.7)',
    }),
    r('.pannello-bolla', {
      'width': '34px',
      'height': '34px',
      'flex': 'none',
      'border-radius': '50%',
      'background': 'linear-gradient(135deg, ${Colori.primarioChiaro}, ${Colori.sfondo})',
      'border': '1px solid rgba(184,149,90,.4)',
    }),
    r('.pannello-testi', {
      'display': 'flex',
      'flex-direction': 'column',
      'flex': '1',
      'line-height': '1.3',
      'font-size': '13px',
    }),
    r('.pannello-codice', {'font-family': display, 'font-weight': '600', 'font-size': '15px'}),
    r('.pannello-stato', {
      'padding': '3px 10px',
      'border-radius': '20px',
      'background': Colori.sfondo,
      'color': Colori.testoTenue,
      'font-size': '12px',
      'white-space': 'nowrap',
    }),
    r('.pannello-stato.aperto', {'background': '#F3EBDD', 'color': '#7A5F2E'}),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(960)), [
      r('.sposi-griglia', {'grid-template-columns': 'minmax(0, 1fr)', 'gap': '48px'}),
      r('.pannello', {'transform': 'none'}),
    ]),
    css.media(const MediaQuery.screen(maxWidth: Unit.pixels(480)), [
      r('.pannello-stato', {'display': 'none'}),
    ]),
  ];
}
