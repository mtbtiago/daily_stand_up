module Slugable
  extend ActiveSupport::Concern

  module ClassMethods
  end

  included do
    validates :slug, presence: true
    after_initialize :after_initialize

    protected

    def after_initialize
      self.slug = SecureRandom.uuid unless slug.present?
    end
  end
end
