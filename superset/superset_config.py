import os

FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True,
}

ENABLE_PROXY_FIX = True
SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY')

# Database configuration
SQLALCHEMY_DATABASE_URI = 'postgresql://superset:superset@superset-postgres:5432/superset'
