# This is free and unencumbered software released into the public domain.

require 'ffi'

module OpenXR::API
  extend FFI::Library
  ffi_lib ["libopenxr_loader.so.1", "openxr_loader"]

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
