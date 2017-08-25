class Contact < ApplicationRecord
  #validations
  validates_presence_of :kind
  validates_presence_of :address

  # kaminari
  paginates_per 5
  
  #Associações
  belongs_to :kind#, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true




  #def birthdate_br
  #  I18n.l(self.birthdate) unless self.birthdate.blank?
  #end

  #def author
  #  "MarVin"
  #end

  #def kind_description
  #  self.kind.description
  #end

  #def as_json(options={})
  #  super(
  #    root: true,
  #    methods: [:author, :kind_description]
  #  )
  #end

  #def hello
  #  I18n.t('hello')
  #end

  #def i18n
  #  I18n.default_locale
  #end
end
