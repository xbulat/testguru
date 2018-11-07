class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || github_client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def github_client
    Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end

  def gist_params
    { "description": "#{I18n.t('gist_question_service.gist_params.test', test: @test.title)}",
      "public": false,
      "files": {
        "#{I18n.t('gist_question_service.gist_params.question', question: @question.id)}": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body].push(@question.answers.pluck(:body)).flatten.join("\n")
  end
end
