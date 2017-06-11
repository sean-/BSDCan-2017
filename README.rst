Universal Userland
==================

Why do we need to be different?
-------------------------------

`Universal Userland Slides <https://www.slideshare.net/SeanChittenden/universal-userland>`__

Walk through replacing the |FreeBSD|_ user land utilities from two different
sets: a |go|_-based user land |go-coreutils|_ (GPLv3) and more interesting a
|rust|_-based implementation of |rs-coreutils|_ (MIT licensed). Why bother?
What's interesting? What can be learned from non-C based user land utilities?

One of the things that irritates me is moving between operating systems and
having my userland change. Both the layout, but most certainly the actual
utilities themselves. In this talk I want to poke at the sacred cow and
universally held belief that builtin utilities must be written in C and that
they are operating system specific. What are the security benefits? What about
the performance benefits? How do you package up a different userland
effectively? Can the |FreeBSD|_ community partner with other OSes and
distributions that also want a modern user land?

Getting Started
---------------

::

    $ cd ~/src/FreeBSD/
    $ git clone https://github.com/sean-/BSDCan-2017.git
    $ mkdir BSDCan-2017/rustbsd
    $ cd BSDCan-2017

1. Install |rst2pdf|_::

    $ make install-rst2pdf
    $ source bin/activate || source bin/activate.csh

2. Install |cfgt|_::

    $ make install-cfgt

3. Install |envchain|_
4. Show the public datacenters::

    $ make triton-public-dcs
    triton datacenters
    NAME       URL
    eu-ams-1   https://eu-ams-1.api.joyentcloud.com
    us-east-1  https://us-east-1.api.joyentcloud.com
    us-east-2  https://us-east-2.api.joyentcloud.com
    us-east-3  https://us-east-3.api.joyentcloud.com
    us-sw-1    https://us-sw-1.api.joyentcloud.com
    us-west-1  https://us-west-1.api.joyentcloud.com

5. Configure an |envchain|_ namespace for |triton|_::

    $ envchain -s triton SDC_URL
    triton.SDC_URL: https://us-west-1.api.joyentcloud.com
    $ envchain -s triton SDC_ACCOUNT
    triton.SDC_ACCOUNT: ${USER}
    $ envchain -s triton SDC_KEY_ID
    triton.SDC_URL: https://us-east-3.api.joyentcloud.com

6. Build a |FreeBSD|_ image with |go|_ userland utilities::

    $ make packer-build TEMPLATE=freebsd-userland-go.json EXTRA_ARGS=-on-error=abort

7. Build a |FreeBSD|_ image with Rust userland utilities::

    $ make packer-build TEMPLATE=freebsd-userland-go.json EXTRA_ARGS=-on-error=abort

Helper Targets
--------------

::

    $ make help
    Valid targets:
    apply           Applies a given Terraform plan
    clean           Clean virtualenv
    env             Show local environment variables
    fmt             Format Terraform files inline
    install-cfgt    Install cfgt(1)
    install-rst2pdf Install rst2pdf in a local virtualenv
    json-config     Show the config as a JSON file
    packer-build    Build a FreeBSD image
    plan-target     Plan a Terraform run against a specific target
    plan            Plan a Terraform run
    show            Show the Terraform state
    taint           Taints a given resource
    triton-dcs      Show Triton Datacenters
    triton-freebsd-images Show all FreeBSD images on Triton
    triton-instances Show all running instances on Triton
    triton-my-images Show my Triton images
    triton-networks Show Triton networks
    triton-packages Show Triton Packages
    triton-public-dcs Show Public Triton Datacenters
    triton-ssh      SSH to a given target on Triton

.. |cfgt| replace:: ``cfgt(1)``
.. _cfgt: https://github.com/sean-/cfgt
.. |envchain| replace:: ``envchain``
.. _envchain: https://github.com/sorah/envchain
.. |FreeBSD| replace:: FreeBSD
.. _FreeBSD: https://www.FreeBSD.org/
.. |gmake| replace:: GNU ``make(1)``
.. _gmake: https://www.gnu.org/software/make/
.. |go| replace:: Go
.. _go: https://www.golang.org/
.. |go-coreutils| replace:: ``go-coreutils``
.. _go-coreutils: https://github.com/aisola/go-coreutils
.. |JSON5| replace:: JSON5
.. _JSON5: http://www.json5.org/
.. |packer| replace:: ``Packer``
.. _packer: https://www.packer.io/
.. |pip| replace:: ``pip(1)``
.. _pip: https://pypi.python.org/pypi/pip
.. |reST| replace:: ``reST``
.. _reST: http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html
.. |rs-coreutils| replace:: ``rs-coreutils``
.. _rs-coreutils: https://github.com/uutils/coreutils
.. |rst2pdf| replace:: ``rst2pdf``
.. _rst2pdf: https://github.com/rst2pdf/rst2pdf
.. |rust| replace:: ``Rust``
.. _rust: https://www.rust-lang.org/
.. |triton| replace:: Triton
.. _triton: https://www.joyent.com/triton/
.. |vagrant| replace:: ``Vagrant``
.. _vagrant: https://www.vagrantup.com/
.. |VirtualBox| replace:: VirtualBox
.. _VirtualBox: https://www.virtualbox.org/
.. |virtualenv| replace:: ``virtualenv(1)``
.. _virtualenv: https://pypi.python.org/pypi/virtualenv
.. |VMware Fusion| replace:: VMware Fusion
.. _VMware Fusion: https://www.vmware.com/products/fusion.html
