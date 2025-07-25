# 🏗️ Inception

**A 42 Network project introducing Docker and containerization by building a virtualized infrastructure with multiple services.**

---

## 📖 About
The **Inception** project focuses on **system administration** and **container orchestration**. The goal is to create a robust and secure infrastructure using **Docker Compose**, running multiple services in isolated containers, with proper networking and persistent volumes.

---

## 🎯 Objectives
- Implement **containerization** using Docker.
- Create and manage **multi-service architecture**:
  - **NGINX** with SSL as reverse proxy.
  - **WordPress** with PHP-FPM.
  - **MariaDB** as the database.
  - **Redis** for caching.
  - **FTP Server** for file transfer.
  - **Static Website** hosted on NGINX.
  - **Portainer** for Docker management via web UI.
  - **Adminer** for database management through a browser.
- Ensure **secure configuration** and **persistent storage**.

---

## 🛠️ Services Overview
| Service       | Description                                         |
|--------------|-----------------------------------------------------|
| **NGINX**    | Reverse proxy with SSL for WordPress & static site  |
| **WordPress**| CMS running with PHP-FPM, connected to MariaDB      |
| **MariaDB**  | Relational database for WordPress                   |
| **Redis**    | In-memory cache for WordPress performance           |
| **FTP**      | File transfer access to WordPress files             |
| **Static Site**| Simple HTML/CSS website hosted on NGINX           |
| **Portainer**| Web UI for managing Docker environment              |
| **Adminer**  | Lightweight database management interface           |

---

## 🗂 Project Structure
```

Inception/
│
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   ├── requirements/
│   │   ├── nginx/
│   │   │   └── Dockerfile
│   │   ├── wordpress/
│   │   │   └── Dockerfile
│   │   ├── mariadb/
│   │   │   └── Dockerfile
│   │   ├── bonus/
│   │   │   ├── redis/
│   │   │   │   └── Dockerfile
│   │   │   ├── ftp/
│   │   │   │   └── Dockerfile
│   │   │   ├── website/
│   │   │   │   ├── Dockerfile
│   │   │   │   └── index.html
│   │   │   ├── portainer/
│   │   │   │   └── Dockerfile
│   │   │   └── adminer/
│   │   │       └── Dockerfile

````

---

## ✅ Requirements
- **Linux** OS (Debian/Ubuntu recommended)
- **Docker** ≥ 20.x  
- **Docker Compose** ≥ 2.x  
- Basic knowledge of:
  - Networking
  - Dockerfile and Compose

---

## ⚙️ Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/Geesama02/Inception.git
   cd Inception
    ````

2. **Set up environment variables** (`srcs/.env` && `secrets/*`):

   ```env
    DATABASE_NAME=mydb
    WORDPRESS_DB_HOST=mariadb
    WORDPRESS_URL=https://oait-laa.42.fr
    WORDPRESS_TITLE=Inception
    WORDPRESS_ADMIN_EMAIL=admin@gmail.com
    WORDPRESS_USER_EMAIL=random@gmail.com
   ```

3. **Build and start containers**:

   ```bash
   make
   ```

   *(or `docker-compose up --build`)*

---

## 🚀 Usage

* **WordPress**:
  `https://<your-domain>`
* **Static Website**:
  `https://<your-domain>:8000`
* **Portainer (Web UI)**:
  `http://<your-domain>:9000`
* **Adminer (DB management)**:
  `http://<your-domain>:8081`
* **FTP Access**:
  Use an FTP client with credentials from `secrets/`.

### Useful Commands:

* Stop containers:

  ```bash
  make down
  ```
* Clean all (containers, volumes, images):

  ```bash
  make fclean
  ```

---

## 📚 Resources

* [Docker Docs](https://docs.docker.com/)
* [Portainer](https://www.portainer.io/)
* [WordPress Docs](https://wordpress.org/support/)
* [NGINX Docs](https://nginx.org/en/docs/)
* [Redis Docs](https://redis.io/documentation)
* [Adminer Docs](https://www.adminer.org/)

---

