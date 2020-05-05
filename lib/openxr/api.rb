# This is free and unencumbered software released into the public domain.

require 'ffi'

module OpenXR::API
  extend FFI::Library
  ffi_lib ["libopenxr_loader.so.1", "openxr_loader"]

  ##
  # @see https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#api-version-numbers-and-semantics
  def self.XR_MAKE_VERSION(major, minor, patch)
    (((major.to_i & 0xffff) << 48) + ((minor.to_i & 0xffff) << 32) + (patch.to_i & 0xffffffff))
  end

  XR_CURRENT_API_VERSION = XR_MAKE_VERSION(1, 0, 8)

  XrVersion  = :uint64
  XrFlags64  = :uint64
  XrSystemId = :uint64
  XrBool32   = :uint32
  XrPath     = :uint64
  XrTime     = :int64
  XrDuration = :int64

  class XrInstance < FFI::Struct
    layout :handle, :pointer
  end

  class XrSession < FFI::Struct
    layout :handle, :pointer
  end

  class XrSpace < FFI::Struct
    layout :handle, :pointer
  end

  class XrAction < FFI::Struct
    layout :handle, :pointer
  end

  class XrSwapchain < FFI::Struct
    layout :handle, :pointer
  end

  class XrActionSet < FFI::Struct
    layout :handle, :pointer
  end

  XrResult                     = :int # enum
  XR_SUCCESS                   = 0
  XR_ERROR_VALIDATION_FAILURE  = -1
  XR_ERROR_RUNTIME_FAILURE     = -2
  XR_ERROR_HANDLE_INVALID      = -12

  XrStructureType              = :int # enum
  XR_TYPE_UNKNOWN              = 0
  XR_TYPE_API_LAYER_PROPERTIES = 1
  XR_TYPE_EXTENSION_PROPERTIES = 2
  XR_TYPE_INSTANCE_CREATE_INFO = 3

  XrInstanceCreateFlags = XrFlags64
  XrSessionCreateFlags  = XrFlags64

  class XrApplicationInfo < FFI::Struct
    layout :applicationName,       [:char, 128],
           :applicationVersion,    :uint32,
           :engineName,            [:char, 128],
           :engineVersion,         :uint32,
           :apiVersion,            XrVersion
  end

  class XrInstanceCreateInfo < FFI::Struct
    layout :type,                  XrStructureType,
           :next,                  :pointer,
           :createFlags,           XrInstanceCreateFlags,
           :applicationInfo,       XrApplicationInfo,
           :enabledApiLayerCount,  :uint32,
           :enabledApiLayerNames,  :string,
           :enabledExtensionCount, :uint32,
           :enabledExtensionNames, :string
  end

  attach_function :xrAcquireSwapchainImage, [:pointer, :pointer, :pointer], :int
  attach_function :xrApplyHapticFeedback, [:pointer, :pointer, :pointer], :int
  attach_function :xrAttachSessionActionSets, [:pointer, :pointer], :int
  attach_function :xrBeginFrame, [:pointer, :pointer], :int
  attach_function :xrBeginSession, [:pointer, :pointer], :int
  attach_function :xrCreateAction, [:pointer, :pointer, :pointer], :int
  attach_function :xrCreateActionSet, [:pointer, :pointer, :pointer], :int
  attach_function :xrCreateActionSpace, [:pointer, :pointer, :pointer], :int
  #attach_function :xrCreateDebugUtilsMessengerEXT, [:pointer, :pointer, :pointer], :int
  attach_function :xrCreateInstance, [:pointer, :pointer], :int
  attach_function :xrCreateReferenceSpace, [:pointer, :pointer, :pointer], :int
  attach_function :xrCreateSession, [:pointer, :pointer, :pointer], :int
  #attach_function :xrCreateSpatialAnchorMSFT, [:pointer, :pointer, :pointer], :int
  #attach_function :xrCreateSpatialAnchorSpaceMSFT, [:pointer, :pointer, :pointer], :int
  attach_function :xrCreateSwapchain, [:pointer, :pointer, :pointer], :int
  attach_function :xrDestroyAction, [:pointer], :int
  attach_function :xrDestroyActionSet, [:pointer], :int
  #attach_function :xrDestroyDebugUtilsMessengerEXT, [:pointer], :int
  attach_function :xrDestroyInstance, [:pointer], :int
  attach_function :xrDestroySession, [:pointer], :int
  attach_function :xrDestroySpace, [:pointer], :int
  #attach_function :xrDestroySpatialAnchorMSFT, [:pointer], :int
  attach_function :xrDestroySwapchain, [:pointer], :int
  attach_function :xrEndFrame, [:pointer, :pointer], :int
  attach_function :xrEndSession, [:pointer], :int
  attach_function :xrEnumerateApiLayerProperties, [:uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateBoundSourcesForAction, [:pointer, :pointer, :uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateEnvironmentBlendModes, [:pointer, :ulong_long, :int, :uint32, :pointer, :int], :int
  attach_function :xrEnumerateInstanceExtensionProperties, [:string, :uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateReferenceSpaces, [:pointer, :uint32, :pointer, :int], :int
  attach_function :xrEnumerateSwapchainFormats, [:pointer, :uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateSwapchainImages, [:pointer, :uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateViewConfigurationViews, [:pointer, :ulong_long, :int, :uint32, :pointer, :pointer], :int
  attach_function :xrEnumerateViewConfigurations, [:pointer, :ulong_long, :uint32, :pointer, :int], :int
  attach_function :xrGetActionStateBoolean, [:pointer, :pointer, :pointer], :int
  attach_function :xrGetActionStateFloat, [:pointer, :pointer, :pointer], :int
  attach_function :xrGetActionStatePose, [:pointer, :pointer, :pointer], :int
  attach_function :xrGetActionStateVector2f, [:pointer, :pointer, :pointer], :int
  attach_function :xrGetCurrentInteractionProfile, [:pointer, :ulong_long, :pointer], :int
  attach_function :xrGetInputSourceLocalizedName, [:pointer, :pointer, :uint32, :pointer, :string], :int
  attach_function :xrGetInstanceProcAddr, [:pointer, :string, :pointer], :int
  attach_function :xrGetInstanceProperties, [:pointer, :pointer], :int
  attach_function :xrGetReferenceSpaceBoundsRect, [:pointer, :int, :pointer], :int
  attach_function :xrGetSystem, [:pointer, :pointer, :pointer], :int
  attach_function :xrGetSystemProperties, [:pointer, :ulong_long, :pointer], :int
  attach_function :xrGetViewConfigurationProperties, [:pointer, :ulong_long, :int, :pointer], :int
  #attach_function :xrGetVisibilityMaskKHR, [:pointer, :int, :uint32, :int, :pointer], :int
  attach_function :xrLocateSpace, [:pointer, :pointer, :long_long, :pointer], :int
  attach_function :xrLocateViews, [:pointer, :pointer, :pointer, :uint32, :pointer, :pointer], :int
  attach_function :xrPathToString, [:pointer, :ulong_long, :uint32, :pointer, :string], :int
  #attach_function :xrPerfSettingsSetPerformanceLevelEXT, [:pointer, :int, :int], :int
  attach_function :xrPollEvent, [:pointer, :pointer], :int
  attach_function :xrReleaseSwapchainImage, [:pointer, :pointer], :int
  attach_function :xrRequestExitSession, [:pointer], :int
  attach_function :xrResultToString, [:pointer, :int, :pointer], :int
  #attach_function :xrSessionBeginDebugUtilsLabelRegionEXT, [:pointer, :pointer], :int
  #attach_function :xrSessionEndDebugUtilsLabelRegionEXT, [:pointer], :int
  #attach_function :xrSessionInsertDebugUtilsLabelEXT, [:pointer, :pointer], :int
  #attach_function :xrSetDebugUtilsObjectNameEXT, [:pointer, :pointer], :int
  #attach_function :xrSetInputDeviceActiveEXT, [:pointer, :ulong_long, :ulong_long, :uint], :int
  #attach_function :xrSetInputDeviceLocationEXT, [:pointer, :ulong_long, :ulong_long, :pointer, :pointer], :int
  #attach_function :xrSetInputDeviceStateBoolEXT, [:pointer, :ulong_long, :ulong_long, :uint], :int
  #attach_function :xrSetInputDeviceStateFloatEXT, [:pointer, :ulong_long, :ulong_long, :float], :int
  #attach_function :xrSetInputDeviceStateVector2fEXT, [:pointer, :ulong_long, :ulong_long, :pointer], :int
  attach_function :xrStopHapticFeedback, [:pointer, :pointer], :int
  attach_function :xrStringToPath, [:pointer, :string, :pointer], :int
  attach_function :xrStructureTypeToString, [:pointer, :int, :pointer], :int
  #attach_function :xrSubmitDebugUtilsMessageEXT, [:pointer, :ulong_long, :ulong_long, :pointer], :int
  attach_function :xrSuggestInteractionProfileBindings, [:pointer, :pointer], :int
  attach_function :xrSyncActions, [:pointer, :pointer], :int
  #attach_function :xrThermalGetTemperatureTrendEXT, [:pointer, :int, :int, :pointer, :pointer], :int
  attach_function :xrWaitFrame, [:pointer, :pointer, :pointer], :int
  attach_function :xrWaitSwapchainImage, [:pointer, :pointer], :int
end # OpenXR::API
