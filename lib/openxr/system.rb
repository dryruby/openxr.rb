# This is free and unencumbered software released into the public domain.

require_relative 'api'

##
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#system
class OpenXR::System
  include OpenXR::API

  ##
  # @param  [Instance] instance
  # @param  [XrFormFactor, #to_i] form_factor
  # @return [System]
  # @see    https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#form_factor_description
  def self.for_form_factor(instance, form_factor)
    request = XrSystemGetInfo.new
    request[:base][:type] = XR_TYPE_SYSTEM_GET_INFO
    request[:formFactor] = form_factor.to_i
    system_id = FFI::MemoryPointer.new(XrSystemId)

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrgetsystem3
    case result = xrGetSystem(instance.handle, request, system_id)
      when XR_SUCCESS then self.new(system_id.read(XrSystemId))
      #when XR_ERROR_FORM_FACTOR_UNAVAILABLE then # TODO
      else raise OpenXR::Error.new(result, :xrGetSystem)
    end
  end

  ##
  # @return [API::XrSystemId]
  attr_reader :id

  ##
  # @param  [API::XrSystemId, #to_i] id
  def initialize(id)
    @id = id.to_i
  end
end # OpenXR::System
