module PostsHelper
  def status_badge(post)
    case post.status
      when "submitted" then "badge-primary"
      when "approved"  then "badge-success"
      when "rejected"  then "badge-danger"
    end
  end
end
