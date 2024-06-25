class About < ApplicationRecord
    # Ensure content and image_link are present
    validates :content, :image_link, presence: true
    
    # Ensure content has a minimum and maximum length
    validates :content, length: { minimum: 10, maximum: 1000 }
  
    # Ensure image_link is a valid URL
    validates :image_link, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
  
    # Custom validation for image link format
    validate :image_link_must_be_an_image_url
  
    private
  
    def image_link_must_be_an_image_url
      unless image_link =~ /\.(png|jpg|jpeg|gif)\z/i
        errors.add(:image_link, "must be a valid image URL ending with .png, .jpg, .jpeg, or .gif")
      end
    end
  end
  