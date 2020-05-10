# This is free and unencumbered software released into the public domain.

require_relative '../lib/openxr'

include OpenXR

RSpec.describe OpenXR::Result do
  describe ".for" do
    it "returns the correct class for valid XrResult success codes" do
      expect(Result.for(XR_SUCCESS)).to eq(Result::Success)
    end

    it "returns the correct class for valid XrResult failure codes" do
      expect(Result.for(XR_ERROR_HANDLE_INVALID)).to eq(Result::HandleInvalid)
    end

    it "returns the default class for invalid XrResult codes" do
      expect(Result.for(XR_RESULT_MAX_ENUM)).to eq(Result)
    end
  end
end
