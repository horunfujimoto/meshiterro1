class PostImage < ApplicationRecord
  #ActiveStorage を使って画像を持たせる
  has_one_attached :image

  belongs_to :user#PostImageモデルに対して、Userモデルとの関係性を追加
  has_many :post_comments, dependent: :destroy #PostImageモデルに、PostCommentモデルとの関連付け
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true #shop_nameが存在しているかを確認するバリデーション
  validates :image, presence: true #imageが存在しているかを確認するバリデーション

  def get_image #アクションとは少し違い、特定の処理を名前で呼び出すことができる4-11にて解説
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id) #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  end


end
