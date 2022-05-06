from pydantic import BaseSettings


class Settings(BaseSettings):
    env: str = 'local'
    service_name: str = 'service3'
    version: str = '0.1.0'

settings = Settings()
