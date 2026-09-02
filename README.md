# Georgia Probate Register — Dashboard Setup

This is a small website that reads `leads.json` and shows it as a
filterable, sortable table. It's a plain HTML file — no server, no
database, nothing to install. GitHub hosts it for free and it updates
every time you push a new `leads.json` to it.

## One-time setup

### 1. Create a GitHub account (skip if you have one)
Go to https://github.com and sign up.

### 2. Create a new repository
- Click the **+** in the top-right corner → **New repository**
- Name it something like `probate-dashboard`
- Set it to **Private** (so the addresses/names in your data aren't
  publicly visible to search engines — see the note on privacy below)
- Don't check "Add a README" — click **Create repository**

### 3. Put these three files in that repo
You should have, in one folder on your computer:
- `index.html` (the dashboard page)
- `leads.json` (starts out empty — `[]` — your daily script fills it in)
- `daily_update.command` (your one-click daily routine)

Follow GitHub's on-screen instructions on the empty repo page under
"…or push an existing repository from the command line" — it'll look
something like this (GitHub shows you your actual URL, use that one):

```
cd ~/Downloads/probate-dashboard
git init
git add .
git commit -m "Initial dashboard"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/probate-dashboard.git
git push -u origin main
```

### 4. Turn on GitHub Pages
- In your repo on github.com, click **Settings** → **Pages** (left sidebar)
- Under "Build and deployment", set **Source** to "Deploy from a branch"
- Set **Branch** to `main` and folder to `/ (root)`, click **Save**
- Wait about a minute, then refresh — GitHub will show you a URL like
  `https://YOUR-USERNAME.github.io/probate-dashboard/`. That's your
  dashboard's permanent address — bookmark it.

### A note on privacy
Since this data includes real people's names and addresses, a **Private**
repo is strongly recommended over Public. Private repos on GitHub can
still use GitHub Pages, but you may see a note that Pages sites built
from private repos are only free on paid GitHub plans (GitHub occasionally
changes this — check the Pages settings page, it'll tell you clearly if
this applies to your account). If cost is a concern, a simpler
alternative is to just open `index.html` directly on your own computer
(double-click it) instead of hosting it anywhere — you'd lose the "check
from my phone anywhere" convenience, but the data never leaves your
computer.

## Using it day to day

1. Double-click `daily_update.command` (or run it from Terminal)
2. It'll walk you through logging in, then fetch new filings, find
   addresses, and push the result to your dashboard automatically
3. Open your dashboard URL — it defaults to showing the last 7 days of
   filings, but you can widen the date range, filter by county, search a
   name, or toggle "Leave-to-sell only" to find the hottest leads

Nothing ever gets deleted from the dashboard — every filing your scraper
has ever found stays there permanently, so you can always go back and
widen the date filter to see older leads too.

## If the folder paths don't match

`daily_update.command` assumes your scraper lives at
`~/Downloads/Fulton Probate Scraper/scraper` and this dashboard lives at
`~/Downloads/probate-dashboard`. If you put them somewhere else, open
`daily_update.command` in a text editor and update the two lines near the
top (`SCRAPER_DIR` and `DASHBOARD_DIR`) to match your actual folder
locations.
