class QuestionLikes
  def self.average_karma(user_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        CAST(SUM(num_likes) / COUNT(DISTINCT(question_id)) AS FLOAT) AS l
      FROM
        question_likes
      JOIN
        questions ON question_id = questions.id
      JOIN
        users ON user_id = users.id
      JOIN (
        SELECT
          COUNT(*) AS num_likes
        FROM
          question_likes
        GROUP BY
          question_id
      ) AS likers
      WHERE
        questions.author_id = ?
    SQL
    likes["l"]
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, users.fname, users.lname
    FROM
      question_likes
    JOIN
      users ON user_id = users.id
    WHERE
      question_id = ?
    SQL
    users.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(*)
    FROM
      question_likes
    WHERE
      question_id = ?
    SQL
    return (likes)
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id
    FROM
      question_likes
    JOIN
      questions ON question_id = questions.id
    WHERE
      user_id = ?
    SQL
    questions.map {|datum| Question.new(datum)}
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id
    FROM
      question_likes
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

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end