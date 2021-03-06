package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

// e.GET("/users/:id", getUser)
func GetUser(c echo.Context) error {
	id := c.Param("id")
	return c.String(http.StatusOK, id)
}
