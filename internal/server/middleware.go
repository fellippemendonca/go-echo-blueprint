package server

import (
	middlewares "go-echo-blueprint/internal/server/middlewares"

	"github.com/labstack/echo/v4"
)

func loadMiddleware(e *echo.Echo) {
	e.Use(middlewares.Cors())
	e.Use(middlewares.Logger())
	e.Use(middlewares.Recover())
}
