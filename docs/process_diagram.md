
# Process Diagram (Text)
1) Client submits **Form** → creates intake.
2) **Flow** writes to Intakes → looks up Providers → selects best match.
3) **Flow** creates Referral → emails Provider.
4) Provider **accepts/declines** via small form → Flow updates Referral.
5) Staff records **Outcome** when resolved.
6) **Power BI** reads Lists → KPIs and trends.
7) Weekly **Excel QA** flags missing/stale records.
