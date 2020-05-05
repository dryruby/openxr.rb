# Configure the OpenXR loader to default to the Monado runtime:
ENV['XR_RUNTIME_JSON'] ||= '/usr/local/share/openxr/1/openxr_monado.json'

require_relative 'lib/openxr'

include OpenXR
