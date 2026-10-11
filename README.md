# Inception

A containerized web project that brings multiple services together with Docker Compose to create a complete development environment.

![Docker](https://img.shields.io/badge/Docker-Compose-2496ED) ![Linux](https://img.shields.io/badge/OS-Linux-000000) ![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25)

## Overview

This project demonstrates a basic infrastructure setup using Docker containers. It focuses on container orchestration, service isolation, and environment configuration for a web application stack.

The repository contains the project configuration and required files for running the stack locally, including Docker definitions and setup scripts.

## Features

- Docker-based local environment setup
- Multi-service orchestration with Docker Compose
- Environment configuration through project files and variables
- Containerized project structure for development and deployment practice
- Makefile-based workflow for common tasks

## Tech Stack

### Infrastructure
- Docker
- Docker Compose
- Linux environment

### Tools
- Makefile
- Shell scripting

## Getting Started

### Prerequisites

- Docker
- Docker Compose
- A Linux-based environment or Docker Desktop

### Run the project

```bash
git clone https://github.com/ayoub-essarghini/Inception.git
cd Inception
make
```

If the project exposes service URLs or environment-specific ports, they are defined in the Docker configuration files inside `srcs/`.

## Project Structure

```text
Inception/
├── Makefile
├── README.md
├── srcs/
│   ├── .env
│   ├── docker-compose.yml
│   └── requirements/
└── TODO.md
```

## What I learned

- How to organize a multi-container development environment
- How Docker Compose coordinates separate services
- How infrastructure setup can be automated with Makefiles and shell scripts
- The importance of clean configuration and environment separation

## Future improvements

- Add clearer service documentation for each container
- Improve configuration portability across environments
- Add validation and health checks for services
- Document environment variable usage more explicitly

## License

This project is available under its repository license, if present in the project files.
