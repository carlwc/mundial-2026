# 🏆 FIFA World Cup 2026™ Dashboard

An interactive, bilingual (English/Spanish) dashboard for tracking every match of the 2026 FIFA World Cup — group stage schedules, live standings, and the full knockout bracket.

**🌐 Live site → [carlwc.github.io/mundial-2026](https://carlwc.github.io/mundial-2026)**

---

## Features

- **📅 Schedule** — All 72 group stage matches in chronological order, with confirmed kickoff times in Pacific Daylight Time (PDT). Filter by group. Click any match to enter a score.
- **📊 Groups** — Live standings for all 12 groups (W / D / L / GF / GA / GD / Pts), auto-calculated as scores are entered.
- **🏆 Bracket** — Full knockout bracket from the Round of 32 through the Final. Slots fill in automatically as the group stage and each knockout round complete.
- **🌐 EN / ES toggle** — Switch between English and Spanish at any time. Preference is saved between visits.
- **📡 Auto-updating** — The page fetches the latest `scores.json` from this repo on every load. Scores are pushed as soon as possible after each match ends — just refresh your browser.

---

## Tournament At a Glance

| | |
|---|---|
| **Host nations** | United States, Canada, Mexico |
| **Teams** | 48 (12 groups of 4) |
| **Total matches** | 104 |
| **Opening match** | June 11, 2026 — Mexico vs South Africa, Estadio Azteca, Mexico City |
| **Final** | July 19, 2026 — MetLife Stadium, East Rutherford, NJ |
| **Kickoff times** | Displayed in Pacific Daylight Time (PDT) |

---

## How Scores Are Updated

1. Scores are entered locally after each match using the built-in score entry dialog.
2. `scores.json` is exported from the dashboard and committed to this repository.
3. Visitors' browsers fetch the latest `scores.json` automatically on every page load.

> No app, login, or refresh trick needed — just open the page and you'll see the latest results.

---

## Knockout Round Schedule

| Round | Dates | Matches |
|---|---|---|
| Round of 32 | June 28 – July 3 | 16 |
| Round of 16 | July 4 – 7 | 8 |
| Quarter-Finals | July 9 – 11 | 4 |
| Semi-Finals | July 14 – 15 | 2 |
| Third-Place Match | July 18 | 1 |
| **Final** | **July 19** | **1** |

**Advancement:** Top 2 teams from each group advance automatically. The 8 best third-place finishers also advance → 32 teams total in the Round of 32.

---

## Using the Dashboard

### Entering Scores
Click any match card on the Schedule tab to open the score entry dialog. Enter goals for each team and click **Save Score**. Group standings and the bracket update instantly.

### Filtering the Schedule
Use the group filter buttons (Group A – Group L) to narrow the schedule to a single group. Click **All** to return to the full schedule.

### The Bracket
Bracket slots labeled `1A`, `2B`, etc. fill in with team names once each group is complete. Knockout match slots fill in as results are entered. A champion banner appears once the Final is decided.

### Status Indicator
The bar below the navigation tabs shows where scores are coming from:

| Indicator | Meaning |
|---|---|
| 🟢 Green dot | Server scores loaded — you're seeing the latest data |
| 🟡 Amber dot | Scores saved locally in your browser |
| ⚫ Grey dot | No scores yet |

---

## Project Structure

```
mundial-2026/
├── index.html                   # The dashboard (self-contained, no build step)
├── scores.json                  # Current match scores — updated after each match
├── WC2026-Dashboard-Guide-EN.docx  # English user guide
└── WC2026-Dashboard-Guide-ES.docx  # Spanish user guide (Guía en Español)
```

---

## Technical Notes

- Pure HTML, CSS, and vanilla JavaScript — no frameworks, no build step, no dependencies.
- Scores are persisted in `localStorage` for offline resilience and fetched from `scores.json` on load.
- Fully responsive — works on phones, tablets, and desktops.
- All 72 group stage fixtures and 32 knockout match slots are pre-loaded with confirmed kickoff times and venues where available.

---

*USA · Canada · Mexico · June 11 – July 19, 2026*
