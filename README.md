# Worklog time-tracker

A small personal system I have run every working day since 1995: I log my time in 15-minute blocks in a plain text file, then a short PowerShell script rolls the hours up by category so I can compare where my time actually went against where I meant it to go.

It is not clever code. The point is the habit and the loop it supports.

## How it works

Each line in the log is one 15-minute (or longer) block:

```
00.25: [project|client|activity|responsibility|type]: short description.
```

- The leading number is hours (`00.25` = 15 minutes, `01.00` = one hour).
- The bracketed tags classify the entry: which project, which client, what kind of activity, what type of responsibility, and so on.
- Dates head each day's block.

The script (`worklog2csv.ps1`) reads the log, parses each line, and tallies the hours per category per day. The output is a simple table of totals I can scan or drop into a spreadsheet.

## The loop

Every two weeks I run the script and compare the category totals against the time allocations my OKRs imply. If the numbers show I have drifted (three weeks of firefighting instead of the work I committed to, say), I see it the week it starts and correct, instead of finding out at quarter's end.

That early-warning correction is the whole value. The log is the raw material; the rollup is what makes drift visible while there is still time to act on it.

## Files

- `worklog-rollup.ps1` — the parser and category roll-up.
- `screenshot-script.png` — the script.
- `screenshot-rollup.png` — sample roll-up output (daily totals by responsibility code).

## Note on privacy

The real log records who I worked with and on what, so I do not publish it. The format example above is synthetic, and any sample output here is stripped of names and identifying detail. I keep this granularity on my own time only: on myself it is ownership, on a team it would be surveillance.
