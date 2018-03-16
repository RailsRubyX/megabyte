class Post < ApplicationRecord
	
	belongs_to :user

	#Картинки к посту
	has_attached_file :image, styles: { medium: "1170x900>", :thumb => "360x300>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	#Проверка на заполненость поста
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true


end
