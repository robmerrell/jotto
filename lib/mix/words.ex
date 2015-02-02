defmodule Mix.Tasks.Words do
  defmodule Insert do
    use Mix.Task

    @shortdoc "Insert dictionary words into the database"

    @moduledoc """
    Uses the wordfiles in priv/dictionaries to create entries in the words table.
    An entry is created for each guessable word and each secret word. They are maintained
    in separate lists.
    """

    defp insert_words(word_stream, secret) do
      Enum.each word_stream, fn(line) ->
        stripped = String.strip(line)
        Jotto.Repo.insert %Jotto.Word{word: stripped, secret: secret}
      end
    end

    def run(_) do
      Mix.Task.run "app.start"

      File.stream!("#{:code.priv_dir(:jotto)}/dictionaries/guess_words.txt")
      |> insert_words(false)

      File.stream!("#{:code.priv_dir(:jotto)}/dictionaries/secret_words.txt")
      |> insert_words(true)
    end

  end
end
