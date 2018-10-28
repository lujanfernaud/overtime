100.times do |post_number|
  puts "Creating post #{post_number}."

  Post.create!(
    date:      Time.zone.now,
    rationale: "Post #{post_number} rationale content."
  )
end
