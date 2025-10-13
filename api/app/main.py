from fastapi import FastAPI

from .api.routes import router
from .core.settings import settings

app = FastAPI(
    title=settings.app_name,
    version=settings.app_version,
    docs_url=settings.docs_url,
    redoc_url=settings.redoc_url,
)
app.include_router(router)


@app.get('/health', tags=['health'])
async def health_check() -> dict[str, str]:
    """Top-level health probe for load balancers."""
    return {'status': 'ok'}
