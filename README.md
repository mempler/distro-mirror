# Distro Mirror

A simple and extensible Linux distribution mirror server powered by Docker, rsync, and Caddy.

This project allows you to deploy your own Arch Linux and Ubuntu mirror servers using Docker. It automatically syncs with official upstream mirrors using `rsync`, and serves the contents via `Caddy` web server. All components are containerized, cron-scheduled, and easy to manage or extend.

---

## ✅ Features

- 🔄 Automatic synchronization via `rsync` with upstream mirrors
- 🕒 Periodic syncing handled by `cron` (every 5 minutes)
- 📁 Directory listing via `Caddy` web server with file browsing enabled
- 🐳 Dockerized: Easy to deploy, rebuild, or expand
- ⚙️ Supports Arch Linux and Ubuntu (extensible to others)
- 🖥️ Ready for reverse proxy and domain-based access
- 🏗️ Multi-architecture support (x86_64 and ARM64)
- 🚀 Automated builds via GitHub Actions for both architectures

---

## 📦 Requirements

- Docker
- Docker Compose
- Basic shell or CMD environment

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/mempler/distro-mirror.git
cd distro-mirror
```

### 2. Deploy with Docker Compose

```bash
docker-compose up -d
```

This will pull the pre-built images and run both Arch and Ubuntu mirror containers in the background.

### 3. Build locally (optional)

If you want to build the images locally instead of using pre-built ones:

```bash
# Build Arch mirror
docker build -t distro-mirror/arch ./arch

# Build Ubuntu mirror  
docker build -t distro-mirror/ubuntu ./ubuntu
```

---

## 🌐 Access URLs

- Arch mirror: http://localhost:20450
- Ubuntu mirror: http://localhost:20451

## 🏗️ Architecture Support

This project provides multi-architecture Docker images built automatically via GitHub Actions:

- **x86_64 (AMD64)**: Built on standard Ubuntu runners
- **ARM64 (AArch64)**: Built on native ARM64 runners

The appropriate image for your architecture will be automatically pulled when using `docker-compose`.

---

## ✍️ Customizing

### Mirror Configuration

- Change `REMOTE` in `sync.sh` to select your preferred upstream rsync mirror
- Modify sync frequency by editing the cron schedule in the Dockerfile
- Adjust storage paths by modifying the volume mounts in `docker-compose.yml`

### Web Server Configuration  

- Modify Caddy settings via the `Caddyfile` in each distro directory
- Add TLS or domain routing by configuring a reverse proxy on the host machine
- Customize file browsing appearance through Caddy's file server directives

### Resource Limits

- Adjust memory limits and reservations in `docker-compose.yml`
- Modify deployment constraints for Docker Swarm environments

---

## 📄 License

[MIT License](LICENSE)
