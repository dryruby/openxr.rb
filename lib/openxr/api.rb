# This is free and unencumbered software released into the public domain.

require 'ffi'

module OpenXR::API
  extend FFI::Library
  ffi_lib ["libopenxr_loader.so.1", "openxr_loader"]

  attach_function :xrAcquireSwapchainImage, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrApplyHapticFeedback, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrAttachSessionActionSets, [:pointer, :pointer], :pointer
  attach_function :xrBeginFrame, [:pointer, :pointer], :pointer
  attach_function :xrBeginSession, [:pointer, :pointer], :pointer
  attach_function :xrCreateAction, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateActionSet, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateActionSpace, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateDebugUtilsMessengerEXT, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateInstance, [:pointer, :pointer], :pointer
  attach_function :xrCreateReferenceSpace, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateSession, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateSpatialAnchorMSFT, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateSpatialAnchorSpaceMSFT, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrCreateSwapchain, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrDestroyAction, [:pointer], :pointer
  attach_function :xrDestroyActionSet, [:pointer], :pointer
  attach_function :xrDestroyDebugUtilsMessengerEXT, [:pointer], :pointer
  attach_function :xrDestroyInstance, [:pointer], :pointer
  attach_function :xrDestroySession, [:pointer], :pointer
  attach_function :xrDestroySpace, [:pointer], :pointer
  attach_function :xrDestroySpatialAnchorMSFT, [:pointer], :pointer
  attach_function :xrDestroySwapchain, [:pointer], :pointer
  attach_function :xrEndFrame, [:pointer, :pointer], :pointer
  attach_function :xrEndSession, [:pointer], :pointer
  attach_function :xrEnumerateApiLayerProperties, [:uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateBoundSourcesForAction, [:pointer, :pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateEnvironmentBlendModes, [:pointer, :ulong_long, :pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateInstanceExtensionProperties, [:string, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateReferenceSpaces, [:pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateSwapchainFormats, [:pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateSwapchainImages, [:pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateViewConfigurationViews, [:pointer, :ulong_long, :pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrEnumerateViewConfigurations, [:pointer, :ulong_long, :uint32, :pointer, :pointer], :pointer
  attach_function :xrGetActionStateBoolean, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetActionStateFloat, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetActionStatePose, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetActionStateVector2f, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetCurrentInteractionProfile, [:pointer, :ulong_long, :pointer], :pointer
  attach_function :xrGetInputSourceLocalizedName, [:pointer, :pointer, :uint32, :pointer, :string], :pointer
  attach_function :xrGetInstanceProcAddr, [:pointer, :string, :pointer], :pointer
  attach_function :xrGetInstanceProperties, [:pointer, :pointer], :pointer
  attach_function :xrGetReferenceSpaceBoundsRect, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetSystem, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrGetSystemProperties, [:pointer, :ulong_long, :pointer], :pointer
  attach_function :xrGetViewConfigurationProperties, [:pointer, :ulong_long, :pointer, :pointer], :pointer
  attach_function :xrGetVisibilityMaskKHR, [:pointer, :pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrLocateSpace, [:pointer, :pointer, :long_long, :pointer], :pointer
  attach_function :xrLocateViews, [:pointer, :pointer, :pointer, :uint32, :pointer, :pointer], :pointer
  attach_function :xrPathToString, [:pointer, :ulong_long, :uint32, :pointer, :string], :pointer
  attach_function :xrPerfSettingsSetPerformanceLevelEXT, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrPollEvent, [:pointer, :pointer], :pointer
  attach_function :xrReleaseSwapchainImage, [:pointer, :pointer], :pointer
  attach_function :xrRequestExitSession, [:pointer], :pointer
  attach_function :xrResultToString, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrSessionBeginDebugUtilsLabelRegionEXT, [:pointer, :pointer], :pointer
  attach_function :xrSessionEndDebugUtilsLabelRegionEXT, [:pointer], :pointer
  attach_function :xrSessionInsertDebugUtilsLabelEXT, [:pointer, :pointer], :pointer
  attach_function :xrSetDebugUtilsObjectNameEXT, [:pointer, :pointer], :pointer
  attach_function :xrSetInputDeviceActiveEXT, [:pointer, :ulong_long, :ulong_long, :uint], :pointer
  attach_function :xrSetInputDeviceLocationEXT, [:pointer, :ulong_long, :ulong_long, :pointer, :pointer], :pointer
  attach_function :xrSetInputDeviceStateBoolEXT, [:pointer, :ulong_long, :ulong_long, :uint], :pointer
  attach_function :xrSetInputDeviceStateFloatEXT, [:pointer, :ulong_long, :ulong_long, :float], :pointer
  attach_function :xrSetInputDeviceStateVector2fEXT, [:pointer, :ulong_long, :ulong_long, :pointer], :pointer
  attach_function :xrStopHapticFeedback, [:pointer, :pointer], :pointer
  attach_function :xrStringToPath, [:pointer, :string, :pointer], :pointer
  attach_function :xrStructureTypeToString, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrSubmitDebugUtilsMessageEXT, [:pointer, :ulong_long, :ulong_long, :pointer], :pointer
  attach_function :xrSuggestInteractionProfileBindings, [:pointer, :pointer], :pointer
  attach_function :xrSyncActions, [:pointer, :pointer], :pointer
  attach_function :xrThermalGetTemperatureTrendEXT, [:pointer, :pointer, :pointer, :pointer, :pointer], :pointer
  attach_function :xrWaitFrame, [:pointer, :pointer, :pointer], :pointer
  attach_function :xrWaitSwapchainImage, [:pointer, :pointer], :pointer
end # OpenXR::API
