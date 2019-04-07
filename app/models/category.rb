class Category < ApplicationRecord
  extend FriendlyId
  # As of FriendlyId 5.0, slugs are only generated when the slug field is nil.
  # If you want a slug to be regenerated,set the slug field to nil
  before_validation :set_nil_slug
  friendly_id :name, use: :slugged

  validates :name, :slug, uniqueness: true
  validates :slug, exclusion: { in: SLUG_BLACK_LIST }

  has_many :products
  has_ancestry orphan_strategy: :rootify

  def set_nil_slug
    self.slug = nil if self.slug.blank?
  end

  def normalize_friendly_id(string)
    string.to_slug.normalize.to_s
  end



end
