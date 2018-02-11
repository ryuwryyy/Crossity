class Question < ActiveRecord::Base
  after_create :create_feed_content

  has_many :participants
  belongs_to :group
  belongs_to :user
  has_many :answers
  has_one :feed_content, as: :content, dependent: :destroy
  has_many :pushed_users, through: :participants, source: :user
  validates_presence_of :user_id, :group_id,:when, :where, :what


  def user_answer(user_id)
    def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
  end
  end

  def answered?(user)
    answers.exists?(user_id: user.id)
  end

  private
  def create_feed_content
    self.feed_content = FeedContent.create(group_id: group_id, updated_at: updated_at)
  end
end
