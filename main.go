package main

import (
	"fmt"

	"github.com/joho/godotenv"
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	BotToken string `envconfig:"NE_KLUB_BOT_TOKEN" required:"true"`
}

func init() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("No .env file found")
	}
}

func main() {
	var config Config
	err := envconfig.Process("NeKlubBot", &config)
	if err != nil {
		fmt.Println(err.Error())
	}
	fmt.Println("HELLO")
}
