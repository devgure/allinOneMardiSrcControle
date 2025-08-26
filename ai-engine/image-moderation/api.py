# ai-engine/image-moderation/api.py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import requests
from PIL import Image
from io import BytesIO

app = FastAPI()

class ModerationRequest(BaseModel):
    imageUrl: str

# Dummy NSFW detection
def is_nsfw(image_url):
    # In real app: use TensorFlow/CLIP model
    return False

@app.post("/moderate")
async def moderate(request: ModerationRequest):
    try:
        response = requests.get(request.imageUrl)
        img = Image.open(BytesIO(response.content))
        if is_nsfw(request.imageUrl):
            return {"status": "blocked", "reason": "NSFW content"}
        return {"status": "allowed", "confidence": 0.95}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))