class QuestionFollow
  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, users.fname, users.lname
    FROM
      question_follows
    JOIN
      users ON user_id = users.id
    WHERE
      question_id = ?
    SQL
    users.map {|datum| User.new(datum)}
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id
    FROM
      question_follows
    JOIN
      questions ON question_id = questions.id
    GROUP BY
      question_id
    ORDER BY
      COUNT(*) DESC 
      LIMIT ?
    SQL
    questions.map{|datum| Question.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id
    FROM
      question_follows
    JOIN
      questions ON question_id = questions.id
    WHERE
      user_id = ?
    SQL
    questions.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end