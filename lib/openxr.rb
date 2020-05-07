# This is free and unencumbered software released into the public domain.

module OpenXR; end

require_relative 'openxr/abi'
require_relative 'openxr/api'

require_relative 'openxr/action'
require_relative 'openxr/action_set'
require_relative 'openxr/extension'
require_relative 'openxr/handle'
require_relative 'openxr/instance'
require_relative 'openxr/layer'
require_relative 'openxr/result'
require_relative 'openxr/session'
require_relative 'openxr/space'
require_relative 'openxr/swapchain'
require_relative 'openxr/system'
require_relative 'openxr/version'

module OpenXR
  ##
  # @return [Boolean]
  def self.has_layers?
    nil # TODO
  end

  ##
  # @return [Boolean]
  def self.has_extensions?
    !!(Extension.count.nonzero?)
  end
end # OpenXR
