# Q&A live · Setup

Tres archivos forman el sistema:

- `qa-config.js` — credenciales + identidad de la charla
- `qa-setup.sql` — schema de Supabase (tablas, RLS, función de upvote)
- `qa.html` — página pública para la audiencia (manda preguntas)
- `keynote.html` — el deck del speaker (recibe popups y muestra el QR)

## 1. Crear el proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com) → **New project**.
2. Nombre cualquiera, región más cercana (us-east-1 desde MX está bien).
3. Espera ~2 min mientras se aprovisiona.

## 2. Correr el schema

1. En Supabase: **SQL Editor → New query**.
2. Pega todo el contenido de [`qa-setup.sql`](./qa-setup.sql).
3. **Run**.

Crea tres cosas:

- Tabla `qa_sessions` (qué slide se está mostrando)
- Tabla `qa_questions` (las preguntas con upvotes)
- Función `increment_upvote(uuid)` (atomic counter, security definer)
- Policies de RLS: anon read/insert questions, anon update session
- Habilita Realtime en ambas tablas
- Semilla un row para esta charla

## 3. Conectar las credenciales

1. En Supabase: **Project Settings → API**.
2. Copia:
   - **Project URL** (ej. `https://abc123xyz.supabase.co`)
   - **Project API keys → anon / public** (el JWT largo que empieza con `eyJ...`)
3. Edita [`qa-config.js`](./qa-config.js):

```js
window.QA_CONFIG = {
  SUPABASE_URL: 'https://abc123xyz.supabase.co',
  SUPABASE_ANON_KEY: 'eyJh...',
  TALK_SLUG: 'speedrun-empresa-era-ia',
  TALK_TITLE: 'Speedrun · Empresa en la era de IA',
  TALK_EVENT: 'Playas on Tech · 14·05·2026',
  TOTAL_SLIDES: 34,
  QA_URL: 'https://overw0rked.github.io/stage/speedrun-empresa-era-ia/qa.html'
};
```

4. Commit + push. Espera ~1 min al deploy de GH Actions.

## 4. Probar

1. Abre `https://overw0rked.github.io/stage/speedrun-empresa-era-ia/keynote.html`.
2. Esquina superior derecha debe mostrar la píldora **Q&A · 0** con punto rojo (significa: conectado y escuchando).
3. En tu celular, escanea el QR (presiona `Q` en el deck) o abre directo `/qa.html`.
4. Manda una pregunta. Debería aparecer **al instante** como popup al fondo del deck.
5. Avanza un slide. En tu teléfono, el indicador "Slide" debe cambiar.

## 5. Atajos de teclado en el deck

- `→` / `Space` — siguiente slide
- `←` — slide anterior
- `Home` / `End` — primer / último
- `F` — toggle fullscreen
- `Q` — mostrar / ocultar el QR
- `Esc` — cierra QR (si está abierto)

## Costo

- Supabase free tier: hasta 500 MB de DB, 2 GB de bandwidth, 200 conexiones concurrentes realtime.
- Para una charla de 50-100 personas: gratis con margen amplio.

## Seguridad (modo "una sola charla")

- La RLS permite a cualquiera **leer** preguntas, **insertar** preguntas, y **actualizar** la sesión.
- El último punto significa que técnicamente alguien en la audiencia podría spoofear el `current_slide`. Para una charla de 15 min el costo es mínimo.
- Para algo más serio (charla grabada en vivo, multi-evento, repetido): cambia la policy de update a `auth.uid() = speaker_id` y conectarte tú como usuario autenticado.

## Después de la charla

- Las preguntas quedan en la DB. Puedes exportarlas para reusar en blog/twitter.
- `select text, upvotes, slide_num from qa_questions where session_slug = 'speedrun-empresa-era-ia' order by upvotes desc;`
- Si quieres reiniciar la sesión: `delete from qa_questions where session_slug = 'speedrun-empresa-era-ia';`
