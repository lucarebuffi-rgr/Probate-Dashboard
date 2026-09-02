#!/bin/bash
# Daily Probate Update
#
# Double-click this file each day (or run it from Terminal) to:
#   1. Log you into re:SearchGA (you'll do the actual login in a browser window)
#   2. Pull any new probate filings from the last 30 days
#   3. Read the mailing address off any new filings using Claude
#   4. Copy the updated data into your dashboard folder and publish it to GitHub
#
# EXPECTED FOLDER LAYOUT (adjust the two paths below if yours is different):
#   ~/Downloads/Fulton Probate Scraper/scraper/   <- your scraper scripts live here
#   ~/Downloads/probate-dashboard/                 <- this dashboard folder (a git repo)

set -e  # stop immediately if any step fails, rather than plowing ahead

SCRAPER_DIR="$HOME/Downloads/Fulton Probate Scraper/scraper"
DASHBOARD_DIR="$HOME/Downloads/probate-dashboard"

echo "========================================"
echo "STEP 1 of 4: Logging in"
echo "========================================"
cd "$SCRAPER_DIR"
python3 capture_session.py

echo ""
echo "========================================"
echo "STEP 2 of 4: Fetching new filings"
echo "========================================"
python3 fetch_leads.py

echo ""
echo "========================================"
echo "STEP 3 of 4: Reading addresses"
echo "========================================"
python3 fetch_addresses.py

echo ""
echo "========================================"
echo "STEP 4 of 4: Publishing to your dashboard"
echo "========================================"
cp "$SCRAPER_DIR/leads.json" "$DASHBOARD_DIR/leads.json"
cd "$DASHBOARD_DIR"
git add leads.json
git commit -m "Daily update: $(date '+%Y-%m-%d %H:%M')" || echo "(Nothing new to commit — leads.json didn't change)"
git push

echo ""
echo "========================================"
echo "All done! Your dashboard is updating now."
echo "It usually takes 1-2 minutes for GitHub Pages to show the new data."
echo "========================================"
