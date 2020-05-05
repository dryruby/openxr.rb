OpenXR Bindings for Ruby
========================

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![RubyGems gem version](https://img.shields.io/gem/v/openxr.svg)](https://rubygems.org/gems/openxr)

Installation
------------

    $ gem install openxr

Prerequisites
-------------

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
