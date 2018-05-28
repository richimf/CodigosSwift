# scaled features.
# x = square feet
# y = sale price
x <- c(1, 2, 4)
y <- c(2, 2.5, 3)

# function to calculate the predicted value
h <- function(x, t0, t1)
{
  result = t0 + t1 * x
  result
}


# given a theta_0 and theta_1, this function calculates
# their cost. We don't need this function, strictly speaking...
# but it is nice to print out the costs as gradient descent iterates.
# We should see the cost go down every time the values of theta get updated.
cost <- function (theta_0, theta_1, x, y) 
{
  distance <- 0
  for (i in 1:length(x)) # arrays in R are indexed starting at 1
  {
    square_feet <- x[i]
    predicted_value <- theta_0 + theta_1 * square_feet
    actual_value <- y[i]
    # how far off was the predicted value (make sure you get the absolute value)?
    distance <- distance + abs(actual_value - predicted_value)
  }
  # get how far off we were on average
  distance <- distance / length(x)
  distance
}

alpha <- 0.1
iters <- 1500
m <- length(x)

# initial values
theta_0 <- 0
theta_1 <- 0

for (i in 1:iters)
{
  # we store this calculation in temporary variables,
  # because theta_0 and theta_1 must be updated *together*.
  # i.e. we can't update theta_0 and use the new theta_0 value
  # while updating theta_1.
  cost_0 <- 0
  for (j in 1:m)
  {
    cost_0 <- cost_0 + (h(x[j], theta_0, theta_1) - y[j])
  }
  temp_0 <- theta_0 - alpha * 1/m * cost_0
  
  cost_1 <- 0
  for (j in 1:m)
  {
    cost_1 = cost_1 + ((h(x[j], theta_0, theta_1) - y[j]) * x[j])
  }
  
  temp_1 <- theta_1 - alpha * 1/m * cost_1
  
  theta_0 <- temp_0
  theta_1 <- temp_1
  
  # print out the new values of theta for each iteration,
  # as well as the new, lower cost
  print(theta_0, theta_1, cost(theta_0, theta_1, x, y))
  
}

# scale the values of theta, they
# were too small because we did feature scaling
theta_0 <- theta_0 * 100000
theta_1 <- theta_1 * 100

# un-scale the features. So now we should be
# back to [1000, 2000, 4000] for square feet,
# from [1, 2, 4].
x <- x * 1000
y <- y * 100000

plot(x, y, col='red')
lines(1000:4000, h(1000:4000, theta_0, theta_1), col='green')

print(h(3000, theta_0, theta_1))