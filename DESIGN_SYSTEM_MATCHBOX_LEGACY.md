# Design system extraído de matchbox/stage

Para usar en el keynote.html de la charla *"Esto es lo que haría si tuviera que hacer una empresa de nuevo en la era de la IA"*.

---

## Tokens (CSS variables)

Los archivos de stage usan estas variables del tema global de matchbox. Las necesito definir explícitamente en el keynote.html porque es self-contained:

```css
:root {
  --pp-bg:           #0a0908;   /* fondo base */
  --pp-text:         #f5f3ef;   /* títulos */
  --pp-body:         #d8d4cc;   /* cuerpo */
  --pp-dim:          #8a857c;   /* meta/dim */
  --pp-ice:          #b8b3a8;   /* labels/eyebrows */
  --pp-lime:         #c8e84d;   /* acento principal */
  --pp-card:         #14120f;
  --pp-card-inner:   #1a1815;
  --pp-border:       #2a2622;
  --pp-border-hover: #3a342d;
}
```
> Nota: los hex son inferidos del patrón visual. Confirmar contra el tema real si los tienes a mano.

---

## Tipografía

| Uso | Familia | Peso | Tamaño | Tracking | Line-height |
|---|---|---|---|---|---|
| Display / títulos | `'Instrument Serif', Georgia, serif` | 400 | `clamp(42px, 6vw, 84px)` | `-0.025em` | 1.02 |
| Subtítulos | `'Instrument Serif', ...` | 400 | `clamp(28px, 3.5vw, 40px)` | `-0.015em` | 1.15 |
| Body | `'DM Sans', system-ui, sans-serif` | 400 | 18px | normal | 1.65 |
| Subtítulo grande | DM Sans | 400 | `clamp(18px, 2.2vw, 24px)` | normal | 1.4 |
| Eyebrow / label | DM Sans | 500-600 | 11-13px | `2px` UPPERCASE | normal |
| Speaker name | Instrument Serif | 400 | 28px | `-0.01em` | 1.1 |

**Move de marca consistente:** palabras clave en *itálica* y color `--pp-lime` dentro de titulares serif. Ejemplo del repo: `dinero` se renderiza como `<em>dinero</em>`. Para esta charla, candidatos a italizar: *cero*, *IA*, *bottleneck*, *empresa*.

---

## Patrones estructurales

### Eyebrow prefix
Todas las secciones llevan `// Nombre de sección` como label. Es el ritmo del sitio.

```
// Presentación
// Contexto
// Oradores
```

Para esta charla aplicaría: `// Speedrun`, `// Paso 03`, `// Cierre`, etc.

### Hero pattern
```
[eyebrow tag · lime · uppercase tracking 2px]
[título serif grande con un <em> en lime]
[subtítulo DM Sans 18-24px]
[meta row con separadores · puntos · DM Sans 13px uppercase]
```

### Card pattern (stage-card)
- Borde sutil `--pp-border`
- **Barra lime de 4px en el lado izquierdo**, que crece de 60px → 140px en hover
- Padding generoso (40px 36px)
- CTA con flecha que se mueve 4px en X al hover
- Border-radius 16px

---

## Animaciones / motion

Todas las transiciones siguen este lenguaje:

| Elemento | Duración | Easing |
|---|---|---|
| Hovers de color/bg | 180–240ms | ease |
| Transformaciones (translate/scale) | 180ms | ease |
| Crecimiento de barra lime | 240ms | ease |
| Focus rings | inmediato | — |

Patrones recurrentes:
- **Arrow CTA:** `transform: translateX(4px)` al hover del padre.
- **Botón lime:** `translateY(-1px)` + cambio de bg a `#D7F268` al hover.
- **Barra lime izquierda:** crece verticalmente (60px → 140px desktop, 40px → 80px mobile).
- **Focus visible:** outline 2px solid lime con offset 4px (3px en botones).

No hay framer-motion ni reveal-on-scroll en estos archivos — la sensación de "vivo" viene de **micro-interacciones disciplinadas**, no de animaciones grandes. Para el keynote.html podríamos sumar:
- **Page transitions** (slide horizontal, 320-400ms)
- **Reveal de bullets** progresivo (cada bullet entra con `opacity 0 → 1` + `translateY(8px → 0)` en 180ms, stagger 80ms)
- **Barra de progreso** en lime arriba/abajo, va llenándose conforme avanzas las 15 slides

---

## Format del deck (keynote.html)

Convención de ruta: `public/stage/<slug>/keynote.html`. El detail page lo embebe en iframe 16:9 y también permite "Abrir en pantalla completa".

Pista que da el `[slug]/page.jsx`:
> "Usa las flechas del teclado o haz clic en los lados para navegar. Presiona ? para ver los controles."

Esto sugiere fuertemente **Reveal.js** o un slide engine equivalente (las flechas + el `?` para help). Es self-contained (un solo archivo HTML), responsive, navegable con teclado, presentable en pantalla completa.

---

## Schema de datos (talks.js — inferido)

A partir de cómo se consume en `[slug]/page.jsx`, una entrada en `talks.js` luce así:

```js
{
  slug: 'empresa-de-nuevo-era-ia',
  title: 'Esto es lo que haría si tuviera que hacer una empresa de nuevo en la era de la IA',
  subtitle: 'Speedrun de 15 cuellos de botella para arrancar en MX, desde cero.',
  shortAbstract: '...',                      // para meta/OG, 1 párrafo
  longAbstract: ['...', '...'],              // array de párrafos para la sección "Sobre esta charla"
  dateLabel: '12 de mayo de 2026',
  dateShort: '12.05.26',
  date: '2026-05-12',                         // ISO para schema.org
  duration: '15 minutos',
  durationShort: '15 min',
  event: '[Nombre del evento]',
  location: 'Ciudad de México',
  language: 'es-MX',
  tags: ['emprendimiento', 'IA', 'México', 'startup'],
  speakers: [
    {
      name: 'Osvaldo [Apellido]',
      role: 'Founder, Creators Crate',
      initials: 'OF',
      bio: '...',
    },
  ],
}
```

---

## Lo que necesito para construir el keynote.html

1. **¿Existe ya algún `public/stage/<slug>/keynote.html`** que pueda revisar para mantener consistencia exacta? Si sí, montame la carpeta `public/stage` o pásame un ejemplo. Eso me dice qué engine usaste (Reveal.js u otro) y qué clases/estructura espera.
2. **Slug, event, location, fecha real** para meter en talks.js.
3. **¿La italización en lime aplica a qué palabra?** Mi propuesta: *cero* en el título.
