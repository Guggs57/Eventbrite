# db/seeds.rb

# Créer quelques utilisateurs
user1 = User.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  password: "password",  # Choisis un mot de passe pour l'utilisateur
  description: "Passionné par les événements et les nouvelles rencontres."
)

user2 = User.create!(
  first_name: "Jane",
  last_name: "Smith",
  email: "jane.smith@example.com",
  password: "password",  # Choisis un mot de passe pour l'utilisateur
  description: "Amatrice d'art et de culture."
)

# Créer quelques événements en associant un utilisateur comme créateur
Event.create!(
  title: "Concert de Jazz",
  description: "Un concert incroyable avec des musiciens de jazz talentueux.",
  location: "Salle de concert ABC, Paris",
  date: "2025-05-01 20:00:00",
  creator: user1  # L'utilisateur John est le créateur de cet événement
)

Event.create!(
  title: "Exposition d'art moderne",
  description: "Découvrez des œuvres d'art moderne dans cette exposition captivante.",
  location: "Galerie d'art XYZ, Paris",
  date: "2025-05-05 14:00:00",
  creator: user2  # L'utilisateur Jane est le créateur de cet événement
)

Event.create!(
  title: "Atelier de cuisine italienne",
  description: "Apprenez à cuisiner des plats traditionnels italiens avec un chef.",
  location: "Cuisine ABC, Paris",
  date: "2025-05-10 11:00:00",
  creator: user1  # L'utilisateur John est le créateur de cet événement
)

Event.create!(
  title: "Conférence sur la technologie",
  description: "Venez écouter des experts discuter des dernières tendances en technologie.",
  location: "Université de Paris, Paris",
  date: "2025-05-15 18:00:00",
  creator: user2  # L'utilisateur Jane est le créateur de cet événement
)
