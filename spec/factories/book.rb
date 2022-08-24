
FactoryBot.define do
  factory :book do
    name { 'default' }
    author { 'default' }
    status { 'ready_for_order' }
  end
end
