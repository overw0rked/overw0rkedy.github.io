# Esto es lo que haría si tuviera que hacer una empresa de nuevo en la era de la IA

**Speedrun: 15 cuellos de botella en 15 minutos.**
Audiencia: técnicos/devs emprendiendo en MX.
Hilo conductor: cada vez que desbloqueas un nivel, te das cuenta del siguiente cuello de botella. El progreso constante es la verdadera moneda de la motivación — por eso este orden importa.

---

## Apertura (~30s)

> "Si tuviera que arrancar de cero hoy, no construiría primero. Validaría, fiscalizaría y haría queryable mi empresa desde el día uno. La IA no cambia el *qué* — los 15 pasos siguen siendo 15. Cambia el *cuándo* puedes saltar al siguiente."

Tesis: **cada paso resuelve un cuello de botella y crea el siguiente.** Si vas a recordar una sola cosa: el progreso te motiva más de lo que crees, por eso el orden importa.

---

## 1. Cronología / sumario (~45s)

**El qué:** un mapa de los 15 pasos. No es lineal estricto, pero sí hay dependencias.
**El cuello de botella que resuelve:** no saber dónde estás parado.
**Mensaje:** "Vas a sentir que todo importa al mismo tiempo. No. Hay un orden."

Visual sugerido: timeline con los 15 nodos, los próximos 14 en gris claro.

---

## 2. Prep work — Queryable company (~60s)

**Tesis opinionada:** *Tu empresa debe ser queryable por un LLM desde el día cero.*

Antes de tener empresa, ten:
- Un Notion (o Obsidian) con: decisiones, métricas, contactos, contratos, contraseñas (en 1Password aparte).
- Un Drive con estructura: `/01-legal /02-finanzas /03-clientes /04-equipo /05-producto`.
- Un **decisions log** con fecha y razón.

**Por qué importa ahora (era IA):** dentro de 6 meses, vas a pegarle todo esto a Claude/ChatGPT y pedirle análisis. Si tu info está dispersa en 14 lugares, no sirve. Si está estructurada, te ahorras un consultor cada mes.

**Cuello de botella desbloqueado:** velocidad sin perder contexto.

---

## 3. Validación como meta inicial — *nail it then scale it* (~60s)

**Tesis opinionada:** *No abras nada legal antes de cobrar tu primer peso.*

- 10 conversaciones de 15 min con clientes potenciales antes de escribir una línea de código.
- "¿Me lo pagarías hoy?" > "¿Te parece interesante?"
- Cobra antes de construir. Carta de intención, anticipo, prepago — algo.

**Era IA:** puedes prototipar con v0/Lovable/Claude en horas. **Eso no es validación, es un demo bonito.** Validación = dinero o compromiso firmado.

**Cuello de botella desbloqueado:** dirección clara, dejas de adivinar.

---

## 4. Finanzas pragmáticas — *la cuenta de tu negocio no es tu cuenta personal* (~60s)

**Regla #1 — desde el día 1:** cuenta bancaria separada. Sin excepciones. Aunque seas persona física con actividad empresarial.

Balance sheet básico (en una hoja):
- Ingresos del mes
- Gastos fijos / variables
- Cash en banco
- Runway en meses (cash / burn)

**Opinionado MX:** abre en Mercado Pago Empresas, Konfío, o BBVA para PFAE. Evita esperar a tener "una empresa de verdad" — mezclar cuentas es el error #1 que te va a costar el doble en contabilidad después.

**Era IA:** Claude/GPT categorizan tu estado de cuenta en segundos. Pégale el PDF, pídele un P&L.

**Cuello de botella desbloqueado:** visibilidad financiera real.

---

## 5. Fiscalización — Alegra / Facturapi / Gigstack (~60s)

**En México: si no facturas, no existes.**

Stack opinionado:
- **Alegra** — contabilidad y emisión manual. Empieza aquí.
- **Facturapi** — emisión por API (cuando ya tienes producto digital o e-commerce).
- **Gigstack** — automatización de cumplimiento SAT, retenciones, complementos de pago.

**Contadora externa desde el principio.** No la dejes para después. Cuesta menos prevenir que regularizar.

**Era IA:** integrar Facturapi con un webhook + Claude para conciliación automática es trivial hoy. Hace 3 años, una semana de trabajo.

**Cuello de botella desbloqueado:** puedes cobrar formalmente y dormir tranquilo con el SAT.

---

## 6. Naming, branding y marcas (~60s)

**Tesis opinionada:** registra la marca en IMPI **antes** de invertir un peso en branding visible.

Proceso speedrun:
1. Genera 50 nombres con Claude (criterios: pronunciable, .com disponible, sin colisiones obvias).
2. Verifica en batch: dominio + IG + búsqueda IMPI (MARCANET).
3. Registra en clase relevante (~$3,000 MXN por clase, ~6 meses de proceso).

**Era IA:** lo que antes era una semana de research, hoy es una tarde. Branding visual (logos, identidad) con herramientas tipo Midjourney + un diseñador para refinar.

**No esperes a "ser grande" para registrar.** El que llega primero al IMPI gana.

**Cuello de botella desbloqueado:** defensibilidad de la marca.

---

## 7. Cotizaciones, CRM y seguimiento al cliente (~60s)

**En B2B: el follow-up es el producto.**

Stack mínimo:
- **HubSpot free** o **Folk** o **Pipedrive** — pick one, no inventes.
- Plantilla de cotización (PDF + link de pago).
- Workflow de seguimiento: día 1, día 3, día 7, día 14.

**Era IA:** agentes de seguimiento automático ya son realidad — Kapso, Lindy, o lo que armes con Claude + scheduled tasks. **Pero la primera versión debe ser manual.** Si no entiendes el proceso, no lo automatizas.

**Cuello de botella desbloqueado:** pipeline visible, cero leads perdidos en el limbo.

---

## 8. El agujero negro de Meta — WhatsApp / Kapso (~60s)

**Realidad MX:** tus clientes están en WhatsApp. No en email. No en LinkedIn. **WhatsApp.**

WhatsApp Business API es Meta — burocracia, BSPs, plantillas aprobadas. **Kapso** te ahorra la pesadilla operativa.

**Tesis opinionada:** invierte en automatización de WhatsApp temprano. Es el canal donde la IA paga ROI más rápido en MX.

**Era IA:** agente de WhatsApp con context awareness (conoce al cliente, historial, productos) — esto era ciencia ficción hace 2 años. Hoy lo arma un dev junior en una semana.

**Cuello de botella desbloqueado:** comunicación con clientes que escala sin contratar.

---

## 9. Breakeven (~45s)

**Pregunta brutal:** ¿cuántas unidades/clientes necesitas al mes para cubrir tus costos fijos?

Es un *número*, no una sensación.

Fórmula: `Costos fijos / (Precio - Costo variable unitario) = Unidades para breakeven`

**Era IA:** simulaciones de sensibilidad de precio con Claude en 2 minutos. "¿Qué pasa si subo precio 15% pero pierdo 20% de clientes?" — antes era un análisis de un día.

**Cuello de botella desbloqueado:** claridad del objetivo mensual.

---

## 10. Aliados / socios — NDAs, JDs, estatutos (~75s)

**Tres documentos que escribes antes de meter a alguien:**

1. **NDA** — antes de mostrar info sensible a cualquiera.
2. **Job Description** clara — qué hace, qué no, métricas de éxito.
3. **Estatutos / acuerdo de socios** — si metes socio: **vesting (4 años, cliff de 1)**, no 50/50 sin tie-breaker, cláusulas de salida.

**Regla de oro:** *socio sin vesting = socio que cobrará por no trabajar dentro de 2 años.* Pasa siempre.

**Era IA:** Claude redacta NDAs y JDs decentes en minutos. **Pero estatutos pásalos por abogado** — la diferencia entre un buen y mal estatuto se ve cuando vendes o cuando peleas.

**Cuello de botella desbloqueado:** poder delegar sin paranoia.

---

## 11. Comunicación interna (~45s)

Stack mínimo:
- **Slack** o **Discord** — síncrono ligero.
- **Notion** — fuente de verdad escrita.
- **Loom** — cultura de video async.

**Async first.** Las juntas son el último recurso, no el primero.

**Era IA:** transcripciones y resúmenes automáticos (Granola, Fireflies, Claude). Tu meeting de 1 hora se vuelve un memo de 200 palabras en Notion.

**Cuello de botella desbloqueado:** escalabilidad del equipo sin caos.

---

## 12. Constitución — PFAE, SAS, SAPI, SA (~75s)

**Tesis opinionada para MX:** *no constituyas antes de tiempo.*

El camino real para la mayoría de devs/founders técnicos en MX:

1. **PFAE (Persona Física con Actividad Empresarial)** — **arranca aquí.** Cero costo de constitución, facturas desde el día 1, deduces gastos. Sirve para validar (paso 3) y cobrar tus primeros clientes sin meterte en notarías. Tope práctico: hasta ~4 MDP/año antes de que la carga fiscal te empiece a doler vs. una moral.
2. **SAS** — opción intermedia: barata (~$5k MXN), online en gob.mx, hasta 5 MDP de ingresos. Útil si quieres separar patrimonio rápido pero **aún no levantas inversión**.
3. **SAPI de CV** — el estándar startup MX. Aquí es cuando metes socios con vesting, inversionistas, cláusulas (drag-along, tag-along, ROFR). **Migra aquí cuando vas a levantar ronda o meter equity al equipo.**
4. **SA de CV** — clásica, menos flexible para startups. Pásala salvo que tu caso lo pida.

**Camino más común que veo funcionar:** **PFAE → SAPI directo**, brincándote SAS. La SAS suena bonita pero migrarla a SAPI es casi rehacerla. Si ya sabes que vas a levantar capital, ahórrate el paso intermedio.

**Cuándo brincar de PFAE a moral:**
- Vas a meter socio con equity (PFAE no aguanta socios).
- Necesitas separar patrimonio personal del negocio (responsabilidad ilimitada en PFAE).
- Vas a levantar inversión (nadie invierte en una persona física).
- Tu carga fiscal como PFAE > el costo anual de operar una moral.

**Migración:** planea 2–3 meses. No es trivial — transferencia de contratos, clientes, marca, facturación.

**Era IA:** estatutos modernos con cláusulas avanzadas — Claude te genera el borrador, abogado lo afina. Lo que costaba $40k de honorarios hoy es $10k.

**Cuello de botella desbloqueado:** estructura formal lista para crecer y recibir capital.

---

## 13. Crédito — Jeeves, Kapital, Clara (~60s)

**Día 1 con la empresa formal:** tarjeta corporativa.

- **Clara** — la opción default para SaaS/digital, sin garantía personal si calificas.
- **Jeeves** — cuando gastas en USD (servicios cloud, herramientas).
- **Kapital** — alternativa con mejor línea para algunos perfiles.

**Por qué importa:** construir historial crediticio empresarial **toma años.** Empieza ya, aunque no necesites el crédito. Cuando lo necesites, ya es tarde.

**Era IA:** estas plataformas ya conciliaban automático antes; ahora categorizan gastos por proyecto/cliente con IA. Tu contadora va a llorar de felicidad.

**Cuello de botella desbloqueado:** working capital y cashflow flexible.

---

## 14. Asambleas ordinarias (~45s)

**Requisito legal en MX:** una asamblea ordinaria al año (mínimo). Resultados, estados financieros, ratificación de admin.

Necesitas:
- Acta de asamblea
- Libro de actas
- Libro de accionistas (actualizado)

**Realidad:** el 70% de las SAS/SAPIs que conozco están en falta aquí. Es un riesgo silencioso que explota cuando llega un inversionista pidiendo due diligence.

**Era IA:** Claude redacta el acta a partir de tus notas de junta en 5 minutos. Imprime, firma, archiva. No hay excusa.

**Cuello de botella desbloqueado:** gobernanza formal — la empresa es *legible* para inversionistas, bancos, compradores.

---

## 15. Primeros pasos de contrataciones — IMSS, LFT (~75s)

**Antes de la primera contratación:**

1. **Alta patronal en IMSS** — sin esto, no puedes dar de alta empleados.
2. **RFC con obligaciones de empleador** (lo activa tu contadora).
3. **Contrato individual de trabajo por escrito** — siempre. No le creas a quien diga "yo le hago como sea."
4. **Decide:** ¿nómina interna o outsourcing?

**Opinionado:** outsourcing de nómina desde el día 1. **Worky, Runa o Nominapp.** Te ahorran el infierno de IDSE, SUA, retenciones, prima vacacional, aguinaldo.

**Trampa común:** contratar "por honorarios" gente que en realidad es empleado. El SAT y el IMSS lo detectan. Multa fuerte. Si la persona te reporta full-time, va por LFT.

**Era IA:** estos sistemas ya integran cumplimiento automático. Lo que era un PhD en nómina hoy es un wizard de 5 pasos.

**Cuello de botella desbloqueado:** equipo formal, contratable, escalable.

---

## Cierre / moraleja (~30s)

> "Cada cuello de botella resuelto revela el siguiente. Pero el progreso constante es la verdadera moneda de la motivación. Por eso este orden importa: vas a sentir avance cada semana.
>
> La IA cambia el *cómo* y el *cuándo*, no el *qué*. Los 15 pasos siguen siendo 15. Lo que antes tomaba 18 meses, hoy puede tomar 6. Pero hay que hacerlos.
>
> No esperes a sentirte 'listo'. Empieza por el #2 esta semana."

---

## Notas de timing (15 min total)

| Sección | Tiempo |
|---|---|
| Apertura | 0:30 |
| 1. Cronología | 0:45 |
| 2-3. Prep + Validación | 2:00 |
| 4-5. Finanzas + Fiscalización | 2:00 |
| 6. Branding | 1:00 |
| 7-8. CRM + WhatsApp | 2:00 |
| 9. Breakeven | 0:45 |
| 10-11. Socios + Comms internas | 2:00 |
| 12. Constitución | 1:15 |
| 13. Crédito | 1:00 |
| 14. Asambleas | 0:45 |
| 15. Contrataciones | 1:15 |
| Cierre | 0:30 |
| **Total** | **~15:45** |

Margen apretado, va a sobrarte si no te alargas en preguntas. Pega 1 frase de cierre con CTA si quieres dejar memorable.
