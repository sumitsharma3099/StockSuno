# db/seeds.rb
if About.count.zero?
    about_us_content = <<-CONTENT.strip_heredoc
    Welcome to our website! We are dedicated to providing you with the latest news and updates.
    Our team works tirelessly to bring you the most accurate and timely information.

    Our mission is to keep you informed and engaged with the world around you. Whether it's breaking news,
    in-depth analysis, or feature stories, we strive to deliver content that matters to you.

    Thank you for visiting our site. We hope you find our content informative and engaging. If you have any
    questions or feedback, please don't hesitate to contact us.
    CONTENT

    About.create!(
    content: about_us_content,
    image_link: "https://bsmedia.business-standard.com/_media/bs/img/misc/2021-05/20/full/markets-bulls-bears-stocks-1621493469-90682620.jpg"  # Replace with your actual image link
    )
end

if Faq.count.zero?
        faqs = [
    {
        question: "What is this website about?",
        answer: "This website is dedicated to providing the latest news and updates. Our team works tirelessly to bring you the most accurate and timely information."
    },
    {
        question: "How often is the content updated?",
        answer: "We update our content regularly to ensure you have access to the most recent news and information."
    },
    {
        question: "How can I contact you?",
        answer: "You can contact us through the contact form on our website. We are always here to help with any questions or feedback you may have."
    },
    {
        question: "Do you have a newsletter?",
        answer: "Yes, we have a newsletter that you can subscribe to for the latest updates. Sign up on our homepage to stay informed."
    }
    ]

    # Create FAQs
    faqs.each do |faq|
        Faq.create(faq)
    end
end


if Admin.count.zero?
    admin = Admin.find_or_initialize_by(email: 'admin@example.com') do |admin|
    admin.password = '111111'  # Set a default password here
  end
  admin.save!
  puts "Admin user created with email: #{admin.email} and password: '111111'"
end