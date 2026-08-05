# Silverpoint Team Check-In

A weekly, low-pressure check-in board that runs alongside the Corrective
Action Protocol and the Metrics Log. People log what moved forward, what
got in the way, and what would help. Wins post to a shared wall. Asks post
to a list corporate is expected to clear.

This repo is a single static site (`index.html`). It stores its data in a
free Supabase database and is hosted for free on GitHub Pages. Nobody
installs anything from an app store; people visit a link, and can optionally
"Add to Home Screen" on their phone so it sits next to their other apps.

Full setup steps are in the conversation this was built in. In short:

1. Create a free Supabase project.
2. Run `supabase_setup.sql` in its SQL editor.
3. Copy your Project URL and anon public key into `index.html` (look for
   `SUPABASE_URL` and `SUPABASE_ANON_KEY` near the very top of the
   `<script>` block).
4. Push this repo to GitHub.
5. Turn on GitHub Pages for the repo (Settings -> Pages -> Deploy from
   branch -> main -> / (root)).
6. Visit the URL GitHub gives you. Check the top of the page: if you see an
   amber notice, the database isn't connected yet. If you don't, you're live.

## Files

- `index.html` — the whole app.
- `manifest.json`, `icon-192.png`, `icon-512.png` — makes the site
  installable to a phone home screen.
- `supabase_setup.sql` — run once, creates the `checkins` table.

## Adding real access control later

Right now this is an open internal tool: anyone with the link can read and
add entries, matching how it worked as a shared Claude artifact. If you
later want to require a login (for example, restrict it to
@silverpointsl.com or @mktagents.com email addresses), that's a Supabase
Auth change plus a small addition to the row-level-security policies in
`supabase_setup.sql`. Worth doing if this ever carries more sensitive
detail than it does today; not necessary to launch.
