from functools import lru_cache
from pathlib import Path

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Centralized application configuration."""

    model_config = SettingsConfigDict(env_file='.env', env_file_encoding='utf-8')

    app_name: str = Field(default='multi-stack-template-api', alias='APP_NAME')
    app_version: str = Field(default='0.1.0', alias='APP_VERSION')
    environment: str = Field(default='local', alias='ENVIRONMENT')
    docs_url: str | None = Field(default='/docs', alias='DOCS_URL')
    redoc_url: str | None = Field(default='/redoc', alias='REDOC_URL')
    log_level: str = Field(default='info', alias='LOG_LEVEL')

    @property
    def project_root(self) -> Path:
        return Path(__file__).resolve().parents[2]


@lru_cache(maxsize=1)
def get_settings() -> Settings:
    return Settings()


settings = get_settings()
