class Contact < ApplicationRecord

  has_attached_file :photo,  styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :photo, less_than: 500.megabytes
  validates :mobile_number, format: {with: /\A[6789]\d{9}\Z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
