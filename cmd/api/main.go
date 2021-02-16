package main

import (
	"fmt"
	"log"
	"os"

	"management-ticket/internal/connector"
	"management-ticket/internal/http/route"
	"management-ticket/internal/utilities/path"

	"github.com/joho/godotenv"
)

func main() {
	rootDir := path.GetRootDirectory()

	// load .env for development
	godotenv.Load(rootDir + "/.env")
	os.Setenv("TZ", "Asia/Bangkok")

	// connect mysql
	mysqlDB := connector.ConnectMysql()
	defer func() {
		err := mysqlDB.Close()
		if err != nil {
			log.Fatal(err)
		}

		fmt.Println("Connection to MySQL closed.")
	}()

	fmt.Println("Connected to MySQL!")

	// serve http request
	serverPort := os.Getenv("SERVER_PORT")
	route.HandleAPI(mysqlDB, serverPort, rootDir)
}
