package server

import (
	"go-echo-blueprint/internal/models"

	"go.uber.org/zap"
)

type Server struct {
	UserRepository models.UserRepository
	Logger         *zap.Logger
}

func NewServer() *Server {
	return &Server{}
}
