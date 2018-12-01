class GistQuestionService
  def initialize(question, client: github_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    Result.new(response)
  end

  private
  def github_client
    Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"] || Rails.application.credentials.github_token )
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

class Result
  delegate :html_url, to: :@gist

  def initialize(gist)
    @gist = gist
  end

  def success?
    html_url.present?
  end
end
