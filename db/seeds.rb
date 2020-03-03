categories = Category.create(
    [{ title: 'backend' },
            { title: 'frontend' }])

tests = Test.create!(
    [{ title: 'HTML', level: 0, category_id: categories[1].id },
             { title: 'CSS', level: 1, category_id: categories[1].id },
             { title: 'Ruby', level: 2, category_id: categories[0].id },
             { title: 'Go', level: 3, category_id: categories[0].id }]
)

questions = Question.create!(
    [{ body: 'What is the use of figure tag in HTML 5?', test_id: tests[0].id },
     { body: 'Which selector allows you to access each element of a web page?', test_id: tests[1].id },
     { body: 'In how many ways you can compare Ruby string?', test_id: tests[2].id },
     { body: 'Why should one use Go programming language?', test_id: tests[3].id }]
)

Answer.create!(
    [{ body: 'Correct answer to HTML', correct: true, question_id: questions[0].id },
     { body: 'Incorrect answer to HTML', correct: false, question_id: questions[0].id },
     { body: 'Correct answer to CSS', correct: true, question_id: questions[1].id },
     { body: 'Incorrect answer to CSS', correct: false, question_id: questions[1].id },
     { body: 'Correct answer to Ruby', correct: true, question_id: questions[2].id },
     { body: 'Incorrect answer to Ruby', correct: false, question_id: questions[2].id },
     { body: 'Correct answer to Go', correct: true, question_id: questions[3].id },
     { body: 'Incorrect answer to Go', correct: false, question_id: questions[3].id }]
)

users = User.create!([{ name: 'admin', email: 'admin@mail.org', role: 'admin' },
                      { name: 'user', email: 'user@mail.org', role: 'user' }])

TestPassage.create!([{ user_id: users[1].id, test_id: tests[0].id, status: 'finish' },
                     { user_id: users[1].id, test_id: tests[1].id, status: 'finish' },
                     { user_id: users[1].id, test_id: tests[2].id, status: 'finish' },
                     { user_id: users[1].id, test_id: tests[3].id, status: 'not started' }])

