# This is free and unencumbered software released into the public domain.

require_relative 'api'
require_relative 'result'

require 'ffi'

##
# An OpenXR instance extension.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#extensions
class OpenXR::Extension < Struct.new(:name, :version)
  extend OpenXR::API
  include OpenXR::API

  ##
  # @return [Integer]
  def self.count
    response = FFI::MemoryPointer.new(:uint32)
    begin
      # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrenumerateinstanceextensionproperties3
      case result = xrEnumerateInstanceExtensionProperties(nil, 0, response, nil)
        when XR_SUCCESS then response.read(:uint32)
        else raise OpenXR::Result.new(result, :xrEnumerateInstanceExtensionProperties)
      end
    ensure
      response&.free
    end
  end

  ##
  # @yield  [extension]
  # @return [Enumerator]
  def self.each(&block)
    return self.to_enum(:each) unless block_given?
    self.list.each(&block)
  end

  ##
  # @return [Array<Extension>]
  def self.list
    self.query.values
  end

  ##
  # @return [Hash<Symbol, Extension>]
  def self.query
    request_count  = self.count
    response_count = FFI::MemoryPointer.new(:uint32)
    response_array = FFI::MemoryPointer.new(XrExtensionProperties, request_count)
    begin
      request_count.times do |i|
        XrExtensionProperties.new(response_array[i]).set_type!
      end

      # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrenumerateinstanceextensionproperties3
      case result = xrEnumerateInstanceExtensionProperties(nil, request_count, response_count, response_array)
        when XR_SUCCESS
          response_count.read(:uint32).times.inject({}) do |available, i|
            response = XrExtensionProperties.new(response_array[i])
            extension_name = response[:extensionName].to_s.to_sym
            extension_version = response[:extensionVersion]
            available[extension_name] = self.new(extension_name, extension_version)
            available
          end
        else raise OpenXR::Result.new(result, :xrEnumerateInstanceExtensionProperties)
      end
    ensure
      response_array&.free
      response_count&.free
    end
  end
end # OpenXR::Extension
