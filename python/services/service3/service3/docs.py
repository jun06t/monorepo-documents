import json
from fastapi.openapi.utils import get_openapi
from main import app
from config import settings

def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title=settings.service_name,
        version=settings.version,
        routes=app.routes,
    )
    app.openapi_schema = openapi_schema
    return app.openapi_schema

if __name__ == "__main__":
    with open(settings.service_name+"-docs.json", "w") as fd:
        print(json.dumps(custom_openapi()), file=fd)