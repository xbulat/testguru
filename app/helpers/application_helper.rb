module ApplicationHelper
  ALERT_STYLE = { notice: 'alert-info',
                  success: 'alert-success',
                  error: 'alert-danger',
                  alert: 'alert-warning' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Репозиторий проекта #{repo}", "https://github.com/#{author}/#{repo}"
  end

  def alert_css_style(type)
    ALERT_STYLE.fetch(type.to_sym, 'alert-info')
  end
end
