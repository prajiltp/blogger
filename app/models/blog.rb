class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :messages

  has_attached_file :header_image, :styles => {:thumb => ['50x50#', :png], :original => ['1440x650#', :jpeg]},
    :default_style => :original

  validates_attachment_content_type :header_image, :content_type => /^image\//
  validates :header_image, :attachment_size => {:less_than => 4.megabytes}
  validates :title, :description, presence: true

  attr_accessor :delete_header_image

  def delete_header_image=(value)
    header_image.clear if value && value == '1'
  end
end
