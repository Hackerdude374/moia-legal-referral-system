
# Minimal FastAPI app for provider matching
# Run locally: uvicorn match_provider:app --reload
from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI(title="MOIA Matching API", version="0.1.0")

class Intake(BaseModel):
    Borough: str
    PreferredLanguage: str
    LegalNeed: str

class Provider(BaseModel):
    ProviderID: str
    BoroughsServed: str
    Languages: str
    Specialties: str
    IntakeCapacity: int

def score(intake: Intake, provider: Provider) -> float:
    s = 0.0
    if intake.Borough in provider.BoroughsServed.split(";"): s += 3
    if intake.PreferredLanguage in provider.Languages.split(";"): s += 3
    if intake.LegalNeed in provider.Specialties.split(";"): s += 4
    s += min(3, max(0, provider.IntakeCapacity)) * 0.3
    return s

@app.post("/match")
def match_endpoint(intake: Intake, providers: List[Provider]):
    ranked = sorted(providers, key=lambda p: score(intake, p), reverse=True)
    top = ranked[0] if ranked else None
    return {"chosen": top.dict() if top else None}
