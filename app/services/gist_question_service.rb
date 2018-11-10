class GistQuestionService
  def initialize(question, client: github_client)
    @question = question
    @test = @question.test
    @client = client
    result_object
  end

  def call
    response = @client.create_gist(gist_params)
    @result_object.new(response&.id.present?, response)
  end

  private
  def result_object
    @result_object = Struct.new(:success?, :gist)
  end

  def github_client
    Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end

  def gist_params
    { description: I18n.t('services.gists.gist_params.test', test: @test.title),
      public: false,
      files: {
        "#{I18n.t('services.gists.gist_params.question', question: @question.id)}": {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
