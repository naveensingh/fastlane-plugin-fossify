# frozen_string_literal: true

require 'fastlane/action'

module Fastlane
  module Actions
    class MetadataAndroidAction < Action
      def self.run(params)
        json_key = params[:json_key]
        package_name = params[:package_name]
        track = params[:track]
        version_code = params[:version_code]
        dryrun = params[:validate_only]

        Actions::SupplyAction.run(
          json_key:,
          metadata_path: 'fastlane/metadata/android',
          package_name:,
          track:,
          version_code:,
          skip_upload_aab: true,
          skip_upload_apk: true,
          validate_only: dryrun
        )
      end

      def self.available_options
        [
          opt(:json_key, required: true),
          opt(:package_name, required: true),
          opt(:track, required: false, default_value: 'production'),
          opt(:version_code, required: true, type: Integer),
          opt(:validate_only, required: false, type: Boolean, default_value: false)
        ]
      end

      def self.opt(key, required:, **extra)
        FastlaneCore::ConfigItem.new(
          key:,
          env_name: key.to_s.upcase, # Uppercase environment variable
          optional: !required,
          **extra
        )
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
