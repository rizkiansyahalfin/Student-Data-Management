class Jurusan < ApplicationRecord
    # validates :jurusan, presence: true
    validates_presence_of :jurusan
    has_many :rombels, dependent: :delete_all
end
