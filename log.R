# --- The Writer ---
books <- read.csv("books.csv")
authors <- read.csv("authors.csv")

# Mia Morgan'ın tek kitabını bul
subset(books, author == "Mia Morgan")
# --- The Musician ---
# 1613 yılında yayınlanan, müzik konulu kitabı bul
subset(books, topic == "Music" & year == 1613)
# --- The Traveler ---
# 1775 yılında yayınlanan, Elena Petrova veya Lysandra Silverleaf tarafından yazılmış kitap
subset(books, author %in% c("Lysandra Silverleaf", "Elena Petrova") & year == 1775)
# --- The Painter ---
# 1990 ya da 1992 yılında yayımlanmış, konusu Art olan ve sayfa sayısı 200–300 arası olan kitap
subset(books, topic == "Art" & year %in% c(1990, 1992) & pages >= 200 & pages <= 300)
# --- The Scientist ---
# Başlığında "Quantum Mechanics" geçen kitap
subset(books, grepl("Quantum Mechanics", title))
# --- The Teacher ---
# Yazarın Zenthia'dan olduğu ve kitabın 1700'lerde yayımlandığı, konusu Education olan kitap
zenthia_authors <- subset(authors, hometown == "Zenthia")
subset(books, author %in% zenthia_authors$author & topic == "Education" & year >= 1700 & year < 1800)

