class Topic < ApplicationRecord
  validates_presence_of :title

  # Contador de Blogs
  has_many :blogs
end
