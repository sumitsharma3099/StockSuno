class Faq < ApplicationRecord
    # Ensure question and answer are present
    validates :question, :answer, presence: true
  
    # Ensure question has a minimum and maximum length
    validates :question, length: { minimum: 5, maximum: 255 }
  
    # Ensure answer has a minimum length
    validates :answer, length: { minimum: 10 }
  end
  