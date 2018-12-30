FactoryBot.define do
  factory :square_board do
    board_name      { Faker::Name.first_name }
    rows            2
    cols 						2
    cols_data_hash  {{1=>[], 2=>[], 3=>[], 4 => []}}
  end
end
