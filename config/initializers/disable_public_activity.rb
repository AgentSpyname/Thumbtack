# config/disable_public_activity.rb

if defined?(Rails::Console)
  PublicActivity.enabled = false
end
