require 'rails_helper'

RSpec.describe 'Proponent', type: :model do
  subject { build(:proponent) }

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:identification_document).case_insensitive }
  end
end
