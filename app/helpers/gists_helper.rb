module GistsHelper
  MAX_LENGTH = 25

  def gist_hash(url)
    url.match(/\/(\w+)$/)[1]
  end

  def question_link_name(body)
    truncate(body, length: MAX_LENGTH)
  end
end
