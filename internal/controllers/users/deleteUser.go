package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

// e.DELETE("/users/:id", getUser)
func DeleteUser(c echo.Context) error {
	id := c.Param("id")
	return c.String(http.StatusAccepted, id)
}
