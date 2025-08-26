
# Power BI Setup
1) Open Power BI Desktop.
2) Get Data → SharePoint Online List (or use `../data/*.csv` to prototype).
3) Build pages: Operations, Equity & Access, Provider Performance, Outcomes.
4) Measures to add:
   - TimeToReferral = DATEDIFF(MIN(Intakes[Date]), MIN(Referrals[SentAt]), MINUTE)
   - AcceptanceRate = DIVIDE(CALCULATE(COUNTROWS(Referrals), Referrals[Status] = "Accepted"), COUNTROWS(Referrals))
   - TimeToFirstResponse = DATEDIFF(MIN(Referrals[SentAt]), MIN(Referrals[FirstResponseAt]), MINUTE)
