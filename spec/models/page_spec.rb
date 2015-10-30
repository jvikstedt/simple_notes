require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should validate_presence_of(:title) }

  it 'has a valid factory' do
    expect(build(:page)).to be_valid
  end
end
