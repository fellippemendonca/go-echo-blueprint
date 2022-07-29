package server

import (
	users "go-echo-blueprint/internal/controllers/users"

	"github.com/labstack/echo/v4"
)

func loadRoutes(e *echo.Echo) {
	e.POST("/users", users.Create)
	e.GET("/users", users.GetAll)
	e.GET("/users/:id", users.GetOne)
	e.PUT("/users/:id", users.Update)
	e.DELETE("/users/:id", users.Delete)
}
