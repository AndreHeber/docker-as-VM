package main

import (
	"log"
	"os"
	"time"
)

func main() {
	// Configure logging to include timestamp
	log.SetFlags(log.Ldate | log.Ltime | log.Lmicroseconds)

	// Read LOG_LEVEL from environment variable
	logLevel := os.Getenv("LOG_LEVEL")
	if logLevel == "" {
		logLevel = "INFO" // Default log level
	}

	log.Printf("Starting application with LOG_LEVEL: %s", logLevel)

	// Infinite loop to log every 2 seconds
	for {
		log.Printf("Current LOG_LEVEL: %s", logLevel)
		time.Sleep(2 * time.Second)
	}
}