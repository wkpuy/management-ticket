package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"management-ticket/internal/connector"
	"management-ticket/internal/http/route"
	"management-ticket/internal/utilities/path"
	"os"
	"testing"

	"bytes"
	"net/http"
	"net/http/httptest"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
)

type Server struct {
	DB     *sql.DB
	Router *mux.Router
}

var server = Server{}
func TestMain(m *testing.M) {
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

	r := mux.NewRouter()
	server.DB = mysqlDB
	server.Router = r
	
	route.TestHandleAPI(mysqlDB,r)
	os.Exit(m.Run())
	
}

func TestCreateTicket(t *testing.T) {
	
	var jsonStr = []byte(`{"name":"xyz","detail":"pqr","contact_info":"xyz@pqr.com"}`)
	req, err := http.NewRequest("POST", "/api/tickets/create", bytes.NewBuffer(jsonStr))
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", "application/json")


	rr := httptest.NewRecorder()
	server.Router.ServeHTTP(rr, req)
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
	
	var respParam map[string]interface{}
    json.Unmarshal(rr.Body.Bytes(), &respParam)

    if respParam["message"] != "Insert success" {
        t.Errorf("Can not insert")
    }
}

func TestUpdateTicket(t *testing.T) {
	
	var jsonStr = []byte(`{"id":6,"name":"xyz1","detail":"pqr","contact_info":"kpnm@pqr.com","ticket_status":"accepted"}`)
	req, err := http.NewRequest("PUT", "/api/tickets/update", bytes.NewBuffer(jsonStr))
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", "application/json")


	rr := httptest.NewRecorder()
	server.Router.ServeHTTP(rr, req)
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
	
	var respParam map[string]interface{}
    json.Unmarshal(rr.Body.Bytes(), &respParam)

    if respParam["message"] != "Edit success" {
        t.Errorf("Can not insert")
    }
}

func TestGetTicket(t *testing.T) {
	
	var jsonStr = []byte(`{
		"filterObj": {
		  "ticket_status": "pending",
		  "start_at": "2021-02-13T13:00:00.00+07:00",
		  "end_at": "2021-02-13T14:00:00.00+07:00"
		},
		"orderBy": "tickets.created_at",
		"orderType": "desc",
		"pageSize": 20,
		"page": 1
	  }`)
	  
	req, err := http.NewRequest("POST", "/api/tickets", bytes.NewBuffer(jsonStr))
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", "application/json")


	rr := httptest.NewRecorder()
	server.Router.ServeHTTP(rr, req)
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
	

}