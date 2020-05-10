# This is free and unencumbered software released into the public domain.

require_relative 'api'

##
# An OpenXR result code.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#return-codes
class OpenXR::Result < StandardError
  include OpenXR::API

  # @return [Integer]
  attr_reader :result

  # @return [Symbol]
  attr_reader :function

  ##
  # @param  [Integer] result
  # @return [Class]
  def self.for(result)
    case result
      # https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#fundamentals-successcodes
      when XR_SUCCESS then Success
      when XR_TIMEOUT_EXPIRED then Success
      when XR_SESSION_LOSS_PENDING then Success
      when XR_EVENT_UNAVAILABLE then Success
      when XR_SPACE_BOUNDS_UNAVAILABLE then Success
      when XR_SESSION_NOT_FOCUSED then Success
      when XR_FRAME_DISCARDED then Success
      # https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#fundamentals-errorcodes
      when XR_ERROR_HANDLE_INVALID then HandleInvalid
      #when XR_ERROR_FORM_FACTOR_UNAVAILABLE then # TODO
      else self
    end
  end

  ##
  # @param  [Integer, #to_i] result
  # @param  [Symbol] function
  def initialize(result, function = nil)
    @result = result.to_i
    @function = function
    super(@function ? "#{@function} returned #{@result}" : @result.to_s)
  end

  class Success < OpenXR::Result; end

  class Error < OpenXR::Result; end

  class HandleInvalid < Error
    ##
    # @param  [Symbol] function
    def initialize(function = nil)
      super(XR_ERROR_HANDLE_INVALID, function)
    end
  end
end # OpenXR::Result
