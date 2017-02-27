module Slugable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_slug(slug)
      find_by(slug: slug)
    end
  end

  included do
    validates :slug, presence: true
    after_initialize :after_initialize

    protected

    def after_initialize
      self.slug = SecureRandom.uuid
    end
  end
end
