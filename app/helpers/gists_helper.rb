module GistsHelper
  MAX_LENGTH = 25

  def gist_url(mash)
    link_to mash, "https://gist.github.com/#{mash}", target: :blank
  end

  def question_link_name(body)
    body.length > MAX_LENGTH ? truncate(body, length: MAX_LENGTH) : body
  end
end
