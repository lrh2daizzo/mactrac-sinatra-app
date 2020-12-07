#User and Meal seed data for my program

luis = User.create(username: "luis02", email: "luis@luis.com", password: "0000")

glu = User.create(username: "gluedup", email: "glu@gluedup.com", password: "0000")

Meal.create(name: "Pizza", calories: 285, carbohydrates: 28, fat: 13, protein: 12, user_id: luis.id)
Meal.create(name: "Protein Shake", calories: 400, carbohydrates: 40, fat: 1, protein: 20, user_id: luis.id)

Meal.create(name: "Burger", calories: 285, carbohydrates: 40, fat: 15, protein: 12, user_id: glu.id)

