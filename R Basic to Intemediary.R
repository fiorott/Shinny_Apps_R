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
