# This is free and unencumbered software released into the public domain.

require_relative 'api'

##
# An OpenXR handle.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#handles
class OpenXR::Handle
  ##
  # @return [void]
  def destroy!
    # subclasses MUST implement this
  end
end # OpenXR::Handle
