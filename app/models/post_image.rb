class PostImage < ApplicationRecord
  #ActiveStorage を使って画像を持たせる
  has_one_attached :image
  #PostImageモデルに対して、Userモデルとの関係性を追加
  belongs_to :user

  def get_image #アクションとは少し違い、特定の処理を名前で呼び出すことができる4-11にて解説
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
