require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:foods).dependent(:destroy) }
  it { should have_many(:recipes).dependent(:destroy) }

  # Devise Modules
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('user@example').for(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
end
