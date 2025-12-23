library(tidyverse)
library(readr)
library(stringr)
library(ggplot2)

# Şarkı sözlerini oku
lyrics <- read_file("lyrics/parked.txt")

# Temizleme işlemleri
words <- lyrics %>%
  str_to_lower() %>%                          # Küçük harfe çevir
  str_replace_all("[^a-z\\s]", "") %>%        # Noktalama işaretlerini kaldır
  str_split("\\s+") %>%                       # Kelimelere ayır
  unlist()

# Kelime frekanslarını hesapla
word_counts <- tibble(word = words) %>%
  filter(word != "") %>%
  count(word, sort = TRUE)

# Sadece birden fazla geçen kelimeleri filtrele
filtered_counts <- word_counts %>%
  filter(n > 1)

# Görselleştirme
ggplot(filtered_counts, aes(x = reorder(word, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Parked Out By The Lake - Kelime Frekansı",
       x = "Kelime",
       y = "Frekans")

# Grafiği kaydet
ggsave("lyrics.png", width = 8, height = 6)
