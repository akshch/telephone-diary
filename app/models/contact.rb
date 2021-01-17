class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :photo, less_than: 500.megabytes
  validates :mobile_number, format: {with: /\A[6789]\d{9}\Z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: VALID_EMAIL_REGEX

end
