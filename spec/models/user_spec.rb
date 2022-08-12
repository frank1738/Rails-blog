require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Frank', bio: 'Engineer', posts_counter: 0) }
  before(:all) do
    Rails.application.load_seed
  end
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should not be a string' do
    subject.posts_counter = 'My string'
    expect(subject).to_not be_valid
  end
end
