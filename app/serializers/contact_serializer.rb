class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id)}
  end
  
  has_many :phones do
    link(:related) { contact_kind_url(object.id)}
  end
  
  has_one :address

  link(:self) { contact_url(object.id)}
  

  #def author
  #  "Marcus"
  #end

  meta do
    {author: "Marcus Rocha"}
  end

  def attributes(*args)
    h = super(*args)
    #h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
