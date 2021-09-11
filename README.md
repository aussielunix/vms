# VMS

An opinionated and simple cli suite for creating and destroying VMs, in my homelab, from cloud images and cloud-init with libvirt and KVM.  

## Why did I build this

The whole libvirt/kvm/qemu ecosystem is quite flexible and powerful. It, like
many long running opensource ecosystems, suffers from a huge amount of old, out
of date documentation on the internet.

I needed a simple way to spin VMs up and down in my homelab without having to
search for the various commands and nuances for each guest OS type.

## Dependencies

* a Linux based host running libvirt and kvm
* ability to resolve static dns for new VMs (I switched off the libvirt/dnsmasq integration)
* a user that is in the `libvirt` group
* jq, virsh, virt-install and qemu-img installed and available in the $PATH

## Opinions

I built this for my homelab to be able to simply spin up and down VMs.

* public cloud images in qcow2 format
* cloud-init (not available for editing before creating a VM)
* static IP bridged to local lan
* new standalone qcow2 image per VM

This is only tested with the following combination:

* Single, Ubuntu 20.04 (x86_64) server install as a KVM host
* a single NIC bridged to the local LAN
* directory based storage volume pools

**Note:** I built my homelab with [aussielunix/vmlab](https://github.com/aussielunix/vmlab) (coming soon)

## Installation

Run the following and further, optional instructions will follow.

```bash
bin/vms init
```

## Usage

`vms` is a cli suite with sub commands. It has documentation and command completion built in to help you learn about all the options and their defaults.  

```bash
[user@vm]  (main) -> vms commands
[user@vm]  (main) -> vms help
[user@vm]  (main) -> vms help new
```

To get a new Ubuntu Focal (20.04 LTS) server VM with a static IP of `192.168.20.77` using the sane defaults for all other options:

```bash
[user@vm]  (main) -> vms new -n mynewvm -i 77
Creating new ubuntu20.04 VM - mynewvm
Type virsh console mynewvm to see when it is finished being created.
```

To get a new CentOS 8 server VM with a static IP of `192.168.20.78` using the sane defaults for all other options:

```bash
[user@vm]  (main) -> vms new -n mynewvm -i 78 -o centos8
Creating new centos8 VM - mynewvm
Type virsh console mynewvm to see when it is finished being created.
```

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/aussielunix/vms).  

* Fork this repository
* Create a branch: `git checkout -b <branch_name>`
* Push your branch: `git push -u origin <branch_name>`
* Create a pull request with `WIP` at the start of the subject
* Make your changes and commit them: git commit -m '<commit_message>'
* Push to your branch: `git push`
* Edit pull request and remove `WIP` from the title and comment it is ready for review

## Contributors

Thanks to the following people who have contributed to this project:

* [@aussielunix](https://aussielunix.io) 🤠

## Credit

This command suite was built quickly using the great [sub](https://github.com/qrush/sub).

## License

The is available as open source under the terms of the [MIT License](LICENSE).
