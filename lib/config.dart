/// Link esterni della pagina, da indicare in build con --dart-define:
///
/// ```sh
/// jaspr build --dart-define=APP_STORE_URL=https://apps.apple.com/... \
///   --dart-define=PLAY_STORE_URL=https://play.google.com/... \
///   --dart-define=PANNELLO_URL=https://app.marryme.example
/// ```
///
/// Se manca il link di uno store il suo pulsante mostra "Presto disponibile".
const linkAppStore = String.fromEnvironment('APP_STORE_URL');
const linkPlayStore = String.fromEnvironment('PLAY_STORE_URL');

/// Il pannello degli sposi (progetto marryme_web), sul suo sottodominio.
/// Segnaposto finché non c'è il dominio vero.
const linkPannello = _pannello == '' ? 'https://app.marryme.example' : _pannello;
const _pannello = String.fromEnvironment('PANNELLO_URL');
