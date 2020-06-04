class Rayon < ApplicationRecord
    # validate :rombel, presence: true
    validates_presence_of :rayon
    has_many :siswas, dependent: :delete_all
end
