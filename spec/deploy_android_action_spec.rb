# frozen_string_literal: true

require 'spec_helper'

describe Fastlane::Actions::DeployAndroidAction do
  describe '#run' do
    it 'builds bundle and uploads to Play Store' do
      params = {
        flavor: 'foss',
        package_name: 'org.fossify.app',
        json_key: 'path/to/key.json',
        track: 'production',
        rollout: '0.05',
        validate_only: false
      }

      expect(Fastlane::Actions::GradleAction).to receive(:run)
        .with(hash_including(task: 'bundle', flavor: 'foss', build_type: 'Release'))

      allow(Dir).to receive(:pwd).and_return('/tmp/myapp')
      allow(Dir).to receive(:[]).and_return(['/tmp/myapp/app/build/outputs/bundle/fossRelease/app.aab'])
      allow(File).to receive(:exist?).and_return(true)

      expect(Fastlane::Actions::UploadToPlayStoreAction).to receive(:run)
        .with(hash_including(
                aab: '/tmp/myapp/app/build/outputs/bundle/fossRelease/app.aab',
                package_name: 'org.fossify.app',
                json_key: 'path/to/key.json',
                track: 'production',
                rollout: '0.05',
                skip_upload_apk: true,
                validate_only: false
              ))

      Fastlane::Actions::DeployAndroidAction.run(params)
    end
  end
end
