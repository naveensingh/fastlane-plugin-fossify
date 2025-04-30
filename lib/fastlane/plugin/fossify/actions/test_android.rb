# frozen_string_literal: true

require 'fastlane/action'

module Fastlane
  module Actions
    class TestAndroidAction < Action
      def self.run(_params)
        Actions::GradleAction.run(
          task: 'test',
          project_dir: Dir.pwd,
          print_command: true,
          print_command_output: true
        )
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
