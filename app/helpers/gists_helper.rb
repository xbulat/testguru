module GistsHelper
  MAX_LENGTH = 25

  def gist_hash(url)
    url.split('/').last
  end

  def question_link_name(body)
    truncate(body, length: MAX_LENGTH)
  end
end
