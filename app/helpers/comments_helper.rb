module CommentsHelper
  def comment_pusher
      Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'comment_created', {
        message: 'あなたの投稿にコメントされました'
      })
  end

  def comment_notification
    Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', {
      unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count
    })
  end
end
