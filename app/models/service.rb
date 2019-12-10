class Service < ApplicationRecord
	belongs_to :user

	#Проверка на заполненость
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
