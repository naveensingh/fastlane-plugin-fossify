# frozen_string_literal: true

require 'spec_helper'

describe Fastlane::Actions::MetadataAndroidAction do
  describe '.run' do
    it 'uploads metadata to Play Store' do
      params = {
        package_name: 'org.fossify.app',
        version_code: 123,
        json_key: 'path/to/key.json',
        metadata_path: 'fastlane/metadata/android',
        track: 'production',
        validate_only: false
      }

      expect(Fastlane::Actions::SupplyAction).to receive(:run)
        .with(hash_including(
                metadata_path: 'fastlane/metadata/android',
                package_name: 'org.fossify.app',
                version_code: 123,
                json_key: 'path/to/key.json',
                track: 'production',
                skip_upload_aab: true,
                skip_upload_apk: true,
                validate_only: false
              ))

      Fastlane::Actions::MetadataAndroidAction.run(params)
    end
  end
end
