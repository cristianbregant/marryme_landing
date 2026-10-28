/// Link esterni della pagina, da indicare in build con --dart-define:
///
/// ```sh
/// jaspr build --dart-define=APP_STORE_URL=https://apps.apple.com/... \
///   --dart-define=PLAY_STORE_URL=https://play.google.com/... \
///   --dart-define=PANNELLO_URL=https://pannello.esempio.it
/// ```
///
/// Se un link manca, il pulsante relativo mostra "Presto disponibile" (store)
/// o non compare (pannello).
const linkAppStore = String.fromEnvironment('APP_STORE_URL');
const linkPlayStore = String.fromEnvironment('PLAY_STORE_URL');
const linkPannello = String.fromEnvironment('PANNELLO_URL');
