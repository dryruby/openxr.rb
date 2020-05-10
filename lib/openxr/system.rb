# This is free and unencumbered software released into the public domain.

require_relative 'api'
require_relative 'result'

##
# An OpenXR system.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#system
class OpenXR::System
  extend OpenXR::API
  include OpenXR::API

  ##
  # @param  [Instance] instance
  # @param  [XrFormFactor, #to_i] form_factor
  # @return [System] if the form factor is supported
  # @raise  [Result::Error] if `xrGetSystem` failed
  # @see    https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#form_factor_description
  def self.for_form_factor(instance, form_factor)
    request = XrSystemGetInfo.new
    request[:formFactor] = form_factor.to_i
    system_id = FFI::MemoryPointer.new(XrSystemId)

    begin
      # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrgetsystem3
      case result = xrGetSystem(instance.handle, request, system_id)
        when XR_SUCCESS then self.new(instance, system_id.read(XrSystemId))
        when XR_ERROR_FORM_FACTOR_UNAVAILABLE then nil
        else raise OpenXR::Result.for(result).new(:xrGetSystem)
      end
    ensure
      system_id&.free
    end
  end

  # @return [Instance]
  attr_reader :instance

  # @return [API::XrSystemId]
  attr_reader :id

  # @return [String]
  attr_reader :name

  # @return [Integer]
  attr_reader :vendor_id

  # @return [Hash<Symbol, Integer>]
  attr_reader :graphics_properties

  # @return [Hash<Symbol, Bool>]
  attr_reader :tracking_properties

  ##
  # @param  [Instance] instance
  # @param  [API::XrSystemId, #to_i] id
  # @raise  [Result::Error] if `xrGetSystemProperties` failed
  def initialize(instance, id)
    @instance = instance
    @id = id.to_i

    response = XrSystemProperties.new

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrgetsystemproperties3
    case result = xrGetSystemProperties(@instance.handle, @id, response)
      when XR_SUCCESS
        @name = response[:systemName].to_s
        @vendor_id = response[:vendorId]
        @graphics_properties = {
          :max_swapchain_image_height => response[:graphicsProperties][:maxSwapchainImageHeight],
          :max_swapchain_image_width => response[:graphicsProperties][:maxSwapchainImageWidth],
          :max_layer_count => response[:graphicsProperties][:maxLayerCount],
        }
        @tracking_properties = {
          :orientation_tracking => response[:trackingProperties][:orientationTracking] == XR_TRUE,
          :position_tracking    => response[:trackingProperties][:positionTracking] == XR_TRUE,
        }
      else raise OpenXR::Result.for(result).new(:xrGetSystemProperties)
    end
  end
end # OpenXR::System
