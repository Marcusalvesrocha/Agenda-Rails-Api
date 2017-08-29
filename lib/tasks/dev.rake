namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "DROP - CREATE - MIGRATE"

    #%x(rails db:drop db:create db:migrate)

    puts "Sucesso"

    puts "cadastrando os tipos de contatos"

    kinds = %w(Amigo Comercia Conhecido)

    kinds.each do |kind|
      Kind .create!(
        description: kind
      )
    end

    puts "tipos de contatos cadastrados com sucesso"

    puts "cadastrando contatos"

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )      
    end

    puts "contatos cadastrado com sucesso"

    puts "cadastrando Phones"

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones << Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end

    puts "contatos cadastrado com sucesso"

    puts "cadastrando Endereço"

    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereço cadastrado com sucesso"

    
  end

end
