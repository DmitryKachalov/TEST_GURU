 Gist.destroy_all
 Category.destroy_all
 User.destroy_all
 Test.destroy_all
 Answer.destroy_all
 Question.destroy_all

 users = Admin.create!([
                           { first_name: 'System',
                             last_name: 'God',
                             email: 'makorsakova@gmail.com',
                             password: '123qwe' }
                       ])

 categories = Category.create!(
     [{ title: 'backend', description: 'Tests for backend web developers' },
      { title: 'frontend', description: 'Tests for frontend web developers' }]
 )

 tests = Test.create!(
     [{ title: 'JavaSE',
        description: 'Java syntax test',
        level: 1,
        category_id: categories[0].id,
        author_id: users[0].id },
      { title: 'Kotlin basics',
        description: 'Kotlin syntax test',
        level: 1,
        category_id: categories[0].id,
        author_id: users[0].id },
      { title: 'JS syntax',
        description: 'JavaScript syntax test',
        level: 3,
        category_id: categories[1].id,
        author_id: users[0].id }]
 )

 questions = Question.create!(
     [{ body: "What is the result of the following code:\n"\
           "Long i = 1 / 0;\n"\
           'System.out.println(i);',
        test_id: tests[0].id },
      { body: "What is the result of the following code:\n"\
           "Long i = 1;\n"\
           'System.out.println(i == 1);',
        test_id: tests[0].id },
      { body: "What is the result of the following code:\n"\
           "val i = 1 / 0;\n"\
           'println(i);',
        test_id: tests[1].id },
      { body: "What is the result of the following code:\n"\
           'let i = 1 / 0',
        test_id: tests[2].id },
      { body: "What is the result of the following code:\n"\
           "[].every(({name}) => name === 'foo')",
        test_id: tests[2].id }]
 )

 Answer.create!(
     [{ title: 'Long.INFINITY', correct: false, question_id: questions[0].id },
      { title: '0', correct: false, question_id: questions[0].id },
      { title: 'ArithmeticException: / by zero', correct: true,
        question_id: questions[0].id },
      { title: 'null', correct: false, question_id: questions[0].id },

      { title: 'true', correct: false, question_id: questions[1].id },
      { title: 'false', correct: false, question_id: questions[1].id },
      { title: 'error: variable num might not have been initialized',
        correct: false, question_id: questions[1].id },
      { title: 'error: incompatible types: int cannot be converted to Long',
        correct: true, question_id: questions[1].id },

      { title: 'Long.INFINITY', correct: false, question_id: questions[2].id },
      { title: '0', correct: false, question_id: questions[2].id },
      { title: 'ArithmeticException: / by zero', correct: true,
        question_id: questions[2].id },
      { title: 'nil', correct: false, question_id: questions[2].id },

      { title: 'undefined', correct: true, question_id: questions[3].id },
      { title: 'null', correct: false, question_id: questions[3].id },
      { title: '0', correct: false, question_id: questions[3].id },
      { title: '-1', correct: false, question_id: questions[3].id },

      { title: "Cannot read property 'name' of null", correct: false,
        question_id: questions[4].id },
      { title: 'false', correct: false, question_id: questions[4].id },
      { title: 'true', correct: true, question_id: questions[4].id },
      { title: "Cannot read property 'name' of undefined", correct: false,
        question_id: questions[4].id }]
 )