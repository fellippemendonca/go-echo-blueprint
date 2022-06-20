package main

import (
	server "go-echo-blueprint/internal/server"
)

func main() {
	server := server.NewServer()
	server.ServeHTTP()
}
