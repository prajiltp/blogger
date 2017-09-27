class Message < ApplicationRecord
  belongs_to :blog
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
