# MarryMe – landing page

La pagina di presentazione di MarryMe, scritta in [Jaspr](https://jaspr.site)
in modalità **static**: in build viene generato un `index.html` già completo,
con gli stili dentro e senza JavaScript.

## Avvio in locale

```sh
dart pub get
jaspr serve --port 8082   # http://localhost:8082
```

## Build

```sh
jaspr build \
  --dart-define=APP_STORE_URL=https://apps.apple.com/... \
  --dart-define=PLAY_STORE_URL=https://play.google.com/... \
  --dart-define=PANNELLO_URL=https://pannello.esempio.it
```

Il risultato è in `build/jaspr/` e si pubblica su qualsiasi hosting statico.

I link sono facoltativi: senza quelli degli store i pulsanti mostrano
"Presto disponibile", senza quello del pannello il pulsante "Area sposi" non
compare (al suo posto c'è "Scarica l'app").

## Pagina degli inviti

`/i/<codice>` è la pagina che si apre quando un ospite inquadra il QR o tocca
il link senza avere l'app: spiega come scaricarla e ha il pulsante che apre
l'invito (`marryme://invito/<codice>`). La build genera `i/index.html`:
l'hosting deve servirla per ogni indirizzo `/i/…`.

È l'unica parte con JavaScript (il pulsante legge il codice dall'indirizzo).
Non è indicizzata dai motori di ricerca.

## Struttura

| File                         | Contenuto                                                     |
| ---------------------------- | ------------------------------------------------------------- |
| `lib/main.server.dart`       | Documento: titolo, descrizione, anteprima social, font        |
| `lib/app.dart`               | L'ordine delle sezioni                                        |
| `lib/sezioni/testata.dart`   | Barra, apertura e il telefono con la schermata dell'app       |
| `lib/sezioni/contenuti.dart` | Come funziona, funzioni per gli ospiti, pannello per gli sposi |
| `lib/sezioni/chiusura.dart`  | Domande frequenti, invito a scaricare l'app e piè di pagina   |
| `lib/tema.dart`              | Colori, caratteri e animazioni, gli stessi dell'app           |
| `lib/config.dart`            | Link agli store e al pannello                                 |

Il telefono, la notifica e la finestra del pannello sono disegnati in HTML e
CSS: si aggiornano insieme al codice, senza screenshot da rifare.
