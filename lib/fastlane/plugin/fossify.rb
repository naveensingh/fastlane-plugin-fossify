# frozen_string_literal: true

require 'fastlane/plugin/fossify/version'

module Fastlane
  module Fossify
    def self.all_classes
      Dir[File.expand_path('**/{actions}/*.rb', File.dirname(__FILE__))]
    end
  end
end

Fastlane::Fossify.all_classes.each do |current|
  require current
end
