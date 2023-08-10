class PostImage < ApplicationRecord
  #ActiveStorage を使って画像を持たせる
  has_one_attached :image
  #PostImageモデルに対して、Userモデルとの関係性を追加
  belongs_to :user
end
