require_relative "user"
require_relative "questionsdatabase"
require_relative "question"
require_relative "reply"
require_relative "question_follow"
require_relative "question_likes"



# sami = User.find_by_id(2)
# p sami
# p QuestionFollow.followers_for_question_id(1)
evans = User.find_by_id(1)
p evans
p evans.average_karma