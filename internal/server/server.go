package server

import (
	"github.com/labstack/echo/v4"
)

// Server handles evaluation requests
type Server struct{}

func NewServer() *Server {
	return &Server{}
}

// ServeHTTP responds to an HTTP request
func (s *Server) ServeHTTP() {
	e := echo.New()

	// Middlewares
	loadMiddleware(e)

	// Routes
	loadRoutes(e)

	// Start server
	e.Logger.Fatal(e.Start(":8888"))
}
