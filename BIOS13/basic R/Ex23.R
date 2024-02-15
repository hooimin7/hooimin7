# 23.	Write a script that inputs 5 numbers and prints the largest and smallest one.
# (Try: numbers <- scan(nmax=5), other useful functions are min(numbers) and max(numbers))
print("Enter 5 numbers!")
numbers <- scan(nmax=5)
cat('The largest number is', max(numbers), '\n')
cat('The smallest number is', min(numbers), '\n')
