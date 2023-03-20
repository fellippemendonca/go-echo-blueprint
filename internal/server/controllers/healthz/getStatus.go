package controllers

import (
	"go-echo-blueprint/internal/server"
	"net/http"

	"github.com/labstack/echo/v4"
)

func GetStatus(s *server.Server) func(c echo.Context) error {
	return func(c echo.Context) error {

		err := s.UserRepository.TestConnection(c.Request().Context())
		if err != nil {
			s.Logger.Error("DB Connection check failed.")
			return c.NoContent(http.StatusInternalServerError)
		}

		s.Logger.Info("DB Connection check Successful.")
		return c.NoContent(http.StatusNoContent)
	}
}
