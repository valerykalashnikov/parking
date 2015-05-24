namespace :db do
  desc "Populate database with fake data"
  task populate: :environment do
    level = Level.create mark: '1'
    3.times do |t|
      ParkingSpaces::Moto.create number: "m#{t}", level: level
    end
    2.times do |t|
      ParkingSpaces::Car.create number: "c#{t}", level: level
    end
  end
end