require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'This is my first post', text: 'Nice', likes_counter: 0, comments_counter: 0) }
  before(:all) do
    Rails.application.load_seed
  end
  before { subject.save }

  it 'Title should not be empty or nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not be more than 250 chars' do
    subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Quisque accumsan dolor ornare, varius nisi in,
    aliquet ligula. Nam a erat et est elementum vestibulum. Morbi ligula diam,
    rhoncus sit amet erat quis, tincidunt aliquam velit.
    Donec vel ultricies ipsum, vitae pharetra purus. Curabitur bibendum faucibus nulla in congue.
    Maecenas venenatis ligula ante, sed consectetur urna pharetra vel.
    Sed sapien quam, consectetur nec euismod id, vulputate a arcu. Nunc vel maximus nulla.
    Pellentesque mattis massa sed consequat scelerisque. Morbi turpis orci, fringilla id leo et, blandit suscipit purus.
    Curabitur ante purus, facilisis quis nisl at, porta pulvinar tortor. Integer aliquet sed tellus sed pellentesque.
    Morbi porta, enim fringilla rhoncus sodales,
    nunc arcu ullamcorper erat, id tristique turpis lacus sit amet turpis.
    Vestibulum sagittis rhoncus ex id ultricies. Integer eget fermentum augue.
    Duis volutpat at libero eu congue. Cras mi magna, commodo sit amet dui id, l
    aoreet dignissim elit. Sed at iaculis sapien. Integer rhoncus eu sapien eget consequat.'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should not be below 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should not be below 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
