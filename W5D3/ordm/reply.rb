class Reply
  attr_reader :id, :question_id, :reply_user_id, :reply_to_id, :body
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0
    reply.map {|datum| Reply.new(datum)}
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0
    reply.map {|datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @reply_to_id = options['reply_to_id']
    @reply_user_id = options['reply_user_id']
    @body = options['body']
    @question_id = options['question_id']
  end

  def author
    user = QuestionsDatabase.instance.execute(<<-SQL,self.reply_user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(user.first)
  end

  def question
    question = QuestionsDatabase.instance.execute(<<-SQL,self.question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(question.first)
  end

  def parent_reply
    reply_to = QuestionsDatabase.instance.execute(<<-SQL,self.reply_to_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(reply_to.first)
  end

  def child_replies
    childs = QuestionsDatabase.instance.execute(<<-SQL,self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_to_id = ? 
    SQL
    Question.new(question.first)
    childs.map {|datum| Reply.new(datum)}
  end
end