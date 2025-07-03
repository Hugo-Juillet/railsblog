# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seeds für die Blog-Anwendung

# Bestehende Daten löschen (optional - entfernen Sie diese Zeilen in Produktion)
puts "Lösche bestehende Daten..."
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Erstelle Test-User..."

# Test-User erstellen
users = [
  {
    email: "max@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "anna@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "tom@example.com",
    password: "password123", 
    password_confirmation: "password123"
  },
  {
    email: "lisa@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "admin@example.com",
    password: "admin123",
    password_confirmation: "admin123"
  }
]

created_users = []
users.each do |user_attrs|
  user = User.create!(user_attrs)
  created_users << user
  puts "✓ User erstellt..."
end

puts "\nErstelle Test-Posts..."

# Test-Posts erstellen
posts_data = [
  {
    title: "Willkommen zu unserem Blog",
    body: "Dies ist der erste Post in unserem neuen Blog. Hier werden wir regelmäßig interessante Artikel über Technologie, Programmierung und vieles mehr veröffentlichen.",
    user: created_users[0]
  },
  {
    title: "Ruby on Rails - Ein Überblick",
    body: "Ruby on Rails ist ein mächtiges Web-Framework, das die Entwicklung von Webanwendungen erheblich vereinfacht. In diesem Artikel schauen wir uns die wichtigsten Konzepte an.",
    user: created_users[1]
  },
  {
    title: "API-Entwicklung mit Rails",
    body: "Moderne Webanwendungen benötigen oft APIs. Rails bietet hervorragende Tools für die Entwicklung von RESTful APIs. Hier sind einige Best Practices.",
    user: created_users[0]
  },
  {
    title: "Datenbank-Design für Webanwendungen",
    body: "Ein gutes Datenbankdesign ist die Grundlage jeder erfolgreichen Anwendung. Wir betrachten wichtige Prinzipien und häufige Fallstricke.",
    user: created_users[2]
  },
  {
    title: "JWT-Authentication verstehen",
    body: "JSON Web Tokens sind ein beliebter Standard für die Authentifizierung in modernen Anwendungen. Dieser Artikel erklärt die Grundlagen und Implementierung.",
    user: created_users[1]
  },
  {
    title: "Testing in Rails",
    body: "Tests sind essentiell für robuste Anwendungen. Wir schauen uns verschiedene Test-Strategien in Rails an, von Unit Tests bis zu Integration Tests.",
    user: created_users[3]
  },
  {
    title: "Deployment mit Docker",
    body: "Docker hat die Art verändert, wie wir Anwendungen bereitstellen. Hier ist eine Schritt-für-Schritt-Anleitung für das Deployment von Rails-Apps.",
    user: created_users[2]
  },
  {
    title: "Performance-Optimierung",
    body: "Eine schnelle Anwendung ist eine gute Anwendung. Wir betrachten verschiedene Techniken zur Optimierung der Performance von Rails-Anwendungen.",
    user: created_users[4]
  }
]

created_posts = []
posts_data.each do |post_attrs|
  post = Post.create!(post_attrs)
  created_posts << post
  puts "✓ Post erstellt: #{post.title} (von #{post.user.email})"
end

puts "\nErstelle Test-Kommentare..."

# Test-Kommentare erstellen
comments_data = [
  {
    body: "Großartiger Artikel! Sehr informativ.",
    user: created_users[1],
    post: created_posts[0]
  },
  {
    body: "Danke für die ausführliche Erklärung. Hat mir sehr geholfen!",
    user: created_users[2],
    post: created_posts[0]
  },
  {
    body: "Ich stimme voll zu. Rails ist wirklich ein tolles Framework.",
    user: created_users[3],
    post: created_posts[1]
  },
  {
    body: "Könntet ihr mehr über ActiveRecord schreiben?",
    user: created_users[0],
    post: created_posts[1]
  },
  {
    body: "Sehr nützliche Tipps für API-Entwicklung!",
    user: created_users[4],
    post: created_posts[2]
  },
  {
    body: "Ich hätte gerne mehr Beispiele gesehen.",
    user: created_users[3],
    post: created_posts[2]
  },
  {
    body: "Datenbankdesign ist so wichtig und wird oft übersehen.",
    user: created_users[1],
    post: created_posts[3]
  },
  {
    body: "JWT ist definitiv der Weg zu gehen für moderne Apps.",
    user: created_users[0],
    post: created_posts[4]
  },
  {
    body: "Sicherheitsaspekte bei JWT wären auch interessant.",
    user: created_users[2],
    post: created_posts[4]
  },
  {
    body: "Tests sind Leben! Ohne Tests keine Deployment.",
    user: created_users[4],
    post: created_posts[5]
  },
  {
    body: "RSpec oder Minitest - was ist besser?",
    user: created_users[3],
    post: created_posts[5]
  },
  {
    body: "Docker hat mein Deployment-Leben revolutioniert.",
    user: created_users[0],
    post: created_posts[6]
  },
  {
    body: "Performance ist King! Danke für die Tipps.",
    user: created_users[1],
    post: created_posts[7]
  },
  {
    body: "N+1-Queries sind der Feind jeder Rails-App.",
    user: created_users[2],
    post: created_posts[7]
  }
]

created_comments = []
comments_data.each do |comment_attrs|
  comment = Comment.create!(comment_attrs)
  created_comments << comment
  puts "✓ Kommentar erstellt auf Post '#{comment.post.title}' von #{comment.user.email}"
end

puts "\n" + "="*50
puts "SEED-DATEN ERFOLGREICH ERSTELLT!"
puts "="*50
puts "#{User.count} User erstellt"
puts "#{Post.count} Posts erstellt"  
puts "#{Comment.count} Kommentare erstellt"
puts "\nTest-Accounts:"
puts "Admin: admin@example.com / admin123"
puts "User: max@example.com / password123"
puts "User: anna@example.com / password123"
puts "User: tom@example.com / password123"
puts "User: lisa@example.com / password123"
puts "="*50
