class Jurusan < ApplicationRecord
    validates :jurusan, presence: true
    has_many :rombels, dependent: :destroy
end
