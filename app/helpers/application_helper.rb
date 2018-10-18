module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "<a href=\'https://github.com/#{author}/#{repo}.git\'>Репозиторий проекта #{repo}</a>"
  end
end
