# This is free and unencumbered software released into the public domain.

require_relative '../lib/openxr'

include OpenXR::API

RSpec.describe OpenXR::API do
  describe "XrInstance" do
    it "must have the correct size" do
      expect(XrInstance.size).to eq(8)
    end
  end

  describe "XrSession" do
    it "must have the correct size" do
      expect(XrSession.size).to eq(8)
    end
  end

  describe "XrSpace" do
    it "must have the correct size" do
      expect(XrSpace.size).to eq(8)
    end
  end

  describe "XrAction" do
    it "must have the correct size" do
      expect(XrAction.size).to eq(8)
    end
  end

  describe "XrSwapchain" do
    it "must have the correct size" do
      expect(XrSwapchain.size).to eq(8)
    end
  end

  describe "XrActionSet" do
    it "must have the correct size" do
      expect(XrActionSet.size).to eq(8)
    end
  end

  describe "XrApplicationInfo" do
    it "must have the correct size" do
      expect(XrApplicationInfo.size).to eq(272)
    end
  end

  describe "XrInstanceCreateInfo" do
    it "must have the correct size" do
      expect(XrInstanceCreateInfo.size).to eq(328)
    end
  end
end
