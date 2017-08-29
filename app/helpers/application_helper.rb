module ApplicationHelper
  # major: on every iteration release
  # minor: when require migrations
  # release: increment in every new feature, reset after migrations
  # build: never reset, increment in every deployment
  VERSION = '20170829.1.2'.freeze
end
