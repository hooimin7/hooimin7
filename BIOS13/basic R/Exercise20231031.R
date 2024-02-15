

reverse.vector = function(x) {
  reverse_vector = numeric(0)
for(i in length(x):1) {
  reverse_vector = append(reverse_vector, x[i])
}
  return(reverse_vector)
}

reverse.vector2 = function(x) {
  reverse_vector2 = x[length(x):1]
  return(reverse_vector2)
}

v = c(1, 2, 3, 4)
reverse.vector2(v)
plot(v)
