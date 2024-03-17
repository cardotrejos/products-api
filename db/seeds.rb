# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
auto_parts = [
  { name: "Oil Filter", description: "High-quality oil filter for improved engine performance.", price: 16 },
  { name: "Brake Pads", description: "Durable brake pads for enhanced safety and control.", price: 46 },
  { name: "Spark Plugs", description: "High-performance spark plugs for efficient combustion.", price: 22 },
  { name: "Alternator", description: "Reliable alternator for ensuring your vehicle's electrical systems run smoothly.", price: 120 },
  { name: "Timing Belt", description: "Durable timing belt for precise engine timing.", price: 85 },
  { name: "Air Filter", description: "Enhances airflow to your engine, improving power and efficiency.", price: 19 },
  { name: "Fuel Pump", description: "High-quality fuel pump for consistent fuel delivery.", price: 139 },
  { name: "Battery", description: "Long-lasting car battery with excellent cold cranking amps.", price: 95 },
  { name: "Headlight Bulbs", description: "Bright, long-lasting headlight bulbs for improved visibility.", price: 29 },
  { name: "Windshield Wipers", description: "Durable windshield wipers for clear visibility in harsh weather.", price: 23 },
  { name: "Radiator", description: "Efficient radiator for optimal engine cooling.", price: 110 },
  { name: "Shock Absorbers", description: "Top-quality shock absorbers for a smoother ride.", price: 88 },
  { name: "Exhaust System", description: "High-performance exhaust system for improved airflow and sound.", price: 259 },
]

auto_parts.each do |part|
  Product.create!(part)
end