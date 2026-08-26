# DevOps Intern Final Assessment

**Name:** Sumit Jadhav  
**Date:** August 26, 2026  
**Project:** DevOps Intern Final Assessment

## Overview

This project demonstrates a small end-to-end DevOps workflow using Git/GitHub, Linux scripting, Docker, GitHub Actions CI, HashiCorp Nomad, and Grafana Loki.

## Project Structure

```text
devops-intern-final/
├── README.md
├── hello.py
├── Dockerfile
├── .dockerignore
├── .gitignore
├── scripts/
│   └── sysinfo.sh
├── .github/
│   └── workflows/
│       └── ci.yml
├── nomad/
│   └── hello.nomad
└── monitoring/
    └── loki_setup.txt
```

## 1. Git & GitHub

Initialize and push the repository:

```bash
git init
git add .
git commit -m "Initial DevOps assessment project"
git branch -M main
git remote add origin https://github.com/<YOUR_USERNAME>/devops-intern-final.git
git push -u origin main
```

Run the sample application:

```bash
python hello.py
```

Expected output:

```text
Hello, DevOps!
```

## 2. Linux & Shell Scripting

Make the script executable:

```bash
chmod +x scripts/sysinfo.sh
```

Run:

```bash
./scripts/sysinfo.sh
```

The script displays the current user, current date, and disk usage.

## 3. Docker

Build the image:

```bash
docker build -t devops-hello:1.0 .
```

Run the container:

```bash
docker run --rm devops-hello:1.0
```

Expected output:

```text
Hello, DevOps!
```

Check images:

```bash
docker images devops-hello
```

## 4. CI/CD with GitHub Actions

The workflow is located at:

```text
.github/workflows/ci.yml
```

It runs automatically on every push and pull request. It:

1. Checks out the repository.
2. Sets up Python.
3. Runs `python hello.py`.
4. Verifies that the expected output is produced.

After pushing to GitHub, open the **Actions** tab to see the workflow result.

### Status Badge

Replace `<YOUR_USERNAME>` with your GitHub username after creating the repository:

```markdown
[![CI](https://github.com/<YOUR_USERNAME>/devops-intern-final/actions/workflows/ci.yml/badge.svg)](https://github.com/<YOUR_USERNAME>/devops-intern-final/actions/workflows/ci.yml)
```

## 5. Nomad Deployment

The Nomad job is defined in:

```text
nomad/hello.nomad
```

It uses a service job and Docker driver with minimal CPU and memory resources.

Validate the job:

```bash
nomad job validate nomad/hello.nomad
```

Run it:

```bash
nomad job run nomad/hello.nomad
```

Check status:

```bash
nomad job status devops-hello
```

Inspect allocations:

```bash
nomad alloc status <ALLOCATION_ID>
```

> Note: The Docker image must be available to the Nomad client. For a local Nomad + Docker setup, the client should have Docker access.

## 6. Monitoring with Grafana Loki

The monitoring notes are in:

```text
monitoring/loki_setup.txt
```

A simple local Loki container can be started with:

```bash
docker run -d --name loki -p 3100:3100 grafana/loki:3.5.0 -config.file=/etc/loki/local-config.yaml
```

Check Loki:

```bash
curl http://localhost:3100/ready
```

Expected response:

```text
ready
```

For log collection, this project documents Docker/container log forwarding using Grafana Alloy. See `monitoring/loki_setup.txt`.

## 7. End-to-End Workflow

```text
Git
 ↓
GitHub
 ↓
GitHub Actions
 ↓
Python test
 ↓
Docker image
 ↓
Nomad deployment
 ↓
Container logs
 ↓
Grafana Alloy
 ↓
Loki
```

## Screenshots

For the final GitHub submission, add screenshots to a `screenshots/` directory and reference them here. Recommended screenshots:

1. GitHub repository with project files.
2. Successful GitHub Actions run.
3. `docker build` and `docker run` output.
4. `nomad job status` output.
5. Loki readiness/log query output.

Example:

```markdown
![GitHub Actions](screenshots/github-actions.png)
```

## Troubleshooting

### Docker command not found

Install Docker and verify:

```bash
docker --version
```

### Permission denied for sysinfo.sh

Run:

```bash
chmod +x scripts/sysinfo.sh
```

### Nomad cannot start the Docker task

Verify:

```bash
nomad status
docker ps
```

The Nomad client must have access to the Docker daemon.

### Loki is not ready

Check:

```bash
docker logs loki
curl http://localhost:3100/ready
```

## Final Checklist

- [ ] Public GitHub repository created
- [ ] README added with name and date
- [ ] `hello.py` works
- [ ] `scripts/sysinfo.sh` is executable
- [ ] Docker image builds and runs
- [ ] GitHub Actions workflow passes
- [ ] Nomad job validates
- [ ] Nomad job runs successfully
- [ ] Loki setup tested
- [ ] Screenshots added to the repository
