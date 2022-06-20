package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

// e.PUT("/users", putUser)
func UpdateUser(c echo.Context) error {
	u := new(User)
	if err := c.Bind(u); err != nil {
		return err
	}
	return c.JSON(http.StatusOK, u)
}
