# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.before(:each) do

    Manufacturer.destroy_all
    Weapon.destroy_all

    @dahl = Manufacturer.create!(name: "Dahl", headquarters: "Unknown", elemental?: true, equipment_production_total: 752005)
    @jakobs = Manufacturer.create!(name: "Jakobs", headquarters: "Eden-6", elemental?: false, equipment_production_total: 1563549)
    @maliwan = Manufacturer.create!(name: "Maliwan", headquarters: "Promethea", elemental?: true, equipment_production_total: 9846620)
    @torgue = Manufacturer.create!(name: "Torque", headquarters: "Pandora", elemental?: false, equipment_production_total: 336452)

    @dahl.weapons.create!(level_req: 9, rarity: "Orange", weapon_type: "SMG", name: "Deft Emperor", damage: 53, accuracy: 91.3, fire_rate: 5.5, reload_speed: 2.3, magazine_size: 48, elemental?: false, elemental_type: "None", trait: "Burst fire while zoomed", price: 2032)
    @dahl.weapons.create!(level_req: 28, rarity: "Blue", weapon_type: "Pistol", name: "Twin Anaconda", damage: 395, accuracy: 87.2, fire_rate: 9.6, reload_speed: 1.4, magazine_size: 25, elemental?: false, elemental_type: "None", trait: "Burst fire while zoomed & +8% Critical Hit Damage", price: 1273)
    @dahl.weapons.create!(level_req: 18, rarity: "Green", weapon_type: "Assault Rifle", name: "Nonuple Minigun", damage: 99, accuracy: 86.7, fire_rate: 7.1, reload_speed: 3.8, magazine_size: 29, elemental?: false, elemental_type: "None", trait: "Burst fire while zoomed", price: 559)
    @dahl.weapons.create!(level_req: 50, rarity: "Blue", weapon_type: "SMG", name: "Deft Jackal", damage: 4003, accuracy: 92.2, fire_rate: 7.1, reload_speed: 3.3, magazine_size: 40, elemental?: true, elemental_type: "Slag", trait: "Burst fire while zoomed & Slagged Enemies take more damage", price: 25188)
    @dahl.weapons.create!(level_req: 31, rarity: "E-Tech", weapon_type: "Sniper Rifle", name: "Operational Railer", damage: 2292, accuracy: 95.6, fire_rate: 13.3, reload_speed: 4.6, magazine_size: 10, elemental?: true, elemental_type: "Corrosive", trait: "Burst fire while zoomed & Highly effective vs Armor", price: 4261)

    @jakobs.weapons.create!(level_req: 2, rarity: "White", weapon_type: "Pistol", name: "Fine Revolver", damage: 20, accuracy: 94.0, fire_rate: 16.7, reload_speed: 2.1, magazine_size: 6, elemental?: false, elemental_type: "None", trait: "Fires as fast as you can pull the trigger", price: 26)
    @jakobs.weapons.create!(level_req: 60, rarity: "Orange", weapon_type: "Pistol", name: "Dastardly Maggie", damage: 116568, accuracy: 81.2, fire_rate: 11.5, reload_speed: 1.7, magazine_size: 10, elemental?: false, elemental_type: "None", trait: "Fires as fast as you can pull the trigger", price: 541783)
    @jakobs.weapons.create!(level_req: 61, rarity: "Purple", weapon_type: "Sniper Rifle", name: "Tumtum Muckamuck", damage: 113420, accuracy: 97.6, fire_rate: 2.8, reload_speed: 5.0, magazine_size: 8, elemental?: false, elemental_type: "None", trait: "+16% Weapon Damage & +180% Critical Hit Damage", price: 196392)
    @jakobs.weapons.create!(level_req: 75, rarity: "Blue", weapon_type: "Assault Rifle", name: "Boss M2828 Thumpson", damage: 482383, accuracy: 95.3, fire_rate: 12.8, reload_speed: 2.6, magazine_size: 49, elemental?: false, elemental_type: "None", trait: "4.5x Weapon Zoom & Fires as fast as you can pull the trigger", price: 5877401)

    @maliwan.weapons.create!(level_req: 50, rarity: "E-Tech", weapon_type: "SMG", name: "Impetuous Plasma Caster", damage: 6437, accuracy: 92.6, fire_rate: 9.0, reload_speed: 2.5, magazine_size: 51, elemental?: true, elemental_type: "Corrosive", trait: "Consumes 2 ammo per shot & Highly effective vs Armor", price: 43629)
    @maliwan.weapons.create!(level_req: 30, rarity: "Green", weapon_type: "Rocket Launcher", name: "Pyroclastic Projectile", damage: 8084, accuracy: 82.6, fire_rate: 1.0, reload_speed: 4.8, magazine_size: 4, elemental?: true, elemental_type: "Fire", trait: "3.9x Weapon Zoom & Highly Effective vs Flesh", price: 3150)
    @maliwan.weapons.create!(level_req: 80, rarity: "Orange", weapon_type: "Sniper Rifle", name: "Barking Volcano", damage: 401180, accuracy: 95.8, fire_rate: 1.4, reload_speed: 3.1, magazine_size: 10, elemental?: true, elemental_type: "Fire", trait: "5.7x Weapon Zoom & Highly effective vs Flesh", price: 5234902)
    @maliwan.weapons.create!(level_req: 58, rarity: "Purple", weapon_type: "SMG", name: "Consummate Crit", damage: 24396, accuracy: 95.8, fire_rate: 8.0, reload_speed: 1.9, magazine_size: 37, elemental?: true, elemental_type: "Electricity", trait: "Highly effective vs Shields", price: 152004)
    @maliwan.weapons.create!(level_req: 77, rarity: "Orange", weapon_type: "Pistol", name: "Potent Lancehead", damage: 498539, accuracy: 86.5, fire_rate: 3.5, reload_speed: 1.7, magazine_size: 17, elemental?: true, elemental_type: "Corrosive", trait: "+50% Melee Damage & Highly effective vs Armor", price: 4732989)

    @torgue.weapons.create!(level_req: 80, rarity: "Orange", weapon_type: "Shotgun", name: "Dismembering Boom Stick 8.o0B", damage: 454596, accuracy: 1.0, fire_rate: 2.4, reload_speed: 3.3, magazine_size: 6, elemental?: true, elemental_type: "Explosive", trait: "Waaaay beyond Groovy! & Deals bonus explosive damage", price: 4582070)
  end

  
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
