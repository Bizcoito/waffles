class Book
  include Mongoid::Document
  field :name, type: String
  field :author, type: String
  field :thumbnail, type: String

  validates_presence_of :name, :author
end
