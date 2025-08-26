# ai-engine/recommendation-engine/api/server.py
from fastapi import FastAPI
from pydantic import BaseModel
import random

app = FastAPI()

class MatchRequest(BaseModel):
    userId: str

@app.post("/recommend")
async def recommend_matches(request: MatchRequest):
    # Mock: return 10 random matches with AI score
    matches = [
        {"userId": f"user_{i}", "score": round(random.uniform(0.7, 0.99), 3)}
        for i in range(10)
    ]
    return {"matches": matches}