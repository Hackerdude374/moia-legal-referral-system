
# MOIA-Style Legal Referral & Reporting System — Quickstart Data

Files:
- `providers.csv`
- `intakes.csv`
- `referrals.csv`
- `outcomes.csv`
- `match_provider.py` (optional FastAPI service for matching)
- `QA_Checks.bas` (Excel VBA module — import into an .xlsm workbook)

Suggested Microsoft Lists (create columns to match):
- Intakes: IntakeID (Text), Date (DateTime), PreferredLanguage (Choice), Borough (Choice), LegalNeed (Choice), ConsentGiven (Yes/No), ContactMethod (Choice), CaseCode (Text)
- Providers: ProviderID (Text), Name (Text), BoroughsServed (Multi-line text), Languages (Multi-line text), Specialties (Multi-line text), IntakeCapacity (Number), ContactEmail (Text), Status (Choice)
- Referrals: ReferralID (Text), IntakeID (Lookup to Intakes), ProviderID (Lookup to Providers), Status (Choice), SentAt (DateTime), FirstResponseAt (DateTime), Outcome (Text)
- Outcomes: OutcomeID (Text), ReferralID (Lookup to Referrals), Resolution (Choice), ClosedAt (DateTime), Notes (Multi-line text)

Power BI:
- Connect to the SharePoint Online Lists or use these CSVs to prototype visuals and DAX.
