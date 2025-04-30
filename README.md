# Fossify Fastlane Plugin

This plugin provides three actions:
- test_android: Run unit and instrumentation tests via Gradle
- deploy_android: Build a release AAB and upload to Google Play (includes metadata)
- metadata_android: Upload Play Store metadata

## Installation

Install the plugin by running:

```bash
fastlane add_plugin fossify
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```
