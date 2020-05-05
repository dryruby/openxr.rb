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

  XR_TRUE                               = 1
  XR_FALSE                              = 0
  XR_MAX_EXTENSION_NAME_SIZE            = 128
  XR_MAX_API_LAYER_NAME_SIZE            = 256
  XR_MAX_API_LAYER_DESCRIPTION_SIZE     = 256
  XR_MAX_SYSTEM_NAME_SIZE               = 256
  XR_MAX_APPLICATION_NAME_SIZE          = 128
  XR_MAX_ENGINE_NAME_SIZE               = 128
  XR_MAX_RUNTIME_NAME_SIZE              = 128
  XR_MAX_PATH_LENGTH                    = 256
  XR_MAX_STRUCTURE_NAME_SIZE            = 64
  XR_MAX_RESULT_STRING_SIZE             = 64
  XR_MIN_COMPOSITION_LAYERS_SUPPORTED   = 16
  XR_MAX_ACTION_SET_NAME_SIZE           = 64
  XR_MAX_LOCALIZED_ACTION_SET_NAME_SIZE = 128
  XR_MAX_ACTION_NAME_SIZE               = 64
  XR_MAX_LOCALIZED_ACTION_NAME_SIZE     = 128

  XrResult                              = :int # enum
  XR_SUCCESS                            = 0
  XR_ERROR_VALIDATION_FAILURE           = -1
  XR_ERROR_RUNTIME_FAILURE              = -2
  XR_ERROR_HANDLE_INVALID               = -12

  XrStructureType                       = :int # enum
  XR_TYPE_UNKNOWN                       = 0
  XR_TYPE_API_LAYER_PROPERTIES          = 1
  XR_TYPE_EXTENSION_PROPERTIES          = 2
  XR_TYPE_INSTANCE_CREATE_INFO          = 3

  XrFormFactor                          = :int # enum
  XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY   = 1
  XR_FORM_FACTOR_HANDHELD_DISPLAY       = 2
  XR_FORM_FACTOR_MAX_ENUM               = 0x7FFFFFFF

  XrInstanceCreateFlags = XrFlags64
  XrSessionCreateFlags  = XrFlags64

  class XrBaseStructure < FFI::Struct
    layout :type,                    XrStructureType,
           :next,                    :pointer
  end

  class XrApiLayerProperties < FFI::Struct
    layout :base,                    XrBaseStructure,
           :layerName,               [:char, XR_MAX_API_LAYER_NAME_SIZE],
           :specVersion,             XrVersion,
           :layerVersion,            :uint32,
           :description,             [:char, XR_MAX_API_LAYER_DESCRIPTION_SIZE]
           
  end

  class XrExtensionProperties < FFI::Struct
    layout :base,                    XrBaseStructure,
           :extensionName,           [:char, XR_MAX_EXTENSION_NAME_SIZE],
           :extensionVersion,        :uint32
  end

  class XrApplicationInfo < FFI::Struct
    layout :applicationName,         [:char, XR_MAX_APPLICATION_NAME_SIZE],
           :applicationVersion,      :uint32,
           :engineName,              [:char, XR_MAX_ENGINE_NAME_SIZE],
           :engineVersion,           :uint32,
           :apiVersion,              XrVersion
  end

  class XrInstanceCreateInfo < FFI::Struct
    layout :base,                    XrBaseStructure,
           :createFlags,             XrInstanceCreateFlags,
           :applicationInfo,         XrApplicationInfo,
           :enabledApiLayerCount,    :uint32,
           :enabledApiLayerNames,    :string,
           :enabledExtensionCount,   :uint32,
           :enabledExtensionNames,   :string
  end

  class XrInstanceProperties < FFI::Struct
    layout :base,                    XrBaseStructure,
           :runtimeVersion,          XrVersion,
           :runtimeName,             [:char, XR_MAX_RUNTIME_NAME_SIZE]
  end

  class XrEventDataBuffer < FFI::Struct
    layout :base,                    XrBaseStructure,
           :varying,                 :uint8
  end

  class XrSystemGetInfo < FFI::Struct
    layout :base,                    XrBaseStructure,
           :formFactor,              XrFormFactor
  end

  class XrSystemGraphicsProperties < FFI::Struct
    layout :maxSwapchainImageHeight, :uint32,
           :maxSwapchainImageWidth,  :uint32,
           :maxLayerCount,           :uint32
  end

  class XrSystemTrackingProperties < FFI::Struct
    layout :orientationTracking,     XrBool32,
           :positionTracking,        XrBool32
  end

  class XrSystemProperties < FFI::Struct
    layout :base,                    XrBaseStructure,
           :systemId,                XrSystemId,
           :vendorId,                :uint32,
           :systemName,              [:char, XR_MAX_SYSTEM_NAME_SIZE],
           :graphicsProperties,      XrSystemGraphicsProperties,
           :trackingProperties,      XrSystemTrackingProperties
  end

  class XrSessionCreateInfo < FFI::Struct
    layout :base,                    XrBaseStructure,
           :createFlags,             XrSessionCreateFlags,
           :systemId,                XrSystemId
  end

  class XrVector3f < FFI::Struct
    # TODO
  end

  class XrSpaceVelocity < FFI::Struct
    # TODO
  end

  class XrQuaternionf < FFI::Struct
    # TODO
  end

  class XrPosef < FFI::Struct
    # TODO
  end

  class XrReferenceSpaceCreateInfo < FFI::Struct
    # TODO
  end

  class XrExtent2Df < FFI::Struct
    # TODO
  end

  class XrActionSpaceCreateInfo < FFI::Struct
    # TODO
  end

  class XrSpaceLocation < FFI::Struct
    # TODO
  end

  class XrViewConfigurationProperties < FFI::Struct
    # TODO
  end

  class XrViewConfigurationView < FFI::Struct
    # TODO
  end

  class XrSwapchainCreateInfo < FFI::Struct
    # TODO
  end

  class XrSwapchainImageBaseHeader < FFI::Struct
    # TODO
  end

  class XrSwapchainImageAcquireInfo < FFI::Struct
    # TODO
  end

  class XrSwapchainImageWaitInfo < FFI::Struct
    # TODO
  end

  class XrSwapchainImageReleaseInfo < FFI::Struct
    # TODO
  end

  class XrSessionBeginInfo < FFI::Struct
    # TODO
  end

  class XrFrameWaitInfo < FFI::Struct
    # TODO
  end

  class XrFrameState < FFI::Struct
    # TODO
  end

  class XrFrameBeginInfo < FFI::Struct
    # TODO
  end

  class XrCompositionLayerBaseHeader < FFI::Struct
    # TODO
  end

  class XrFrameEndInfo < FFI::Struct
    # TODO
  end

  class XrViewLocateInfo < FFI::Struct
    # TODO
  end

  class XrViewState < FFI::Struct
    # TODO
  end

  class XrFovf < FFI::Struct
    # TODO
  end

  class XrView < FFI::Struct
    # TODO
  end

  class XrActionSetCreateInfo < FFI::Struct
    # TODO
  end

  class XrActionCreateInfo < FFI::Struct
    # TODO
  end

  class XrActionSuggestedBinding < FFI::Struct
    # TODO
  end

  class XrInteractionProfileSuggestedBinding < FFI::Struct
    # TODO
  end

  class XrSessionActionSetsAttachInfo < FFI::Struct
    # TODO
  end

  class XrInteractionProfileState < FFI::Struct
    # TODO
  end

  class XrActionStateGetInfo < FFI::Struct
    # TODO
  end

  class XrActionStateBoolean < FFI::Struct
    # TODO
  end

  class XrActionStateFloat < FFI::Struct
    # TODO
  end

  class XrVector2f < FFI::Struct
    # TODO
  end

  class XrActionStateVector2f < FFI::Struct
    # TODO
  end

  class XrActionStatePose < FFI::Struct
    # TODO
  end

  class XrActiveActionSet < FFI::Struct
    # TODO
  end

  class XrActionsSyncInfo < FFI::Struct
    # TODO
  end

  class XrBoundSourcesForActionEnumerateInfo < FFI::Struct
    # TODO
  end

  class XrInputSourceLocalizedNameGetInfo < FFI::Struct
    # TODO
  end

  class XrHapticActionInfo < FFI::Struct
    # TODO
  end

  class XrHapticBaseHeader < FFI::Struct
    # TODO
  end

  XrBaseInStructure  = XrBaseStructure
  XrBaseOutStructure = XrBaseStructure

  class XrOffset2Di < FFI::Struct
    # TODO
  end

  class XrExtent2Di < FFI::Struct
    # TODO
  end

  class XrRect2Di < FFI::Struct
    # TODO
  end

  class XrSwapchainSubImage < FFI::Struct
    # TODO
  end

  class XrCompositionLayerProjectionView < FFI::Struct
    # TODO
  end

  class XrCompositionLayerProjection < FFI::Struct
    # TODO
  end

  class XrCompositionLayerQuad < FFI::Struct
    # TODO
  end

  class XrEventDataBaseHeader < FFI::Struct
    # TODO
  end

  class XrEventDataEventsLost < FFI::Struct
    # TODO
  end

  class XrEventDataInstanceLossPending < FFI::Struct
    # TODO
  end

  class XrEventDataSessionStateChanged < FFI::Struct
    # TODO
  end

  class XrEventDataReferenceSpaceChangePending < FFI::Struct
    # TODO
  end

  class XrEventDataInteractionProfileChanged < FFI::Struct
    # TODO
  end

  class XrHapticVibration < FFI::Struct
    # TODO
  end

  class XrOffset2Df < FFI::Struct
    # TODO
  end

  class XrRect2Df < FFI::Struct
    # TODO
  end

  class XrVector4f < FFI::Struct
    # TODO
  end

  class XrColor4f < FFI::Struct
    # TODO
  end

  class XrCompositionLayerCubeKHR < FFI::Struct
    # TODO
  end

  class XrCompositionLayerDepthInfoKHR < FFI::Struct
    # TODO
  end

  class XrCompositionLayerCylinderKHR < FFI::Struct
    # TODO
  end

  class XrCompositionLayerEquirectKHR < FFI::Struct
    # TODO
  end

  class XrVisibilityMaskKHR < FFI::Struct
    # TODO
  end

  class XrEventDataVisibilityMaskChangedKHR < FFI::Struct
    # TODO
  end

  class XrEventDataPerfSettingsEXT < FFI::Struct
    # TODO
  end

  class XrDebugUtilsObjectNameInfoEXT < FFI::Struct
    # TODO
  end

  class XrDebugUtilsLabelEXT < FFI::Struct
    # TODO
  end

  class XrDebugUtilsMessengerCallbackDataEXT < FFI::Struct
    # TODO
  end

  class XrDebugUtilsMessengerCreateInfoEXT < FFI::Struct
    # TODO
  end

  class XrSystemEyeGazeInteractionPropertiesEXT < FFI::Struct
    # TODO
  end

  class XrEyeGazeSampleTimeEXT < FFI::Struct
    # TODO
  end

  class XrSessionCreateInfoOverlayEXTX < FFI::Struct
    # TODO
  end

  class XrEventDataMainSessionVisibilityChangedEXTX < FFI::Struct
    # TODO
  end

  class XrSpatialAnchorCreateInfoMSFT < FFI::Struct
    # TODO
  end

  class XrSpatialAnchorSpaceCreateInfoMSFT < FFI::Struct
    # TODO
  end

  class XrViewConfigurationDepthRangeEXT < FFI::Struct
    # TODO
  end

  class XrViewConfigurationViewFovEPIC < FFI::Struct
    # TODO
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
