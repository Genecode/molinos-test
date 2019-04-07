class Product < ApplicationRecord
  extend FriendlyId
  # As of FriendlyId 5.0, slugs are only generated when the slug field is nil.
  # If you want a slug to be regenerated,set the slug field to nil
  before_validation :set_nil_slug
  friendly_id :name, use: :slugged

  validates :name, uniqueness: true
  validates :slug, exclusion: { in: SLUG_BLACK_LIST }
  validates :image, blob: { content_type: :image }

  belongs_to :category
  has_one_attached :image, dependent: :purge_now

  def set_nil_slug
    self.slug = nil if self.slug.blank?
  end

  def normalize_friendly_id(string)
    string.to_slug.normalize.to_s
  end
end
