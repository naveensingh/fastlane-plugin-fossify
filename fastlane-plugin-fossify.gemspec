# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/fossify/version'

Gem::Specification.new do |spec|
  spec.name = 'fastlane-plugin-fossify'
  spec.version = Fastlane::Fossify::VERSION
  spec.author = 'Naveen Singh'
  spec.email = 'snaveen935@gmail.com'

  spec.summary = 'Plugin to manage Fossify releases'
  spec.description = 'This fastlane plugin provides actions for managing Fossify app releases, including testing, deploying to Play Store, and updating metadata.'
  spec.homepage = 'https://github.com/naveensingh/fastlane-plugin-fossify'
  spec.license = 'MIT'

  spec.files = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.required_ruby_version = '>= 3.3'
  spec.add_dependency 'abbrev'
end
