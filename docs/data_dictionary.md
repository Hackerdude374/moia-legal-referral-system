
# Data Dictionary

## Intakes
- IntakeID (Text) — unique code
- Date (DateTime) — intake timestamp
- PreferredLanguage (Choice)
- Borough (Choice)
- LegalNeed (Choice) — Asylum, TPS, DACA, etc.
- ConsentGiven (Yes/No)
- ContactMethod (Choice) — Phone/Email
- CaseCode (Text) — non-PII public case code

## Providers
- ProviderID (Text), Name (Text)
- BoroughsServed (Multi-line) — e.g., "Brooklyn;Queens"
- Languages (Multi-line) — e.g., "English;Spanish;Mandarin"
- Specialties (Multi-line) — e.g., "Asylum;Citizenship"
- IntakeCapacity (Number)
- ContactEmail (Text)
- Status (Choice) — Active/Paused

## Referrals
- ReferralID (Text)
- IntakeID (Lookup→Intakes)
- ProviderID (Lookup→Providers)
- Status (Choice) — Sent/Accepted/Declined
- SentAt (DateTime)
- FirstResponseAt (DateTime)
- Outcome (Text)

## Outcomes
- OutcomeID (Text)
- ReferralID (Lookup→Referrals)
- Resolution (Choice)
- ClosedAt (DateTime)
- Notes (Multi-line)
