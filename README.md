# mirror-docker

A simple and extensible Linux mirror server powered by Docker, rsync, and nginx.

This project allows you to deploy your own Arch Linux and Ubuntu mirror servers using Docker. It automatically syncs with official upstream mirrors using `rsync`, and serves the contents via `nginx`. All components are containerized, cron-scheduled, and easy to manage or extend.

---

## ✅ Features

- 🔄 Automatic synchronization via `rsync` with upstream mirrors
- 🕒 Periodic syncing handled by `cron`
- 📁 Directory listing via `nginx` with autoindex enabled
- 🐳 Dockerized: Easy to deploy, rebuild, or expand
- ⚙️ Supports Arch Linux and Ubuntu (extensible to others)
- 🖥️ Ready for reverse proxy and domain-based access

---

## 📦 Requirements

- Docker
- Docker Compose
- Basic shell or CMD environment

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/LunaStev/mirror-docker.git
cd mirror-docker
```

### 2. Run
On Linux/macOS:

```bash
./docstart.sh
```

On Windows (CMD):

```cmd
docstart.bat
```

This will build and run both Arch and Ubuntu mirror containers in the background.

---

## 🌐 Access URLs
- Arch mirror: http://localhost:8081
- Ubuntu mirror: http://localhost:8082

---

## ✍️ Customizing
- Change `REMOTE` in `sync.sh` to select your preferred upstream rsync mirror
- Modify nginx settings via `default.conf` or `nginx.conf`
- Add TLS or domain routing by configuring a reverse proxy on the host machine

---

## 📄 License
[MIT License](LICENSE)