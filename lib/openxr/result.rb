# This is free and unencumbered software released into the public domain.

require_relative 'api'

##
# An OpenXR result code.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#return-codes
class OpenXR::Result < StandardError
  include OpenXR::API

  attr_reader :result

  def initialize(result, function)
    @result = result
    super("#{function} returned #{result}")
  end

  class HandleInvalid < OpenXR::Result
    def initialize(function)
      super(XR_ERROR_HANDLE_INVALID, function)
    end
  end
end # OpenXR::Result
