defmodule Mix.Tasks.Words do
  defmodule Insert do
    use Mix.Task

    @shortdoc "Insert dictionary words into the database"

    @moduledoc """
    Uses the wordfiles in priv/dictionaries to create entries in the words table.
    An entry is created for each guessable word and each secret word. They are maintained
    in separate lists.
    """

    def run(_) do
      Mix.Task.run "app.start"

      File.stream!("#{word_file_path}/guess_words.txt")
      |> insert_words(false)

      File.stream!("#{word_file_path}/secret_words.txt")
      |> insert_words(true)
    end

    defp word_file_path do
      case Mix.env do
        :test -> "test/test_data"
            _ -> "#{Application.app_dir(:jotto)}/priv/dictionaries"
      end
    end

    defp insert_words(word_stream, secret) do
      Enum.each word_stream, fn(line) ->
        stripped = String.strip(line)
        Jotto.Repo.insert %Jotto.Word{word: stripped, secret: secret}
      end
    end

  end
end
