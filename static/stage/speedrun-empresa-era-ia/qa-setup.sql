-- =============================================================================
-- oa.log — Q&A live for keynote
-- Run this once in Supabase SQL Editor (SQL > New query > paste > Run).
-- Idempotent: safe to re-run.
-- =============================================================================

-- ---------- Tables -----------------------------------------------------------

create table if not exists qa_sessions (
  slug          text primary key,
  current_slide int  default 1,
  total_slides  int  default 34,
  title         text,
  event         text,
  updated_at    timestamptz default now()
);

create table if not exists qa_questions (
  id            uuid primary key default gen_random_uuid(),
  session_slug  text references qa_sessions(slug) on delete cascade,
  slide_num     int,
  text          text not null
                  check (length(text) > 0 and length(text) <= 280),
  upvotes       int  default 0,
  created_at    timestamptz default now()
);

create index if not exists qa_questions_session_created_idx
  on qa_questions (session_slug, created_at desc);

create index if not exists qa_questions_session_upvotes_idx
  on qa_questions (session_slug, upvotes desc, created_at desc);

-- ---------- Atomic upvote RPC ------------------------------------------------

-- security definer so anon role can call it without direct UPDATE rights
create or replace function increment_upvote(qid uuid)
returns int
language sql
security definer
set search_path = public
as $$
  update qa_questions set upvotes = upvotes + 1 where id = qid
  returning upvotes;
$$;

grant execute on function increment_upvote(uuid) to anon, authenticated;

-- ---------- Row level security -----------------------------------------------

alter table qa_sessions  enable row level security;
alter table qa_questions enable row level security;

-- Anyone can read sessions and questions
drop policy if exists "anon read sessions"   on qa_sessions;
drop policy if exists "anon read questions"  on qa_questions;
create policy "anon read sessions"  on qa_sessions  for select using (true);
create policy "anon read questions" on qa_questions for select using (true);

-- Anyone can insert a question (audience submits)
drop policy if exists "anon insert questions" on qa_questions;
create policy "anon insert questions" on qa_questions for insert with check (true);

-- Anyone can update the session row (speaker pushes current_slide).
-- Risk is tiny for a one-time talk: worst case someone in the audience
-- spoofs the slide number for ~30s. If you care, replace this with a
-- service-role key bound to a server you control.
drop policy if exists "anon update sessions" on qa_sessions;
create policy "anon update sessions" on qa_sessions for update using (true) with check (true);

-- ---------- Realtime ---------------------------------------------------------

alter publication supabase_realtime add table qa_questions;
alter publication supabase_realtime add table qa_sessions;

-- ---------- Seed session -----------------------------------------------------

insert into qa_sessions (slug, current_slide, total_slides, title, event)
values (
  'speedrun-empresa-era-ia',
  1,
  34,
  'Speedrun · Empresa en la era de IA',
  'Playas on Tech · 14·05·2026'
)
on conflict (slug) do update
  set total_slides = excluded.total_slides,
      title        = excluded.title,
      event        = excluded.event;
