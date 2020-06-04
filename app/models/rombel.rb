class Rombel < ApplicationRecord
  belongs_to :jurusan
  # validates :rombel, presence: true
  validates_presence_of :rombel
  has_many :siswas, dependent: :delete_all
end