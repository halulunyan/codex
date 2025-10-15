from fastapi import FastAPI

app = FastAPI(title="codex-api")

@app.get("/health")
def health():
    return {"status": "ok"}
