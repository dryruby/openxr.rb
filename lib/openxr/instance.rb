# This is free and unencumbered software released into the public domain.

require_relative 'api'
require_relative 'handle'
require_relative 'result'

##
# An OpenXR instance handle.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#instance
class OpenXR::Instance < OpenXR::Handle
  include OpenXR::API

  ##
  # @param  [String, #to_s]  app_name
  # @param  [Integer, #to_i] app_version
  # @param  [Integer, #to_i] api_version
  # @yield  [instance]
  # @return [Object]
  def self.create(app_name, app_version: nil, api_version: nil, &block)
    instance = self.new(app_name, app_version: app_version, api_version: api_version)
    begin
      block.call(instance) if block_given?
    ensure
      instance&.destroy!
    end
  end

  ##
  # @param  [String, #to_s]  app_name
  # @param  [Integer, #to_i] app_version
  # @param  [Integer, #to_i] api_version
  # @raise  [Result::Error] if `xrCreateInstance` failed
  def initialize(app_name, app_version: nil, api_version: nil)
    @struct = XrInstance.new

    request = XrInstanceCreateInfo.new
    request[:base][:type] = XR_TYPE_INSTANCE_CREATE_INFO
    request[:base][:next] = nil
    request[:createFlags] = 0
    request[:applicationInfo][:applicationName] = app_name.to_s
    request[:applicationInfo][:applicationVersion] = (app_version || 0).to_i
    request[:applicationInfo][:engineName] = "OpenXR.rb"
    request[:applicationInfo][:engineVersion] = 0
    request[:applicationInfo][:apiVersion] = (api_version || XR_CURRENT_API_VERSION).to_i

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrcreateinstance3
    case result = xrCreateInstance(request, @struct)
      when XR_SUCCESS
      else raise OpenXR::Result.for(result).new(:xrCreateInstance)
    end
  end

  #
  # @return [FFI::Pointer]
  def handle
    @struct[:handle]
  end

  ##
  # @return [void]
  # @raise  [Result::Error] if `xrDestroyInstance` failed
  def destroy!
    return if @struct.nil?
    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrdestroyinstance3
    case result = xrDestroyInstance(@struct[:handle])
      when XR_SUCCESS then @struct = nil
      else raise OpenXR::Result.for(result).new(:xrDestroyInstance) # unreachable
    end
  end
end # OpenXR::Instance
