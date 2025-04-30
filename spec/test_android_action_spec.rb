# frozen_string_literal: true

require 'spec_helper'

describe Fastlane::Actions::TestAndroidAction do
  describe '.run' do
    it 'runs gradle test task' do
      allow(Dir).to receive(:pwd).and_return('/tmp/myapp')

      expect(Fastlane::Actions::GradleAction).to receive(:run)
        .with(hash_including(task: 'test'))

      Fastlane::Actions::TestAndroidAction.run({})
    end
  end
end
