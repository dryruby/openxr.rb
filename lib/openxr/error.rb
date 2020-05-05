# This is free and unencumbered software released into the public domain.

require_relative 'api'

class OpenXR::Error < StandardError
  include OpenXR::API

  attr_reader :result

  def initialize(result, function)
    @result = result
    super("#{function} returned #{result}")
  end

  class HandleInvalid < OpenXR::Error
    def initialize(function)
      super(XR_ERROR_HANDLE_INVALID, function)
    end
  end
end # OpenXR::Error
