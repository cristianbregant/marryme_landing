import 'package:jaspr/dom.dart';

/// Colori e caratteri dell'app MarryMe.
class Colori {
  static const primario = '#9E3B4D'; // rosa antico
  static const primarioScuro = '#7A2A3A';
  static const primarioChiaro = '#F6E3E6';
  static const oro = '#B8955A';
  static const sfondo = '#FBF7F3'; // avorio
  static const superficie = '#FFFFFF';
  static const testo = '#2A2224';
  static const testoTenue = '#7A6C6F';
  static const bordo = '#E7DCD6';
}

const display = "'Playfair Display', Georgia, serif";
const corpo = "'Lato', system-ui, sans-serif";
const script = "'Great Vibes', cursive";

StyleRule r(String selettore, Map<String, String> stili) => css(selettore).styles(raw: stili);

/// Stili condivisi da tutte le sezioni della pagina.
List<StyleRule> get stiliGlobali => [
  r('*, *::before, *::after', {'box-sizing': 'border-box'}),
  r('html', {'scroll-behavior': 'smooth', 'scroll-padding-top': '80px'}),
  r('html, body', {
    'margin': '0',
    'background': Colori.sfondo,
    'color': Colori.testo,
    'font-family': corpo,
    'font-size': '17px',
    'line-height': '1.6',
    '-webkit-font-smoothing': 'antialiased',
    'overflow-x': 'hidden',
  }),
  r('h1, h2, h3', {'font-family': display, 'font-weight': '400', 'margin': '0', 'line-height': '1.15'}),
  r('h2', {'font-size': 'clamp(32px, 4.5vw, 48px)'}),
  r('h3', {'font-size': '21px', 'font-weight': '600'}),
  r('p', {'margin': '0'}),
  r('a', {'color': 'inherit'}),
  r('img', {'max-width': '100%', 'display': 'block'}),
  r('::selection', {'background': Colori.primarioChiaro}),
  r(':focus-visible', {'outline': '2px solid ${Colori.primario}', 'outline-offset': '3px'}),

  // contenitore che non crea un riquadro (al posto dei frammenti)
  r('.pila', {'display': 'contents'}),
  r('.script', {'font-family': script, 'font-weight': '400'}),
  r('.corsivo', {'font-family': display, 'font-style': 'italic'}),
  r('.tenue', {'color': Colori.testoTenue}),
  r('.etichetta', {
    'display': 'inline-flex',
    'align-items': 'center',
    'gap': '10px',
    'font-size': '12px',
    'font-weight': '700',
    'letter-spacing': '2px',
    'text-transform': 'uppercase',
    'color': Colori.oro,
  }),
  r('.etichetta::before', {'content': "''", 'width': '28px', 'height': '1px', 'background': Colori.oro}),
  r('.contenitore', {'width': 'min(1160px, 100% - 48px)', 'margin': '0 auto'}),
  r('.sezione', {'padding': '120px 0'}),
  r('.intestazione-sezione', {
    'display': 'flex',
    'flex-direction': 'column',
    'align-items': 'center',
    'gap': '14px',
    'max-width': '680px',
    'margin': '0 auto 64px',
    'text-align': 'center',
  }),
  r('.intestazione-sezione p', {'font-size': '19px'}),

  // pulsanti
  r('.pulsante', {
    'display': 'inline-flex',
    'align-items': 'center',
    'justify-content': 'center',
    'gap': '10px',
    'height': '56px',
    'padding': '0 28px',
    'border-radius': '18px',
    'font-weight': '700',
    'font-size': '16px',
    'letter-spacing': '.3px',
    'text-decoration': 'none',
    'white-space': 'nowrap',
    'transition': 'transform .2s ease, box-shadow .25s ease, background .2s ease, border-color .2s ease',
  }),
  r('.pulsante:active', {'transform': 'scale(.97)'}),
  r('.pulsante svg', {'transition': 'transform .25s ease'}),
  r('.pulsante:hover svg:last-child', {'transform': 'translateX(3px)'}),
  r('.pulsante.primario', {
    'color': '#fff',
    'background': 'linear-gradient(135deg, ${Colori.primario}, ${Colori.primarioScuro})',
    'box-shadow': '0 12px 26px rgba(158,59,77,.32)',
  }),
  r('.pulsante.primario:hover', {'box-shadow': '0 18px 34px rgba(158,59,77,.4)', 'transform': 'translateY(-2px)'}),
  r('.pulsante.secondario', {
    'color': Colori.primario,
    'background': 'rgba(255,255,255,.7)',
    'border': '1px solid ${Colori.bordo}',
  }),
  r('.pulsante.secondario:hover', {'border-color': Colori.oro, 'background': '#fff'}),

  // ornamento linea – cuore – linea
  r('.ornamento', {'display': 'inline-flex', 'align-items': 'center', 'gap': '12px', 'color': Colori.oro}),
  r('.ornamento::before, .ornamento::after', {
    'content': "''",
    'width': '48px',
    'height': '1px',
    'background': Colori.oro,
  }),

  // animazioni
  css.keyframes('entra', {
    'from': const Styles(raw: {'opacity': '0', 'transform': 'translateY(24px)'}),
    'to': const Styles(raw: {'opacity': '1', 'transform': 'none'}),
  }),
  css.keyframes('fluttua', {
    '0%, 100%': const Styles(raw: {'transform': 'translateY(0)'}),
    '50%': const Styles(raw: {'transform': 'translateY(-12px)'}),
  }),
  css.keyframes('batte', {
    '0%, 100%': const Styles(raw: {'transform': 'scale(1)'}),
    '15%': const Styles(raw: {'transform': 'scale(1.18)'}),
    '30%': const Styles(raw: {'transform': 'scale(1)'}),
    '45%': const Styles(raw: {'transform': 'scale(1.12)'}),
  }),
  css.keyframes('riempie', {
    'from': const Styles(raw: {'transform': 'scaleX(0)'}),
    'to': const Styles(raw: {'transform': 'scaleX(1)'}),
  }),
  r('.entra', {'animation': 'entra .9s cubic-bezier(.22,1,.36,1) both'}),

  // i blocchi compaiono mentre si scorre, dove il browser lo supporta
  css.supports('(animation-timeline: view())', [
    r('.rivela', {
      'animation': 'entra linear both',
      'animation-timeline': 'view()',
      'animation-range': 'entry 0% entry 40%',
    }),
  ]),

  css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
    r('*, *::before, *::after', {
      'animation': 'none !important',
      'transition-duration': '1ms !important',
    }),
    r('html', {'scroll-behavior': 'auto'}),
  ]),
  css.media(const MediaQuery.screen(maxWidth: Unit.pixels(720)), [
    r('html, body', {'font-size': '16px'}),
    r('.sezione', {'padding': '80px 0'}),
    r('.contenitore', {'width': 'min(1160px, 100% - 32px)'}),
    r('.intestazione-sezione', {'margin-bottom': '44px'}),
  ]),
];
