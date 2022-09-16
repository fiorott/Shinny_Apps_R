#Vectors

# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
# Which days did you make money on roulette?
    # A linha abaixo gera um vetor resutado com TRUE/FALSE para o teste de se o valor é       # maior do que 0
selection_vector <- roulette_vector > 0
selection_vector
# Select from roulette_vector these days
    # Quando eu pego um vetor e coloco entre aspas um vetor de seleção, ele exibirá
    # com base no vetor de nomes, os nomes dos itens que tem como resultado TRUE
roulette_winning_days <- roulette_vector[selection_vector]
roulette_winning_days

#_______

# What's a matrix?
#
# In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called two-dimensional.
# You can construct a matrix in R with the matrix() function. Consider the following example:
# ```
my_matrix <- matrix(1:9, byrow = TRUE, nrow = 3)

# ```
# In the matrix() function:
# - The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we use 1:9 which is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9).
# - The argument byrow indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place byrow = FALSE.
# - The third argument nrow indicates that the matrix should have three rows.


# Naming a matrix
#
# To help you remember what is stored in star_wars_matrix, you would like to add the names of the movies for the rows. Not only does this help you to read the data, but it is also useful to select certain elements from the matrix.
# Similar to vectors, you can add names for the rows and the columns of a matrix
# ```
row_names_vector <- c('lin 1', 'lin 2', 'lin 3')
col_names_vector <- c('col 1', 'col 2', 'col 2')


rownames(my_matrix) <- row_names_vector
colnames(my_matrix) <- col_names_vector
my_matrix

# ```
# We went ahead and prepared two vectors for you: region, and titles. You will need these vectors to name the columns and rows of star_wars_matrix, respectively.

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)
# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
# Name the columns with region
colnames(star_wars_matrix) <- region
# Name the rows with titles
rownames(star_wars_matrix) <- titles
# Print out star_wars_matrix
star_wars_matrix

#_________

# Summarizing a factor
#
# After finishing this course, one of your favorite functions in R will be summary(). This will give you a quick overview of the contents of a variable:
# ```
# summary(my_var)

# ```
# Going back to our survey, you would like to know how many "Male" responses you have in your study, and how many "Female" responses. The summary() function gives you the answer to this question.


# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector
# Generate summary for survey_vector
summary(survey_vector)
# Generate summary for factor_survey_vector
summary(factor_survey_vector)

# Comando:
# factor(<vetor>) - determina quantas categorias diferentes há no conjunto de dados. Obs.: sem ordenação, por default, mas é possível ordenar. (ver logo abaixo)
# Levels(<factorvetor>) - permite renomear as categorias calculadas pelo comando factor  em ordem alfabética, por exemplo, "F" do factor virará -> "Female" se assim eu desejar;
# summary(<factorvetor>) : mostra quantos itens há em cada categoria do factor

#_________________

#Ordered factors

# Since "Male" and "Female" are unordered (or nominal) factor levels, R returns a warning message, telling you that the greater than operator is not meaningful. As seen before, R attaches an equal value to the levels for such factors.
#
# But this is not always the case! Sometimes you will also deal with factors that do have a natural ordering between its categories. If this is the case, we have to make sure that we pass this information to R…
# Let us say that you are leading a research team of five data analysts and that you want to evaluate their performance. To do this, you track their speed, evaluate each analyst as "slow", "medium" or "fast", and save the results in speed_vector.
#

# Create factor_speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
# Factor value for second data analyst
da2 <-factor_speed_vector [2]
da2
# Factor value for fifth data analyst
da5 <-factor_speed_vector[5]
da5
# Is data analyst 2 faster than data analyst 5?
da2> da5


#########

# Creating a data frame
#
# Since using built-in datasets is not even half the fun of creating your own datasets, the rest of this chapter is based on your personally developed dataset. Put your jet pack on because it is time for some space exploration!
# As a first goal, you want to construct a data frame that describes the main characteristics of eight planets in our solar system. According to your good friend Buzz, the main features of a planet are:
# - The type of planet (Terrestrial or Gas Giant).
# - The planet's diameter relative to the diameter of the Earth.
# - The planet's rotation across the sun relative to that of the Earth.
# - If the planet has rings or not (TRUE or FALSE).
# After doing some high-quality research on Wikipedia, you feel confident enough to create the necessary vectors: name, type, diameter, rotation and rings; these vectors have already been coded up in the editor. The first element in each of these vectors correspond to the first observation.
# You construct a data frame with the data.frame() function. As arguments, you pass the vectors from before: they will become the different columns of your data frame. Because every column has the same length, the vectors you pass should also have the same length. But don't forget that it is possible (and likely) that they contain different types of data.
#
# instruction

# Use the function data.frame() to construct a data frame. Pass the vectors name, type, diameter, rotation and rings as arguments to data.frame(), in this order. Call the resulting data frame planets_df.
# Definition of vectors
name <- c("Mercury", "Venus", "Earth",
          "Mars", "Jupiter", "Saturn",
          "Uranus", "Neptune")
type <- c("Terrestrial planet",
          "Terrestrial planet",
          "Terrestrial planet",
          "Terrestrial planet", "Gas giant",
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532,
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03,
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name,type,diameter,rotation, rings)
planets_df
#__________________________

# Only planets with rings but shorter
#
# So what exactly did you learn in the previous exercises? You selected a subset from a data frame (planets_df) based on whether or not a certain condition was true (rings or no rings), and you managed to pull out all relevant data. Pretty awesome! By now, NASA is probably already flirting with your CV ;-).
# Now, let us move up one level and use the function subset(). You should see the subset() function as a short-cut to do exactly the same as what you did in the previous exercises.

#subset(my_df, subset = some_condition)

# The first argument of subset() specifies the dataset for which you want a subset.
# By adding the second argument, you give R the necessary information and conditions to select the correct subset.
# The code below will give the exact same result as you got in the previous exercise,
# but this time, you didn't need the rings_vector!

subset(planets_df, subset = rings)

# instructions
#
# Use subset() on planets_df to select planets that have a diameter smaller than Earth.
# Because the diameter variable is a relative measure of the
# planet's diameter w.r.t that of planet Earth, your condition is diameter < 1.
#
# # Select planets with diameter < 1
subset(planets_df, subset = diameter <1)

#Sorting

# Making and creating rankings is one of mankind's favorite affairs. These rankings can be useful (best universities
# in the world), entertaining (most influential movie stars) or pointless (best 007 look-a-like).
# In data analysis you can sort your data according to a certain variable in the dataset. In R, this is done with the
# help of the function order().
# order() is a function that gives you the ranked position of each element when it is applied on a variable, such as a
#  vector for example:

a <- c(100, 10, 1000)
order(a)


# 10, which is the second element in a, is the smallest element, so 2 comes first in the output of order(a). 100, which
# is the first element in a is the second smallest element, so 1 comes second in the output of order(a).
# This means we can use the output of order(a) to reshuffle a:

a[order(a)]


# Sorting your data frame
#
# Alright, now that you understand the order() function, let us do something useful with it. You would like to rearrange
# your data frame such that it starts with the smallest planet and ends with the largest one. A sort on the diameter column.
#
# instructions
#
# - Call order() on planets_df$diameter (the diameter column of planets_df). Store the result as positions.
# - Now reshuffle planets_df with the positions vector as row indexes inside square brackets. Keep all columns.
# Simply print out the result.
# Dica: Use planets_df[positions, ] to sort planets_df; the comma inside the square brackets is crucial!

# planets_df is pre-loaded in your workspace
# Use order() to create positions
positions <-  order(planets_df$diameter)
positions
# Use positions to sort planets_df

planets_df[positions, ]

# - Vectors (one dimensional array): can hold numeric, character or logical values. The elements in a vector all have the same data type.
# - Matrices (two dimensional array): can hold numeric, character or logical values. The elements in a matrix all have the same data type.
# - Data frames (two-dimensional objects): can hold numeric, character or logical values. Within a column all elements have the same data type,
# but different columns can be of different data type.

# Creating a named list

# Well done, you're on a roll!
# Just like on your to-do list, you want to avoid not knowing or remembering what the components of your list stand for.
# That is why you should give names to them:

your_comp1 <- "Dell"
your_comp2 <- "Apple"


my_list <- list(name1 = your_comp1,
                name2 = your_comp2)
my_list

# This creates a list with components that are named name1, name2, and so on. If you want to name your lists after you've
# created them, you can use the names() function as you did with vectors. The following commands are fully equivalent to
#  the assignment above:

my_list <- list(your_comp1, your_comp2)

names(my_list) <- c("name1", "name2")
my_list


# Change the code of the previous exercise (see editor) by adding names to the components. Use for my_vector the
# name vec, for my_matrix the name mat and for my_df the name df.

# Vector with numerics from 1 up to 10
my_vector <- 1:10
# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)
# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]
# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)
# Print out my_list
my_list

#__________

# R intermediary
#
# Customize further: else if
# The else if statement allows you to further customize your control structure. You can add as many else if statements as
# you like. Keep in mind that R ignores the remainder of the control structure once a condition has been found that is TRUE
# and the corresponding expressions have been executed. Here's an overview of the syntax to freshen your memory:

# if (condition1) {
#   expr1
# } else if (condition2) {
#   expr2
# } else if (condition3) {
#   expr3
# } else {
#   expr4
# }
# Again, It's important that the else if keywords comes on the same line as the closing bracket of the previous part of
# the control construct!

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
# Exercício
# Take control!
# In this exercise, you will combine everything that you've learned so far: relational operators, logical operators and
# control constructs. You'll need it all!
#
# We've pre-defined two values for you: li and fb, denoting the number of profile views your LinkedIn and Facebook profile
# had on the last day of recordings. Go through the instructions to create R code that generates a 'social media score',
# sms, based on the values of li and fb.
#
# Instructions
# 0 XP
# Finish the control-flow construct with the following behavior:
#
# If both li and fb are 15 or higher, set sms equal to double the sum of li and fb.
# If both li and fb are strictly below 10, set sms equal to half the sum of li and fb.
# In all other cases, set sms equal to li + fb.
# Finally, print the resulting sms variable.


# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li >= 15 & fb >= 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 & fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
sms

#____
# While Loops

# Throw in more conditionals
# In the previous exercise, you simulated the interaction between a driver and a driver's assistant: When the speed
# was too high, "Slow down!" got printed out to the console, resulting in a decrease of your speed by 7 units.
#
# There are several ways in which you could make your driver's assistant more advanced. For example, the assistant
# could give you different messages based on your speed or provide you with a current speed at a given moment.
#
# A while loop similar to the one you've coded in the previous exercise is already available for you to use.
# It prints out your current speed, but there's no code that decreases the speed variable yet, which is pretty dangerous.
# Can you make the appropriate changes?

# If the speed is greater than 48, have R print out "Slow down big time!", and decrease the speed by 11.
# Otherwise, have R simply print out "Slow down!", and decrease the speed by 6.
# If the session keeps timing out and throwing an error, you are probably stuck in an infinite loop! Check the body of
# your while loop and make sure you are assigning new values to speed.

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is", speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Stop the while loop: break
# There are some very rare situations in which severe speeding is necessary: what if a hurricane is approaching and you
# have to get away as quickly as possible? You don't want the driver's assistant sending you speeding notifications in
# that scenario, right?
#
# This seems like a great opportunity to include the break statement in the while loop you've been working on. Remember
#  that the break statement is a control statement. When R encounters it, the while loop is abandoned completely.

# Initialize the speed variable
speed <- 79

while (speed > 30) {
  print(paste("Your speed is", speed))

  # Break the while loop when speed exceeds 80
  if (speed >80 ) {
    break
  }

  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Build a while loop from scratch
# The previous exercises guided you through developing a pretty advanced while loop, containing a break statement and
# different messages and updates as determined by control flow constructs. If you manage to solve this comprehensive
# exercise using a while loop, you're totally ready for the next topic: the for loop.

# Initialize i as 1
i <- 1

# Code the while loop
while (i <= 10) {
  print(i * 3)
  if (((i * 3)%% 8) <= 0  ) {
    print(i * 3)
    break
  }
  i <- i + 1
}