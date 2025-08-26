
# MOIA Legal Referral System (Prototype)

**One-liner:** End-to-end legal referral and reporting system prototype using Microsoft Forms, Lists, Power Automate, Power BI, and Excel, with optional Python matching API, to simulate how MOIA routes immigrant intakes to legal providers and tracks outcomes with real-time dashboards and QA checks.

## Repo Structure
```
moia-legal-referral-system/
├─ data/                # seed CSVs (intakes/providers/referrals/outcomes)
├─ functions/           # optional FastAPI matching service
├─ excel-macros/        # QA macro module (.bas)
├─ powerbi/             # setup notes / measures
├─ docs/                # data dictionary, process diagram
└─ README.md
```

## Quickstart
1. Create Microsoft **Lists** named Intakes, Providers, Referrals, Outcomes (see docs/data_dictionary.md).
2. Import CSVs from **data/** into the Lists to seed sample data.
3. Build a Microsoft **Form** "Legal Intake" (Language, Borough, Need, Consent, ContactMethod).
4. In **Power Automate**:
   - Trigger: *When a new response is submitted* → Get response details
   - Create item in **Intakes**
   - Get items from **Providers** → Filter (borough/language/need) → pick top
   - Create item in **Referrals** (Status="Sent", SentAt=utcNow())
   - Send email to provider contact
5. In **Power BI**, connect to the Lists (or use data/*.csv) and build KPIs.
6. In **Excel**, import `excel-macros/QA_Checks.bas` and run **QA_Checks** on your Referrals export.

## Optional Matching API
```bash
pip install -r requirements.txt
uvicorn functions.match_provider:app --reload
```
Then call POST /match with an Intake and array of Providers to get the best match.

## Security Notes
- Use least-privilege permissions for Lists.
- Avoid storing PII; use **CaseCode** instead of names in emails.
- Use retention labels on Lists per org policy.
