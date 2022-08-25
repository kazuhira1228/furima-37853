class Item < ApplicationRecord
  validates :image,            presence: true
  validates :item_name,        presence: true, length: { maximum: 40 }
  validates :content,          presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :postage_id,       presence: true
  validates :region_id,        presence: true
  validates :shopping_date_id, presence: true
  validates :price,            presence: true, numericality: { only_integer: true }
  validates_inclusion_of :price, in:300..9999999

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :region 
  belongs_to :postage
  belongs_to :shopping_date
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
