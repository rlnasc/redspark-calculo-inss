# frozen_string_literal: true

FactoryBot.define do
  factory :proponent do
    name { "Ricardo de lucas" }
    identification_document { '42803498754' }
    birthdate { Date.today - 30.years }
    address { "Rua do Limoeiro" }
    address_number { 720 }
    neighborhood { "Vila nova curuçá" }
    city { "São paulo" }
    state { "SP" }
    postcode { "08032650" }
    personal_phonenumber { "11976237545" }
    reference_phonenumber { '11976274144' }
    monthly_salary { 12000.00 }
  end
end
