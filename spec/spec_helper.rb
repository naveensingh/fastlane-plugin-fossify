# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'fastlane'
require 'fastlane/plugin/fossify'

Fastlane.load_actions
