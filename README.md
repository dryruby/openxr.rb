OpenXR for Ruby
===============

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![RubyGems gem](https://img.shields.io/gem/v/openxr.svg)](https://rubygems.org/gems/openxr)
[![Ruby compatibility](https://img.shields.io/badge/ruby-2.7%2B-red)](https://rubygems.org/gems/openxr)

**OpenXR.rb** implements Ruby bindings for [OpenXR](https://www.khronos.org/openxr/)
[1.0](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html),
the open standard and cross-platform API for virtual reality (VR) and
augmented reality (AR) hardware.

Installation
------------

    $ gem install openxr

Prerequisites
-------------

- [Ruby](https://www.ruby-lang.org/en/) 2.7+
  with [FFI](https://github.com/ffi/ffi/wiki)

- [OpenXR SDK](https://github.com/KhronosGroup/OpenXR-SDK) 1.0.8+

Examples
--------

### Loading the library

    require 'openxr'

### Listing extensions

    OpenXR::Extension.each do |extension|
      puts [extension.name, extension.version].join("\t")
    end

### Creating an instance

    OpenXR::Instance.create($0) do |instance|
      ...
    end

Development
-----------

We recommend Debian 11 (aka [Bullseye](https://www.debian.org/releases/bullseye/))
as a development environment. If you're on a Mac, you can run Debian in a
virtual machine using [VMware Fusion](https://www.vmware.com/products/fusion.html)
or [VirtualBox](https://www.virtualbox.org).

Install the Debian packages for the OpenXR SDK's loader as follows:

    $ apt install libopenxr-loader1

That's the only required package, but find related packages of interest using:

    $ apt search openxr

In addition, you _will_ need an OpenXR runtime for your hardware. In the
absence of suitable vendor-supplied runtimes, have a look at the open-source
[Monado](https://monado.freedesktop.org) project which supports many common
devices.

See Also
--------

- [OpenXR.py](https://github.com/drypy/openxr.py):
  OpenXR bindings for Python.

- [OpenXR.dart](https://github.com/drydart/openxr.dart):
  OpenXR bindings for Dart & Flutter.

- [Unofficial OpenXR Tests](https://github.com/artob/openxr-rspec):
  An unofficial OpenXR conformance test suite.
