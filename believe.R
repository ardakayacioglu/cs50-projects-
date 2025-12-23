is_palindrome <- function(s) {
  cleaned <- tolower(s)                       # önce küçük harfe çevir
  cleaned <- gsub("[^a-z0-9]", "", cleaned)   # sonra sadece harf ve rakamları tut
  reversed <- paste(rev(strsplit(cleaned, "")[[1]]), collapse = "")
  return(cleaned == reversed)
}
