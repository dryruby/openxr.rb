# This is free and unencumbered software released into the public domain.

require_relative 'api'
require_relative 'error'

class OpenXR::Instance
  include OpenXR::API

  ##
  # @param  [String, #to_s]  app_name
  # @param  [Integer, #to_i] app_version
  # @param  [Integer, #to_i] api_version
  def initialize(app_name, app_version: nil, api_version: nil)
    @struct = XrInstance.new

    request = XrInstanceCreateInfo.new
    request[:type] = XR_TYPE_INSTANCE_CREATE_INFO
    request[:next] = nil
    request[:createFlags] = 0
    request[:applicationInfo][:applicationName] = app_name.to_s
    request[:applicationInfo][:applicationVersion] = (app_version || 0).to_i
    request[:applicationInfo][:engineName] = "OpenXR.rb"
    request[:applicationInfo][:engineVersion] = 0
    request[:applicationInfo][:apiVersion] = (api_version || XR_CURRENT_API_VERSION).to_i

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrcreateinstance3
    case result = xrCreateInstance(request, @struct)
      when XR_SUCCESS
      else raise Error.new(result, :xrCreateInstance) # TODO
    end
  end

  ##
  # @return [void]
  def destroy!
    return if @struct.nil?
    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrdestroyinstance3
    case result = xrDestroyInstance(@struct[:handle])
      when XR_SUCCESS then @struct = nil
      when XR_ERROR_HANDLE_INVALID then raise Error::HandleInvalid.new(:xrDestroyInstance)
      else raise Error.new(result, :xrDestroyInstance) # unreachable
    end
  end
end # OpenXR::Instance
