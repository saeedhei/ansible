# Helm Ansible Role

This Ansible role installs **Helm 3** on Ubuntu 22 using the **official keyring-based APT repository**.

It is designed to be:
- **Production-ready**
- Fully **idempotent**
- Secure (GPG signed)
- Simple and maintainable

---

## Requirements

- Ubuntu 22.04 (Jammy)
- Root privileges (`become: true`)
- A working internet connection to access the Helm repository

---

## Role Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `helm_package_name` | `helm` | The package name to install via apt |
| `helm_repo_url` | `https://packages.buildkite.com/helm-linux/helm-debian/any/` | Helm APT repository URL |
| `helm_gpg_key_url` | `https://packages.buildkite.com/helm-linux/helm-debian/gpgkey` | URL to download Helm GPG key |
| `helm_list_file` | `/etc/apt/sources.list.d/helm-stable-debian.list` | Location of the apt source list |
| `helm_keyring` | `/usr/share/keyrings/helm.gpg` | Path to store the GPG key |

---

## Usage

```yaml
- hosts: control_plane
  become: true
  roles:
    - helm
