from fastapi import APIRouter

from ..core.settings import settings

router = APIRouter(prefix='/api', tags=['api'])


@router.get('/info')
async def info() -> dict[str, str]:
    """Surface application metadata and environment hints."""
    return {
        'service': settings.app_name,
        'environment': settings.environment,
        'version': settings.app_version,
    }
