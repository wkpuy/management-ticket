package route

import (
	"database/sql"
	"management-ticket/internal/http/handler"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/rs/cors"
)

func HandleAPI(mysql *sql.DB, port, rootPath string) {
	r := mux.NewRouter()
	s := r.PathPrefix("/api").Subrouter()
	
	s.Handle("/tickets", &handler.TicketHandler{Db: mysql}).Methods("POST")
	s.Handle("/tickets/create", &handler.InsertTicketHandler{Db: mysql}).Methods("POST")
	s.Handle("/tickets/update", &handler.UpdateTicketHandler{Db: mysql}).Methods("PUT")
	
	handler := cors.AllowAll().Handler(r)
	http.ListenAndServe(":"+port, handler)
}


func TestHandleAPI(mysql *sql.DB,r *mux.Router) {
	s := r.PathPrefix("/api").Subrouter()
	
	s.Handle("/tickets", &handler.TicketHandler{Db: mysql}).Methods("POST")
	s.Handle("/tickets/create", &handler.InsertTicketHandler{Db: mysql}).Methods("POST")
	s.Handle("/tickets/update", &handler.UpdateTicketHandler{Db: mysql}).Methods("PUT")
	
}



