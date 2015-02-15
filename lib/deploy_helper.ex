defmodule DeployHelper do
  @moduledoc """
  Provides a couple of functions to make the deployment mix tasks easier to deal with.
  """

  @doc """
  Run the given command using the env_vars provided by prod_env in a vagrant host.
  """
  def run_vagrant_cmd!(cmd) do
    {output, ret} = System.cmd "vagrant", ["ssh", "-c", "cd /vagrant; #{env_vars()} #{cmd}"], [stderr_to_stdout: true]
    if ret != 0, do: raise "Could not run command #{cmd} - #{output}"
    IO.puts output
  end

  @doc """
  Run the given command remotely
  """
  def run_ssh_cmd!(cmd, creds, dir) do
    {output, ret} = System.cmd "ssh", [creds, "cd #{dir}; #{cmd}"], [stderr_to_stdout: true]
    if ret != 0, do: raise "Could not run command #{cmd} - #{output}"
    IO.puts output
  end

  @doc """
  Perform an scp
  """
  def scp!(local, remote, creds) do
    {output, ret} = System.cmd "scp", [local, "#{creds}:#{remote}"], [stderr_to_stdout: true]
    if ret != 0, do: raise "Could not scp #{local} - #{output}"
    IO.puts output
  end

  @doc """
  Read config/prod_env (a file in dotenv notation) and create a string of the environment variables
  """
  def env_vars() do
    Dotenv.load("config/prod_env").values
    |> Enum.reduce("", fn(x, acc) ->
      key = String.upcase(elem(x, 0))
      val = elem(x, 1)
      "#{key}=#{val} #{acc}"
    end)
  end

end
