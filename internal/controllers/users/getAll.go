package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

// e.GET("/users/:id", getUser)
func GetAll(c echo.Context) error {
	return c.String(http.StatusOK, "all")
}
