# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

frank = User.create!(
    name: 'frank',
    photo: 'https://dummyimage.com/600x400/000/fff' ,
    bio: 'Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque nulla nunc, 
    lacinia sed volutpat ut, tristique et tortor. 
    Proin a nulla lorem. Duis ac nunc lectus. Ut non felis id elit tempor gravida.
    Aenean varius sem vel tellus elementum,
    in eleifend mauris eleifend. Donec at tempor libero,
    et maximus magna. Nulla vehicula convallis nulla.
    Duis arcu turpis, egestas ultrices est at, scelerisque lobortis est.',
    posts_counter: 3)

tom = User.create!(
        name: 'tom',
        photo: 'https://dummyimage.com/600x400/000/fff',
        bio: 'Lorem ipsum dolor sit amet,
        consectetur adipiscing elit. Pellentesque nulla nunc, 
        lacinia sed volutpat ut, tristique et tortor. 
        Proin a nulla lorem. Duis ac nunc lectus. Ut non felis id elit tempor gravida.
        Aenean varius sem vel tellus elementum,
        in eleifend mauris eleifend. Donec at tempor libero,
        et maximus magna. Nulla vehicula convallis nulla.
        Duis arcu turpis, egestas ultrices est at, scelerisque lobortis est.',
        posts_counter: 2)

        post1 = frank.posts.create!(title: 'Ruby and Rails 1', text: 'this is first post about Ruby and Rails! 1', comments_counter: 0, likes_counter: 0)
        post2 = frank.posts.create!(title: 'Ruby and Rails 2', text: 'this is first post about Ruby and Rails! 2', comments_counter: 0, likes_counter: 0)
        post3 = tom.posts.create!(title: 'Ruby and Rails 3', text: 'this is first post about Ruby and Rails! 3', comments_counter: 0, likes_counter: 0)
        post4 = tom.posts.create!(title: 'Ruby and Rails 4', text: 'this is first post about Ruby and Rails! 4', comments_counter: 0, likes_counter: 0)
        post5 = frank.posts.create!(title: 'Ruby and Rails 5', text: 'this is first post about Ruby and Rails! 5', comments_counter: 0, likes_counter: 0)
        post6 = tom.posts.create!(title: 'Never ending fun', text: 'this is second post but I don\'t think I should create another post again', comments_counter: 0, likes_counter: 0)
        post7 = tom.posts.create!(title: 'The end of the world', text: 'it all around the corner', comments_counter: 0, likes_counter: 0)

        frank.comments.create!(text: 'really nice post Michael', post: post1)
        frank.comments.create!(text: 'Absolutely amazing 1', post: post1)
        tom.comments.create!(text: 'Absolutely amazing 2', post: post2)

