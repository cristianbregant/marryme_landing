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

## Pubblicazione su Firebase Hosting

La GitHub Action `.github/workflows/deploy.yml` fa la build statica e la
pubblica sul progetto Firebase `matrimonio-6f724`:

- a ogni push su `main` aggiorna il sito pubblico;
- a ogni pull request pubblica un'anteprima temporanea (7 giorni) e ne
  scrive il link nella pull request;
- si può lanciare a mano da *Actions → Deploy su Firebase Hosting → Run workflow*.

`firebase.json` pubblica solo la build (non le cartelle di servizio di Jaspr)
e serve `i/index.html` per ogni indirizzo `/i/<codice>`.

La landing va sul sito principale del progetto (il dominio, es.
`marryme.example`); il pannello degli sposi (`marryme_web`) ha il suo sito,
sul sottodominio `app.` (es. `app.marryme.example`), e si pubblica dal suo
repository. I pulsanti "Area sposi" della landing portano lì.

I link si impostano con le variabili del repository (*Settings → Secrets and
variables → Actions → Variables*), tutte facoltative:

| Variabile        | Default                         |
| ---------------- | ------------------------------- |
| `PANNELLO_URL`   | `https://app.marryme.example`   |
| `APP_STORE_URL`  | nessuno: "Presto disponibile"   |
| `PLAY_STORE_URL` | nessuno: "Presto disponibile"   |

### Configurazione, una volta sola

1. Console Firebase → *Hosting* → *Inizia*, per attivare l'hosting sul
   progetto.
2. Console Google Cloud del progetto → *IAM e amministrazione* → *Account di
   servizio* → crea un account con i ruoli **Amministratore Firebase
   Hosting**, **Visualizzatore chiavi API**, **Utente account di servizio** e
   **Consumatore di Service Usage** (senza quest'ultimo il deploy fallisce
   con 403 su `serviceusage.services.get`), e generane una chiave JSON.
3. Su GitHub, nel repository → *Settings → Secrets and variables → Actions*
   → *New repository secret*: nome `FIREBASE_SERVICE_ACCOUNT`, valore il
   contenuto del file JSON. Poi il file si può cancellare.

In alternativa, con la Firebase CLI (`firebase init hosting:github`) i passi
2 e 3 si fanno in automatico: in quel caso il segreto si chiama
`FIREBASE_SERVICE_ACCOUNT_MATRIMONIO_6F724` e va aggiornato nel workflow.

Per un dominio vostro: *Hosting → Aggiungi dominio personalizzato*.
