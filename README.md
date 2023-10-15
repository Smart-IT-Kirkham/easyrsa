![OpenVPN Logo](./.assets/openvpn_logo.png)
# Docker Container for EasyRSA

An Alpine based image that provides an EasyRSA Certificate Authority.

## Usage

This does not run as a spawned background task. The container is merely a repository for the EasyRSA program. This makes it transportable in that you will be able to have a pki store uniquely for any other usage rather than a single pki store per host.

You can then use this on a container by container need for deploying certificates.

Modify the `vars` file to suit your environment. The only change made here is to fix the location of the pki store to `/easyrsa/pki` so it matches the mount point.

**There is one point of note - you cannot use `easyrsa init-pki`.**

Because the `pki` store is mounted you cannot use the argument `init-pki`, `easyrsa init-pki` needs the ability to remove the `pki` folder using `rm -rf` and recreate it. It cannot do this with a mounted `pki` folder. If you need to reset your pki, just provide the host with an empty `./pki` folder, or delete it and continue the process of `build-ca`.

The delivery of `easyrsa` is carried out using a `wget` of version 3.0.8. This is then placed into `/usr/local/bin` just to have it included in the PATH.

### docker-compose.yml

```yaml
version: '3.2'

services:
  easyrsa:
    build: build
    volumes:
      - "${PWD}/vars:/usr/local/bin/vars:ro"
      - "${PWD}/pki/:/easyrsa/pki/:rw"
```

First Usage

```shell
docker-compose build
mkdir -p pki/{private,reqs}
docker-compose run --rm easyrsa easyrsa build-ca
```

### Guide

[https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md](https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md)
