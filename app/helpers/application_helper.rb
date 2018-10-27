module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Репозиторий проекта #{repo}", "https://github.com/#{author}/#{repo}"
  end

  def flash_block
    render 'shared/alert' if flash.any?
  end
end
