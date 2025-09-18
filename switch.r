#Traffic Lights
trafficLights <- "red"

result <- switch(trafficLights,
                 red = "Stop",
                 yellow = "Ready",
                 green = "Go",
                 "Invalid signal")
print(result)

#Grade System

input <- "A"

result <- switch(input,
                 A = "Excellent",
                 B = "Good",
                 C = "Average",
                 D = "Below Average",
                 F = "Fail",
                 "Invalid grade")
print(result)


#Math Menu
cat("Enter first number: ")
x <- as.numeric(readline())
cat("Enter second number: ")
y <- as.numeric(readline())
cat("Select operation (1: add, 2: subtract, 3: multiply, 4: divide): ")
operation <- readline()

result <- switch(operation,
                 "1" = x + y,
                 "2" = x - y,
                 "3" = x * y,
                 "4" = x / y,
                 "Invalid operation")
cat("Result: ", result, "\n")