"""
NewsRadar Backend – FastAPI Application
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="NewsRadar API",
    description="API for NewsRadar – RSS monitoring and alert system.",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health", tags=["System"])
async def health_check():
    """Health check endpoint."""
    return {"status": "ok", "service": "newsradar-backend"}


@app.get("/", tags=["System"])
async def root():
    """Root endpoint – redirects to API docs."""
    return {"message": "NewsRadar API is running. Visit /docs for API documentation."}
