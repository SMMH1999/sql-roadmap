# Install PostgreSQL

This project uses **PostgreSQL** as the main relational database.

Follow the steps below to install it on your system.

---

## 1. Download PostgreSQL

Go to the official website:

- https://www.postgresql.org/download/

Choose your operating system:

- **Windows**
- **macOS**
- **Linux (Ubuntu / Debian / etc.)**

---

## 2. Windows Installation (Recommended Settings)

1. Download the Windows installer (usually from EnterpriseDB).
2. Run the installer.
3. Keep the default components:
   - PostgreSQL Server
   - pgAdmin
   - Command Line Tools
4. Choose an installation directory (default is fine).
5. Set a password for the `postgres` superuser.
   - Remember this password. You will need it later.
6. Leave the default port: `5432`.
7. Complete the installation.

---

## 3. macOS Installation

You have two main options:

### Option A — Official Installer

1. Go to https://www.postgresql.org/download/macosx/
2. Download the recommended installer.
3. Run the installer and follow the steps.
4. Set a password for the `postgres` user.
5. Keep the default port: `5432`.

### Option B — Homebrew (if you use Homebrew)

```bash
brew update
brew install postgresql
brew services start postgresql
