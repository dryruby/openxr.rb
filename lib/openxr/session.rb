# This is free and unencumbered software released into the public domain.

require_relative 'api'
require_relative 'handle'
require_relative 'result'

##
# An OpenXR session handle.
#
# @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#session
class OpenXR::Session < OpenXR::Handle
  extend OpenXR::API
  include OpenXR::API

  # @return [Instance]
  attr_reader :instance

  # @return [System]
  attr_reader :system

  ##
  # @param  [System]
  # @param  [XrGraphicsBinding] graphics_binding
  # @raise  [Result::Error] if `xrCreateSession` failed
  def initialize(system, graphics_binding = nil)
    @instance = system.instance
    @system   = system
    @struct   = XrSession.new

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrsessioncreateinfo3
    request = XrSessionCreateInfo.new
    request[:base][:next] = graphics_binding
    request[:createFlags] = 0
    request[:systemId] = system.id

    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrcreatesession3
    case result = xrCreateSession(instance.handle, request, @struct)
      when XR_SUCCESS
      else raise OpenXR::Result.for(result).new(:xrCreateSession)
    end
  end

  #
  # @return [FFI::Pointer]
  def handle
    @struct[:handle]
  end

  ##
  # @return [void]
  # @raise  [Result::Error] if `xrDestroySession` failed
  def destroy!
    return if @struct.nil?
    # https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html#_xrdestroysession3
    case result = xrDestroySession(@struct[:handle])
      when XR_SUCCESS then @struct = nil
      else raise OpenXR::Result.for(result).new(:xrDestroySession) # unreachable
    end
  end
end # OpenXR::Session
