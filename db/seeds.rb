 # Category.create(
 #     [{ title: 'backend' }, { title: 'frontend' }])

 # User.create!([{ name: 'admin', email: 'admin@mail.org', type: 'admin' }])
#                       { name: 'user', email: 'user@mail.org', role: 'user' }
#
# tests = Test.create!(
#     [{ title: 'HTML', level: 0, category: categories[1], author: users[0] },
#              { title: 'CSS', level: 1, category: categories[1], author: users[0] },
#              { title: 'Ruby', level: 2, category: categories[0], author: users[0] },
#              { title: 'Go', level: 3, category: categories[0], author: users[0] }]
# )

# questions = Question.create!(
#     [{ body: 'What is the use of figure tag in HTML 5?', test: tests[0] },
#      { body: 'Which selector allows you to access each element of a web page?', test: tests[1] },
#      { body: 'In how many ways you can compare Ruby string?', test: tests[2] },
#      { body: 'Why should one use Go programming language?', test: tests[3] }]
# )

# Answer.create!(
#     [{ body: 'Correct answer to HTML', correct: true, question: questions[0] },
#      { body: 'Incorrect answer to HTML', correct: false, question: questions[0] },
#      { body: 'Correct answer to CSS', correct: true, question: questions[1] },
#      { body: 'Incorrect answer to CSS', correct: false, question: questions[1] },
#      { body: 'Correct answer to Ruby', correct: true, question: questions[2] },
#      { body: 'Incorrect answer to Ruby', correct: false, question: questions[2] },
#      { body: 'Correct answer to Go', correct: true, question: questions[3] },
#      { body: 'Incorrect answer to Go', correct: false, question: questions[3] }]
# )

# TestPassage.create!([{ user: users[1], test: tests[0], status: 'finish' },
#                      { user: users[1], test: tests[1], status: 'finish' },
#                      { user: users[1], test: tests[2], status: 'finish' },
#                      { user: users[1], test: tests[3], status: 'not started' }])

