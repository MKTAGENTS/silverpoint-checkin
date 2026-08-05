-- Run this once in Supabase: Project -> SQL Editor -> New query -> paste all -> Run.

create table if not exists checkins (
  id uuid primary key default gen_random_uuid(),
  community text not null,
  week text not null,
  mood text,
  win text,
  blocker text,
  ask text,
  resolved boolean default false,
  rec_id text,
  logged_by text,
  entered_at timestamptz default now()
);

alter table checkins enable row level security;

-- These policies keep this an open, no-login internal tool, matching how
-- the check-in board already worked: anyone with the link can read and
-- add entries. If you later want to require sign-in, see the README's
-- "Adding real access control later" section before changing these.

create policy "anon can read checkins" on checkins
  for select to anon using (true);

create policy "anon can insert checkins" on checkins
  for insert to anon with check (true);

create policy "anon can update checkins" on checkins
  for update to anon using (true);
