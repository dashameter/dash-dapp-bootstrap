
# Dash Dapp Bootstrap

Get up an running with local Dash evolution / platform development in an instant. Once installed you will have a running `mn-boostrap` node with a miner configured to feed the [autofaucet](https://github.com/dashameter/dash-dapp-autofaucet). [Console](https://github.com/dashameter/dash-platform-console),[EvoWallet](https://github.com/dashameter/evowallet) and [Jembe](https://github.com/dashameter/jembe) will be up and running with their data contracts registered and pointing at the local dev node.

## Run Using Docker Compose

[Docker Compose](https://docs.docker.com/compose/install/)

#### Run Using Docker Compose

```bash
$ docker-compose -f docker-compose.yml up -d
$ docker exec -it dash-dapp-bootstrap /bin/bash
$ ./install-bundle-local.sh
```

#### Your apps will run at:

Autofaucet: http://127.0.0.1:5050/drip/[address]

Console: http://127.0.0.1:8080

EvoWallet: http://127.0.0.1:3330

Jembe: http://127.0.0.1:3331

## Run Using Multipass

The virtual machine is spun up using [Multipass](https://multipass.run/docs)

#### Run

```bash
$ ./install-bundle-vm.sh
```

#### Your apps will run at:

Autofaucet: http://[VM_IP]:5050/drip/[address]

Console: http://[VM_IP]:8080

EvoWallet: http://[VM_IP]:3330

Jembe: http://[VM_IP]:3331


## Run Locally ( Without VM )

#### Run

```bash
$ ./install-bundle-local.sh
```

to install the dev dependencies locally. Enter `sudo` password when prompted to allow installing dependencies using `apt`.

You can of course install the bundle in the virtual machine and clone and run certain dapps locally. They will already point at `mn-bootstrap` and `Autofaucet` inside the VM.

#### Your local apps will run at:

Autofaucet: http://127.0.0.1:5050/drip/[address]

Console: http://127.0.0.1:8080

EvoWallet: http://127.0.0.1:3330

Jembe: http://127.0.0.1:3331
