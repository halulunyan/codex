import pytest
from httpx import AsyncClient

from app.main import app


@pytest.mark.asyncio
async def test_health_endpoint():
    async with AsyncClient(app=app, base_url='http://testserver') as client:
        response = await client.get('/health')
    assert response.status_code == 200
    assert response.json() == {'status': 'ok'}


@pytest.mark.asyncio
async def test_info_endpoint():
    async with AsyncClient(app=app, base_url='http://testserver') as client:
        response = await client.get('/api/info')
    assert response.status_code == 200
    payload = response.json()
    assert payload['service'] == 'multi-stack-template-api'
    assert payload['version']
