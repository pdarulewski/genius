.PHONY: clean
clean:
	rm -rf bin/genius-*

.PHONY: deps
deps:
	@echo "Installing dependencies..."
	@go mod download

genius:
	@echo "Building Genius..."
	@mkdir -p bin
	@go build -o bin/genius-$(shell go env GOOS)-$(shell go env GOARCH) ./cmd/main.go

.PHONY: lint
lint:
	@echo "Running linter..."
	@golangci-lint run ./...

.PHONY: test
test:
	@echo "Running tests..."
	@go test -v ./...
