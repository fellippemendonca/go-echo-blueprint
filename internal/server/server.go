package server

import (
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// Server handles evaluation requests
type Server struct{}

func NewServer() *Server {
	return &Server{}
}

// ServeHTTP responds to an HTTP request
func (s *Server) ServeHTTP() {
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Routes
	initialyzeRoutes(e)

	// Start server
	e.Logger.Fatal(e.Start(":8888"))
}
