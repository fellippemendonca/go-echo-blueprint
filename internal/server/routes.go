package server

import (
	controllers "go-echo-blueprint/internal/controllers/users"

	"github.com/labstack/echo/v4"
)

func loadRoutes(e *echo.Echo) {
	e.POST("/users", controllers.CreateUser)
	e.GET("/users/:id", controllers.GetUser)
	e.PUT("/users/:id", controllers.UpdateUser)
	e.DELETE("/users/:id", controllers.DeleteUser)
}
