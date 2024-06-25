class News < ApplicationRecord
  # Ensure all required fields are present
  validates :title, :description, :link, :new_from, :image_link, presence: true

  # Validate the format of the link and image_link
  validates :link, :image_link, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'must be a valid URL' }

  # Length validations for title and description
  validates :title, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }

  # Custom validation to ensure the uniqueness of a news item
  validate :unique_news

  private

  # Custom validation method to check for uniqueness of the news item
  def unique_news
    if News.exists?(title: title, description: description, link: link, new_from: new_from, image_link: image_link)
      errors.add(:base, "News item with the same title, description, link, source, and image link already exists")
    end
  end
end
