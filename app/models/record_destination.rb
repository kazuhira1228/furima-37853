class RecordDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid"}
    validates :region_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A([0-9]{11,12})\z/, message: "is invalid"}
    validates :token
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, region_id: region_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end