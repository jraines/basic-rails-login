module PostsHelper

  def publish_or_count(posts)
    if current_user
      link_to "Create New Post", new_post_path
    else
      "There are #{pluralize(posts.count, 'post')}"
    end
  end

end
