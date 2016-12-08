package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

var (
	host string
	port int
	lim  int
	cnt  int
)

func main() {
	flag.StringVar(&host, "h", "", "hostname.")
	flag.IntVar(&port, "p", 8080, "port number.")
	flag.IntVar(&lim, "l", 5, "access limit number.")
	flag.Parse()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if cnt >= lim {
			log.Printf("quit count %d", cnt)
			os.Exit(0)
		}

		cnt++
		fmt.Fprintf(w, "hello %d/%d\n", cnt, lim)
	})

	http.HandleFunc("/favicon.ico", func(w http.ResponseWriter, r *http.Request) {})

	addr := fmt.Sprintf("%s:%d", host, port)
	log.Printf("listen %s", addr)

	err := http.ListenAndServe(addr, nil)
	if err != nil {
		log.Println(err)
		os.Exit(1)
	}
}
