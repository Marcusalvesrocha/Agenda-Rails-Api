module V2
	class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :kind do
    link(:related) { v2_contact_kind_url(object.id)}
  end
  
  has_many :phones do
    link(:related) { v2_contact_phones_url(object.id)}
  end

  has_one :address do
    link(:related) { v2_contact_address_url(object.id)}
  end

  link(:self) { v2_contact_url(object.id)}
  

  #def author
  #  "Marcus"
  #end
end

end