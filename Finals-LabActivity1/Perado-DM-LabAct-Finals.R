#R packages
install.packages("arules")
install.packages("arulesViz")

#load the packages
library(arules)
library(arulesViz)

#Use the built‑in Groceries dataset
data("Groceries")
summary(Groceries)

#Find frequent itemsets
itemsets <- apriori(Groceries, parameter = list(supp = 0.01, target = "frequent itemsets"))
inspect(head(itemsets, 5))

#Find association rules
rules <- apriori(Groceries, parameter = list(supp = 0.01, conf = 0.5))
inspect(head(rules, 5))

# ---- Rule Interpretations (based on the output when running the previous code) ----
# [1] {curd, yogurt} => {whole milk}
# Support = 0.010 → About 1% of all transactions include curd, yogurt, and milk together.
# Confidence = 0.582 → 58% of customers who buy curd and yogurt also buy milk.
# Lift = 2.28 → Buying curd and yogurt makes milk 2.28 times more likely than random.

# [2] {other vegetables, butter} => {whole milk}
# Support = 0.011 → About 1.1% of transactions include veggies, butter, and milk.
# Confidence = 0.574 → 57% of customers who buy veggies and butter also buy milk.
# Lift = 2.24 → Strong positive association; milk is more than twice as likely.

# [3] {other vegetables, domestic eggs} => {whole milk}
# Support = 0.012 → About 1.2% of transactions include veggies, eggs, and milk.
# Confidence = 0.553 → 55% of customers who buy veggies and eggs also buy milk.
# Lift = 2.16 → Positive association; milk is 2.16 times more likely.

# [4] {yogurt, whipped/sour cream} => {whole milk}
# Support = 0.011 → About 1.1% of transactions include yogurt, sour cream, and milk.
# Confidence = 0.525 → 52% of customers who buy yogurt and sour cream also buy milk.
# Lift = 2.05 → Dairy items strongly predict milk purchases.

# [5] {other vegetables, whipped/sour cream} => {whole milk}
# Support = 0.015 → About 1.5% of transactions include veggies, sour cream, and milk.
# Confidence = 0.507 → 51% of customers who buy veggies and sour cream also buy milk.
# Lift = 1.98 → Still a positive association, though slightly weaker than the others.

#scatterplot
plot(rules, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")

#graph
plot(rules, method = "graph", control = list(type = "items"))

