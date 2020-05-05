OpenXR Bindings for Ruby
========================

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
