class PostImage < ApplicationRecord
  #ActiveStorage を使って画像を持たせる
  has_one_attached :image
end
