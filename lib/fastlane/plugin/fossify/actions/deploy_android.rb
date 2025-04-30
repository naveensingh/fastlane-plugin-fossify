# frozen_string_literal: true

require 'fastlane/action'

module Fastlane
  module Actions
    class DeployAndroidAction < Action
      def self.run(params)
        flavor = params[:flavor]
        package_name = params[:package_name]
        json_key = params[:json_key]
        track = params[:track]
        rollout = params[:rollout]
        dryrun = params[:validate_only]
        build_type = 'Release'
        variant = "#{flavor}#{build_type}"
        Actions::GradleAction.run(
          task: 'bundle',
          flavor:,
          build_type:,
          project_dir: Dir.pwd,
          print_command: true,
          print_command_output: true
        )

        aab_pattern = "app/build/outputs/bundle/#{variant}/*.aab"
        aab_path = Dir[aab_pattern].first
        UI.user_error!("No AAB found at #{aab_pattern}") unless aab_path && File.exist?(aab_path)

        UI.message("AAB found at #{aab_path}")

        Actions::UploadToPlayStoreAction.run(
          rollout:,
          aab: aab_path,
          package_name:,
          json_key:,
          skip_upload_apk: true,
          skip_upload_metadata: false,
          track:,
          validate_only: dryrun
        )
      end

      def self.available_options
        [
          opt(:flavor, required: true),
          opt(:package_name, required: true),
          opt(:json_key, required: true),
          opt(:track, required: false, default_value: 'production'),
          opt(:rollout, required: false, default_value: '0.05'),
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
