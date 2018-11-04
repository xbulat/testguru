module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Репозиторий проекта #{repo}", "https://github.com/#{author}/#{repo}"
  end

  def alert_css_style(type)
    styles = { notice: 'alert alert-info',
               success: 'alert alert-success',
               error: 'alert alert-danger',
               alert: 'alert alert-warning' }
    styles.fetch(type.to_sym)
end
end
